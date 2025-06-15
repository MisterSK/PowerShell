# ActivityGenerator.ps1 - Enhanced Version

## Quick Fix for Common Errors

### "Positional parameter cannot be found that accepts argument '1/2'" Error

**Current Solution**: 
The script now uses the call operator (&) which handles parameters more reliably than Start-Process.

**If error persists**:
1. Your Start-Countdown.ps1 may not have proper parameter declarations
2. Replace it with Start-Countdown-Fixed.ps1 which properly handles the -Message parameter
3. Or try the base64 encoding method (commented in ActivityGenerator.ps1)

**To diagnose**:
```powershell
.\Test-CountdownCall.ps1
```

### Line Break Issue

If the countdown timer shows everything on one line instead of:
```
[Iteration 2/3 :: Estimated Iteration End time: 12:30:00]
Write new activity quote text in 45 seconds...
```

**Solutions**:
1. The script uses backtick-n (`n) for line breaks with the call operator
2. If Start-Countdown.ps1 doesn't display line breaks, use Start-Countdown-Fixed.ps1
3. Or add this to your Start-Countdown.ps1:
   ```powershell
   $lines = $Message -split "`n|`r`n|`r"
   foreach ($line in $lines) {
       Write-Host $line -ForegroundColor Yellow
   }
   ```

## Quick Start Guide

1. **Update Configuration**: Edit `ActivityGeneratorConfig.json` to set your working directory path
2. **Run the Orchestrator**: Execute `.\Start-ActivityOrchestrator.ps1`
3. **Monitor Progress**: Watch the console for iteration progress and check logs for details

## Overview

ActivityGenerator is a PowerShell script that simulates user activity by automatically typing and deleting random quotes in Notepad at randomized intervals. This enhanced version includes iteration tracking, estimated completion times, and integration with an orchestrator script for automated multi-iteration execution.

## System Architecture

The system consists of multiple components working together:

1. **Start-ActivityOrchestrator.ps1** - The main launcher that manages iterations
2. **ActivityGenerator.ps1** - The core script that performs the activity simulation
3. **ActivityGeneratorConfig.json** - JSON configuration file for settings
4. **ActivityGeneratorProcessController.ps1** - Provides configuration functions
5. **GetZappQuotes.ps1** - Supplies quotes for typing simulation

## Features

- **Automated Activity Simulation**: Types and deletes quotes in Notepad to simulate user activity
- **Multi-Iteration Support**: Runs multiple iterations with different wait times
- **Iteration Tracking**: Displays current iteration number and total iterations
- **Estimated Completion Times**: Shows when each iteration is expected to complete
- **Configurable Wait Times**: Each iteration can have different min/max wait times
- **Comprehensive Logging**: Detailed logs with statistics and timing information
- **Retry Logic**: Automatic retry on failures with configurable attempts
- **Visual Countdown**: Shows countdown timers with detailed status information

## Prerequisites

- Windows PowerShell 5.0 or higher
- Windows OS with Notepad installed
- Required PowerShell scripts:
  - `ActivityGeneratorProcessController.ps1`
  - `GetZappQuotes.ps1`
  - `Start-Countdown.ps1` (located at `C:\Users\[username]\WorkingDir\PowerShell\CountDownTimers\`)

## Parameters

### ActivityGenerator.ps1 Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `loggedinuserfull` | String | Yes | Full name of the logged-in user |
| `loggedinuser` | String | Yes | Username of the logged-in user |
| `IterationNumber` | Int | No | Current iteration number (default: 1) |
| `StartTime` | DateTime | No | Start time of the activity session |
| `TerminateWindow` | Int | No | Total time in seconds before termination |

### ActivityOrchestrator.ps1

The orchestrator script automatically determines user information and manages all parameters internally.

## Quick Fix for Common Errors

### "The Minimum value cannot be greater than or equal to the Maximum value" Error

This occurs when the configuration indices don't match between scripts. To fix:

1. Run the test script to diagnose:
   ```powershell
   .\Test-Configuration.ps1
   ```

2. Verify your ActivityGenerator.cfg has these values:
   ```
   TERMINATE_WINDOW=10800
   RANDOMIZER_SEED_MAX=2900
   RANDOMIZER_SEED_MIN=250
   ```

3. Ensure ActivityGeneratorProcessController.ps1 returns values in this order:
   - Index 0: SHUTDOWN
   - Index 1: SHUTDOWN_WINDOW
   - Index 2: USE_TERMINATE
   - Index 3: TERMINATE_WINDOW
   - Index 4: RANDOMIZER_SEED_MAX
   - Index 5: RANDOMIZER_SEED_MIN
   - Index 6: SLEEP_SEED

## Key Behavior: Fixed Main Iteration End Time

The main iteration end time is calculated **once** at the start of each outer iteration:

```
Start Time: 10:30:00
Terminate Window: 7200 seconds (2 hours)
MAIN ITERATION END TIME: 12:30:00  <-- FIXED, NEVER CHANGES
```

This fixed end time is then used consistently in all countdown messages:

```
Inner Loop Timeline:
10:30:00 - [Iteration 2/3 :: Estimated Iteration End time: 12:30:00]
10:45:23 - [Iteration 2/3 :: Estimated Iteration End time: 12:30:00]
11:15:45 - [Iteration 2/3 :: Estimated Iteration End time: 12:30:00]
11:58:12 - [Iteration 2/3 :: Estimated Iteration End time: 12:30:00]
12:29:55 - [Iteration 2/3 :: Estimated Iteration End time: 12:30:00]
12:30:00 - Terminate window expires, iteration ends
```

**Critical Points**:
- The end time shown is for the main iteration (terminate window), not individual actions
- It's calculated once: `$iterationEndTime = $StartTime.AddSeconds($TerminateWindow)`
- This value is stored and reused throughout the entire iteration
- Individual action durations (45 seconds, 23 seconds, etc.) do NOT affect this time

To verify this is working correctly, run:
```powershell
.\Test-IterationEndTime.ps1
```

## Important Configuration Update

If you're using the new TERMINATE_WINDOW_MIN/MAX configuration, ensure your `ActivityGeneratorProcessController.ps1` is updated to include these values at indices 7 and 8. The updated version should have:

```powershell
$control_configs = @(
    $shutdown,              # Index 0
    $shutdown_window,       # Index 1
    $use_terminate,         # Index 2
    $terminate_window,      # Index 3
    $randomizer_seed_max,   # Index 4
    $randomizer_seed_min,   # Index 5
    $sleep_seed,            # Index 6
    $terminate_window_min,  # Index 7  <-- NEW
    $terminate_window_max   # Index 8  <-- NEW
)
```

Run `.\Test-Configuration.ps1` to verify your configuration is being read correctly.

## Key Behavior: Fixed Iteration End Time

The iteration end time is calculated **once** at the start of each outer iteration and remains constant:

```
Start Time: 10:30:00
Terminate Window: 7200 seconds (2 hours)
Calculated End Time: 12:30:00  <-- This stays fixed

Inner Loop Timeline:
10:30:00 - Start - Shows: "Estimated Iteration End time: 12:30:00"
10:45:23 - Shows: "Estimated Iteration End time: 12:30:00" (same)
11:15:45 - Shows: "Estimated Iteration End time: 12:30:00" (same)
11:58:12 - Shows: "Estimated Iteration End time: 12:30:00" (same)
12:29:55 - Shows: "Estimated Iteration End time: 12:30:00" (same)
12:30:00 - Terminate window expires, iteration ends
```

This ensures users always see when the current iteration will actually end, not a moving target.

## Verifying the Fix

To confirm the main iteration end time is staying fixed:

1. **Run the test script**:
   ```powershell
   .\Test-IterationEndTime.ps1
   ```

2. **When running the actual system**, look for these indicators:
   - Initial cyan message: "MAIN ITERATION END TIME (FIXED): 2025-06-12 12:40:42"
   - All countdown messages show the SAME end time
   - Status updates confirm: "Main iteration still ends at: 2025-06-12 12:40:42"
   - Final message: "Main iteration end time was: 2025-06-12 12:40:42"

3. **If the time is changing**, you're likely still using an old version where:
   - End time is recalculated inside the while loop
   - Individual action times affect the displayed end time
   - The fix ensures `$iterationEndTime` is set ONCE before the loop

## Configuration

### For Start-ActivityOrchestrator_v0.1.ps1 (JSON Config)

**ActivityGeneratorConfig.json**:
```json
{
  "iterations": {
    "default": 3,  // Number of terminate window cycles to run
    "waitTimes": [
      { "minWait": 150, "maxWait": 6200 },   // Wait times for orchestrator between cycles
      { "minWait": 250, "maxWait": 7000 },
      { "minWait": 500, "maxWait": 10000 }
    ]
  }
}
```

**Important**: 
- The `iterations.default` value determines how many terminate window cycles to run
- The `waitTimes` are in milliseconds and used by the orchestrator between outer iterations
- Ensure minWait < maxWait for each pair
- You need at least as many waitTime pairs as iterations

### For Both Orchestrators (CFG Config)

**ActivityGenerator.cfg**:
```
SHUTDOWN=0                    # 1 to enable immediate shutdown, 0 to disable
SHUTDOWN_WINDOW=300          # Seconds to wait before shutdown when enabled
USE_TERMINATE=1              # 1 to enable terminate window, 0 to disable
TERMINATE_WINDOW=10800       # Duration of each cycle in seconds (3 hours)
RANDOMIZER_SEED_MAX=2900     # Maximum random wait for activities (ms)
RANDOMIZER_SEED_MIN=250      # Minimum random wait for activities (ms)
SLEEP_SEED=600               # Maximum sleep between outer iterations (seconds)
```

### Configuration Values from ActivityGeneratorProcessController.ps1

The controller reads these values using index numbers from the array:
```powershell
$control_configs = @($shutdown, $shutdown_window, $use_terminate, $terminate_window, $randomizer_seed_max, $randomizer_seed_min, $sleep_seed)
```

Index mapping:
- Index 0: SHUTDOWN
- Index 1: SHUTDOWN_WINDOW  
- Index 2: USE_TERMINATE
- Index 3: TERMINATE_WINDOW
- Index 4: RANDOMIZER_SEED_MAX
- Index 5: RANDOMIZER_SEED_MIN
- Index 6: SLEEP_SEED

The TERMINATE_WINDOW value determines how long each outer iteration runs.
The RANDOMIZER_SEED values control the typing/deletion delays within the inner loop.

## How It Works

### Two-Level Iteration System

#### Outer Loop (Orchestrator Level)
1. **Start-ActivityOrchestrator_v0.1.ps1**:
   - Reads number of iterations from config (e.g., 3)
   - For each outer iteration:
     - Gets terminate window from ActivityGenerator.cfg
     - Calculates iteration end time once: StartTime + TerminateWindow
     - Launches ActivityGenerator.ps1 with iteration info
     - Waits for ActivityGenerator to run for full terminate window
     - Logs completion and waits before next cycle

2. **ActivityOrchestrator.ps1**:
   - Runs indefinitely until shutdown
   - Each cycle:
     - Gets terminate window from config
     - Calculates iteration end time once: StartTime + TerminateWindow
     - Launches ActivityGenerator.ps1
     - Shows progress bar with remaining time
     - Waits random time before next cycle

#### Inner Loop (ActivityGenerator Level)
- Calculates iteration end time once at start (StartTime + TerminateWindow)
- Uses this fixed end time for all countdown displays
- Runs continuously within each terminate window:
  - Clear Notepad
  - Show countdown with outer iteration info and fixed end time
  - Type random quote
  - Show countdown with same fixed end time
  - Delete quote
  - Check if terminate window expired
- Shows remaining time periodically (every 10 inner iterations)

### Display Format
```
[Iteration 2/3 :: Estimated Iteration End time: 12/06/25 15:30:00]
Write new activity quote text in 45 seconds...
```
- `2/3` = Current outer iteration / Total outer iterations
- `Estimated Iteration End time` = When the ENTIRE outer iteration ends (StartTime + TerminateWindow)
- This is NOT when the current action (45 seconds) completes
- This time remains FIXED throughout the entire outer iteration

## Usage

### Option 1: Fixed Number of Cycles (Start-ActivityOrchestrator_v0.1.ps1)

```powershell
# Run default number of cycles from config (e.g., 2 cycles)
.\Start-ActivityOrchestrator_v0.1.ps1

# Run specific number of cycles (e.g., 5 cycles)
.\Start-ActivityOrchestrator_v0.1.ps1 -NumberOfIterations 5
```

Each cycle runs ActivityGenerator continuously for one terminate_window period.

### Option 2: Continuous Operation (ActivityOrchestrator.ps1)

```powershell
# Run continuously until shutdown signal
.\ActivityOrchestrator.ps1
```

Runs indefinitely, with each cycle lasting one terminate_window period.

### Running ActivityGenerator Directly (Not Recommended)

```powershell
# Basic usage - runs once then exits
.\ActivityGenerator.ps1 -loggedinuserfull "John Doe" -loggedinuser "jdoe"

# With terminate window - runs continuously for specified seconds
.\ActivityGenerator.ps1 -loggedinuserfull "John Doe" -loggedinuser "jdoe" -IterationNumber 1 -StartTime (Get-Date) -TerminateWindow 3600 -TotalIterations 3
```

## File Structure

```
ActivityGenerator/
├── ActivityOrchestrator.ps1          # Main controller script (continuous)
├── Start-ActivityOrchestrator_v0.1.ps1  # Alternative controller (fixed cycles)
├── ActivityGenerator.ps1             # Core activity simulation script
├── ActivityGenerator.cfg             # Configuration file
├── ActivityGeneratorConfig.json      # JSON config for Start-ActivityOrchestrator_v0.1
├── ActivityGeneratorProcessController.ps1  # Configuration provider (Updated version available)
├── GetZappQuotes.ps1                # Quote provider
├── Test-Configuration.ps1           # Configuration test script
├── Test-ParameterPassing.ps1        # Parameter passing diagnostic script
├── Test-IterationEndTime.ps1        # Main iteration end time consistency test
├── Test-LineBreak.ps1               # Line break method testing script
├── Test-BacktickN.ps1               # Quick test for backtick-n line breaks
├── Test-CountdownCall.ps1           # Test call operator method for countdown
├── Example-StartCountdown.ps1       # Example countdown script with proper line break handling
├── Start-Countdown-Fixed.ps1        # Fixed countdown script with proper parameter handling
├── Logs/                            # Log directory (created by Start-ActivityOrchestrator_v0.1)
│   └── ActivityGenerator.log        # Log file
└── C:\Users\[username]\WorkingDir\PowerShell\CountDownTimers\
    └── Start-Countdown.ps1          # Countdown timer display (may need replacing with fixed version)
```

## Dependencies

### External Scripts

1. **ActivityGeneratorProcessController.ps1**
   - Provides `GetProcesControlConfig()` function
   - Returns configuration values for randomizer settings

2. **GetZappQuotes.ps1**
   - Provides `Get-ZappQuote()` function
   - Returns random quotes for typing simulation

3. **Start-Countdown.ps1**
   - Displays visual countdown timer
   - Accepts `-Seconds` and `-Message` parameters

## Example Output

When running with Start-ActivityOrchestrator_v0.1.ps1 with 3 iterations and random terminate window (5 min - 4 hours):

```
[2025-06-12 10:30:00] [INFO] Using random terminate window between 300 and 14400 seconds
[2025-06-12 10:30:00] [INFO] Selected terminate window: 7842 seconds

Running outer iteration 2 of 3
This iteration will run for 7842 seconds

[Iteration 2/3 :: Estimated Iteration End time: 12/06/25 12:40:42]
Write new activity quote text in 45 seconds...
```

Where:
- `2/3` indicates this is outer iteration 2 of 3 total terminate window cycles
- `12:40:42` shows when the current terminate window will expire (7842 seconds from start)
- Each iteration can have a different duration based on the random range

The orchestrator log shows:
```
[2025-06-12 10:30:00] [INFO] Starting iteration 2 of 3
[2025-06-12 10:30:00] [INFO] Using random terminate window between 300 and 14400 seconds
[2025-06-12 10:30:00] [INFO] Selected terminate window: 7842 seconds
...
[2025-06-12 12:40:45] [SUCCESS] Outer iteration 2 completed successfully (Duration: 7845.23 seconds)
[2025-06-12 12:40:45] [INFO] Terminate window was set to 7842 seconds
```

When using ActivityOrchestrator.ps1, you'll see the terminate window type:
```
TERMINATE_WINDOW :: 5234 seconds (RANDOM)
  Range: 300 - 14400 seconds

Process time is 1200 seconds; termination window is 5234 seconds.
4034 seconds left to termination...

0% [ ||||||||||||||||||||                                                                                ] 100%
```

## Customization

### Using Fixed Termination Window
Edit ActivityGenerator.cfg to use a consistent duration for each cycle:
```
USE_TERMINATE=1              # Enable terminate window
TERMINATE_WINDOW_MIN=        # Leave empty for fixed mode
TERMINATE_WINDOW_MAX=        # Leave empty for fixed mode
TERMINATE_WINDOW=7200        # Each cycle runs for exactly 2 hours
```

### Using Random Termination Window
Edit ActivityGenerator.cfg to vary the duration of each cycle:
```
USE_TERMINATE=1              # Enable terminate window
TERMINATE_WINDOW_MIN=300     # Minimum 5 minutes
TERMINATE_WINDOW_MAX=14400   # Maximum 4 hours
TERMINATE_WINDOW=3600        # Fallback if MIN/MAX not used
```

Each outer iteration will randomly choose a duration between MIN and MAX.

### Adjusting Activity Timing
Modify the RANDOMIZER_SEED values in ActivityGenerator.cfg:
```
RANDOMIZER_SEED_MAX=5000     # Longer maximum delays
RANDOMIZER_SEED_MIN=500      # Longer minimum delays
SLEEP_SEED=1200              # Longer waits between iterations
```

### Enabling Immediate Shutdown
```
SHUTDOWN=1                   # Enable shutdown
SHUTDOWN_WINDOW=60           # Shutdown after 60 seconds
```

### Progress Bar Color Scheme
The progress bar changes color based on remaining time:
- Green: 80-100% time remaining
- Blue: 60-80% time remaining
- Cyan: 40-60% time remaining
- Magenta: 20-40% time remaining
- Yellow: 10-20% time remaining
- Red: 0-10% time remaining

### Modifying Date Format
To change the date/time format in ActivityGenerator.ps1, modify the ToString() format:
```powershell
$estimatedEndTime = (Get-Date).AddSeconds($sleepfor).ToString("yyyy-MM-dd HH:mm:ss")
```

## Notes

- The script requires execution policy to allow running scripts
- Notepad window must remain accessible (not minimized)
- The Windows Shell COM object simulates keyboard input
- Random intervals help simulate natural user behavior
- Iterations continue until terminate window is reached or shutdown is triggered
- The estimated total iterations is dynamically calculated based on average activity times
- Progress bar provides visual feedback on remaining session time

## Troubleshooting

### Script Won't Run
- Check execution policy: `Get-ExecutionPolicy`
- Set if needed: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Notepad Not Responding
- Ensure Notepad window is not minimized
- Check if 'Untitled - Notepad' window title matches

### Missing Dependencies
- Verify all required scripts exist in their expected locations
- Check that functions `GetProcesControlConfig()` and `Get-ZappQuote()` are available

### Countdown Timer Not Showing
- Verify `Start-Countdown.ps1` exists at the specified path
- Check that the path includes the correct username

### "Positional parameter cannot be found that accepts argument '1/2'" Error
This error occurs when the message parameter is parsed incorrectly by PowerShell:

**Solution Applied**: The script now uses the call operator (&) instead of Start-Process, which handles complex strings better.

**To verify the fix**:
```powershell
.\Test-CountdownCall.ps1
```

**If the error persists**, uncomment the base64 encoding method in ActivityGenerator.ps1:
```powershell
# Comment out the current line:
# & "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $sleepfor -Message $writeMessage

# Uncomment the base64 encoding method:
$bytes = [System.Text.Encoding]::Unicode.GetBytes($writeMessage)
$encodedMessage = [Convert]::ToBase64String($bytes)
$decodedCommand = "`$msg = [System.Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('$encodedMessage')); & 'C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1' -Seconds $sleepfor -Message `$msg"
Start-Process powershell.exe -ArgumentList "-ExecutionPolicy", "Bypass", "-Command", $decodedCommand -Wait -NoNewWindow
```

**Root cause**: Start-Countdown.ps1 may not be properly declaring its parameters, causing PowerShell to misinterpret the message string.

### Line Breaks Not Showing in Countdown Message
If line breaks aren't appearing in the countdown timer display:

**Common Causes**:
- Start-Countdown.ps1 may strip newlines from the -Message parameter
- Command-line parameter passing can lose special characters
- Different PowerShell versions handle multi-line strings differently

**Solutions**:
1. **Run the test script** to find which method works:
   ```powershell
   .\Test-LineBreak.ps1
   ```

2. **Current implementation uses**:
   - Simple backtick-n (`n) for line breaks: `"$header`n$action"`
   - Start-Process with ArgumentList array for parameter passing

