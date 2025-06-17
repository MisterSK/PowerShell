<#
.SYNOPSIS
Standalone Window Monitor for PowerShell Orchestrator Windows - ENHANCED VERSION
.DESCRIPTION
Monitors PowerShell orchestrator windows and launches replacements when needed.
Can be run independently of the main PwshWindowManager script.
Supports all monitoring modes: Continuous, UntilDateTime, ForDuration, UntilDayOfWeek.
Now includes full window configuration support including fonts, colors, and sizing.

.PARAMETER ConfigPath
Path to the PwshWindowManager.json configuration file
.PARAMETER Force
Force monitoring even if Enable is set to false in config

.MONITORING MODES
The script supports several monitoring modes configured in MonitorSettings:

1. Continuous (default) - Monitors indefinitely until manually stopped
   - Set Mode = 'Continuous'

2. UntilDateTime - Monitors until a specific date and time
   - Set Mode = 'UntilDateTime'
   - Set UntilDateTime = 'yyyy-MM-dd HH:mm:ss' (e.g., '2025-06-05 18:00:00')

3. ForDuration - Monitors for a specified number of minutes
   - Set Mode = 'ForDuration'
   - Set ForDurationMinutes = number of minutes (e.g., 120 for 2 hours)

4. UntilDayOfWeek - Monitors until a specific day and time
   - Set Mode = 'UntilDayOfWeek'
   - Set UntilDayOfWeek = day name (e.g., 'Monday', 'Friday')
   - Set UntilTime = time in 24-hour format (e.g., '09:00:00')

.EXAMPLE CONFIGURATIONS
Monitor for 4 hours:
    "Mode": "ForDuration",
    "ForDurationMinutes": 240

Monitor until next Monday at 9 AM:
    "Mode": "UntilDayOfWeek",
    "UntilDayOfWeek": "Monday",
    "UntilTime": "09:00:00"

Monitor until specific date/time:
    "Mode": "UntilDateTime",
    "UntilDateTime": "2025-06-10 17:30:00"

.WINDOW CONFIGURATION
The script now fully supports all window configuration options:
- Window size (Cols, Lines)
- Background color (BgColor)
- Font settings (FontName, FontSize, FontWeight)
- Auto-close behavior (AutoCloseSeconds, NoExit)
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$ConfigPath = ".\PwshWindowManager.json",
    [Parameter(Mandatory=$false)]
    [switch]$Force
)

#region Initialization
# Use simple path handling
$scriptPath = $PSScriptRoot
if (-not $scriptPath) {
    $scriptPath = Get-Location
}

# Check if config path is absolute by looking for drive letter or UNC path
$isAbsolute = $false
if ($ConfigPath -match '^[a-zA-Z]:\\' -or $ConfigPath -match '^\\\\') {
    $isAbsolute = $true
}

# Set config path relative to script location if not absolute
if (-not $isAbsolute) {
    $ConfigPath = Join-Path $scriptPath $ConfigPath
}

$baseLogPath = "$scriptPath\Logs"

# Global variable to track current log file
$global:currentLogFile = $null
$global:currentLogDate = $null

# Function to get current log file path with date structure
function Get-CurrentLogFile {
    $currentDate = Get-Date -Format "yyyyMMdd"
    $currentYear = Get-Date -Format "yyyy"
    $currentMonth = Get-Date -Format "MM"
    $currentDay = Get-Date -Format "dd"
    
    $logDir = "$baseLogPath\$currentYear\$currentMonth\$currentDay"
    $logFile = "$logDir\StandaloneMonitor_$currentDate.log"
    
    # Create directory structure if it doesn't exist
    if (-not (Test-Path $logDir)) {
        New-Item -ItemType Directory -Path $logDir -Force | Out-Null
    }
    
    return $logFile
}

