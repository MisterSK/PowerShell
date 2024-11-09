# Get the script's directory path
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Get the start time
$startTime = Get-Date
$startTimeFormatted = $startTime.ToString("dddd dd/MM/yyyy HH:mm:ss")

# Create function to ensure directory exists
function Ensure-DirectoryExists {
    param (
        [string]$Path
    )
    if (-not (Test-Path -Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

# Create function to format elapsed time
function Format-ElapsedTime {
    param (
        [TimeSpan]$TimeSpan
    )
    return "{0:D2}:{1:D2}:{2:D2}" -f $TimeSpan.Hours, $TimeSpan.Minutes, $TimeSpan.Seconds
}

# Create function to get log directory path
function Get-LogDirectory {
    $currentDate = Get-Date
    $year = $currentDate.ToString("yyyy")
    $month = $currentDate.ToString("MM")
    $day = $currentDate.ToString("dd")
    
    $logBasePath = Join-Path -Path $scriptPath -ChildPath "Logs"
    $yearPath = Join-Path -Path $logBasePath -ChildPath $year
    $monthPath = Join-Path -Path $yearPath -ChildPath $month
    $dayPath = Join-Path -Path $monthPath -ChildPath $day
    
    # Create directories if they don't exist
    Ensure-DirectoryExists -Path $logBasePath
    Ensure-DirectoryExists -Path $yearPath
    Ensure-DirectoryExists -Path $monthPath
    Ensure-DirectoryExists -Path $dayPath
    
    return $dayPath
}

# Function to write log entry
function Write-LogEntry {
    param (
        [string]$StartTime,
        [string]$CurrentTime,
        [string]$ElapsedTime,
        [string]$LogPath
    )
    
    $logEntry = "Start Time: $StartTime | Current Time: $CurrentTime | Elapsed Time: $ElapsedTime"
    
    # Write to console with colors
    Write-Host "Start Time   : " -NoNewline -ForegroundColor Cyan
    Write-Host $StartTime
    Write-Host "Current Time : " -NoNewline -ForegroundColor Green
    Write-Host $CurrentTime
    Write-Host "Elapsed Time : " -NoNewline -ForegroundColor Yellow
    Write-Host $ElapsedTime
    Write-Host ("-" * 80)
    
    # Write to log file
    $logEntry | Out-File -FilePath $LogPath -Append
}

Clear-Host
Write-Host "Time Logging Script Started - Press Ctrl+C to stop" -ForegroundColor Magenta
Write-Host ("-" * 80)

try {
    while ($true) {
        # Get current time
        $currentTime = Get-Date
        $currentTimeFormatted = $currentTime.ToString("dddd dd/MM/yyyy HH:mm:ss")
        
        # Calculate elapsed time
        $elapsedTime = $currentTime - $startTime
        $elapsedTimeFormatted = Format-ElapsedTime -TimeSpan $elapsedTime
        
        # Get log directory and create log file path
        $logDir = Get-LogDirectory
        $logFile = Join-Path -Path $logDir -ChildPath "TimeLog.log"
        
        # Write log entry
        Write-LogEntry -StartTime $startTimeFormatted `
                      -CurrentTime $currentTimeFormatted `
                      -ElapsedTime $elapsedTimeFormatted `
                      -LogPath $logFile
        
        # Wait for 1 second before next iteration
        Start-Sleep -Seconds 1
        
        # Clear screen for next update
        Clear-Host
        Write-Host "Time Logging Script Running - Press Ctrl+C to stop" -ForegroundColor Magenta
        Write-Host ("-" * 80)
    }
}
catch {
    Write-Host "`nScript terminated by user" -ForegroundColor Red
}
finally {
    Write-Host "Final log entry written to: $logFile" -ForegroundColor Yellow
}