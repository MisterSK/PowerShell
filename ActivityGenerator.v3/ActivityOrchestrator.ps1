$infinite_loop = $true
$StartTimeStamp = (Get-Date)
$iterationCounter = 0  # Track iteration number

$LOGGED_IN_USER = $ENV:USERNAME
if(($LOGGED_IN_USER.Length -gt 6 -and $LOGGED_IN_USER.IndexOf(" ") -ge 0) -or ($LOGGED_IN_USER.IndexOf("(") -ge 0)){
    $LOGGED_IN_USER_FULL = $LOGGED_IN_USER
    $LOGGED_IN_USER = $LOGGED_IN_USER.Substring(0,6) + "~1"
}

Write-Host ""
Write-Host "LOGGED_IN_USER_FULL :: $LOGGED_IN_USER_FULL"
Write-Host "LOGGED_IN_USER :: $LOGGED_IN_USER"
Write-Host ""

while($infinite_loop -eq $true){

    $CurrentTimeStamp = (Get-Date)
    $iterationCounter++  # Increment iteration counter

    # Get Controller Config
    Write-Host "Getting activity generator controller config..."
    .".\ActivityGeneratorProcessController.ps1"
    
    # Based on the updated ProcessController array structure:
    # Index 0: SHUTDOWN
    # Index 1: SHUTDOWN_WINDOW
    # Index 2: USE_TERMINATE
    # Index 3: TERMINATE_WINDOW
    # Index 4: RANDOMIZER_SEED_MAX
    # Index 5: RANDOMIZER_SEED_MIN
    # Index 6: SLEEP_SEED
    # Index 7: TERMINATE_WINDOW_MIN
    # Index 8: TERMINATE_WINDOW_MAX
    
    $shutdown = GetProcesControlConfig(0)
    $shutdown_window = GetProcesControlConfig(1)
    $use_terminate = GetProcesControlConfig(2)
    $terminate_window_fixed = GetProcesControlConfig(3)
    $randomizer_seed_max = GetProcesControlConfig(4)
    $randomizer_seed_min = GetProcesControlConfig(5)
    $sleepseed = GetProcesControlConfig(6)
    $terminate_window_min = GetProcesControlConfig(7)
    $terminate_window_max = GetProcesControlConfig(8)
    
    # Determine which terminate window to use
    if($terminate_window_min -ne "" -and $terminate_window_max -ne "" -and 
       $terminate_window_min -ne $null -and $terminate_window_max -ne $null -and
       [int]$terminate_window_min -gt 0 -and [int]$terminate_window_max -gt [int]$terminate_window_min){
        # Use random range
        $terminate_window = Get-Random -Minimum ([int]$terminate_window_min) -Maximum ([int]$terminate_window_max)
        $terminate_window_type = "RANDOM"
    }
    else{
        # Use fixed value
        $terminate_window = [int]$terminate_window_fixed
        $terminate_window_type = "FIXED"
    }

    Write-Host ""
    Write-Host "SHUTDOWN :: $shutdown"
    Write-Host "SHUTDOWN_WINDOW :: $shutdown_window"
    Write-Host "USE_TERMINATE :: $use_terminate"
    Write-Host "TERMINATE_WINDOW :: $terminate_window seconds ($terminate_window_type)"
    if($terminate_window_type -eq "RANDOM"){
        Write-Host "  Range: $terminate_window_min - $terminate_window_max seconds"
    }
    Write-Host "SLEEP_SEED :: $sleepseed"
    Write-Host ""

    # Continue or prepare to exit process?
    if($shutdown -eq $true){
        powershell.exe -executionpolicy bypass -file "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $shutdown_window -Message "Exiting activity generator in $shutdown_window seconds..."
        Break
    }
    elseif($use_terminate -eq $true){
        $ElapsedTime = ($CurrentTimeStamp - $StartTimeStamp)
        $ElapsedTimeSecs = $ElapsedTime.TotalSeconds
        # $ElapsedTimeSecs = [Math]::Round($ElapsedTimeSecs,0)
        # $ElapsedTimeSecs = [System.Math]::Round($ElapsedTimeSecs,0)
        $StringElapsedTimeSecs =  "$ElapsedTimeSecs"
        $ArrayStringElapsedTimeSecs = $StringElapsedTimeSecs.Split(".")
        $StringElapsedTimeSecs = $ArrayStringElapsedTimeSecs[0]


        if($ElapsedTimeSecs -lt $terminate_window){
            $RemainingTime = ($terminate_window - $ElapsedTimeSecs)
            $StringRemainingTime =  "$RemainingTime"
            $ArrayStringRemainingTime = $StringRemainingTime.Split(".")
            $StringRemainingTime = $ArrayStringRemainingTime[0]
            Write-Host ""
            Write-Host "Process time is $StringElapsedTimeSecs seconds; termination window is $terminate_window seconds."
            Write-Host "$StringRemainingTime seconds left to termination..."
            Write-Host ""

            # Display color-coded progress bar based on percentage of time left to end of activity loops
            $RemainingTimePercent = ($RemainingTime / $terminate_window) * 100
            $strPaddingPercent = (($terminate_window - $RemainingTime) / $terminate_window) * 100
            
            # Set progress bar color
            $foreColor = switch ( $RemainingTimePercent )
            {
                { $_ -le 10} { 'Red'; break; }
                { $_ -le 20} { 'Yellow'; break; }
                { $_ -le 40} { 'Magenta'; break; }
                { $_ -le 60} { 'Cyan'; break; }
                { $_ -le 80} { 'Blue'; break; }
                default { 'Green' }
            }

            $strToWrite = "0% [ " + ("|" * $RemainingTimePercent) + (" " * $strPaddingPercent) + " ] 100%"
            Write-Host $strToWrite -ForegroundColor $foreColor
            Write-Host ""

        }
        else{
            $sleepfor = (Get-Random -Minimum 0 -Maximum $sleepseed)
            powershell.exe -executionpolicy bypass -file "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $sleepfor -Message "Exiting activity generator in $sleepfor seconds..."
            Break
        }
    }
    else{
        Write-Host ""
        Write-Host "No shutdown or terminate process signal enabled. Continuing activity generation process as normal..."
        Write-Host ""
    }

    # Launch activity generator with iteration tracking and terminate window info
    # Pass StartTime as a string to avoid parsing issues
    $startTimeString = $StartTimeStamp.ToString("yyyy-MM-dd HH:mm:ss")
    
    & .\ActivityGenerator.ps1 -loggedinuser $LOGGED_IN_USER `
                             -loggedinuserfull $LOGGED_IN_USER_FULL `
                             -IterationNumber $iterationCounter `
                             -StartTime $startTimeString `
                             -TerminateWindow $terminate_window

    # Pause activity orchestrator loop
    $sleepfor = (Get-Random -Minimum 0 -Maximum $sleepseed)
    Write-Host ""
    Write-Host "Orchestrator Random sleep seed number: $sleepfor"
    Write-Host ""

    powershell.exe -executionpolicy bypass -file "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $sleepfor -Message "Next activity quote in $sleepfor seconds..."

}