# Enhanced logging with log levels and automatic date-based log rotation
function Write-Log {
    param(
        [string]$Message,
        [ValidateSet("INFO","WARN","ERROR","DEBUG")]
        [string]$Level = "INFO"
    )
    
    # Check if we need to switch to a new log file (date changed)
    $currentDate = Get-Date -Format "yyyyMMdd"
    if ($global:currentLogDate -ne $currentDate) {
        $global:currentLogDate = $currentDate
        $global:currentLogFile = Get-CurrentLogFile
        
        # Log the transition if this isn't the first log entry
        if ($global:currentLogDate) {
            $transitionMessage = "=== LOG ROTATED TO NEW DATE: $currentDate ==="
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            $logEntry = "[$timestamp] [INFO] $transitionMessage"
            try {
                $logEntry | Out-File -FilePath $global:currentLogFile -Append -Encoding UTF8
            } catch {
                # Ignore log file errors to prevent cascading failures
            }
        }
    }
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    
    # Write to current log file
    try {
        $logEntry | Out-File -FilePath $global:currentLogFile -Append -Encoding UTF8
    } catch {
        # Ignore log file errors to prevent cascading failures
    }
    
    # Console output with colors
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

# Initialize logging
$global:currentLogFile = Get-CurrentLogFile
$global:currentLogDate = Get-Date -Format "yyyyMMdd"

Write-Log "=== ENHANCED STANDALONE WINDOW MONITOR STARTING ===" -Level "INFO"
Write-Log "Monitor PID: $PID" -Level "INFO"
Write-Log "Configuration file: $ConfigPath" -Level "INFO"
Write-Log "Logging to: $global:currentLogFile" -Level "INFO"
#endregion

#region Configuration Loading
# Default configuration with all window settings
$defaultConfig = @{
    'WindowSettings' = @{
        'Count'      = 4
        'NoExit'     = $false
        'MinSeconds' = 12
        'MaxSeconds' = 499000
        'Cols'       = 100
        'Lines'      = 14
        'BgColor'    = "0A"
        'AutoCloseSeconds' = 30
        'FontSize'   = 6                    # Font size in points
        'FontName'   = "Consolas"            # Font name (Consolas, Lucida Console, Courier New, etc.)
        'FontWeight' = 400                   # Font weight (400=normal, 700=bold)
    }
    'MonitorSettings' = @{
        'Enable'        = $true
        'CheckInterval' = 60
        'MinWindows'    = 1
        'AddIfBelow'    = 2
        'MaxTotal'      = 10
        'Mode'          = 'Continuous'  # Options: Continuous, UntilDateTime, ForDuration, UntilDayOfWeek
        'UntilDateTime' = ''            # Format: "2025-06-05 18:00:00"
        'ForDurationMinutes' = 120      # Monitor for X minutes then exit
        'UntilDayOfWeek' = 'Monday'     # Options: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
        'UntilTime'     = '09:00:00'    # Time on the target day (24-hour format)
    }
}

# Load configuration
try {
    if (Test-Path $ConfigPath) {
        $config = Get-Content $ConfigPath | ConvertFrom-Json -ErrorAction Stop
        
        # Add font settings if not present in existing config
        if (-not $config.WindowSettings.PSObject.Properties.Name -contains 'FontSize') {
            $config.WindowSettings | Add-Member -NotePropertyName 'FontSize' -NotePropertyValue 6
        }
        if (-not $config.WindowSettings.PSObject.Properties.Name -contains 'FontName') {
            $config.WindowSettings | Add-Member -NotePropertyName 'FontName' -NotePropertyValue "Consolas"
        }
        if (-not $config.WindowSettings.PSObject.Properties.Name -contains 'FontWeight') {
            $config.WindowSettings | Add-Member -NotePropertyName 'FontWeight' -NotePropertyValue 400
        }
        
        Write-Log "Configuration loaded from $ConfigPath" -Level "INFO"
    } else {
        Write-Log "Configuration file not found at: $ConfigPath" -Level "ERROR"
        Write-Log "Using default configuration" -Level "WARN"
        $config = $defaultConfig
    }
} catch {
    Write-Log "Error loading config: $_. Using defaults." -Level "ERROR"
    $config = $defaultConfig
}

# Log window configuration
Write-Log "Window Configuration:" -Level "INFO"
Write-Log "  - Size: $($config.WindowSettings.Cols) x $($config.WindowSettings.Lines)" -Level "INFO"
Write-Log "  - Color: $($config.WindowSettings.BgColor)" -Level "INFO"
Write-Log "  - Font: $($config.WindowSettings.FontName) $($config.WindowSettings.FontSize)pt (weight: $($config.WindowSettings.FontWeight))" -Level "INFO"
Write-Log "  - Auto-close: $($config.WindowSettings.AutoCloseSeconds)s (NoExit: $($config.WindowSettings.NoExit))" -Level "INFO"

# Check if monitoring should run
if (-not $config.MonitorSettings.Enable -and -not $Force) {
    Write-Log "Monitoring is disabled in configuration and -Force not specified" -Level "ERROR"
    Write-Log "Either enable monitoring in config or use -Force parameter" -Level "INFO"
    exit 1
}

if ($Force -and -not $config.MonitorSettings.Enable) {
    Write-Log "Monitoring forced via -Force parameter (config has Enable=false)" -Level "WARN"
}
#endregion

#region Path Setup and Verification
# Explicit path handling - update these paths to match your environment
$basePath = "C:\Users\SanyaKhasenye`(Sensit\WorkingDir\PowerShell"
$countdownScript = "$basePath\CountDownTimers\Start-Countdown.ps1"
$orchestratorDir = "$basePath\ActivityGenerator.v3"
$orchestratorScript = "$orchestratorDir\Start-ActivityOrchestrator_v0.1.ps1"

Write-Log "=== PATH VERIFICATION ===" -Level "INFO"
Write-Log "Base path: $basePath" -Level "DEBUG"
Write-Log "Countdown script: $countdownScript" -Level "DEBUG"
Write-Log "Orchestrator directory: $orchestratorDir" -Level "DEBUG"
Write-Log "Orchestrator script: $orchestratorScript" -Level "DEBUG"

# Verify paths
$pathErrors = 0
if (-not (Test-Path $countdownScript)) {
    Write-Log "CRITICAL: Countdown script not found at: $countdownScript" -Level "ERROR"
    $pathErrors++
} else {
    Write-Log "SUCCESS: Countdown script found" -Level "INFO"
}

if (-not (Test-Path $orchestratorScript)) {
    Write-Log "CRITICAL: Orchestrator script not found at: $orchestratorScript" -Level "ERROR"
    $pathErrors++
} else {
    Write-Log "SUCCESS: Orchestrator script found" -Level "INFO"
}

if (-not (Test-Path $orchestratorDir)) {
    Write-Log "CRITICAL: Orchestrator directory not found at: $orchestratorDir" -Level "ERROR"
    $pathErrors++
} else {
    Write-Log "SUCCESS: Orchestrator directory found" -Level "INFO"
}

# Check for orchestrator config file
$orchestratorConfig = "$orchestratorDir\ActivityGeneratorConfig.json"
if (-not (Test-Path $orchestratorConfig)) {
    Write-Log "WARNING: Orchestrator config file not found at: $orchestratorConfig" -Level "WARN"
    Write-Log "The orchestrator script may fail without this configuration file" -Level "WARN"
} else {
    Write-Log "SUCCESS: Orchestrator config found" -Level "INFO"
}

if ($pathErrors -gt 0) {
    Write-Log "Cannot continue with $pathErrors path errors" -Level "ERROR"
    exit 1
}

Write-Log "=== PATH VERIFICATION COMPLETE ===" -Level "INFO"
#endregion

#region Core Functions
# Calculate monitoring end time based on mode (same as main script)
function Get-MonitoringEndTime {
    param($config)
    
    switch ($config.MonitorSettings.Mode) {
        'Continuous' {
            Write-Log "Monitoring mode: Continuous - No end time" -Level "INFO"
            return $null
        }
        
        'UntilDateTime' {
            try {
                # Parse date using Get-Date instead of [DateTime]::Parse
                $endTime = Get-Date $config.MonitorSettings.UntilDateTime -ErrorAction Stop
                Write-Log "Monitoring mode: UntilDateTime - Will monitor until $($endTime.ToString('yyyy-MM-dd HH:mm:ss'))" -Level "INFO"
                
                if ($endTime -le (Get-Date)) {
                    Write-Log "WARNING: Specified end time is in the past. Monitoring will exit immediately." -Level "WARN"
                }
                
                return $endTime
            } catch {
                Write-Log "ERROR: Invalid UntilDateTime format. Expected: 'yyyy-MM-dd HH:mm:ss'. Using continuous mode." -Level "ERROR"
                return $null
            }
        }
        
        'ForDuration' {
            $minutes = [int]$config.MonitorSettings.ForDurationMinutes
            $endTime = (Get-Date).AddMinutes($minutes)
            Write-Log "Monitoring mode: ForDuration - Will monitor for $minutes minutes (until $($endTime.ToString('yyyy-MM-dd HH:mm:ss')))" -Level "INFO"
            return $endTime
        }
        
        'UntilDayOfWeek' {
            try {
                # Parse day of week using string comparison instead of enum
                $targetDayString = $config.MonitorSettings.UntilDayOfWeek
                $validDays = @('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')
                
                $targetDayIndex = -1
                for ($i = 0; $i -lt $validDays.Length; $i++) {
                    if ($validDays[$i] -eq $targetDayString) {
                        $targetDayIndex = $i
                        break
                    }
                }
                
                if ($targetDayIndex -eq -1) {
                    throw "Invalid day of week: $targetDayString"
                }
                
                # Parse time using simple string manipulation
                $timeParts = $config.MonitorSettings.UntilTime -split ':'
                if ($timeParts.Count -ne 3) {
                    throw "Invalid time format. Expected HH:mm:ss"
                }
                
                $hours = [int]$timeParts[0]
                $minutes = [int]$timeParts[1]
                $seconds = [int]$timeParts[2]
                
                $now = Get-Date
                $currentDayIndex = [int]$now.DayOfWeek
                
                # Calculate days until target
                $daysUntilTarget = ($targetDayIndex - $currentDayIndex + 7) % 7
                
                if ($daysUntilTarget -eq 0) {
                    # It's the target day - check if time has passed
                    $currentTimeMinutes = $now.Hour * 60 + $now.Minute
                    $targetTimeMinutes = $hours * 60 + $minutes
                    
                    if ($currentTimeMinutes -ge $targetTimeMinutes) {
                        # Time has passed, set to next week
                        $daysUntilTarget = 7
                    }
                }
                
                # Create end date
                $endDate = $now.Date.AddDays($daysUntilTarget)
                $endDate = $endDate.AddHours($hours).AddMinutes($minutes).AddSeconds($seconds)
                
                Write-Log "Monitoring mode: UntilDayOfWeek - Will monitor until $targetDayString at $($config.MonitorSettings.UntilTime) ($($endDate.ToString('yyyy-MM-dd HH:mm:ss')))" -Level "INFO"
                
                return $endDate
            } catch {
                Write-Log "ERROR: Invalid UntilDayOfWeek configuration. Using continuous mode. Error: $_" -Level "ERROR"
                return $null
            }
        }
        
        default {
            Write-Log "WARNING: Unknown monitoring mode '$($config.MonitorSettings.Mode)'. Using continuous mode." -Level "WARN"
            return $null
        }
    }
}

# Check if monitoring should continue (same as main script)
function Test-MonitoringContinue {
    param($endTime)
    
    if ($null -eq $endTime) {
        # Continuous mode
        return $true
    }
    
    $now = Get-Date
    $shouldContinue = $now -lt $endTime
    
    if (-not $shouldContinue) {
        $duration = $now - $script:monitoringStartTime
        Write-Log "Monitoring period has ended. Duration: $($duration.ToString('dd\.hh\:mm\:ss'))" -Level "INFO"
    }
    
    return $shouldContinue
}

# Window counting function (same as main script)
function Get-RunningPowerShellCount {
    try {
        $searchString = "Windows PowerShell"
        $matchingProcesses = Get-Process | Where-Object { $_.MainWindowTitle -like "*$searchString*" }
        
        # Handle different return types from ConstrainedLanguage mode
        if ($null -eq $matchingProcesses) {
            $count = 0
        }
        elseif ($matchingProcesses -is [Array]) {
            # Multiple matches - use Length property
            $count = $matchingProcesses.Length
        }
        else {
            # Single match - count is 1
            $count = 1
        }
        
        # Reduce by 1 to exclude the script execution/monitoring window
        $count = [int]$count - 1
        if ($count -lt 0) { $count = 0 }  # Ensure we don't go negative
        
        Write-Log "Found $count running PowerShell terminal windows (excluding monitoring window)" -Level "DEBUG"
        return $count
    }
    catch {
        Write-Log "Error counting PowerShell terminal windows: $_" -Level "ERROR"
        return 0
    }
}

# Window launching function with full configuration support
function Start-OrchestratorWindow {
    param($id, $seconds)
    
    Write-Log "Preparing to launch window $id with $seconds second countdown" -Level "DEBUG"
    
    # Font configuration script block
    $fontConfigScript = @"
# Set console font properties (requires Windows 10/11)
try {
    `$fontName = '$($config.WindowSettings.FontName)'
    `$fontSize = $($config.WindowSettings.FontSize)
    `$fontWeight = $($config.WindowSettings.FontWeight)
    
    # Create a temporary registry key for this console window
    `$random = Get-Random
    `$regPath = "HKCU:\Console\OrchestratorWindow`$random"
    
    if (-not (Test-Path `$regPath)) {
        New-Item -Path `$regPath -Force | Out-Null
    }
    
    # Set font properties
    Set-ItemProperty -Path `$regPath -Name 'FaceName' -Value `$fontName -Type String
    Set-ItemProperty -Path `$regPath -Name 'FontSize' -Value ([int](`$fontSize * 65536)) -Type DWord
    Set-ItemProperty -Path `$regPath -Name 'FontWeight' -Value `$fontWeight -Type DWord
    Set-ItemProperty -Path `$regPath -Name 'FontFamily' -Value 54 -Type DWord
    
    # Clean up old registry entries (optional)
    Get-ChildItem 'HKCU:\Console' | Where-Object { `$_.PSChildName -like 'OrchestratorWindow*' -and `$_.PSChildName -ne "OrchestratorWindow`$random" } | Remove-Item -Force -ErrorAction SilentlyContinue
    
    Write-Host "Font configuration applied: `$fontName `$fontSize pt (weight: `$fontWeight)" -ForegroundColor Gray
} catch {
    Write-Warning "Could not apply font settings: `$_"
}
"@
    
    # Create the main script content with all window configurations
    $scriptContent = @"
# Apply font configuration first
$fontConfigScript

# Basic window setup using cmd commands (works in ConstrainedLanguage mode)
cmd /c color $($config.WindowSettings.BgColor)
cmd /c mode con: cols=$($config.WindowSettings.Cols) lines=$($config.WindowSettings.Lines)
cmd /c title "Orchestrator Window $id"

Write-Host '========================================' -ForegroundColor Green
Write-Host 'Starting Orchestrator Window $id' -ForegroundColor Green
Write-Host '========================================' -ForegroundColor Green
Write-Host ''
Write-Host "Window Configuration:" -ForegroundColor Cyan
Write-Host "  Size: $($config.WindowSettings.Cols) x $($config.WindowSettings.Lines)" -ForegroundColor Gray
Write-Host "  Color: $($config.WindowSettings.BgColor)" -ForegroundColor Gray
Write-Host "  Font: $($config.WindowSettings.FontName) $($config.WindowSettings.FontSize)pt" -ForegroundColor Gray
Write-Host ''

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

# Auto-close or keep open based on NoExit setting
if ('$($config.WindowSettings.NoExit)' -eq 'True') {
    Write-Host 'Window will remain open (NoExit enabled)' -ForegroundColor Cyan
    Write-Host 'You can close this window manually when finished.' -ForegroundColor Cyan
} else {
    # Auto-close countdown
    `$autoCloseSeconds = $($config.WindowSettings.AutoCloseSeconds)
    Write-Host '' 
    Write-Host "Window will automatically close in `$autoCloseSeconds seconds..." -ForegroundColor Yellow
    Write-Host 'Press Ctrl+C to cancel auto-close and keep window open.' -ForegroundColor Gray
    Write-Host ''
    
    for (`$i = `$autoCloseSeconds; `$i -gt 0; `$i--) {
        Write-Host "Closing in `$i seconds..." -ForegroundColor Yellow -NoNewline
        try {
            Start-Sleep -Seconds 1
            Write-Host "`r" -NoNewline
        } catch {
            Write-Host ''
            Write-Host 'Auto-close cancelled by user. Window will remain open.' -ForegroundColor Cyan
            Read-Host 'Press Enter to close window manually'
            exit
        }
    }
    Write-Host ''
    Write-Host 'Auto-closing window now...' -ForegroundColor Green
}
"@

    # Create a temporary script file using only basic cmdlets
    $tempScript = "$env:TEMP\OrchestratorWindow_$id.ps1"
    
    try {
        # Write the script content using basic Out-File
        $scriptContent | Out-File -FilePath $tempScript -Encoding UTF8 -Force
        
        # Build simple arguments
        $arguments = @(
            "-ExecutionPolicy", "Bypass"
            "-File", $tempScript
        )
        
        if ($config.WindowSettings.NoExit) {
            $arguments = @("-NoExit") + $arguments
        }

        Write-Log "Creating temporary script: $tempScript" -Level "DEBUG"
        Write-Log "Window settings - Size: $($config.WindowSettings.Cols)x$($config.WindowSettings.Lines), Color: $($config.WindowSettings.BgColor)" -Level "DEBUG"
        Write-Log "Font settings - Name: $($config.WindowSettings.FontName), Size: $($config.WindowSettings.FontSize), Weight: $($config.WindowSettings.FontWeight)" -Level "DEBUG"
        Write-Log "Auto-close timeout: $($config.WindowSettings.AutoCloseSeconds) seconds" -Level "DEBUG"
        
        # Start process without -PassThru to avoid property access restrictions
        Start-Process powershell.exe -ArgumentList $arguments
        Write-Log "Launched window $id - $seconds second countdown" -Level "INFO"
        
        Start-Sleep -Milliseconds 1000
        
    }
    catch {
        Write-Log "Failed to launch window $id : $_" -Level "ERROR"
        # Clean up temp file on error using basic cmdlet
        if (Test-Path $tempScript) {
            Remove-Item $tempScript -Force -ErrorAction SilentlyContinue
        }
    }
}
#endregion

