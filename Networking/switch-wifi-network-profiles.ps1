Param (
	[Parameter(Mandatory=$true)]
	[string] $WifiNetwork1,
    [string] $WifiNetwork2,
    [Parameter(Mandatory=$false)]
    [Int32]$SwitchPeriod
);

Write-Host "Preparing to switch to Wi-Fi network $WifiNetwork1 ..."
Netsh WLAN connect name="$WifiNetwork1"
#Start-Sleep $sleeptime;

if ($SwitchPeriod -eq "")
    {
        $SwitchPeriod = 0
    }
else {
    # Start-Sleep $TimeToWait
    powershell.exe -File C:\_SCRIPTS_DO_NOT_DELETE!\PowerShell\CountDownTimers\Start-Countdown.ps1 -Seconds $SwitchPeriod -Message "Wi-Fi network has been temporarily switched to $WifiNetwork1 ..."
    }

Write-Host "Preparing to switch back to Wi-Fi network $WifiNetwork2 ..."
Netsh WLAN connect name="$WifiNetwork2"