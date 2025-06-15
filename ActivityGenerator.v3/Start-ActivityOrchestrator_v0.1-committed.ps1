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
        [int]$MaxWait,
        [int]$MinWait,
        [string]$WorkingDirectory,
        [string]$StartupScript,
        [string]$OrchestratorScript,
        [string]$LogPath,
        [int]$MaxRetries,
        [int]$RetryDelay
    )

    $startTime = Get-Date
    $generatedRandom = Get-Random -Minimum $MinWait -Maximum $MaxWait
    $retryCount = 0
    $success = $false

    Write-Log "Starting iteration $($IterationNumber + 1)" -LogPath $LogPath
    Write-Log "Configuration - Min Wait: $MinWait, Max Wait: $MaxWait" -LogPath $LogPath
    Write-Log "Generated random wait time: $generatedRandom ms" -LogPath $LogPath

    do {
        try {
            # Set working directory for this iteration
            Set-Location -Path $WorkingDirectory -ErrorAction Stop

            # Run startup script with parameters
            $startupParams = @{
                FilePath = "powershell.exe"
                ArgumentList = @(
                    "-ExecutionPolicy", "Bypass",
                    "-File", $StartupScript,
                    "-rand_start_wait_max", $MaxWait,
                    "-rand_start_wait_min", $MinWait
                )
            }
            Start-Process @startupParams -Wait -NoNewWindow

            # Run orchestrator script
            $orchestratorParams = @{
                FilePath = "powershell.exe"
                ArgumentList = @(
                    "-ExecutionPolicy", "Bypass",
                    "-File", $OrchestratorScript
                )
            }
            Start-Process @orchestratorParams -Wait -NoNewWindow

            $success = $true
            
            $endTime = Get-Date
            $duration = ($endTime - $startTime).TotalSeconds
            
            Write-Log "Iteration $($IterationNumber + 1) completed successfully (Duration: $($duration.ToString('F2')) seconds)" -Level "SUCCESS" -LogPath $LogPath
            
            # Log detailed statistics
            $stats = @{
                "Iteration" = $IterationNumber + 1
                "StartTime" = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
                "EndTime" = $endTime.ToString("yyyy-MM-dd HH:mm:ss")
                "Duration" = "$($duration.ToString('F2')) seconds"
                "MinWait" = $MinWait
                "MaxWait" = $MaxWait
                "GeneratedWait" = $generatedRandom
                "RetryCount" = $retryCount
            }
            
            Write-Log "Iteration Statistics:`n$(($stats.GetEnumerator() | ForEach-Object { "  $($_.Key): $($_.Value)" }) -join "`n")" -LogPath $LogPath
        }
        catch {
            $retryCount++
            Write-Log "Error in iteration $($IterationNumber + 1) (Attempt $retryCount of $MaxRetries): $_" -Level "ERROR" -LogPath $LogPath
            
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

    $scriptStartTime = Get-Date
    Write-Log "Starting Activity Generator Orchestrator" -LogPath $config.logging.logPath
    Write-Log "Using configuration file: $ConfigPath" -LogPath $config.logging.logPath
    Write-Log "Total planned iterations: $NumberOfIterations" -LogPath $config.logging.logPath

    # Clean up old logs
    Remove-OldLogs -LogPath $config.logging.logPath -RetentionDays $config.logging.logRetentionDays

    # Run iterations
    for ($i = 0; $i -lt $NumberOfIterations; $i++) {
        $waitTimes = $config.iterations.waitTimes[$i]
        
        Invoke-ActivityIteration `
            -IterationNumber $i `
            -MaxWait $waitTimes.maxWait `
            -MinWait $waitTimes.minWait `
            -WorkingDirectory $config.workingDirectory `
            -StartupScript $config.scripts.startup `
            -OrchestratorScript $config.scripts.orchestrator `
            -LogPath $config.logging.logPath `
            -MaxRetries $config.execution.maxRetries `
            -RetryDelay $config.execution.retryDelaySeconds
    }

    $scriptEndTime = Get-Date
    $totalDuration = ($scriptEndTime - $scriptStartTime).TotalMinutes
    
    Write-Log "All iterations completed successfully" -Level "SUCCESS" -LogPath $config.logging.logPath
    Write-Log "Total execution time: $($totalDuration.ToString('F2')) minutes" -LogPath $config.logging.logPath
    
    # Write final summary statistics
    $summaryStats = @{
        "Total Iterations" = $NumberOfIterations
        "Start Time" = $scriptStartTime.ToString("yyyy-MM-dd HH:mm:ss")
        "End Time" = $scriptEndTime.ToString("yyyy-MM-dd HH:mm:ss")
        "Total Duration" = "$($totalDuration.ToString('F2')) minutes"
        "Average Duration" = "$($($totalDuration / $NumberOfIterations).ToString('F2')) minutes per iteration"
        "Configuration File" = $ConfigPath
    }
    
    Write-Log "Final Summary:`n$(($summaryStats.GetEnumerator() | ForEach-Object { "  $($_.Key): $($_.Value)" }) -join "`n")" -Level "SUCCESS" -LogPath $config.logging.logPath
}
catch {
    Write-Log "Script execution failed: $_" -Level "ERROR" -LogPath $config.logging.logPath
    exit 1
}