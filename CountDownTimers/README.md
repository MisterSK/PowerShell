# Start-Countdown.ps1

A PowerShell script that provides a graphical countdown timer with progress bar visualization. Perfect for adding user-friendly delays to scripts with visual feedback.

## Overview

Start-Countdown.ps1 displays a countdown timer with:
- Visual progress bar showing completion percentage
- Multi-line message support
- Customizable countdown duration
- Clear visual formatting with borders

## Features

- **Progress Bar Display**: Shows graphical progress with percentage complete
- **Multi-line Messages**: Supports messages with line breaks for detailed status information
- **Flexible Input**: Accepts any duration in seconds
- **Visual Formatting**: Displays messages in a bordered box for clarity
- **Error Handling**: Robust error handling with clear error messages

## Requirements

- PowerShell 3.0 or higher
- Windows PowerShell or PowerShell Core

## Installation

1. Download `Start-Countdown.ps1` to your desired location
2. Ensure PowerShell execution policy allows script execution:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

## Usage

### Basic Syntax

```powershell
.\Start-Countdown.ps1 -Seconds <duration> -Message <message>
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `-Seconds` | Int32 | Yes | Duration of the countdown in seconds |
| `-Message` | String | Yes | Message to display during countdown |

### Examples

#### Simple Countdown
```powershell
.\Start-Countdown.ps1 -Seconds 30 -Message "Please wait while Active Directory replicates data..."
```

#### Multi-line Message
```powershell
.\Start-Countdown.ps1 -Seconds 45 -Message "[Iteration 2/3 :: Estimated End time: 12:30:00]`nWrite new activity quote text in 45 seconds..."
```

#### Using with Variables
```powershell
$duration = 60
$status = "System Update in Progress`nDo not power off your computer"
.\Start-Countdown.ps1 -Seconds $duration -Message $status
```

## Display Format

The script displays messages in a formatted box:

```
========================================
[Iteration 2/3 :: Estimated End time: 12:30:00]
Write new activity quote text in 45 seconds...
========================================
(45 seconds)

[Progress Bar showing percentage complete]
```

## Multi-line Message Support

The script supports various line break formats:
- Backtick-n (`` `n``)
- Carriage Return + Line Feed (`` `r`n``)
- Carriage Return (`` `r``)

Example with multiple lines:
```powershell
$message = @"
Task: Database Backup
Status: In Progress
Estimated Time: 5 minutes
"@

.\Start-Countdown.ps1 -Seconds 300 -Message $message
```

## Integration with Other Scripts

### Basic Integration
```powershell
# In your script
Write-Host "Starting backup process..."
& ".\Start-Countdown.ps1" -Seconds 10 -Message "Initializing backup system..."
# Continue with next steps
```

### With Error Handling
```powershell
try {
    & ".\Start-Countdown.ps1" -Seconds 30 -Message "Processing files..."
    # Next steps
}
catch {
    Write-Error "Countdown failed: $_"
    # Handle error
}
```

### Dynamic Messages
```powershell
$iteration = 1
$total = 5
$endTime = (Get-Date).AddMinutes(10).ToString("HH:mm:ss")

$message = "[Iteration $iteration/$total :: End time: $endTime]`nProcessing batch..."
& ".\Start-Countdown.ps1" -Seconds 60 -Message $message
```

## Progress Bar Details

The progress bar shows:
- **Activity**: First line of your message (or entire message if single line)
- **Status**: "Waiting for X seconds, Y left"
- **Percentage**: Visual bar from 0% to 100%

## Troubleshooting

### "Cannot bind parameter" Error
Ensure you're using named parameters:
```powershell
# Wrong
.\Start-Countdown.ps1 30 "Please wait..."

# Correct
.\Start-Countdown.ps1 -Seconds 30 -Message "Please wait..."
```

### Line Breaks Not Showing
Use PowerShell escape sequences:
```powershell
# Use backtick-n
-Message "Line 1`nLine 2"

# Or here-strings
-Message @"
Line 1
Line 2
"@
```

### Script Not Found
Use the full path or ensure you're in the correct directory:
```powershell
# Full path
& "C:\Scripts\Start-Countdown.ps1" -Seconds 10 -Message "Wait..."

# Or change directory first
cd C:\Scripts
.\Start-Countdown.ps1 -Seconds 10 -Message "Wait..."
```

## Advanced Usage

### Custom Progress Messages
```powershell
function Start-CustomCountdown {
    param($Seconds, $Task)
    
    $message = @"
Task: $Task
Started: $(Get-Date -Format "HH:mm:ss")
Duration: $Seconds seconds
"@
    
    & ".\Start-Countdown.ps1" -Seconds $Seconds -Message $message
}

# Usage
Start-CustomCountdown -Seconds 45 -Task "Database Optimization"
```

### Integration with Activity Generator
```powershell
$header = "[Iteration $current/$total :: End time: $endTime]"
$action = "Write new activity quote text in $delay seconds..."
$message = "$header`n$action"

& ".\Start-Countdown.ps1" -Seconds $delay -Message $message
```

## Version History

- **2.2**: Added support for multi-line messages and improved parameter handling
- **2.1**: Fixed parameter conflict issue
- **2.0**: New release uses Write-Progress for graphical display
- **1.0**: Initial Release

## Author

- **Author**: Martin Pugh
- **Twitter**: @thesurlyadm1n
- **Spiceworks**: Martin9700
- **Blog**: www.thesurlyadmin.com

## License

This script is provided as-is under the MIT License. See the script header for more details.

## Contributing

For bug reports or feature requests, please contact the author through the channels listed above.

## See Also

- [Write-Progress Documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-progress)
- [PowerShell Script Parameters](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters)
- [Original Script on Spiceworks](http://community.spiceworks.com/scripts/show/1712-start-countdown)