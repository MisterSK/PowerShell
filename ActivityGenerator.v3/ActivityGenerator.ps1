# ActivityGenerator.ps1 - Fixed for Constrained Language Mode
# This version uses PowerShell cmdlets instead of .NET methods to avoid ConstrainedLanguage errors

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

# Convert StartTime to DateTime if it's a string (using PowerShell cmdlet instead of .NET method)
if ($StartTime -is [string]) {
    try {
        $StartTime = Get-Date $StartTime
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
        # Calculate MAIN end time once for this entire iteration using TimeSpan
        $endTimeSpan = New-TimeSpan -Seconds $TerminateWindow
        $iterationEndTime = $StartTime + $endTimeSpan
        $iterationEndTimeFormatted = Get-Date $iterationEndTime -Format 'yyyy-MM-dd HH:mm:ss'
        Write-Host "MAIN iteration will end at: $iterationEndTimeFormatted" -ForegroundColor Green
        Write-Host "Terminate window: $TerminateWindow seconds"
        Write-Host "Note: This MAIN end time will remain constant throughout all inner actions" -ForegroundColor Yellow
    }
} elseif ($TerminateWindow -gt 0) {
    # Called from ActivityOrchestrator.ps1 with terminate window
    # In this case, we don't know total iterations, just current one
    $iteration = $IterationNumber
    $totalIterations = "?"  # Unknown total
    
    # Calculate MAIN end time once for this entire iteration
    $endTimeSpan = New-TimeSpan -Seconds $TerminateWindow
    $iterationEndTime = $StartTime + $endTimeSpan
    $iterationEndTimeFormatted = Get-Date $iterationEndTime -Format 'yyyy-MM-dd HH:mm:ss'
    
    Write-Host "Running iteration $iteration (terminate window mode)"
    Write-Host "MAIN iteration will end at: $iterationEndTimeFormatted" -ForegroundColor Green
    $currentTime = Get-Date
    $elapsedSpan = New-TimeSpan -Start $StartTime -End $currentTime
    $elapsedSeconds = [int]$elapsedSpan.TotalSeconds
    $remainingTime = $TerminateWindow - $elapsedSeconds
    Write-Host "Remaining time in terminate window: $remainingTime seconds"
    Write-Host "Note: This MAIN end time will remain constant throughout all inner actions" -ForegroundColor Yellow
} else {
    # Default mode - single iteration
    $iteration = $IterationNumber
    $totalIterations = "∞"
    Write-Host "Running iteration $iteration (continuous mode)"
}

# Initialize variables
$seednumber = Get-Random -Maximum $RANDOMIZER_SEED_MAX -Minimum $RANDOMIZER_SEED_MIN
Write-Host "Random sleep seed number: $seednumber"

# Check if Notepad is running
try {
    $npadProcess = Get-Process -Name notepad -ErrorAction SilentlyContinue
    if($npadProcess){
        Write-Host "Notepad already running. Continuing..."
    }
    else{
        Write-Host "Notepad not running. Starting..."
        Start-Process notepad -ErrorAction Stop
        Start-Sleep -Seconds 2  # Give Notepad time to start
    }
}
catch {
    Write-Host "Error checking/starting Notepad: $_"
    Write-Host "Attempting to start Notepad anyway..."
    Start-Process notepad
    Start-Sleep -Seconds 2
}

# Run continuously until terminate window expires
$continueRunning = $true
$innerIterationCount = 0

# Log the FIXED main iteration end time that will be used throughout
if ($iterationEndTime -ne $null) {
    Write-Host "===============================================" -ForegroundColor Cyan
    $mainEndTimeDisplay = Get-Date $iterationEndTime -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Host "MAIN ITERATION END TIME (FIXED): $mainEndTimeDisplay" -ForegroundColor Cyan
    Write-Host "This time will remain constant throughout the iteration" -ForegroundColor Cyan
    Write-Host "===============================================" -ForegroundColor Cyan
}

