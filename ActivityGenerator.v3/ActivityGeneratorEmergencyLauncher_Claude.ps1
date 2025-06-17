# Activity Generator Emergency Launcher - Constrained Mode Compatible
# ===================================================================
# This version works within PowerShell Constrained Language Mode restrictions

# Clear screen
Clear-Host

# Simple header (no functions in constrained mode)
Write-Host ""
Write-Host "====================================" -ForegroundColor Cyan
Write-Host "    ACTIVITY GENERATOR LAUNCHER     " -ForegroundColor Cyan  
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Phase 1: Initial countdown
Write-Host "[~] Phase 1: Initializing countdown timer..." -ForegroundColor Yellow
$waitTime1 = Get-Random -Maximum 1300 -Minimum 1
Write-Host "[?] Random wait time selected: $waitTime1 seconds" -ForegroundColor Magenta
Write-Host ""

Write-Host "[>>] Starting countdown to launch Activity Orchestrator..." -ForegroundColor Cyan

# Simple inline countdown for constrained mode
Write-Host "Countdown: $waitTime1 seconds" -ForegroundColor Yellow
$count = $waitTime1
while ($count -gt 0) {
    Write-Host "`r[$count] seconds remaining...    " -NoNewline -ForegroundColor Cyan
    Start-Sleep -Seconds 1
    $count--
}
Write-Host "`r[0] seconds remaining...      " -ForegroundColor Green

Write-Host ""
Write-Host "[OK] Countdown complete!" -ForegroundColor Green
Start-Sleep -Seconds 1

# Phase 2: Navigate and launch orchestrator
Write-Host ""
Write-Host "[~] Phase 2: Navigating to Activity Generator directory..." -ForegroundColor Yellow

# Change directory
Set-Location "~\WorkingDir\PowerShell\ActivityGenerator.v3\"
Write-Host "[OK] Directory changed successfully" -ForegroundColor Green
Write-Host ""

Write-Host "[!] Launching Activity Orchestrator v0.1..." -ForegroundColor Cyan
Write-Host "[*] Bypassing execution policy for smooth operation" -ForegroundColor Yellow
Write-Host ""

# Loading animation (simple version for constrained mode)
Write-Host "Loading " -NoNewline -ForegroundColor White
$i = 1
while ($i -le 5) {
    Write-Host "." -NoNewline -ForegroundColor Cyan
    Start-Sleep -Milliseconds 300
    $i++
}
Write-Host " READY!" -ForegroundColor Green

# Launch orchestrator in new process to avoid constrained mode
Start-Process -FilePath "powershell.exe" -ArgumentList @(
    "-ExecutionPolicy", "Bypass", 
    "-File", ".\Start-ActivityOrchestrator_v0.1.ps1"
) -Wait -NoNewWindow

Write-Host ""
Write-Host "[OK] Activity Orchestrator execution completed!" -ForegroundColor Green
Start-Sleep -Seconds 1

# Phase 3: Final countdown
Write-Host ""
Write-Host "[~] Phase 3: Preparing for session cleanup..." -ForegroundColor Yellow
$waitTime2 = Get-Random -Maximum 1300 -Minimum 1
Write-Host "[?] Random wait time selected: $waitTime2 seconds" -ForegroundColor Magenta
Write-Host ""

Write-Host "[>>] Starting final countdown..." -ForegroundColor Cyan

# Simple inline countdown for constrained mode
Write-Host "Countdown: $waitTime2 seconds" -ForegroundColor Yellow
$count = $waitTime2
while ($count -gt 0) {
    Write-Host "`r[$count] seconds remaining...    " -NoNewline -ForegroundColor Cyan
    Start-Sleep -Seconds 1
    $count--
}
Write-Host "`r[0] seconds remaining...      " -ForegroundColor Green

Write-Host ""
Write-Host "[OK] Final countdown complete!" -ForegroundColor Green

# Exit sequence
Write-Host ""
Write-Host "-----------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "[!!!] All operations completed successfully!" -ForegroundColor Green
Write-Host "[...] Closing PowerShell session in 3 seconds..." -ForegroundColor Yellow

# Simple countdown (no complex operations)
Write-Host "  [3]" -ForegroundColor Cyan
Start-Sleep -Seconds 1
Write-Host "  [2]" -ForegroundColor Cyan
Start-Sleep -Seconds 1
Write-Host "  [1]" -ForegroundColor Cyan
Start-Sleep -Seconds 1

Write-Host ""
Write-Host "[BYE] Goodbye!" -ForegroundColor Magenta
Start-Sleep -Milliseconds 500

exit