[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$ConfigPath = ".\ActivityGeneratorConfig.json",
    
    [Parameter(Mandatory=$false)]
    [string]$WordApiConfigPath = ".\WordGeneratorAPIs.json",
    
    [Parameter(Mandatory=$false)]
    [string]$NameStoragePath = ".\RandomNames.json",
    
    [Parameter(Mandatory=$false)]
    [int]$NumberOfIterations = 0  # Will use config file default if 0
)

# Function to manage log rotation and creation
function Get-CurrentLogPath {
    param (
        [string]$BaseLogPath,
        [DateTime]$CurrentTime,
        [int64]$MaxSizeBytes = 10MB
    )
    
    try {
        $logDir = Join-Path $BaseLogPath "Logs"
        $logDir = Join-Path $logDir $CurrentTime.ToString("yyyy")
        $logDir = Join-Path $logDir $CurrentTime.ToString("MM")
        $logDir = Join-Path $logDir $CurrentTime.ToString("dd")
        
        if (-not (Test-Path $logDir)) {
            New-Item -ItemType Directory -Path $logDir -Force | Out-Null
        }

        $baseLogName = "ActivityGenerator_Runtime"
        $logPath = Join-Path $logDir "$baseLogName.log"

        # Check if log exists and needs rotation
        if (Test-Path $logPath) {
            $logFile = Get-Item $logPath
            if ($logFile.Length -ge $MaxSizeBytes) {
                # Find next available rotation number
                $i = 1
                while (Test-Path (Join-Path $logDir "$baseLogName.$i.log")) {
                    $i++
                }
                
                # Rename existing log
                $newName = Join-Path $logDir "$baseLogName.$i.log"
                Rename-Item -Path $logPath -NewName (Split-Path $newName -Leaf)
                
                # Create new log file
                New-Item -ItemType File -Path $logPath -Force | Out-Null
            }
        }
        else {
            New-Item -ItemType File -Path $logPath -Force | Out-Null
        }

        return $logPath
    }
    catch {
        Write-Error "Failed to manage log path: $_"
        throw
    }
}

# Function to write to both console and log file
function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO",
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$LogPath
    )
    
    try {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "[$timestamp] [$Level] $Message"
        
        switch ($Level) {
            "ERROR" { Write-Host $logMessage -ForegroundColor Red }
            "WARNING" { Write-Host $logMessage -ForegroundColor Yellow }
            "SUCCESS" { Write-Host $logMessage -ForegroundColor Green }
            default { Write-Host $logMessage }
        }
        
        # Ensure log directory exists
        $logDir = Split-Path -Path $LogPath -Parent
        if (-not (Test-Path -Path $logDir)) {
            New-Item -ItemType Directory -Path $logDir -Force | Out-Null
        }
        
        Add-Content -Path $LogPath -Value $logMessage -ErrorAction Stop
    }
    catch {
        Write-Error "Failed to write to log file: $_"
    }
}

# Function to check if log needs to be rolled over to new day
function Test-LogRollover {
    param (
        [string]$CurrentLogPath
    )
    
    try {
        if (-not $CurrentLogPath) { return $true }
        
        $logPathDate = Split-Path (Split-Path (Split-Path $CurrentLogPath -Parent) -Parent) -Leaf
        $currentDate = (Get-Date).ToString("dd")
        
        return $logPathDate -ne $currentDate
    }
    catch {
        Write-Error "Failed to check log rollover: $_"
        return $true
    }
}

# Function to manage word generator APIs
function Get-WordGeneratorAPI {
    param (
        [string]$ConfigPath
    )
    
    try {
        $apiConfig = Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json
        $availableApis = $apiConfig.apiEndpoints | Where-Object { $_.failureCount -lt $apiConfig.maxFailures }
        
        if (-not $availableApis) {
            throw "No available API endpoints"
        }
        
        return Get-Random -InputObject $availableApis
    }
    catch {
        Write-Log "Error loading API configuration: $_" -Level "ERROR" -LogPath $script:CurrentLogPath
        return $null
    }
}