#region Main Monitoring Loop
try {
    Write-Log "=== ENHANCED STANDALONE MONITORING STARTED ===" -Level "INFO"
    Write-Log "Monitor settings - Min: $($config.MonitorSettings.MinWindows), Max: $($config.MonitorSettings.MaxTotal), Check interval: $($config.MonitorSettings.CheckInterval)s" -Level "INFO"
    Write-Log "Will add $($config.MonitorSettings.AddIfBelow) windows when count drops below minimum" -Level "INFO"
    Write-Log "Monitoring mode: $($config.MonitorSettings.Mode)" -Level "INFO"
    Write-Log "Press Ctrl+C to stop monitoring" -Level "INFO"
    
    # Store monitoring start time for duration calculations
    $script:monitoringStartTime = Get-Date
    
    # Calculate monitoring end time based on mode
    $monitoringEndTime = Get-MonitoringEndTime -config $config
    
    # Display monitoring schedule
    if ($null -ne $monitoringEndTime) {
        $duration = $monitoringEndTime - $script:monitoringStartTime
        Write-Log "Monitoring will run for approximately: $($duration.ToString('dd\.hh\:mm\:ss'))" -Level "INFO"
        Write-Log "Monitoring will end at: $($monitoringEndTime.ToString('yyyy-MM-dd HH:mm:ss'))" -Level "INFO"
    }
    
    while (Test-MonitoringContinue -endTime $monitoringEndTime) {
        Write-Log "=== MONITOR CHECK CYCLE ===" -Level "DEBUG"
        
        # Check if we're approaching end time (within 5 minutes)
        if ($null -ne $monitoringEndTime) {
            $timeRemaining = $monitoringEndTime - (Get-Date)
            if ($timeRemaining.TotalMinutes -le 5 -and $timeRemaining.TotalMinutes -gt 0) {
                # Use simple math to round
                $roundedMinutes = [int]($timeRemaining.TotalMinutes + 0.5)
                Write-Log "Monitoring will end in $roundedMinutes minutes" -Level "WARN"
            }
        }
        
        $running = Get-RunningPowerShellCount
        $required = [int]($config.MonitorSettings.MinWindows)
        $maxTotal = [int]($config.MonitorSettings.MaxTotal)
        $addIfBelow = [int]($config.MonitorSettings.AddIfBelow)
        
        Write-Log "Monitor Status: Running=$running, Required=$required, Max=$maxTotal" -Level "INFO"
        
        if ($running -lt $required) {
            # Calculate how many to launch using explicit integer arithmetic
            $available = $maxTotal - $running
            if ($addIfBelow -lt $available) {
                $toLaunch = $addIfBelow
            } else {
                $toLaunch = $available
            }
            
            Write-Log "*** LOW WINDOW COUNT DETECTED ***" -Level "WARN"
            Write-Log "Running: $running, Required: $required, Available slots: $available" -Level "WARN"
            Write-Log "Launching $toLaunch new windows..." -Level "WARN"
            
            if ($toLaunch -gt 0) {
                1..$toLaunch | ForEach-Object {
                    $seconds = Get-Random -Minimum $config.WindowSettings.MinSeconds -Maximum $config.WindowSettings.MaxSeconds
                    $windowId = "MONITOR_$(Get-Date -Format 'HHmmss')_$_"
                    Write-Log "Launching window $windowId with $seconds second countdown" -Level "INFO"
                    Start-OrchestratorWindow -id $windowId -seconds $seconds
                    Start-Sleep -Milliseconds 2000  # Brief delay between launches
                }
                Write-Log "Completed launching $toLaunch replacement windows" -Level "INFO"
            } else {
                Write-Log "No windows to launch (already at maximum)" -Level "WARN"
            }
        } else {
            Write-Log "Window count OK: $running >= $required (minimum)" -Level "DEBUG"
        }
        
        $nextCheck = (Get-Date).AddSeconds($config.MonitorSettings.CheckInterval)
        
        # Check if next check would exceed end time
        if ($null -ne $monitoringEndTime -and $nextCheck -gt $monitoringEndTime) {
            Write-Log "Next check would exceed monitoring end time. Preparing to exit..." -Level "INFO"
            Write-Log "=== MONITOR CHECK COMPLETE ===" -Level "DEBUG"
            break
        }
        
        Write-Log "Next monitor check at: $($nextCheck.ToString('HH:mm:ss'))" -Level "DEBUG"
        Write-Log "=== MONITOR CHECK COMPLETE ===" -Level "DEBUG"
        
        Start-Sleep -Seconds $config.MonitorSettings.CheckInterval
    }
    
    # Log monitoring completion
    $totalDuration = (Get-Date) - $script:monitoringStartTime
    Write-Log "=== MONITORING COMPLETED ===" -Level "INFO"
    Write-Log "Total monitoring duration: $($totalDuration.ToString('dd\.hh\:mm\:ss'))" -Level "INFO"
    Write-Log "Monitoring mode was: $($config.MonitorSettings.Mode)" -Level "INFO"
    Write-Log "Standalone monitor will now exit as monitoring period has ended." -Level "INFO"
}
catch {
    Write-Log "Fatal error in monitoring: $_" -Level "ERROR"
    Write-Log "Stack trace: $($_.ScriptStackTrace)" -Level "ERROR"
    exit 1
}
finally {
    Write-Log "=== ENHANCED STANDALONE MONITORING ENDED ===" -Level "INFO"
}
#endregion