while($continueRunning -eq $true) {
    $innerIterationCount++
    
    # Check if we should stop based on terminate window
    if ($TerminateWindow -gt 0) {
        $currentTime = Get-Date
        $elapsedSpan = New-TimeSpan -Start $StartTime -End $currentTime
        $elapsedSeconds = [int]$elapsedSpan.TotalSeconds
        if ($elapsedSeconds -ge $TerminateWindow) {
            Write-Host "Terminate window reached. Stopping activity generation."
            break
        }
        
        # Show remaining time periodically (but main end time stays fixed)
        if ($innerIterationCount % 10 -eq 0) {
            $remainingTime = $TerminateWindow - $elapsedSeconds
            Write-Host "Status Update: Remaining time: $remainingTime seconds" -ForegroundColor Gray
            $fixedEndTime = Get-Date $iterationEndTime -Format 'yyyy-MM-dd HH:mm:ss'
            Write-Host "Main iteration still ends at: $fixedEndTime" -ForegroundColor Gray
        }
    }
    
    $sleepfor = Get-Random -Minimum 0 -Maximum $seednumber
    
    # Activate and clear Notepad
    try {
        $wshell.AppActivate('Untitled - Notepad')
        Start-Sleep -Milliseconds 100
        $wshell.SendKeys("^a")
        Start-Sleep -Milliseconds 100
        $wshell.SendKeys("{BKSP}")
    }
    catch {
        Write-Host "Warning: Could not activate Notepad window" -ForegroundColor Yellow
    }

    # Calculate action end time for write operation
    $actionEndTimeSpan = New-TimeSpan -Seconds $sleepfor
    $actionEndDateTime = (Get-Date) + $actionEndTimeSpan
    $actionEndTime = Get-Date $actionEndDateTime -Format "dd/MM/yy HH:mm:ss"
    
    # ALWAYS use the pre-calculated main iteration end time for the header
    if ($iterationEndTime -ne $null) {
        # Main iteration end time stays constant
        $mainIterationEndTimeDisplay = Get-Date $iterationEndTime -Format "dd/MM/yy HH:mm:ss"
    } else {
        # No terminate window, use action end time as fallback
        $mainIterationEndTimeDisplay = $actionEndTime
    }
    
    # Build message with main iteration info ONLY
    $header = "[Iteration $iteration/$totalIterations :: Estimated Iteration End time: $mainIterationEndTimeDisplay]"
    $action = "Write new activity quote text in $sleepfor seconds..."
    
    # Simple string concatenation
    $writeMessage = $header + "`n" + $action
    
    # Call countdown timer - try different methods based on what works in constrained mode
    $countdownPath = "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1"
    
    if (Test-Path $countdownPath) {
        try {
            # Method 1: Use call operator
            & $countdownPath -Seconds $sleepfor -Message $writeMessage
        }
        catch {
            # Method 2: Fallback to simple sleep if countdown fails
            Write-Host $writeMessage
            Start-Sleep -Seconds $sleepfor
        }
    }
    else {
        # No countdown script, just use sleep
        Write-Host $writeMessage
        Start-Sleep -Seconds $sleepfor
    }
    
    # Get and write the quote
    $quote = Get-ZappQuote
    
    try {
        $wshell.AppActivate('Untitled - Notepad')
        Start-Sleep -Milliseconds 100
        $wshell.SendKeys($quote)
    }
    catch {
        Write-Host "Warning: Could not send keys to Notepad" -ForegroundColor Yellow
    }
    
    $sleepfor = Get-Random -Minimum 0 -Maximum $seednumber
    
    # Calculate estimated end time for delete action
    $deleteEndTimeSpan = New-TimeSpan -Seconds $sleepfor
    $deleteEndDateTime = (Get-Date) + $deleteEndTimeSpan
    $estimatedEndTime = Get-Date $deleteEndDateTime -Format "dd/MM/yy HH:mm:ss"
    
    # Format iteration display
    if ($totalIterations -eq "" -or $totalIterations -eq "∞") {
        $iterationDisplay = "Iteration $iteration"
    } else {
        $iterationDisplay = "Iteration $iteration/$totalIterations"
    }
    
    # Build delete message
    $deleteMessage = "[$iterationDisplay :: Estimated Iteration End time: $estimatedEndTime]" + "`n" + "Delete activity quote text in $sleepfor seconds..."
    
    # Call the countdown timer for delete action
    if (Test-Path $countdownPath) {
        try {
            # Try calling with powershell.exe
            $scriptBlock = @"
& '$countdownPath' -Seconds $sleepfor -Message '$deleteMessage'
"@
            powershell.exe -ExecutionPolicy Bypass -Command $scriptBlock
        }
        catch {
            # Fallback to simple sleep
            Write-Host $deleteMessage
            Start-Sleep -Seconds $sleepfor
        }
    }
    else {
        Write-Host $deleteMessage
        Start-Sleep -Seconds $sleepfor
    }
    
    # Delete the text
    try {
        $wshell.AppActivate('Untitled - Notepad')
        Start-Sleep -Milliseconds 100
        $wshell.SendKeys("^a")
        Start-Sleep -Milliseconds 100
        $wshell.SendKeys("{BKSP}")
    }
    catch {
        Write-Host "Warning: Could not clear Notepad text" -ForegroundColor Yellow
    }
}

Write-Host "Activity generation completed."