# Read passed parameters
param(
    [Parameter(Mandatory)]
    [String]$loggedinuserfull,
    
    [Parameter(Mandatory)]
    [String]$loggedinuser,
    
    [Parameter(Mandatory=$false)]
    [int]$IterationNumber = 1,
    
    [Parameter(Mandatory=$false)]
    $StartTime = (Get-Date),  # Can be DateTime or String
    
    [Parameter(Mandatory=$false)]
    [int]$TerminateWindow = 0,
    
    [Parameter(Mandatory=$false)]
    [int]$TotalIterations = 0,
    
    [Parameter(Mandatory=$false)]
    [int]$MinWait = 0,
    
    [Parameter(Mandatory=$false)]
    [int]$MaxWait = 0
)

# Convert StartTime to DateTime if it's a string
if ($StartTime -is [string]) {
    try {
        $StartTime = [DateTime]::ParseExact($StartTime, "yyyy-MM-dd HH:mm:ss", $null)
    }
    catch {
        Write-Host "Warning: Could not parse StartTime '$StartTime', using current time" -ForegroundColor Yellow
        $StartTime = Get-Date
    }
}

$LOGGED_IN_USER_FULL = $loggedinuserfull
$LOGGED_IN_USER = $loggedinuser

Write-Host ""
Write-Host "LOGGED_IN_USER_FULL :: $LOGGED_IN_USER_FULL"
Write-Host "LOGGED_IN_USER :: $LOGGED_IN_USER"
Write-Host ""

# Get Activity Generator Config
Write-Host "Getting activity generator controller config..."
.".\ActivityGeneratorProcessController.ps1"
$RANDOMIZER_SEED_MAX = GetProcesControlConfig(4)
$RANDOMIZER_SEED_MIN = GetProcesControlConfig(5)

if($wshell){
    Write-Host "Windows Shell COM Object already exists. Continuing..."
}
else{
     Write-Host "Windows Shell COM Object does not exist. Creating..."
    $wshell = New-Object -ComObject wscript.shell
}

Write-Host "Getting quote list..."
.".\GetZappQuotes.ps1"

# Calculate the MAIN iteration end time once at the beginning
# This is when the entire outer iteration (terminate window) expires
$iterationEndTime = $null

# Determine which mode we're in based on parameters
if ($TotalIterations -gt 0) {
    # Called from Start-ActivityOrchestrator_v0.1.ps1
    $iteration = $IterationNumber
    $totalIterations = $TotalIterations
    Write-Host "Running outer iteration $iteration of $totalIterations"
    if ($TerminateWindow -gt 0) {
        # Calculate MAIN end time once for this entire iteration
        $iterationEndTime = $StartTime.AddSeconds($TerminateWindow)
        Write-Host "MAIN iteration will end at: $($iterationEndTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Green
        Write-Host "Terminate window: $TerminateWindow seconds"
        Write-Host "Note: This MAIN end time will remain constant throughout all inner actions" -ForegroundColor Yellow
    }
} elseif ($TerminateWindow -gt 0) {
    # Called from ActivityOrchestrator.ps1 with terminate window
    # In this case, we don't know total iterations, just current one
    $iteration = $IterationNumber
    $totalIterations = "?"  # Unknown total
    
    # Calculate MAIN end time once for this entire iteration
    $iterationEndTime = $StartTime.AddSeconds($TerminateWindow)
    
    Write-Host "Running iteration $iteration (terminate window mode)"
    Write-Host "MAIN iteration will end at: $($iterationEndTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Green
    $remainingTime = $TerminateWindow - ((Get-Date) - $StartTime).TotalSeconds
    Write-Host "Remaining time in terminate window: $([Math]::Round($remainingTime, 0)) seconds"
    Write-Host "Note: This MAIN end time will remain constant throughout all inner actions" -ForegroundColor Yellow
} else {
    # Default mode - single iteration
    $iteration = $IterationNumber
    $totalIterations = "∞"
    Write-Host "Running iteration $iteration (continuous mode)"
}

# $shutdown = $false
$seednumber = Get-Random -Maximum $RANDOMIZER_SEED_MAX -Minimum $RANDOMIZER_SEED_MIN
Write-Host "Random sleep seed number: $seednumber"
$npadrunning = (Get-Process -Name notepad -ErrorAction SilentlyContinue).CPU
if($npadrunning -gt 0){
    Write-Host "Notepad already running. Continuing..."
}
else{
    Write-Host "Notepad not running. Starting..."
    Start-Process notepad -ErrorAction Stop
}

