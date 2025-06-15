# Test script to find the right line break method for Start-Countdown.ps1
Write-Host "Testing line break methods for countdown timer..." -ForegroundColor Cyan
Write-Host ""

# Create a simple test countdown script if needed
$testCountdownScript = @'
param([int]$Seconds, [string]$Message)
Write-Host $Message
Start-Sleep -Seconds $Seconds
'@

# Save test countdown script
$testCountdownScript | Out-File -FilePath ".\Test-Countdown.ps1" -Force

# Test values
$header = "[Iteration 2/3 :: Estimated Iteration End time: 12:30:00]"
$action = "Write new activity quote text in 5 seconds..."
$sleepfor = 5

Write-Host "Testing different line break methods..." -ForegroundColor Yellow
Write-Host ""

# Method 1: Backtick-n
Write-Host "Method 1: Using backtick-n (`n)" -ForegroundColor Green
$message1 = $header + "`n" + $action
Write-Host "Direct output:"
Write-Host $message1
Write-Host ""
Write-Host "Via Start-Process:"
Start-Process powershell.exe -ArgumentList "-NoProfile", "-Command", "Write-Host '$message1'" -Wait -NoNewWindow
Write-Host ""

# Method 2: Carriage return + line feed
Write-Host "Method 2: Using carriage return + line feed (`r`n)" -ForegroundColor Green
$message2 = $header + "`r`n" + $action
Write-Host "Direct output:"
Write-Host $message2
Write-Host ""
Write-Host "Via Start-Process:"
Start-Process powershell.exe -ArgumentList "-NoProfile", "-Command", "Write-Host '$message2'" -Wait -NoNewWindow
Write-Host ""

# Method 3: Double backtick-n for escaping
Write-Host "Method 3: Using double backtick-n (``n)" -ForegroundColor Green
$message3 = $header + "``n" + $action
Write-Host "Direct output:"
Write-Host $message3
Write-Host ""
Write-Host "Via Start-Process:"
Start-Process powershell.exe -ArgumentList "-NoProfile", "-Command", "Write-Host '$message3'" -Wait -NoNewWindow
Write-Host ""

# Method 4: Using [char]10 (Line Feed)
Write-Host "Method 4: Using [char]10 (Line Feed)" -ForegroundColor Green
$message4 = $header + [char]10 + $action
Write-Host "Direct output:"
Write-Host $message4
Write-Host ""
Write-Host "Via Start-Process:"
Start-Process powershell.exe -ArgumentList "-NoProfile", "-Command", "Write-Host '$message4'" -Wait -NoNewWindow
Write-Host ""

# Method 5: Using encoded newline
Write-Host "Method 5: Using %0A (URL encoded newline)" -ForegroundColor Green
$message5 = $header + "%0A" + $action
Write-Host "Direct output:"
Write-Host $message5
Write-Host ""

# Method 6: Pass as Base64 encoded
Write-Host "Method 6: Using Base64 encoding" -ForegroundColor Green
$originalMessage = $header + "`n" + $action
$bytes = [System.Text.Encoding]::UTF8.GetBytes($originalMessage)
$encodedMessage = [Convert]::ToBase64String($bytes)
Write-Host "Encoded: $encodedMessage"
Write-Host "Via Start-Process with decoding:"
Start-Process powershell.exe -ArgumentList "-NoProfile", "-Command", "`$decoded = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('$encodedMessage')); Write-Host `$decoded" -Wait -NoNewWindow
Write-Host ""

# Method 7: Using literal newline in quotes
Write-Host "Method 7: Using literal newline in double quotes" -ForegroundColor Green
$message7 = @"
$header
$action
"@
Write-Host "Direct output:"
Write-Host $message7
Write-Host ""
Write-Host "Via Start-Process:"
$escapedMessage7 = $message7 -replace '"', '\"'
Start-Process powershell.exe -ArgumentList "-NoProfile", "-Command", "Write-Host `"$escapedMessage7`"" -Wait -NoNewWindow
Write-Host ""

# Method 8: Using Write-Host with -Separator
Write-Host "Method 8: Two separate Write-Host commands" -ForegroundColor Green
Write-Host "Via Start-Process:"
Start-Process powershell.exe -ArgumentList "-NoProfile", "-Command", "Write-Host '$header'; Write-Host '$action'" -Wait -NoNewWindow
Write-Host ""

# Cleanup
Remove-Item ".\Test-Countdown.ps1" -Force -ErrorAction SilentlyContinue

Write-Host "Test complete. Check which method produces the desired line break." -ForegroundColor Cyan
Write-Host ""
Write-Host "Recommendation: If the countdown script supports it, Method 8 (two Write-Host commands)" -ForegroundColor Yellow
Write-Host "is most reliable. Otherwise, try Method 6 (Base64 encoding) for complex messages." -ForegroundColor Yellow