# Simple Countdown Script - Works in Constrained Language Mode
# =============================================================

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [Int32]$Seconds,
    [Parameter(Mandatory=$true)]
    [string]$Message
)

# Display the message header
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host $Message -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "($Seconds seconds)" -ForegroundColor Cyan
Write-Host ""

# Simple countdown without functions or complex operations
$Count = 1
while ($Count -le $Seconds) {
    $Remaining = $Seconds - $Count + 1
    $PercentComplete = ($Count / $Seconds) * 100
    
    # Simple progress display
    Write-Host "`r[" -NoNewline -ForegroundColor Yellow
    
    # Draw progress bar
    $BarLength = 30
    $FilledLength = [int](($PercentComplete / 100) * $BarLength)
    $EmptyLength = $BarLength - $FilledLength
    
    $i = 0
    while ($i -lt $FilledLength) {
        Write-Host "#" -NoNewline -ForegroundColor Green
        $i++
    }
    
    $i = 0
    while ($i -lt $EmptyLength) {
        Write-Host "-" -NoNewline -ForegroundColor DarkGray
        $i++
    }
    
    Write-Host "] $Remaining seconds left    " -NoNewline -ForegroundColor Yellow
    
    Start-Sleep -Seconds 1
    $Count++
}

# Clear the line and show completion
Write-Host "`r[" -NoNewline -ForegroundColor Green
$i = 0
while ($i -lt 30) {
    Write-Host "#" -NoNewline -ForegroundColor Green
    $i++
}
Write-Host "] Complete!                    " -ForegroundColor Green

Write-Host ""
Write-Host "Countdown finished. Proceeding..." -ForegroundColor Green