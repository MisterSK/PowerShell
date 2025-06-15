param(
    [int]$rand_start_wait_max = 50000,
    [int]$rand_start_wait_min = 10000
)

Write-Host "=== SIMPLE STARTUP SCRIPT ===" -ForegroundColor Cyan
Write-Host "Startup parameters:" -ForegroundColor Green
Write-Host "  Max wait: $rand_start_wait_max ms" -ForegroundColor Gray
Write-Host "  Min wait: $rand_start_wait_min ms" -ForegroundColor Gray

# Generate and execute wait time (NO additional countdown - that was already done!)
$waitTime = Get-Random -Minimum $rand_start_wait_min -Maximum $rand_start_wait_max
$waitSeconds = $waitTime / 1000

Write-Host "Generated startup wait: $waitSeconds seconds" -ForegroundColor Yellow
Write-Host "Executing startup wait..." -ForegroundColor Yellow

# Simple wait without calling countdown script again
Start-Sleep -Milliseconds $waitTime

Write-Host "Startup phase completed!" -ForegroundColor Green
Write-Host "=== STARTUP COMPLETE ===" -ForegroundColor Cyan