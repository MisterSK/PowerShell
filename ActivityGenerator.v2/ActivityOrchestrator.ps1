$infinite_loop = $true
$StartTimeStamp = (Get-Date)

while($infinite_loop -eq $true){

    $CurrentTimeStamp = (Get-Date)

    # Get Controller Config
    Write-Host "Getting activity generator controller config..."
    .".\ActivityGeneratorProcessController.ps1"
    $shutdown = GetProcesControlConfig(0)
    $shutdown_window = GetProcesControlConfig(1)
    $use_terminate = GetProcesControlConfig(2)
    $terminate_window = GetProcesControlConfig(3)

    Write-Host ""
    Write-Host "SHUTDOWN :: $shutdown"
    Write-Host "SHUTDOWN_WINDOW :: $shutdown_window"
    Write-Host "USE_TERMINATE :: $use_terminate"
    Write-Host "TERMINATE_WINDOW :: $terminate_window"
    Write-Host ""

    # Continue or prepare to exit process?
    if($shutdown -eq $true){
        C:\Users\SanyaK~1\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1 -Seconds $shutdown_window -Message "Exiting activity generator in $shutdown_window seconds..."
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
        }
        else{
            $sleepseed = (Get-Random -Minimum 0 -Maximum 120)
            C:\Users\SanyaK~1\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1 -Seconds $sleepseed -Message "Exiting activity generator in $sleepseed seconds..."
            Break
        }
    }
    else{
        Write-Host ""
        Write-Host "No shutdown or terminate process signal enabled. Continuing activity generation process as normal..."
        Write-Host ""
    }

    # Launch activity generator
    .\ActivityGenerator.ps1

    # Pause activity orchestrator loop
    $sleepseed = (Get-Random -Minimum 0 -Maximum 60)
    Write-Host ""
    Write-Host "Orchestrator Random sleep seed number: $sleepseed"
    Write-Host ""

    C:\Users\SanyaK~1\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1 -Seconds $sleepseed -Message "Next activity quote in $sleepseed seconds..."

}