# Function to update API failure count
function Update-ApiFailureCount {
    param (
        [string]$ConfigPath,
        [string]$ApiName,
        [bool]$Success
    )
    
    $apiConfig = Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json
    $api = $apiConfig.apiEndpoints | Where-Object { $_.name -eq $ApiName }
    
    if ($Success) {
        $api.failureCount = 0
    } else {
        $api.failureCount++
    }
    
    $apiConfig | ConvertTo-Json -Depth 10 | Set-Content -Path $ConfigPath
}

# Function to manage name storage
function Get-RandomName {
    param (
        [string]$NameStoragePath,
        [string]$WordApiConfigPath
    )
    
    try {
        # Try online API first
        $api = Get-WordGeneratorAPI -ConfigPath $WordApiConfigPath
        if ($api) {
            try {
                $response = Invoke-RestMethod `
                    -Uri $api.url `
                    -Method $api.method `
                    -Headers $api.headers
                
                $word = $response
                $pathParts = $api.wordPath -split '\.'
                foreach ($part in $pathParts) {
                    if ($part -match '^\[(\d+)\]$') {
                        $index = [int]$matches[1]
                        $word = $word[$index]
                    } else {
                        $word = $word.$part
                    }
                }
                
                Update-ApiFailureCount -ConfigPath $WordApiConfigPath -ApiName $api.name -Success $true
                Update-NameStorage -NameStoragePath $NameStoragePath -NewName $word
                return $word
            }
            catch {
                Update-ApiFailureCount -ConfigPath $WordApiConfigPath -ApiName $api.name -Success $false
            }
        }
        
        # Fallback to stored names
        $nameData = Get-Content -Path $NameStoragePath -Raw | ConvertFrom-Json
        return Get-Random -InputObject $nameData.names
    }
    catch {
        Write-Log "Error generating random name: $_" -Level "ERROR" -LogPath $script:CurrentLogPath
        return "script-$(Get-Random -Minimum 1000 -Maximum 9999)"
    }
}

# Function to update name storage
function Update-NameStorage {
    param (
        [string]$NameStoragePath,
        [string]$NewName
    )
    
    try {
        $nameData = Get-Content -Path $NameStoragePath -Raw | ConvertFrom-Json
        
        if ($nameData.names -notcontains $NewName) {
            $nameData.names = @($NewName) + $nameData.names
            
            if ($nameData.names.Count -gt $nameData.settings.maxNames) {
                $nameData.names = $nameData.names[0..($nameData.settings.maxNames - 1)]
            }
            
            $nameData.settings.lastUpdated = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")
            $nameData | ConvertTo-Json -Depth 10 | Set-Content -Path $NameStoragePath
        }
    }
    catch {
        Write-Log "Error updating name storage: $_" -Level "ERROR" -LogPath $script:CurrentLogPath
    }
}

# Function to generate script instance ID
function Get-ScriptInstanceId {
    param (
        [string]$NameStoragePath,
        [string]$WordApiConfigPath
    )
    
    $randomName = Get-RandomName -NameStoragePath $NameStoragePath -WordApiConfigPath $WordApiConfigPath
    $timestamp = Get-Date -Format "yyyy-MMM-dd-HHmm"
    return "$randomName-$timestamp"
}

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

    Write-Log "Starting iteration $($IterationNumber + 1)" -LogPath $LogPath
    Write-Log "Using wait times - Min: $MinWait, Max: $MaxWait" -LogPath $LogPath
    Write-Log "Generated wait time: $generatedRandom ms" -LogPath $LogPath

    try {
        Set-Location -Path $WorkingDirectory -ErrorAction Stop

        # Run startup script
        $startupParams = @{
            FilePath = "powershell.exe"
            ArgumentList = @(
                "-ExecutionPolicy", "Bypass",
                "-File", $StartupScript,
                "-rand_start_wait_max", $MaxWait,
                "-rand_start_wait_min", $MinWait
            )
        }
        $startupProcess = Start-Process @startupParams -Wait -NoNewWindow -PassThru

        if ($startupProcess.ExitCode -ne 0) {
            throw "Startup script failed with exit code: $($startupProcess.ExitCode)"
        }

        # Run orchestrator script
        $orchestratorParams = @{
            FilePath = "powershell.exe"
            ArgumentList = @(
                "-ExecutionPolicy", "Bypass",
                "-File", $OrchestratorScript
            )
        }
        $orchestratorProcess = Start-Process @orchestratorParams -Wait -NoNewWindow -PassThru

        if ($orchestratorProcess.ExitCode -ne 0) {
            throw "Orchestrator script failed with exit code: $($orchestratorProcess.ExitCode)"
        }

        $endTime = Get-Date
        $duration = ($endTime - $startTime).TotalSeconds

        Write-Log "Iteration $($IterationNumber + 1) completed successfully (Duration: $($duration.ToString('F2')) seconds)" -Level "SUCCESS" -LogPath $LogPath

        # Log iteration stats
        $stats = @{
            "Iteration" = $IterationNumber + 1
            "StartTime" = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
            "EndTime" = $endTime.ToString("yyyy-MM-dd HH:mm:ss")
            "Duration" = "$($duration.ToString('F2')) seconds"
            "MinWait" = $MinWait
            "MaxWait" = $MaxWait
            "GeneratedWait" = $generatedRandom
        }

        Write-Log "Iteration Statistics:`n$(($stats.GetEnumerator() | ForEach-Object { "  $($_.Key): $($_.Value)" }) -join "`n")" -LogPath $LogPath
    }
    catch {
        Write-Log "Error in iteration $($IterationNumber + 1): $_" -Level "ERROR" -LogPath $LogPath
        throw $_
    }
}

# Main execution block
try {
    # Generate script instance ID
    $scriptInstanceId = Get-ScriptInstanceId -NameStoragePath $NameStoragePath -WordApiConfigPath $WordApiConfigPath
    
    # Load configuration
    $config = Get-ScriptConfig -ConfigPath $ConfigPath
    
    # Set number of iterations
    if ($NumberOfIterations -le 0) {
        $NumberOfIterations = $config.iterations.default
    }

    # Validate iteration count against wait times
    if ($config.iterations.waitTimes.Count -lt $NumberOfIterations) {
        throw "Not enough wait time pairs in configuration for requested iterations"
    }

    # Initialize logging
    $script:CurrentLogPath = Get-CurrentLogPath -BaseLogPath (Split-Path $config.logging.logPath) -CurrentTime (Get-Date)
    
    $scriptStartTime = Get-Date
    Write-Log "Starting Activity Generator Orchestrator (Instance ID: $scriptInstanceId)" -LogPath $script:CurrentLogPath
    Write-Log "Total planned iterations: $NumberOfIterations" -LogPath $script:CurrentLogPath

    # Execute iterations
    for ($i = 0; $i -lt $NumberOfIterations; $i++) {
        # Check for log rollover at the start of each iteration
        if (Test-LogRollover -CurrentLogPath $script:CurrentLogPath) {
            Write-Log "Rolling over log file to new day" -Level "INFO" -LogPath $script:CurrentLogPath
            $script:CurrentLogPath = Get-CurrentLogPath -BaseLogPath (Split-Path $config.logging.logPath) -CurrentTime (Get-Date)
            Write-Log "Log rollover complete. Continuing execution." -Level "INFO" -LogPath $script:CurrentLogPath
        }

        $waitTimes = $config.iterations.waitTimes[$i]
        
        Invoke-ActivityIteration `
            -IterationNumber $i `
            -MaxWait $waitTimes.maxWait `
            -MinWait $waitTimes.minWait `
            -WorkingDirectory $config.workingDirectory `
            -StartupScript $config.scripts.startup `
            -OrchestratorScript $config.scripts.orchestrator `
            -LogPath $script:CurrentLogPath `
            -MaxRetries $config.execution.maxRetries `
            -RetryDelay $config.execution.retryDelaySeconds
    }

    $scriptEndTime = Get-Date
    $totalDuration = ($scriptEndTime - $scriptStartTime).TotalMinutes

    # Log final summary
    $summaryStats = @