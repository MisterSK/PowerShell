Write-Host "=== SIMPLE ACTIVITY SCRIPT ===" -ForegroundColor Magenta
Write-Host "Activity execution started at: $(Get-Date)" -ForegroundColor Green

# Simulate actual work activities
Write-Host "Performing activities..." -ForegroundColor Yellow

# Activity 1: System Information
Write-Host "  -> Activity 1: Gathering system information" -ForegroundColor Cyan
Write-Host "     Computer: $env:COMPUTERNAME" -ForegroundColor Gray
Write-Host "     User: $env:USERNAME" -ForegroundColor Gray
Write-Host "     Current directory: $(Get-Location)" -ForegroundColor Gray
Start-Sleep -Seconds 1

# Activity 2: Process Check  
Write-Host "  -> Activity 2: Checking processes" -ForegroundColor Cyan
$processes = Get-Process -Name powershell -ErrorAction SilentlyContinue
$count = ($processes | Measure-Object).Count
Write-Host "     PowerShell processes running: $count" -ForegroundColor Gray
Start-Sleep -Seconds 1

# Activity 3: File System Check
Write-Host "  -> Activity 3: File system validation" -ForegroundColor Cyan
$currentDir = Get-Location
$files = Get-ChildItem -Path $currentDir -File -ErrorAction SilentlyContinue
$fileCount = ($files | Measure-Object).Count
Write-Host "     Files in current directory: $fileCount" -ForegroundColor Gray
Start-Sleep -Seconds 1

# Activity 4: Random Processing
Write-Host "  -> Activity 4: Random processing simulation" -ForegroundColor Cyan
$randomWork = Get-Random -Minimum 2 -Maximum 6
Write-Host "     Processing for $randomWork seconds..." -ForegroundColor Gray
Start-Sleep -Seconds $randomWork

# Activity 5: Memory Check (simplified to avoid method calls)
Write-Host "  -> Activity 5: Memory usage check" -ForegroundColor Cyan
$memory = Get-Process -Id $PID | Select-Object -ExpandProperty WorkingSet64
$memoryMB = $memory / 1MB
Write-Host "     Current process memory usage: $memoryMB MB (approx)" -ForegroundColor Gray
Start-Sleep -Seconds 1

Write-Host "All activities completed successfully!" -ForegroundColor Green
Write-Host "Activity execution finished at: $(Get-Date)" -ForegroundColor Green
Write-Host "=== ACTIVITY SCRIPT COMPLETE ===" -ForegroundColor Magenta