Start-Sleep 7200;
Write-Host; Write-Host "    Tearing down infrastructure in the 'idd_firecrest_production_hub_network_sub' subscription. Please wait ...    " -ForegroundColor Black -BackgroundColor Yellow; Write-Host;
az account set --subscription idd_firecrest_production_hub_network_sub;
Start-Sleep 10;
foreach($line in Get-Content "..\idd_aztf_firecrest_production_hub_network_sub\azgroups_hub_network.txt"){az group delete -n $line -y}
Write-Host; Write-Host "    Tearing down infrastructure in the 'idd_firecrest_production_idam' subscription. Please wait ...    " -ForegroundColor Black -BackgroundColor Yellow; Write-Host;
az account set --subscription idd_firecrest_production_idam;
Start-Sleep 10;
foreach($line in Get-Content "..\idd_aztf_firecrest_production_idam_sub\azgroups_idam.txt"){az group delete -n $line -y}
Write-Host; Write-Host "    Tearing down infrastructure in the 'idd_firecrest_production_management_sub' subscription. Please wait ...    " -ForegroundColor Black -BackgroundColor Yellow; Write-Host;
az account set --subscription idd_firecrest_production_management_sub;
Start-Sleep 10;
foreach($line in Get-Content "..\idd_aztf_firecrest_production_management_sub\azgroups_management.txt"){az group delete -n $line -y}