# while($shutdown -eq $false){
# Run continuously until terminate window expires
$continueRunning = $true
$innerIterationCount = 0

# Log the FIXED main iteration end time that will be used throughout
if ($iterationEndTime -ne $null) {
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "MAIN ITERATION END TIME (FIXED): $($iterationEndTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Cyan
    Write-Host "This time will remain constant throughout the iteration" -ForegroundColor Cyan
    Write-Host "===============================================" -ForegroundColor Cyan
}

while($continueRunning -eq $true) {
    $innerIterationCount++
    
    # Check if we should stop based on terminate window
    if ($TerminateWindow -gt 0) {
        $elapsedTime = ((Get-Date) - $StartTime).TotalSeconds
        if ($elapsedTime -ge $TerminateWindow) {
            Write-Host "Terminate window reached. Stopping activity generation."
            break
        }
        
        # Show remaining time periodically (but main end time stays fixed)
        if ($innerIterationCount % 10 -eq 0) {
            $remainingTime = $TerminateWindow - $elapsedTime
            Write-Host "Status Update: Remaining time: $([Math]::Round($remainingTime, 0)) seconds" -ForegroundColor Gray
            Write-Host "Main iteration still ends at: $($iterationEndTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Gray
        }
    }
    
    $sleepfor = Get-Random -Minimum 0 -Maximum $seednumber
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("^a")
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("{BKSP}")

    # Calculate action end time for write operation (but don't display it)
    $actionEndTime = (Get-Date).AddSeconds($sleepfor).ToString("dd/MM/yy HH:mm:ss")
    
    # ALWAYS use the pre-calculated main iteration end time for the header
    if ($iterationEndTime -ne $null) {
        # Main iteration end time stays constant
        $mainIterationEndTimeDisplay = $iterationEndTime.ToString("dd/MM/yy HH:mm:ss")
    } else {
        # No terminate window, use action end time as fallback
        $mainIterationEndTimeDisplay = $actionEndTime
    }
    
    # Build message with main iteration info ONLY
    $header = "[Iteration $iteration/$totalIterations :: Estimated Iteration End time: $mainIterationEndTimeDisplay]"
    $action = "Write new activity quote text in $sleepfor seconds..."
    
    # Method 1: Simple backtick-n (most common)
    $writeMessage = "$header`n$action"
    
    # Use the call operator for better parameter handling
    & "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $sleepfor -Message $writeMessage
    
    # Alternative: If the call operator doesn't work, try Start-Process with base64 encoding
    # $bytes = [System.Text.Encoding]::Unicode.GetBytes($writeMessage)
    # $encodedMessage = [Convert]::ToBase64String($bytes)
    # $decodedCommand = "`$msg = [System.Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('$encodedMessage')); & 'C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1' -Seconds $sleepfor -Message `$msg"
    # Start-Process powershell.exe -ArgumentList "-ExecutionPolicy", "Bypass", "-Command", $decodedCommand -Wait -NoNewWindow
    $quote = Get-ZappQuote
    # Write-Host "Next quote is '$quote'"

    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys($quote)
    $sleepfor = Get-Random -Minimum 0 -Maximum $seednumber
    
    # Calculate estimated end time for delete action
    $estimatedEndTime = (Get-Date).AddSeconds($sleepfor).ToString("dd/MM/yy HH:mm:ss")
    
    # Format iteration display (same logic as above)
    if ($totalIterations -eq "" -or $totalIterations -eq "∞") {
        $iterationDisplay = "Iteration $iteration"
    } else {
        $iterationDisplay = "Iteration $iteration/$totalIterations"
    }
    
    $deleteMessage = "[$iterationDisplay :: Estimated Iteration End time: $estimatedEndTime]" + [Environment]::NewLine + "Delete activity quote text in $sleepfor seconds..."
    
    powershell.exe -executionpolicy bypass -file "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $sleepfor -Message "`"$deleteMessage`""
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("^a")
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("{BKSP}")
    
    # Increment iteration counter for next run
    # $iteration++
}