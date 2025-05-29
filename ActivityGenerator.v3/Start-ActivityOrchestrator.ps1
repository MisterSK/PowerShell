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

# Function to generate hierarchical log path
function Get-HierarchicalLogPath {
    param (
        [string]$BaseLogPath,
        [DateTime]$CurrentTime
    )
    
    $logDir = Join-Path $BaseLogPath "Logs"
    $logDir = Join-Path $logDir $CurrentTime.ToString("yyyy")
    $logDir = Join-Path $logDir $CurrentTime.ToString("MM")
    $logDir = Join-Path $logDir $CurrentTime.ToString("dd")
    
    if (-not (Test-Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir -Force | Out-Null
    }
    
    return Join-Path $logDir "ActivityGenerator_Runtime.log"
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
    
    switch ($Level) {
        "ERROR" { Write-Host $logMessage -ForegroundColor Red }
        "WARNING" { Write-Host $logMessage -ForegroundColor Yellow }
        "SUCCESS" { Write-Host $logMessage -ForegroundColor Green }
        default { Write-Host $logMessage }
    }
    
    Add-Content -Path $LogPath -Value $logMessage
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
        Write-Log "Error loading API configuration: $_" -Level "ERROR"
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
        Write-Log "Error generating random name: $_" -Level "ERROR"
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
        Write-Log "Error updating name storage: $_" -Level "ERROR"
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

        $requiredProperties = @(
            'workingDirectory',
            'scripts',
            'logging',
            'iterations'
        )

        foreach ($prop in $requiredProperties) {
            if (-not $config.PSObject.Properties.Name.Contains($prop)) {
                throw "Missing required configuration property: $prop"
            }
        }

        if (-not ($config.scripts.PSObject.Properties.Name -contains 'startup' -and 
                 $config.scripts.PSObject.Properties.Name -contains 'orchestrator')) {
            throw "Scripts configuration must include 'startup' and 'orchestrator' paths"
        }

        if (-not $config.iterations.PSObject.Properties.Name.Contains('waitTimes')) {
            throw "Iterations configuration must include 'waitTimes' array"
        }

        if ($config.iterations.waitTimes.Count -eq 0) {
            throw "At least one wait time configuration must be specified"
        }

        foreach ($waitTime in $config.iterations.waitTimes) {
            if (-not ($waitTime.PSObject.Properties.Name -contains 'maxWait' -and 
                     $waitTime.PSObject.Properties.Name -contains 'minWait')) {
                throw "Each wait time must include 'maxWait' and 'minWait' values"
            }

            if ($waitTime.minWait -ge $waitTime.maxWait) {
                throw "minWait must be less than maxWait for all wait time configurations"
            }
        }

        return $config
    }
    catch {
        throw "Configuration validation failed: $_"
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
        [string]$LogPath
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

    # Set up logging
    $hierarchicalLogPath = Get-HierarchicalLogPath -BaseLogPath (Split-Path $config.logging.logPath) -CurrentTime (Get-Date)
    $config.logging.logPath = $hierarchicalLogPath

    $scriptStartTime = Get-Date
    Write-Log "Starting Activity Generator Orchestrator (Instance ID: $scriptInstanceId)" -LogPath $config.logging.logPath
    Write-Log "Total planned iterations: $NumberOfIterations" -LogPath $config.logging.logPath

    # Execute iterations
    for ($i = 0; $i -lt $NumberOfIterations; $i++) {
        $waitTimes = $config.iterations.waitTimes[$i]
        
        Invoke-ActivityIteration `
            -IterationNumber $i `
            -MaxWait $waitTimes.maxWait `
            -MinWait $waitTimes.minWait `
            -WorkingDirectory $config.workingDirectory `
            -StartupScript $config.scripts.startup `
            -OrchestratorScript $config.scripts.orchestrator `
            -LogPath $config.logging.logPath
    }

    $scriptEndTime = Get-Date
    $totalDuration = ($scriptEndTime - $scriptStartTime).TotalMinutes

    # Log final summary
    $summaryStats = @{
        "Instance ID" = $scriptInstanceId
        "Total Iterations" = $NumberOfIterations
        "Start Time" = $scriptStartTime.ToString("yyyy-MM-dd HH:mm:ss")
        "End Time" = $scriptEndTime.ToString("yyyy-MM-dd HH:mm:ss")
        "Total Duration" = "$($totalDuration.ToString('F2')) minutes"
        "Average Duration" = "$($($totalDuration / $NumberOfIterations).ToString('F2')) minutes per iteration"
    }

    Write-Log "All iterations completed successfully" -Level "SUCCESS" -LogPath $config.logging.logPath
    Write-Log "Final Summary:`n$(($summaryStats.GetEnumerator() | ForEach-Object { "  $($_.Key): $($_.Value)" }) -join "`n")" -Level "SUCCESS" -LogPath $config.logging.logPath
}
catch {
    Write-Log "Script execution failed: $_" -Level "ERROR" -LogPath $config.logging.logPath
    exit 1
}