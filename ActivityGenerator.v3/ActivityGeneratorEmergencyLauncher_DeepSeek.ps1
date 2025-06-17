<#
Activity Generator Emergency Launcher
Version 1.6 - Minimalist working version
#>

function Show-Status {
    param (
        [string]$message,
        [string]$symbol,
        [string]$color = "White"
    )
    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] $symbol " -NoNewline
    Write-Host $message -ForegroundColor $color
}

# Clear screen for fresh start
Clear-Host

# Simple text header
Write-Host "`n`n"
Write-Host "ACTIVITY GENERATOR EMERGENCY LAUNCHER" -ForegroundColor Yellow
Write-Host "===================================="
Write-Host "`n"

# Fixed path handling
$countdownPath = "C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1"

# Initial countdown before launch
Show-Status -message "Starting initial countdown before Activity Orchestrator launch..." -symbol ">>" -color "Yellow"
$initialSeconds = Get-Random -Max 2500 -Min 1
powershell.exe -file $countdownPath -seconds $initialSeconds -message "Waiting to launch Activity Orchestrator (Random delay: $initialSeconds seconds)"

# Launch Activity Orchestrator
Show-Status -message "Setting working directory..." -symbol "++" -color "Cyan"
Set-Location "~\WorkingDir\PowerShell\ActivityGenerator.v3\"

Show-Status -message "Launching Activity Orchestrator..." -symbol "!!" -color "Green"
powershell.exe -ExecutionPolicy Bypass -file ".\Start-ActivityOrchestrator_v0.1.ps1"

# Final countdown before exit
Show-Status -message "Activity Orchestrator completed. Starting final countdown..." -symbol ">>" -color "Yellow"
$finalSeconds = Get-Random -Max 2500 -Min 1
powershell.exe -file $countdownPath -seconds $finalSeconds -message "Waiting to exit PowerShell session (Random delay: $finalSeconds seconds)"

# Exit
Show-Status -message "Script completed. Exiting..." -symbol "--" -color "Magenta"
exit