3. **Quick fix** - Toggle to the call operator method:
   ```powershell
   # Comment out Start-Process line:
   # Start-Process @countdownParams
   
   # Uncomment the alternative:
   & "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $sleepfor -Message $writeMessage
   ```

4. **Alternative line break methods** if backtick-n doesn't work:
   - CRLF: `"$header`r`n$action"`
   - Here-string: `@"$header$([Environment]::NewLine)$action"@`
   - Pipe delimiter: `"$header|$action"` (if countdown script supports it)

5. **Ultimate fix**: If your Start-Countdown.ps1 doesn't handle line breaks:
   ```powershell
   # In Start-Countdown.ps1, add this to display multi-line messages:
   $lines = $Message -split "`n|`r`n"
   foreach ($line in $lines) {
       Write-Host $line -ForegroundColor Yellow
   }
   ```

### Main Iteration End Time Not Staying Fixed
If the main iteration end time is changing during execution:
- Ensure you're using the latest ActivityGenerator.ps1 from these artifacts
- The main end time should be calculated once as: `$iterationEndTime = $StartTime.AddSeconds($TerminateWindow)`
- This value should be stored and reused, never recalculated
- Look for this calculation happening BEFORE the while loop starts
- The `$iterationEndTime` variable should NOT be modified inside the while loop
- Run `.\Test-IterationEndTime.ps1` to verify the fix is working
- Look for the prominent cyan message showing "MAIN ITERATION END TIME (FIXED)"
- If using old versions, the end time might be recalculated for each action - this is the bug being fixed

### "Positional parameter cannot be found" Error
If you see errors like "A positional parameter cannot be found that accepts argument '11:31:44'":
- This occurs when date/time parameters are passed without quotes
- The space in "2025-06-12 11:31:44" causes PowerShell to treat it as multiple arguments
- Solution: Ensure all date/time parameters are wrapped in quotes when passed via Start-Process
- Run `.\Test-ParameterPassing.ps1` to diagnose parameter passing issues

### Configuration Index Errors
If you see errors like "The Minimum value cannot be greater than or equal to the Maximum value":
- Run `.\Test-Configuration.ps1` to verify your configuration values
- Check that ActivityGeneratorProcessController.ps1 returns values at the correct indices
- The scripts expect specific indices as shown in the configuration section
- Common issue: Scripts looking for terminate_window_min/max that don't exist in the config

### Configuration Issues
- Ensure ActivityGenerator.cfg exists and has valid values
- Check that numeric values are integers without quotes
- Verify TERMINATE_WINDOW is set to a reasonable value (in seconds)

### Iteration Confusion
- **Outer iterations**: Number of terminate window cycles (from config file)
- **Inner iterations**: Continuous activity loop within each terminate window
- The display shows outer iteration count (e.g., 2/3 means 2nd cycle of 3 total)
- Inner iterations are tracked but not displayed in countdown messages

### Activity Not Stopping at Terminate Window
- Ensure TERMINATE_WINDOW value is in seconds, not minutes
- Check that USE_TERMINATE is set to 1
- Verify StartTime is being passed correctly to ActivityGenerator.ps1

### Progress Bar Not Showing
- Progress bar only appears in ActivityOrchestrator.ps1, not Start-ActivityOrchestrator_v0.1.ps1
- Ensure USE_TERMINATE is set to 1 in the config file
- Check that the terminate window hasn't already elapsed

## Version History

- **Call Operator Fix Version**: Fixed parameter parsing errors
  - Switched from Start-Process to call operator (&) for countdown script invocation
  - Resolves "positional parameter cannot be found" errors with complex strings
  - Better handling of special characters like slashes in "1/2"
  - Added base64 encoding method as alternative for stubborn cases
- **Backtick-n Line Break Version**: Simplified line break approach
  - Changed from here-strings to simple backtick-n (`n) method
  - More compatible with various PowerShell environments
  - Easier to modify for different line break formats
  - Retained Start-Process with ArgumentList array
