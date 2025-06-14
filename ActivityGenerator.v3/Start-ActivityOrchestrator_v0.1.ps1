[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$ConfigPath = ".\ActivityGeneratorConfig.json",
    
    [Parameter(Mandatory=$false)]
    [int]$NumberOfIterations = 0  # Will use config file default if 0
)

# Function to load and validate configuration
function Get-ScriptConfig {
    param (
        [string]$ConfigPath
    )
    
    try {
        if (-not (Test-Path $ConfigPath)) {
            throw "Configuration file not found at: $ConfigPath"
        }

        $config = Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json

        # Validate required configuration sections
        $requiredSections = @('workingDirectory', 'scripts', 'logging', 'iterations')
        foreach ($section in $requiredSections) {
            if (-not $config.$section) {
                throw "Missing required configuration section: $section"
            }
        }

        # Validate wait times array
        if (-not $config.iterations.waitTimes -or $config.iterations.waitTimes.Count -eq 0) {
            throw "Configuration must include at least one wait time pair"
        }

        return $config
    }
    catch {
        throw "Error loading configuration: $_"
    }
}

# Function to write to both console and log file
function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO",
        [string]$LogPath
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    
    # Write to console with appropriate color
    switch ($Level) {
        "ERROR" { Write-Host $logMessage -ForegroundColor Red }
        "WARNING" { Write-Host $logMessage -ForegroundColor Yellow }
        "SUCCESS" { Write-Host $logMessage -ForegroundColor Green }
        default { Write-Host $logMessage }
    }
    
    # Append to log file
    Add-Content -Path $LogPath -Value $logMessage
}

# Function to clean up old log files
function Remove-OldLogs {
    param (
        [string]$LogPath,
        [int]$RetentionDays
    )
    
    try {
        $logDir = Split-Path -Parent $LogPath
        $logPattern = "$(Split-Path -Leaf $LogPath)*"
        $oldLogs = Get-ChildItem -Path $logDir -Filter $logPattern | 
            Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$RetentionDays) }
        
        foreach ($log in $oldLogs) {
            Remove-Item $log.FullName -Force
            Write-Log "Removed old log file: $($log.Name)" -Level "INFO" -LogPath $LogPath
        }
    }
    catch {
        Write-Log "Error cleaning up old logs: $_" -Level "WARNING" -LogPath $LogPath
    }
}

