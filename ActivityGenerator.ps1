if($wshell){Write-Host 'Shell COM Object exists. Continue...'; Start-Sleep 2}else{Write-Host 'Create Shell COM Object...'; Start-Sleep 1; $wshell = New-Object -ComObject wscript.shell;}`
$npadrunning = (Get-Process -Name notepad).CPU;`
if($npadrunning -ge 0) {Write-Host 'Notepad already running. Resuming...'; Start-Sleep 3} else {Write-Host 'Notepad not running. Launching...'; Start-Sleep 3; notepad}`
$shutdown = $false;
# Get base operational vars
foreach($line in Get-Content ".\ActivityGenerator.vars"){
    $line_array = $line.Split(",");switch ($line_array[0] | Select-String -Pattern 'SHUTDOWN'){
        'SHUTDOWN' {$shutdown=$line_array[1]; Write-Host "shutdown=$shutdown"}
        'SHUTDOWN_TIMER' {$shutdown_timer=$line_array[1]; Write-Host "shutdown_timer=$shutdown_timer"}
    }
}
while($shutdown -eq $false -or $shutdown_timer -ge $time_to_shutdown){
    # Get shutdown status and timer
    foreach($line in Get-Content ".\ActivityGenerator.vars"){
        $line_array = $line.Split(",");switch ($line_array[0] | Select-String -Pattern 'SHUTDOWN'){
            'SHUTDOWN' {$shutdown=$line_array[1]; Write-Host "shutdown=$shutdown";}
            'SHUTDOWN_TIMER' {$shutdown_timer=$line_array[1]; Write-Host "shutdown_timer=$shutdown_timer";}
        }
        $sleep_array = $line.Split(",");switch ($line_array[0] | Select-String -Pattern 'SLEEP'){
            'FIRST_SLEEP' {$first_sleep=(Get-Random -Minimum 10 -Maximum $line_array[1]); Write-Host "first_sleep=$first_sleep";}
            'SECOND_SLEEP' {$second_sleep=(Get-Random -Minimum 10 -Maximum $line_array[1]); Write-Host "second_sleep=$second_sleep";}
            'THIRD_SLEEP' {$third_sleep=(Get-Random -Minimum 10 -Maximum $line_array[1]); Write-Host "third_sleep=$third_sleep";}
            'FOURTH_SLEEP' {$fourth_sleep=(Get-Random -Minimum 10 -Maximum $line_array[1]); Write-Host "fourth_sleep=$fourth_sleep";}
        }
    }
    if ($shutdown -eq $true){$shutdown_timer = $shutdown_timer - ($first_sleep + $second_sleep + $third_sleep + $fourth_sleep);Write-Host "time_to_shutdown: $shutdown_timer seconds...";}
    $wshell.AppActivate('Untitled - Notepad'); Start-Sleep $first_sleep; $wshell.AppActivate('Untitled - Notepad'); $wshell.SendKeys("Hello, I'm being kept alive!!"); 
    Start-Sleep $second_sleep; 
    $wshell.AppActivate('Untitled - Notepad'); $wshell.SendKeys("^a"); 
    $wshell.SendKeys("{BKSP}"); Start-Sleep $third_sleep; $wshell.AppActivate('Windows PowerShell'); Clear-Host; Start-Sleep $fourth_sleep;
}