- **Line Break Fix Version**: Improved countdown message formatting
  - Changed to PowerShell here-strings (@"..."@) for multi-line messages
  - Switched to Start-Process with ArgumentList array for better parameter preservation
  - Added Test-LineBreak.ps1 to diagnose line break issues
  - Multiple alternative methods documented in code comments
  - Better handling of special characters in command-line parameters
- **Main Iterator Fix Version**: Ensured main iteration end time never changes
  - Removed action end times to eliminate confusion
  - Main iteration end time is calculated once and stored in `$iterationEndTime`
  - This fixed time is used for ALL countdown displays
  - Added prominent cyan logging to highlight the fixed end time
  - Enhanced test script to verify consistency
  - Clear separation between main iteration timing and action durations
- **Separated End Times Version**: Fixed main iteration end time overwriting issue
  - Main iteration end time (based on terminate_window) is now truly fixed
  - Action end times are shown separately in parentheses
  - Clear visual distinction between iteration-level and action-level timing
  - Added prominent logging to confirm main end time remains constant
  - Test script to verify consistency of main iteration end time
- **Fixed Iteration End Time Version**: Ensures consistent end time display
  - Iteration end time is calculated once at start (StartTime + TerminateWindow)
  - This fixed end time is displayed throughout the entire terminate window
  - Prevents drift or changes in the displayed end time
  - Added periodic remaining time updates while keeping end time constant
- **Random Terminate Window Version**: Added support for variable duration cycles
  - Added TERMINATE_WINDOW_MIN and TERMINATE_WINDOW_MAX configuration
  - Each outer iteration can use a random duration within the specified range
  - Updated all scripts to handle both fixed and random terminate windows
  - Enhanced configuration testing and diagnostics
- **Two-Level Iteration Version**: Clarified architecture with inner/outer loops
  - Inner loop: Continuous activity within terminate window
  - Outer loop: Multiple terminate window cycles from config
  - Fixed iteration display to show outer iteration count
  - Updated both orchestrators to properly manage cycles
- **Terminate Window Version**: Full integration with ActivityOrchestrator.ps1
  - Added support for terminate window-based iteration estimation
  - Dynamic calculation of total iterations based on session duration
  - Integration with progress bar visualization
  - Improved estimated end time showing session termination time
- **Integrated Version**: Full integration with orchestrator for automated multi-iteration execution
  - Added parameter support for iteration tracking
  - Integrated with JSON configuration
  - Enhanced estimated end time calculations
- **Enhanced Version**: Added iteration tracking and estimated end times
- **Original Version**: Basic quote typing and deletion functionality