# Function to run a single iteration
function Invoke-ActivityIteration {
    param(
        [int]$IterationNumber,
        [int]$TotalIterations,
        [int]$MaxWait,
        [int]$MinWait,
        [string]$WorkingDirectory,
        [string]$LogPath,
        [int]$MaxRetries,
        [int]$RetryDelay,
        [string]$LoggedInUserFull,
        [string]$LoggedInUser
    )

    $startTime = Get-Date
    $generatedRandom = Get-Random -Minimum $MinWait -Maximum $MaxWait
    $retryCount = 0
    $success = $false

    Write-Log "Starting iteration $($IterationNumber) of $TotalIterations" -LogPath $LogPath
    Write-Log "Configuration - Min Wait: $MinWait ms, Max Wait: $MaxWait ms" -LogPath $LogPath
    Write-Log "Generated random wait time: $generatedRandom ms (used for orchestrator sleep between outer iterations)" -LogPath $LogPath

    do {
        try {
            # Set working directory for this iteration
            Set-Location -Path $WorkingDirectory -ErrorAction Stop

            # Get terminate window from ActivityGenerator.cfg
            .".\ActivityGeneratorProcessController.ps1"
            
            # Based on the actual array structure in ActivityGeneratorProcessController.ps1:
            # Index 3 is terminate_window (fixed value)
            $terminate_window = GetProcesControlConfig(3)
            
            if ($terminate_window -eq "" -or $terminate_window -eq $null -or $terminate_window -eq 0) {
                # Default to 1 hour if no terminate window is set
                $terminate_window = 3600
                Write-Log "No terminate window found in config, defaulting to 3600 seconds" -Level "WARNING" -LogPath $LogPath
            }
            
            Write-Log "Terminate window for this iteration: $terminate_window seconds" -LogPath $LogPath

            # Run ActivityGenerator.ps1 with all required parameters
            $activityParams = @{
                FilePath = "powershell.exe"
                ArgumentList = @(
                    "-ExecutionPolicy", "Bypass",
                    "-File", ".\ActivityGenerator.ps1",
                    "-loggedinuserfull", "`"$LoggedInUserFull`"",
                    "-loggedinuser", $LoggedInUser,
                    "-IterationNumber", $IterationNumber,
                    "-TotalIterations", $TotalIterations,
                    "-MinWait", $MinWait,
                    "-MaxWait", $MaxWait,
                    "-StartTime", "`"$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`"",
                    "-TerminateWindow", $terminate_window
                )
            }
            Start-Process @activityParams -Wait -NoNewWindow

            $success = $true
            
            $endTime = Get-Date
            $duration = ($endTime - $startTime).TotalSeconds
            
            Write-Log "Outer iteration $IterationNumber completed successfully (Duration: $($duration.ToString('F2')) seconds)" -Level "SUCCESS" -LogPath $LogPath
            Write-Log "Terminate window was set to $terminate_window seconds" -LogPath $LogPath
            
            # Log detailed statistics
            $stats = @{
                "Outer Iteration" = "$IterationNumber of $TotalIterations"
                "StartTime" = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
                "EndTime" = $endTime.ToString("yyyy-MM-dd HH:mm:ss")
                "Total Duration" = "$($duration.ToString('F2')) seconds"
                "Terminate Window" = "$terminate_window seconds"
                "Config MinWait" = "$MinWait ms"
                "Config MaxWait" = "$MaxWait ms"
                "Orchestrator Wait" = "$generatedRandom ms"
                "RetryCount" = $retryCount
            }
            
            Write-Log "Iteration Statistics:`n$(($stats.GetEnumerator() | ForEach-Object { "  $($_.Key): $($_.Value)" }) -join "`n")" -LogPath $LogPath
        }
        catch {
            $retryCount++
            Write-Log "Error in iteration $IterationNumber (Attempt $retryCount of $MaxRetries): $_" -Level "ERROR" -LogPath $LogPath
            
            if ($retryCount -lt $MaxRetries) {
                Write-Log "Retrying in $RetryDelay seconds..." -Level "WARNING" -LogPath $LogPath
                Start-Sleep -Seconds $RetryDelay
            }
        }
    } while (-not $success -and $retryCount -lt $MaxRetries)

    if (-not $success) {
        throw "Failed to complete iteration after $MaxRetries attempts"
    }
}

# Main execution block
try {
    # Load configuration
    $config = Get-ScriptConfig -ConfigPath $ConfigPath
    
    # Set number of iterations
    if ($NumberOfIterations -le 0) {
        $NumberOfIterations = $config.iterations.default
    }

    # Ensure we have enough wait time pairs
    if ($config.iterations.waitTimes.Count -lt $NumberOfIterations) {
        throw "Not enough wait time pairs in configuration for requested number of iterations"
    }

    # Get user information
    $LoggedInUserFull = $env:USERNAME
    $LoggedInUser = $env:USERNAME
    
    # Create log directory if it doesn't exist
    $logDir = Split-Path -Parent $config.logging.logPath
    if (-not (Test-Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir -Force | Out-Null
    }

    $scriptStartTime = Get-Date
    Write-Log "Starting Activity Generator Orchestrator" -LogPath $config.logging.logPath
    Write-Log "Using configuration file: $ConfigPath" -LogPath $config.logging.logPath
    Write-Log "Total planned iterations: $NumberOfIterations" -LogPath $config.logging.logPath
    Write-Log "Logged in user: $LoggedInUserFull" -LogPath $config.logging.logPath

    # Clean up old logs
    Remove-OldLogs -LogPath $config.logging.logPath -RetentionDays $config.logging.logRetentionDays

    # Run iterations
    for ($i = 0; $i -lt $NumberOfIterations; $i++) {
        $waitTimes = $config.iterations.waitTimes[$i]
        
        Invoke-ActivityIteration `
            -IterationNumber ($i + 1) `
            -TotalIterations $NumberOfIterations `
            -MaxWait $waitTimes.maxWait `
            -MinWait $waitTimes.minWait `
            -WorkingDirectory $config.workingDirectory `
            -LogPath $config.logging.logPath `
            -MaxRetries $config.execution.maxRetries `
            -RetryDelay $config.execution.retryDelaySeconds `
            -LoggedInUserFull $LoggedInUserFull `
            -LoggedInUser $LoggedInUser
            
        # Wait between iterations (except for the last one)
        if ($i -lt ($NumberOfIterations - 1)) {
            $waitTime = Get-Random -Minimum $waitTimes.minWait -Maximum $waitTimes.maxWait
            $waitSeconds = $waitTime / 1000
            Write-Log "Waiting $($waitSeconds.ToString('F2')) seconds before next iteration..." -LogPath $config.logging.logPath
            Start-Sleep -Seconds $waitSeconds
        }
    }

    $scriptEndTime = Get-Date
    $totalDuration = ($scriptEndTime - $scriptStartTime).TotalMinutes
    
    Write-Log "All outer iterations completed successfully" -Level "SUCCESS" -LogPath $config.logging.logPath
    Write-Log "Total execution time: $($totalDuration.ToString('F2')) minutes" -LogPath $config.logging.logPath
    
    # Write final summary statistics
    $summaryStats = @{
        "Total Outer Iterations" = $NumberOfIterations
        "Start Time" = $scriptStartTime.ToString("yyyy-MM-dd HH:mm:ss")
        "End Time" = $scriptEndTime.ToString("yyyy-MM-dd HH:mm:ss")
        "Total Duration" = "$($totalDuration.ToString('F2')) minutes"
        "Average Duration" = "$($($totalDuration / $NumberOfIterations).ToString('F2')) minutes per outer iteration"
        "Configuration File" = $ConfigPath
    }
    
    Write-Log "Final Summary:`n$(($summaryStats.GetEnumerator() | ForEach-Object { "  $($_.Key): $($_.Value)" }) -join "`n")" -Level "SUCCESS" -LogPath $config.logging.logPath
}
catch {
    if ($config.logging.logPath) {
        Write-Log "Script execution failed: $_" -Level "ERROR" -LogPath $config.logging.logPath
    } else {
        Write-Host "Script execution failed: $_" -ForegroundColor Red
    }
    exit 1
}