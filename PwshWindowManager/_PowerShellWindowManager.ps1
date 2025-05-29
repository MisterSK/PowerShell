# Open 8 PowerShell windows with black background and light green text (using color command)
1..4 | ForEach-Object {
    # Adjust the min and max values on each run
    $minvalue = Get-Random -Minimum 1 -Maximum 9
    $maxvalue = Get-Random -Minimum 19 -Maximum 199000
    $command = @"
        cmd /c color 0A
        mode con: cols=80 lines=10
        powershell.exe -file 'C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1' -seconds (Get-Random -Minimum $minvalue -Maximum $maxvalue) -message 'Waiting to launch Activity Orchestrator'
        Set-Location 'C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v3'
        .\Start-ActivityOrchestrator_v0.1.ps1
"@
    # Start-Process powershell -ArgumentList "-NoExit", "-Command", $command
    Start-Process powershell "-Command", $command
}