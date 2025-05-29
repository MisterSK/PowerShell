# Read passed parameters
param(
    [Parameter(Mandatory)]
    [String]$loggedinuserfull,
    [String]$loggedinuser
)

$LOGGED_IN_USER_FULL = $loggedinuserfull
$LOGGED_IN_USER = $loggedinuser

Write-Host ""
Write-Host "LOGGED_IN_USER_FULL :: $LOGGED_IN_USER_FULL"
Write-Host "LOGGED_IN_USER :: $LOGGED_IN_USER"
Write-Host ""

# Get Activity Generator Config
Write-Host "Getting activity generator controller config..."
.".\ActivityGeneratorProcessController.ps1"
$RANDOMIZER_SEED_MAX = GetProcesControlConfig(4)
$RANDOMIZER_SEED_MIN = GetProcesControlConfig(5)

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
$seednumber = Get-Random -Maximum $RANDOMIZER_SEED_MAX -Minimum $RANDOMIZER_SEED_MIN
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

    powershell.exe -executionpolicy bypass -file "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $sleepfor -Message "Write new activity quote text in $sleepfor seconds..."
    $quote = Get-ZappQuote
    # Write-Host "Next quote is '$quote'"

    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys($quote)
    $sleepfor = Get-Random -Minimum 0 -Maximum $seednumber
    powershell.exe -executionpolicy bypass -file "C:\Users\$LOGGED_IN_USER\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1" -Seconds $sleepfor -Message "Delete acivity quote text in $sleepfor seconds..."
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("^a")
    $wshell.AppActivate('Untitled - Notepad')
    $wshell.SendKeys("{BKSP}")
# }
