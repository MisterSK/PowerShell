if($wshell){
    Write-Host "Windows Shell COM Object already exists. Continuing..."
}
else{
     Write-Host "Windows Shell COM Object does not exist. Creating..."
    $wshell = New-Object -ComObject wscript.shell
}

Write-Host "Getting quote list..."
.".\GetZappQuotes.ps1"

# $shutdown = $false
$seednumber = 550
Write-Host "Random sleep seed number: $seednumber"
$npadrunning = (Get-Process -Name notepad -ErrorAction SilentlyContinue).CPU
if($npadrunning -gt 0){
    Write-Host "Notepad already running. Continuing..."
}
else{
    Write-Host "Notepad not running. Starting..."
    Start-Process notepad -ErrorAction Stop
}

# while($shutdown -eq $false){
    $sleepfor = Get-Random -Minimum 0 -Maximum $seednumber
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("^a")
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("{BKSP}")

    C:\Users\SanyaK~1\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1 -Seconds $sleepfor -Message "Sleeping for $sleepfor seconds..."
    Start-Sleep -Seconds $sleepfor
    $quote = Get-ZappQuote
    # Write-Host "Next quote is '$quote'"

    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys($quote)
    $sleepfor = Get-Random -Minimum 0 -Maximum $seednumber
    C:\Users\SanyaK~1\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1 -Seconds $sleepfor -Message "Sleeping for $sleepfor seconds..."
    Start-Sleep -Seconds $sleepfor
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("^a")
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("{BKSP}")
# }
