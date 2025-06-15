[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$ConfigPath = ".\ActivityGeneratorConfig.json",
    
    [Parameter(Mandatory=$false)]
    [int]$NumberOfIterations = 0  # Will use config file default if 0
)

# Function to write to both console and log file with error handling
function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO",
        [string]$LogPath = ""
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
    
    # Append to log file only if LogPath is provided and valid
    if ($LogPath -and $LogPath.Trim() -ne "") {
        try {
            # Ensure directory exists
            $logDir = Split-Path -Parent $LogPath -ErrorAction SilentlyContinue
            if ($logDir -and -not (Test-Path $logDir)) {
                New-Item -ItemType Directory -Path $logDir -Force | Out-Null
            }
            
            # Write to log file
            $logMessage | Out-File -FilePath $LogPath -Append -Encoding UTF8 -ErrorAction SilentlyContinue
        } catch {
            Write-Host "Warning: Could not write to log file: $LogPath" -ForegroundColor Yellow
        }
    }
}

# Function to load and validate configuration
function Get-ScriptConfig {
    param (
        [string]$ConfigPath
    )
    
    try {
        Write-Log "Attempting to load configuration from: $ConfigPath"
        
        if (-not (Test-Path $ConfigPath)) {
            throw "Configuration file not found at: $ConfigPath"
        }

        $config = Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json
        Write-Log "Configuration loaded successfully"

        # Validate required configuration sections
        $requiredSections = @('workingDirectory', 'scripts', 'logging', 'iterations')
        foreach ($section in $requiredSections) {
            if (-not $config.$section) {
                throw "Missing required configuration section: $section"
            }
        }

        # Convert relative log path to absolute path
        if ($config.logging.logPath -and $config.logging.logPath.StartsWith(".")) {
            $workingDir = $config.workingDirectory
            if (-not $workingDir) {
                $workingDir = Get-Location
            }
            $config.logging.logPath = Join-Path $workingDir $config.logging.logPath.TrimStart(".\")
            Write-Log "Converted log path to: $($config.logging.logPath)"
        }

        # Validate wait times array
        if (-not $config.iterations.waitTimes -or $config.iterations.waitTimes.Count -eq 0) {
            throw "Configuration must include at least one wait time pair"
        }

        Write-Log "Configuration validation completed successfully"
        return $config
    }
    catch {
        Write-Log "Error loading configuration: $_" -Level "ERROR"
        throw "Error loading configuration: $_"
    }
}

# Function to clean up old log files
function Remove-OldLogs {
    param (
        [string]$LogPath,
        [int]$RetentionDays
    )
    
    if (-not $LogPath -or $LogPath.Trim() -eq "") {
        Write-Log "Skipping log cleanup - no log path specified" -Level "WARNING"
        return
    }
    
    try {
        $logDir = Split-Path -Parent $LogPath
        if (-not (Test-Path $logDir)) {
            Write-Log "Log directory does not exist: $logDir" -Level "WARNING"
            return
        }
        
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
            Write-Log "Setting working directory to: $WorkingDirectory" -LogPath $LogPath
            Set-Location -Path $WorkingDirectory -ErrorAction Stop

            # Check if startup script exists
            $fullStartupPath = Join-Path $WorkingDirectory $StartupScript
            if (-not (Test-Path $fullStartupPath)) {
                throw "Startup script not found: $fullStartupPath"
            }

            # Run startup script with parameters
            Write-Log "Executing startup script: $StartupScript" -LogPath $LogPath
            $startupParams = @{
                FilePath = "powershell.exe"
                ArgumentList = @(
                    "-ExecutionPolicy", "Bypass",
                    "-File", $fullStartupPath,
                    "-rand_start_wait_max", $MaxWait,
                    "-rand_start_wait_min", $MinWait
                )
            }
            Start-Process @startupParams -Wait -NoNewWindow

            # Check if orchestrator script exists
            $fullOrchestratorPath = Join-Path $WorkingDirectory $OrchestratorScript
            if (-not (Test-Path $fullOrchestratorPath)) {
                throw "Orchestrator script not found: $fullOrchestratorPath"
            }

            # Run orchestrator script
            Write-Log "Executing orchestrator script: $OrchestratorScript" -LogPath $LogPath
            $orchestratorParams = @{
                FilePath = "powershell.exe"
                ArgumentList = @(
                    "-ExecutionPolicy", "Bypass",
                    "-File", $fullOrchestratorPath
                )
            }
            Start-Process @orchestratorParams -Wait -NoNewWindow

            $success = $true
            
            $endTime = Get-Date
            $duration = ($endTime - $startTime).TotalSeconds
            
            Write-Log "Iteration $($IterationNumber + 1) completed successfully (Duration: $($duration.ToString('F2')) seconds)" -Level "SUCCESS" -LogPath $LogPath
            
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
    Write-Log "=== ACTIVITY ORCHESTRATOR STARTING ===" -Level "INFO"
    Write-Log "Current working directory: $(Get-Location)" -Level "INFO"
    Write-Log "Configuration file: $ConfigPath" -Level "INFO"
    
    # Load configuration
    $config = Get-ScriptConfig -ConfigPath $ConfigPath
    
    # Set up logging with the loaded configuration
    $logPath = $config.logging.logPath
    Write-Log "Using log file: $logPath" -Level "INFO" -LogPath $logPath
    
    # Set number of iterations
    if ($NumberOfIterations -le 0) {
        $NumberOfIterations = $config.iterations.default
    }

    # Ensure we have enough wait time pairs
    if ($config.iterations.waitTimes.Count -lt $NumberOfIterations) {
        Write-Log "Not enough wait time pairs for $NumberOfIterations iterations. Using available pairs cyclically." -Level "WARNING" -LogPath $logPath
    }

    $scriptStartTime = Get-Date
    Write-Log "Starting Activity Generator Orchestrator" -LogPath $logPath
    Write-Log "Total planned iterations: $NumberOfIterations" -LogPath $logPath

    # Clean up old logs
    Remove-OldLogs -LogPath $logPath -RetentionDays $config.logging.logRetentionDays

    # Run iterations
    for ($i = 0; $i -lt $NumberOfIterations; $i++) {
        # Use modulo to cycle through wait times if we have more iterations than wait time pairs
        $waitTimeIndex = $i % $config.iterations.waitTimes.Count
        $waitTimes = $config.iterations.waitTimes[$waitTimeIndex]
        
        Invoke-ActivityIteration `
            -IterationNumber $i `
            -MaxWait $waitTimes.maxWait `
            -MinWait $waitTimes.minWait `
            -WorkingDirectory $config.workingDirectory `
            -StartupScript $config.scripts.startup `
            -OrchestratorScript $config.scripts.orchestrator `
            -LogPath $logPath `
            -MaxRetries $config.execution.maxRetries `
            -RetryDelay $config.execution.retryDelaySeconds
    }

    $scriptEndTime = Get-Date
    $totalDuration = ($scriptEndTime - $scriptStartTime).TotalMinutes
    
    Write-Log "All iterations completed successfully" -Level "SUCCESS" -LogPath $logPath
    Write-Log "Total execution time: $($totalDuration.ToString('F2')) minutes" -LogPath $logPath
    Write-Log "=== ACTIVITY ORCHESTRATOR COMPLETE ===" -Level "SUCCESS" -LogPath $logPath
}
catch {
    Write-Log "Script execution failed: $_" -Level "ERROR" -LogPath $logPath
    Write-Log "=== ACTIVITY ORCHESTRATOR FAILED ===" -Level "ERROR" -LogPath $logPath
    exit 1
}