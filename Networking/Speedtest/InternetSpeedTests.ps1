$speedlogexists = Test-Path C:\_SCRIPTS_DO_NOT_DELETE!\PowerShell\Networking\Speedtest\Speedtests.log; 
if($speedlogexists -eq $false){
    New-Item -Type File C:\_SCRIPTS_DO_NOT_DELETE!\PowerShell\Networking\Speedtest\Speedtests.log
};
$speedtestresults = speedtest 

Write-Output "$speedtestresults" | Select-String -Pattern 'Latency','Download','Upload' | Out-File -Encoding utf8 "C:\_SCRIPTS_DO_NOT_DELETE!\PowerShell\Networking\Speedtest\Speedtests.log" -Append