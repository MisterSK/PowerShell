<#
.SYNOPSIS
Advanced orchestrator with simple window counting and proper path handling - DIAGNOSTIC VERSION
#>

#region Initialization
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$configPath = Join-Path $scriptPath "PwshWindowManager.json"
$logPath = Join-Path $scriptPath "Logs"
$logFile = Join-Path $logPath "Orchestrator_$(Get-Date -Format 'yyyyMMdd').log"

# Ensure Logs directory exists
if (-not (Test-Path $logPath)) {
    New-Item -ItemType Directory -Path $logPath | Out-Null
}

# Enhanced logging with log levels
function Write-Log {
    param(
        [string]$Message,
        [ValidateSet("INFO","WARN","ERROR","DEBUG")]
        [string]$Level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    Add-Content -Path $logFile -Value $logEntry
    
    if ($Level -in ("ERROR","WARN")) { 
        if ($Level -eq "ERROR") {
            Write-Host $logEntry -ForegroundColor Red
        } else {
            Write-Host $logEntry -ForegroundColor Yellow
        }
    }
    elseif ($Level -eq "DEBUG") { 
        Write-Host $logEntry -ForegroundColor Gray 
    }
    else { 
        Write-Host $logEntry 
    }
}

# Default configuration
$defaultConfig = @{
    WindowSettings = @{
        Count      = 4
        NoExit     = $false
        MinSeconds = 12
        MaxSeconds = 499000
        Cols       = 80
        Lines      = 10
        BgColor    = "0A"
    }
    MonitorSettings = @{
        Enable        = $true
        CheckInterval = 60
        MinWindows    = 1
        AddIfBelow    = 2
        MaxTotal      = 6
    }
}

# Load configuration
try {
    if (Test-Path $configPath) {
        $config = Get-Content $configPath | ConvertFrom-Json -ErrorAction Stop
        Write-Log "Configuration loaded from $configPath"
    } else {
        $config = $defaultConfig
        $config | ConvertTo-Json -Depth 3 | Out-File $configPath
        Write-Log "Created default configuration at $configPath" -Level "WARN"
    }
} catch {
    $config = $defaultConfig
    Write-Log "Error loading config: $_. Using defaults." -Level "ERROR"
}

# Correct path handling with escaped parenthesis
$basePath = "C:\Users\SanyaKhasenye`(Sensit\WorkingDir\PowerShell"
$countdownScript = "$basePath\CountDownTimers\Start-Countdown.ps1"
$orchestratorDir = "$basePath\ActivityGenerator.v3"
$orchestratorScript = "$orchestratorDir\Start-ActivityOrchestrator_v0.1.ps1"

Write-Log "Base path: $basePath" -Level "DEBUG"
Write-Log "Countdown script: $countdownScript" -Level "DEBUG"
Write-Log "Orchestrator directory: $orchestratorDir" -Level "DEBUG"
Write-Log "Orchestrator script: $orchestratorScript" -Level "DEBUG"

# Verify paths
if (-not (Test-Path $countdownScript)) {
    Write-Log "Countdown script not found at: $countdownScript" -Level "ERROR"
    Write-Log "Please verify the path exists and is accessible" -Level "ERROR"
    exit 1
}
if (-not (Test-Path $orchestratorScript)) {
    Write-Log "Orchestrator script not found at: $orchestratorScript" -Level "ERROR"
    Write-Log "Please verify the path exists and is accessible" -Level "ERROR"
    exit 1
}

# Check for required configuration file for orchestrator
$orchestratorConfig = Join-Path $orchestratorDir "ActivityGeneratorConfig.json"
if (-not (Test-Path $orchestratorConfig)) {
    Write-Log "Warning: Orchestrator config file not found at: $orchestratorConfig" -Level "WARN"
    Write-Log "The orchestrator script may fail without this configuration file" -Level "WARN"
}

Write-Log "All path validations completed" -Level "DEBUG"
#endregion

#region Core Functions
# SIMPLE window counting as requested
function Get-RunningPowerShellCount {
    try {
        $processes = Get-Process -Name powershell -ErrorAction SilentlyContinue | 
                    Where-Object { $_.MainWindowTitle -ne "" }
        $count = $processes.Count
        Write-Log "Found $count running PowerShell windows" -Level "DEBUG"
        return $count
    }
    catch {
        Write-Log "Error counting PowerShell processes: $_" -Level "ERROR"
        return 0
    }
}

function Start-OrchestratorWindow {
    param($id, $seconds)
    
    Write-Log "Preparing to launch window $id with $seconds second countdown" -Level "DEBUG"
    
    # Create a very simple script using original cmd-based approach
    $scriptContent = @"
# Basic window setup using cmd commands (works in ConstrainedLanguage mode)
cmd /c color $($config.WindowSettings.BgColor)
cmd /c mode con: cols=$($config.WindowSettings.Cols) lines=$($config.WindowSettings.Lines)
cmd /c title "Orchestrator Window $id"

Write-Host '========================================' -ForegroundColor Green
Write-Host 'Starting Orchestrator Window $id' -ForegroundColor Green
Write-Host '========================================' -ForegroundColor Green

# Change to working directory
Write-Host 'Changing to orchestrator directory...' -ForegroundColor Cyan
try {
    Set-Location -LiteralPath '$orchestratorDir'
    Write-Host "Successfully changed to: `$(Get-Location)" -ForegroundColor Green
} catch {
    Write-Warning "Failed to change directory: `$_"
    Write-Host 'Continuing with current directory...' -ForegroundColor Yellow
}

# Start countdown
Write-Host '========================================' -ForegroundColor Yellow
Write-Host 'Starting countdown for window $id ($seconds seconds)...' -ForegroundColor Yellow
Write-Host '========================================' -ForegroundColor Yellow
try {
    if (Test-Path '$countdownScript') {
        & '$countdownScript' -Seconds $seconds -Message 'Window $id initializing'
        Write-Host 'Countdown completed successfully' -ForegroundColor Green
    } else {
        Write-Warning "Countdown script not found: '$countdownScript'"
        Write-Host 'Skipping countdown...' -ForegroundColor Yellow
        Start-Sleep -Seconds 3
    }
} catch {
    Write-Warning "Countdown failed: `$_"
    Write-Host 'Continuing without countdown...' -ForegroundColor Yellow
}

# Start orchestrator
Write-Host '========================================' -ForegroundColor Green
Write-Host 'Starting orchestrator for window $id...' -ForegroundColor Green
Write-Host '========================================' -ForegroundColor Green
try {
    if (Test-Path '$orchestratorScript') {
        & '$orchestratorScript'
        Write-Host 'Orchestrator completed successfully' -ForegroundColor Green
    } else {
        Write-Warning "Orchestrator script not found: '$orchestratorScript'"
    }
} catch {
    Write-Warning "Orchestrator failed: `$_"
}

Write-Host '========================================' -ForegroundColor Magenta
Write-Host "Orchestrator window $id completed." -ForegroundColor Magenta
Write-Host '========================================' -ForegroundColor Magenta

# Simple wait or exit
Write-Host 'Press Enter to close this window...' -ForegroundColor Cyan
Read-Host 'Press Enter to continue'
"@

    # Create a temporary script file
    $tempScript = Join-Path $env:TEMP "OrchestratorWindow_$id.ps1"
    
    try {
        # Write the script content to the temp file
        $scriptContent | Out-File -FilePath $tempScript -Encoding UTF8
        
        # Build simple arguments
        $arguments = @(
            "-ExecutionPolicy", "Bypass"
            "-File", $tempScript
        )
        
        if ($config.WindowSettings.NoExit) {
            $arguments = @("-NoExit") + $arguments
        }

        Write-Log "Creating temporary script: $tempScript" -Level "DEBUG"
        
        $process = Start-Process powershell.exe -ArgumentList $arguments -PassThru
        Write-Log "Launched window $id with PID $($process.Id) - $seconds second countdown" -Level "INFO"
        
        # Clean up temp file after a delay
        Start-Job -ScriptBlock {
            param($file)
            Start-Sleep -Seconds 60
            if (Test-Path $file) {
                Remove-Item $file -Force -ErrorAction SilentlyContinue
            }
        } -ArgumentList $tempScript | Out-Null
        
        Start-Sleep -Milliseconds 1000
    }
    catch {
        Write-Log "Failed to launch window $id : $_" -Level "ERROR"
        # Clean up temp file on error
        if (Test-Path $tempScript) {
            Remove-Item $tempScript -Force -ErrorAction SilentlyContinue
        }
    }
}
#endregion

#region Main Execution
try {
    Write-Log "Script started with PID $PID" -Level "INFO"
    Write-Log "Current working directory: $(Get-Location)" -Level "DEBUG"
    Write-Log "PowerShell version: $($PSVersionTable.PSVersion)" -Level "DEBUG"

    # Initial launch
    $initialCount = $config.WindowSettings.Count
    Write-Log "Launching $initialCount initial windows" -Level "INFO"
    
    1..$initialCount | ForEach-Object {
        $seconds = Get-Random -Minimum $config.WindowSettings.MinSeconds -Maximum $config.WindowSettings.MaxSeconds
        Write-Log "Generated $seconds seconds for window $_" -Level "DEBUG"
        Start-OrchestratorWindow -id $_ -seconds $seconds
    }

    # Monitoring loop
    if ($config.MonitorSettings.Enable) {
        Write-Log "Starting monitoring process..." -Level "INFO"
        Write-Log "Monitor settings - Min: $($config.MonitorSettings.MinWindows), Max: $($config.MonitorSettings.MaxTotal), Check interval: $($config.MonitorSettings.CheckInterval)s" -Level "DEBUG"
        
        while ($true) {
            $running = Get-RunningPowerShellCount
            $required = $config.MonitorSettings.MinWindows
            
            Write-Log "Monitor check - Running: $running, Required: $required" -Level "DEBUG"
            
            if ($running -lt $required) {
                $toLaunch = [Math]::Min(
                    $config.MonitorSettings.AddIfBelow,
                    $config.MonitorSettings.MaxTotal - $running
                )
                Write-Log "Low window count ($running/$required). Launching $toLaunch new windows..." -Level "WARN"
                
                1..$toLaunch | ForEach-Object {
                    $seconds = Get-Random -Minimum $config.WindowSettings.MinSeconds -Maximum $config.WindowSettings.MaxSeconds
                    $windowId = "AUTO_$(Get-Date -Format 'HHmmss')_$_"
                    Start-OrchestratorWindow -id $windowId -seconds $seconds
                }
            }
            
            Start-Sleep -Seconds $config.MonitorSettings.CheckInterval
        }
    } else {
        Write-Log "Monitoring disabled. Script will exit after initial launch." -Level "INFO"
    }
}
catch {
    Write-Log "Fatal error: $_" -Level "ERROR"
    Write-Log "Stack trace: $($_.ScriptStackTrace)" -Level "ERROR"
    exit 1
}
finally {
    Write-Log "Script execution ended" -Level "INFO"
}
#endregion