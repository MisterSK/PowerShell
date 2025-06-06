 Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); 
 Start-Sleep -Seconds 100; 
 choco install sublimetext4 -y;
 Start-Sleep -Seconds 30; 
 choco install notepadplusplus -y
 start-sleep -Seconds 15
 choco install microsoft-windows-terminal -y; 
 start-sleep -seconds 15; 
 choco install vscode -y