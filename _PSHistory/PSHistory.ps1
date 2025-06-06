$timestamp = Get-Date -Format "yyyyMMdd_HHmm"
$historyfile = $timestamp + "_PSHistory.ps1"
cat (Get-PSReadLineOption).HistorySavePath > $env:USERPROFILE\WorkingDir\PowerShell\_PSHistory\$historyfile