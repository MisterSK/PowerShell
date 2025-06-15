# PwshWindowManager

A PowerShell orchestrator that manages multiple PowerShell windows running activity/countdown timers with intelligent monitoring and auto-recovery capabilities.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Monitoring Modes](#monitoring-modes)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Logging](#logging)
- [Troubleshooting](#troubleshooting)

## Overview

PwshWindowManager is an advanced PowerShell script that:
- Launches multiple PowerShell windows with countdown timers
- Monitors the number of running windows
- Automatically launches new windows when the count drops below a threshold
- Provides flexible monitoring duration options
- Logs all activities for debugging and auditing

## Features

- **Automatic Window Management**: Maintains a minimum number of active PowerShell windows
- **Configurable Monitoring**: Multiple modes for controlling how long monitoring runs
- **Smart Recovery**: Automatically launches new windows when existing ones close
- **Customizable Window Appearance**: Control window size, colors, and behavior
- **Comprehensive Logging**: Detailed logs with multiple severity levels
- **Flexible Configuration**: JSON-based configuration for easy customization
- **Auto-Close Options**: Windows can automatically close after completion or stay open

## Requirements

- Windows PowerShell 5.1 or later
- Windows operating system
- Administrator privileges (recommended)
- Required scripts:
  - `Start-Countdown.ps1` (countdown timer script)
  - `Start-ActivityOrchestrator_v0.1.ps1` (orchestrator script)

## Installation

1. Create a directory for the PwshWindowManager:
   ```powershell
   New-Item -ItemType Directory -Path "C:\Scripts\PwshWindowManager"
   ```

2. Place the `PwshWindowManager.ps1` script in this directory

3. Update the script paths in the script to match your environment:
   ```powershell
   $basePath = "C:\Users\YourUsername\YourPath\PowerShell"
   $countdownScript = "$basePath\CountDownTimers\Start-Countdown.ps1"
   $orchestratorDir = "$basePath\ActivityGenerator.v3"
   $orchestratorScript = "$orchestratorDir\Start-ActivityOrchestrator_v0.1.ps1"
   ```

4. Run the script once to generate the default configuration file:
   ```powershell
   .\PwshWindowManager.ps1
   ```

5. Edit the generated `PwshWindowManager.json` file to customize settings

## Configuration

The configuration file (`PwshWindowManager.json`) contains all customizable settings:

### Window Settings

```json
{
  "WindowSettings": {
    "Count": 4,                    // Initial number of windows to launch
    "NoExit": false,               // Keep windows open after completion
    "MinSeconds": 12,              // Minimum countdown seconds
    "MaxSeconds": 499000,          // Maximum countdown seconds
    "Cols": 80,                    // Window width in columns
    "Lines": 10,                   // Window height in lines
    "BgColor": "0A",              // Background color (DOS color code)
    "AutoCloseSeconds": 30         // Seconds before auto-close (if NoExit=false)
  }
}
```

#### Color Codes
- `0A` = Black background, bright green text
- `1B` = Blue background, bright cyan text
- `2E` = Green background, bright yellow text
- `4F` = Red background, bright white text

### Monitor Settings

```json
{
  "MonitorSettings": {
    "Enable": true,                // Enable/disable monitoring
    "CheckInterval": 60,           // Seconds between window count checks
    "MinWindows": 1,               // Minimum windows to maintain
    "AddIfBelow": 2,               // Windows to add when below minimum
    "MaxTotal": 10,                // Maximum total windows allowed
    "Mode": "Continuous",          // Monitoring mode (see below)
    "UntilDateTime": "",           // For UntilDateTime mode
    "ForDurationMinutes": 120,     // For ForDuration mode
    "UntilDayOfWeek": "Monday",    // For UntilDayOfWeek mode
    "UntilTime": "09:00:00"        // Time for UntilDayOfWeek mode
  }
}
```

## Monitoring Modes

### 1. Continuous Mode (Default)
Monitors indefinitely until the script is manually stopped.

```json
"Mode": "Continuous"
```

### 2. UntilDateTime Mode
Monitors until a specific date and time.

```json
"Mode": "UntilDateTime",
"UntilDateTime": "2025-06-10 18:00:00"
```

### 3. ForDuration Mode
Monitors for a specified number of minutes.

```json
"Mode": "ForDuration",
"ForDurationMinutes": 240  // Monitor for 4 hours
```

### 4. UntilDayOfWeek Mode
Monitors until a specific day of the week at a specific time.

```json
"Mode": "UntilDayOfWeek",
"UntilDayOfWeek": "Friday",
"UntilTime": "17:00:00"  // Monitor until Friday at 5 PM
```

## Usage

### Basic Usage
Simply run the script to start with default settings:
```powershell
.\PwshWindowManager.ps1
```

### Common Scenarios

#### Scenario 1: Run 6 windows continuously
```json
{
  "WindowSettings": { "Count": 6 },
  "MonitorSettings": { 
    "Enable": true,
    "Mode": "Continuous",
    "MinWindows": 3
  }
}
```

#### Scenario 2: Run during business hours
```json
{
  "MonitorSettings": {
    "Enable": true,
    "Mode": "UntilDayOfWeek",
    "UntilDayOfWeek": "Friday",
    "UntilTime": "17:30:00"
  }
}
```

#### Scenario 3: Run for a specific task duration
```json
{
  "MonitorSettings": {
    "Enable": true,
    "Mode": "ForDuration",
    "ForDurationMinutes": 480  // 8 hours
  }
}
```

#### Scenario 4: One-time launch without monitoring
```json
{
  "WindowSettings": { "Count": 10 },
  "MonitorSettings": { "Enable": false }
}
```

## File Structure

```
PwshWindowManager/
├── PwshWindowManager.ps1       # Main script
├── PwshWindowManager.json      # Configuration file
└── Logs/
    └── Orchestrator_YYYYMMDD.log  # Daily log files
```

## Logging

### Log Levels
- **INFO**: General information about script operation
- **WARN**: Warning messages (e.g., low window count)
- **ERROR**: Error messages that don't stop execution
- **DEBUG**: Detailed debugging information

### Log Location
Logs are stored in the `Logs` subdirectory with daily rotation:
- Format: `Orchestrator_YYYYMMDD.log`
- Example: `Orchestrator_20250603.log`

### Log Examples
```
[2025-06-03 14:30:00] [INFO] Script started with PID 12345
[2025-06-03 14:30:01] [INFO] Configuration loaded from C:\Scripts\PwshWindowManager\PwshWindowManager.json
[2025-06-03 14:30:02] [INFO] Launching 4 initial windows
[2025-06-03 14:30:10] [INFO] Monitor Status: Running=4, Required=1, Max=10
[2025-06-03 14:35:10] [WARN] *** LOW WINDOW COUNT DETECTED ***
[2025-06-03 14:35:10] [WARN] Launching 2 new windows...
```

## Troubleshooting

### Common Issues

#### 1. Script Fails to Find Countdown/Orchestrator Scripts
**Error**: `CRITICAL: Countdown script not found at: [path]`

**Solution**: Update the paths in the script:
```powershell
$basePath = "C:\Your\Actual\Path"
$countdownScript = "$basePath\CountDownTimers\Start-Countdown.ps1"
```

#### 2. Windows Close Immediately
**Issue**: Windows flash and close

**Solution**: Enable NoExit mode:
```json
"NoExit": true
```

#### 3. Type Conversion Error
**Error**: `Cannot convert the "System.Object[]" value of type "System.Object[]" to type "System.Int32"`

**Solution**: Ensure you're using the fixed version of the script with proper variable assignment in `Get-RunningPowerShellCount`

#### 4. Monitoring Doesn't Stop
**Issue**: Script continues past intended end time

**Solution**: Verify your monitoring mode configuration:
- Check date/time format matches requirements
- Ensure the end time is in the future
- Verify the Mode setting matches your configuration

#### 5. No Windows Launching
**Issue**: Initial windows don't appear

**Solution**:
1. Check PowerShell execution policy: `Get-ExecutionPolicy`
2. Run as Administrator if needed
3. Check logs for specific error messages
4. Verify all required scripts exist at specified paths

### Debug Mode
To enable detailed debugging:
1. Open the script
2. Add more DEBUG level logging where needed
3. Check the log file for DEBUG entries

### Performance Considerations
- Each window uses system resources
- Recommended maximum: 20-30 windows
- Adjust `CheckInterval` for less frequent monitoring (reduces CPU usage)
- Consider using `ForDuration` mode for long-running tasks

## Advanced Configuration

### Custom Window Titles
Modify the script to include custom window titles:
```powershell
cmd /c title "Custom Title - Window $id"
```

### Integration with Task Scheduler
Create a scheduled task to run the manager:
```powershell
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File C:\Scripts\PwshWindowManager\PwshWindowManager.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 9:00AM
Register-ScheduledTask -TaskName "PwshWindowManager" -Action $action -Trigger $trigger
```

### Network Paths
If using network paths, ensure:
- UNC paths are properly formatted
- Network drives are mapped before script runs
- Appropriate permissions are set

## Support

For issues or questions:
1. Check the log files first
2. Verify configuration syntax (valid JSON)
3. Ensure all paths are correct
4. Test with minimal configuration first

## Version History

- v1.0 - Initial release with basic window management
- v1.1 - Added configurable monitoring modes
- v1.2 - Fixed window counting bug
- v1.3 - Added comprehensive logging and monitoring duration options