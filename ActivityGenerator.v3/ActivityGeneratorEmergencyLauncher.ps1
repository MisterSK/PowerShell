powershell.exe -file  'C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1' -seconds (Get-Random -Max 600 -min 1) -message 'Waiting to launch Activity Orchestrator'; 
Set-Location .\WorkingDir\PowerShell\ActivityGenerator.v3\; 
powershell.exe -executionpolicy bypass -file .\Start-ActivityOrchestrator_v0.1.ps1; 
powershell.exe -file  'C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1' -seconds (Get-Random -Max 600 -min 1) -message 'Waiting to exit PowerShell session and close this window'; 
exit