hostname
(get-date)-(gcimWin32_OperatingSystem).LastBooptUpTime
(get-date)-(gcim Win32_OperatingSystem).LastBooptUpTime
hostname
cd C:\temp\
ls
ls .\CoreSoftware\
Compress-Archive -Path C:\temp\CoreSoftware\ -DestinationPath C:\temp\CoreSoftware.zip
visio
C:\Program Files\Microsoft Office\Office16\VPREVIEW.EXE
"C:\Program Files\Microsoft Office\Office16\VPREVIEW.EXE"
open "C:\Program Files\Microsoft Office\Office16\VPREVIEW.EXE"
Compress-Archive -Path C:\temp\CoreSoftware\ -DestinationPath C:\temp\
Compress-Archive -Path C:\temp\*.* -DestinationPath C:\temp\CoreSoftware.zip
Compress-Archive -Path C:\temp\ -DestinationPath C:\temp\CoreSoftware.zip
Compress-Archive -Path C:\temp\*.* -DestinationPath C:\temp\CoreSoftware.zip
Compress-Archive -Path C:\temp\* -DestinationPath C:\temp\CoreSoftware.zip
cd c:
cd C:\temp\
ls
Expand-Archive 'c:\\temp\\CoreSoftware.zip' c:\\temp
Expand-Archive 'c:\\temp\\CoreSoftware.zip' c:\\temp\\CoreSoftware
cd C:\temp\
ls
.\add-win7admins_grp-to-local-admins.ps1
set-executionpolicy remotesigned
.\add-win7admins_grp-to-local-admins.ps1
cd C:\temp\
ls
.\add-win7admins_grp-to-local-admins.ps1
Get-ADGroup -Identity 'HR'
cd C:\temp\
.\add-win7admins_grp-to-local-admins.ps1
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
.\add-win7admins_grp-to-local-admins.ps1
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
.\add-win7admins_grp-to-local-admins.ps1
$fDenyTSConnections = Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -ErrorAction SilentlyContinue
$TSConnections_denied = $fDenyTSConnections.fDenyTSConnections
Write-Host $TSConnections_denied
.\add-win7admins_grp-to-local-admins.ps1
cd C:\temp\
ls
edit .\add-win7admins_grp-to-local-admins.ps1
powershellise
powershell_ise .\add-win7admins_grp-to-local-admins.ps1
powershell_ise.exe
$win7admins_group_add = Add-LocalGroupMember -Group "Administrators" -Member "DFID\_Win 7 Admins" 2>&1
Write-Host  $win7admins_group_add
start-sleep 20; $win7admins_group_add = Add-LocalGroupMember -Group "Administrators" -Member "DFID\_Win 7 Admins" 2>&1
Write-Host  $win7admins_group_add
powershell_ise.exe
cd C:\temp\
.\add-win7admins_grp-to-local-admins.ps1
Set-ExecutionPolicy RemoteSigned
.\add-win7admins_grp-to-local-admins.ps1
cd C:\temp\
powershell_ise.exe
curl https://dfid.sharepoint.com/sites/insight?wa=wsignin1.0
curl https://dfid.sharepoint.com/sites/insight?wa=wsignin1.0 | Select-String -Pattern 'sanya'
curl https://dfid.sharepoint.com/sites/insight?wa=wsignin1.0 | Select-String -Pattern "Pick"
curl https://dfid.sharepoint.com/sites/insight?wa=wsignin1.0 | Select-String -Pattern 'sanya'
curl https://dfid.sharepoint.com/sites/insight?wa=wsignin1.0 | Select-String -Pattern "Sanya"
curl https://dfid.sharepoint.com/sites/insight?wa=wsignin1.0 | Select-String -Pattern "Pick"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco
hostname
cd C:\temp\
ls
.\install-OPD-ONLY-Apps.ps1
cd C:\temp\
.\install-OPD-ONLY-Apps.ps1
Start-Process -FilePath "C:\temp\CoreSoftware-plus-OPD\_OPD_Software\RequestedApps\Avco PayrollEDI 5.0.0.3\UpdatePayrollEDI.exe" -Wait -ErrorAction Stop -ArgumentList "/S"
.\install-OPD-ONLY-Apps.ps1
Invoke-WebRequest -Uri google.com
Invoke-WebRequest -Uri https://aka.ms/fslogix/download -UseBasicParsing -OutFile FSLogix-Apps_2.9.8171.14983.zip
ls
ls c:
mv .\FSLogix-Apps_2.9.8171.14983.zip .\Downloads\
curl https://aka.ms/fslogix-latest
curl https://aka.ms/fslogix-latest | Select-String "FSLogix_Apps"
cd C:\Users\S-Khasenye.DFID\
ls
mkdir WorkingDir\PowerShell
ls
cd .\WorkingDir\PowerShell\
cd C:\Users\S-Khasenye.DFID\
cd .\WorkingDir\PowerShell\
Connect-AzAccount
get-rdsuersession
get-azseess
.\vm-cleanup.ps1
ls
.\vm-cleanup.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
ls
get-rdsessionhost
get-azwvdsessionhost
get-azwvdsessionhost -ResourceGroupName HEL-WVDESKTOP-RG -HostPoolName WVDesktop_Pooled -Name hel-pool-vm-7
get-azwvdsessionhost -ResourceGroupName HEL-WVDESKTOP-RG -HostPoolName WVDesktop_Pooled -Name hel-pool-vm-0
get-azwvdsessionhost -ResourceGroupName HEL-WVDESKTOP-RG -HostPoolName WVDesktop_Pooled -Name hel-pool-vm-7.dfid.gov.uk
remove-azwvdsessionhost -ResourceGroupName HEL-WVDESKTOP-RG -HostPoolName WVDesktop_Pooled -Name hel-pool-vm-7.dfid.gov.uk
ls
.\session-host-cleanup.ps1
get-azwvdsessionhost -ResourceGroupName HEL-WVDESKTOP-RG -HostPoolName WVDesktop_Pooled -Name hel-pool-vm-7.dfid.gov.uk
$session_host = get-azwvdsessionhost -ResourceGroupName HEL-WVDESKTOP-RG -HostPoolName WVDesktop_Pooled -Name hel-pool-vm-7.dfid.gov.uk
get-azwvdsessionhost -ResourceGroupName HEL-WVDESKTOP-RG -HostPoolName WVDesktop_Pooled
start-sleep -Seconds 1800; .\session-host-cleanup.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
ls
.\vm-cleanup-test.ps1
winget
winget search vscode
winget help install
winget install --help
winget install vscode --accept-package-agreements --accept-source-agreements
code .\vm-cleanup.ps1
vscode .\vm-cleanup.ps1
code
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
code .\vm-cleanup.ps1
.\vm-cleanup-test.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
az login
Connect-AzAccount
cd C:\Users\S-Khasenye.DFID\
ls
cd .\WorkingDir\PowerShell\
ls
Start-Sleep -Seconds 60; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
Start-Sleep -Seconds 15; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
Start-Sleep -Seconds 900; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\
winget
winget search terminal
Connect-AzAccount
az login
Start-Sleep -Seconds 900; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\
cd .\PowerShell\
powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
notepad
powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
$npadrunning = (Get-Process -Name notepad).CPU
$npadrunning = (Get-Process -Name notepad -ea SilentlyContinue).CPU
powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\
cd .\PowerShell\
choco install microsoft-windows-terminal -y
hostname
ls
Start-Sleep 3600 ; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\
mkdir Projects
mkdir Projects\Azure-HITCH-Migration
cd Projects\Azure-HITCH-Migration
$AzureRmContext = Connect-AzAccount`

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
$AzureRmContext = Connect-AzAccount
$AzureRmContext = (az login)
az login
choco search azure-cli
choco install azure-cli -y
$AzureRmContext = (az login)
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\
$AzureRmContext = Connect-AzAccount
$Resources = Get-AzResource | Sort-Object Name`

$Resources | Export-Csv -Path .\ -NoTypeInformation
$Resources | Export-Csv -Path . -NoTypeInformation
mkdir Exports
$Resources | Export-Csv -Path .\Exports\ -NoTypeInformation
$Resources | Export-Csv -Path ".\Exports\" -NoTypeInformation
$Resources | Export-Csv -Path "C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\Exports" -NoTypeInformation
ls .\Exports\
cd .\WorkingDir\Projects\Azure-HITCH-Migration\
$AzureRmContext = Connect-AzAccount
ls
$Resources | Export-Csv -Path "C:\AzureResources.csv" -NoTypeInformation
$Resources | Select-Object Name, ResourceType, Location, @{Name="Tags"; Expression={($_.Tags | Sort-Object Name | Select-Object -ExpandProperty Name) -join ","}} | Export-Csv -Path "C:\AzureResourcesWithTags.csv" -NoTypeInformation
Start-Sleep 10 ; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
cd .\WorkingDir\Projects\Azure-HITCH-Migration\
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
Start-Sleep 600 ; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
Connect-AzAccount
Get-AzResource | Select-Object ResourceType,Name,Tags | Format-Table -AutoSize
Start-Sleep 3600 ; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1
Get-AzResource | Sort-!Object ResourceType | Select-Object ResourceType, Tags | Format-Table -AutoSize
Get-AzResource | Sort-!Object ResourceType | Select-Object ResourceType, Tags | Format-Table -AutoSize
Get-AzResource | Sort- Object ResourceType | Select-Object ResourceType, Tags | Format-Table -AutoSize
Get-AzResource | Sort-Object ResourceType | Select-Object ResourceType, Tags | Format-Table -AutoSize
Get-AzResource | Sort-Object ResourceType | Select-Object ResourceType, Tags | Format-Table -AutoSize |  Export-Csv -Path "C:\AzureResourcesWithTags.csv" -NoTypeInformation
$Resources | Select-Object Name, ResourceType, Location, @{Name="Tags"; Expression={($_.Tags | Sort-Object Name | Select-Object -ExpandProperty Name) -join ","}} | Export-Csv -Path "C:\AzureResourcesWithTags.csv" -NoTypeInformation
$Resources = Get-AzResource | Sort-Object ResourceType | Select-Object ResourceType, Tags | Format-Table -AutoSize
Write-Host $Red
Write-Host $Resources
Start-Sleep 3600 ; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1cls
cls
Start-Sleep 3600 ; powershell.exe -ExecutionPolicy ByPass -File .\ActivityGenerator.ps1cls
Get-AzResource | Sort-Object ResourceType | Format-Table Name,Location,ResourceType,Tags`

Get-VM | Select Name, VMType
Get-AzVM | Select Name, VMType
Get-AzVM | Select Name, VMType |  | Format-Table Name,Location,VMType,Tags
Get-AzVM | Select Name, VMType | Format-Table Name,Location,VMType,Tags
Get-AzResource | Select-String -Pattern "Compute" | Sort-Object ResourceType | Format-Table Name,Location,ResourceType,Tags
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
ls
.\ActivityGenerator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\
ls
cd .\PowerShell\
cd ..\Projects\
ls
cd .\Azure-HITCH-Migration\
ls
cd .\Exports\
ls
cd .\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\\a
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
ls
cd .\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
choco search postman
choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco search postman
choco install postman
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
choco uninstall postman
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
az login
Connect-AzAccount
az accout show
az account list
choco
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
ls
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
history
pshistory
(Get-PSReadLineOption).HistorySavePath
cat (Get-PSReadLineOption).HistorySavePath
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
New-Item -ItemType File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\_PSHistory.ps1
echo "cat (Get-PSReadLineOption).HistorySavePath" > C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\_PSHistory.ps1
cat C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\_PSHistory.ps1
C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\_PSHistory.ps1
Connect-AzAccount
C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\_PSHistory.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\_PSHistory.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
New-Item -ItemType File ResourceInteroryTaskList.txt
get
choco search get
choco search curl
curl
curl --?
help curl
Invoke-RestMethod -Uri  https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resources?api-version=2021-04-01
Connect-AzAccount
Invoke-RestMethod -Uri  https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resources?api-version=2021-04-01
$AzureCredentials = Get-Credential
$Params = @{`
    Uri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resources?api-version=2021-04-01"`
    Authentication = "Basic"`
    Credential = $AzureCredentials`
}`
`
Invoke-RestMethod @Params
Write-Host $AzureCredentials
$Params = @{`
    Uri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resources?api-version=2021-04-01"`
    Authentication = "Bearer"`
    Credential = $AzureCredentials`
}`
`
Invoke-RestMethod @Params
$azContext = Get-AzContext`
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRm`
ProfileProvider]::Instance.Profile`
$profileClient = New-Object -`
TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -`
ArgumentList ($azProfile)`
$token = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)`
$authHeader = @{`
   'Content-Type'='application/json'`
   'Authorization'='Bearer ' + $token.AccessToken`
}
$azContext = Get-AzContext
$azContext = Get-AzContext`
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile`
$profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)`
$token = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)`
$authHeader = @{`
   'Content-Type'='application/json'`
   'Authorization'='Bearer ' + $token.AccessToken`
}
$restUri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resources?api-version=2021-04-01"
$response = Invoke-RestMethod -Uri $restUri -Method Get -Headers $authHeader
Write-Output $response
Write-Host $response
$response
$RestURIVMs = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/providers/Microsoft.Compute/virtualMachines?api-version=2019-03-01"
$response = Invoke-RestMethod -Uri $restUriVMs -Method Get -Headers $authHeader
Write-Host $RestURIVMs
Write-Host $response
Write-Host "Virtual Machine Collection : " -ForegroundColor Green`
$RestURIVMs.value | ForEach-Object {`
 Write-Output $_.Name `
}
Write-Host "Virtual Machine Collection : " -ForegroundColor Green`
$response.value | ForEach-Object {`
 Write-Output $_.Name `
}
Write-Host "Virtual Machine Collection : " -ForegroundColor Green`
$response.value | ForEach-Object {`
 Write-Output $_.Name,",",$_.Tags`
}
Start-Sleep -Seconds 3600;  .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\
ls
cd .\AzureResourceInventory\
ls
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\
cd .\AzureResourceInventory\
ls
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
Connect-AzAccount
 Get-BrowserData -Browser Chrome -Datatype History 
Import-Module Get-BrowserData
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
..\Chrome\Get-BrowserData.ps1
history | Select-String -Pattern 'bypass'
history
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'bypass'
powershell.exe -ExecutionPolicy ByPass -File ..\Chrome\Get-BrowserData.ps1
powershell.exe -ExecutionPolicy ByPass -File ..\Chrome\Get-BrowserData.ps1  -Browser Chrome -Datatype History
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\
ls
cd .\AzureResourceInventory\
ls
az login
az account set --subscription "HITCH - Production"
az account show -o table
az consumption usage list --debug --end-date 2023-03-31 --start-date 2023-01-31
az account show -o table
az account show 
az costmanagement export create --name HITCH-Prod-Consumption-Report --type Usage --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335" --storage-account-id hitchinfrareports --storage-container hitchinfrareports --timeframe MonthToDate
az costmanagement export create --name HEL-WVDesktop-RG --type Usage --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335" --storage-account-id wvdgeneralartifacts --storage-container hitchinfrareports --timeframe MonthToDate --storage-directory hitchinfrareports
### START ###`
#Subscription Id.`
$SubscriptionId = "d0e6f74b-b854-4c52-9ad2-4b5606b58335"`
 `
#Tenant Id.`
$TenantId = "cdf709af-1a18-4c74-bd93-6d14a64d73b3"`
 `
 `
$Resource = "https://management.core.windows.net/"`
$RequestAccessTokenUri = "https://login.microsoftonline.com/$TenantId/oauth2/token"`
 `
$body = "grant_type=client_credentials&client_id=$ClientId&client_secret=$ClientSecret&resource=$Resource"`
 `
# Get Access Token`
$AccessToken = Invoke-RestMethod -Method Post -Uri $RequestAccessTokenUri -Body $body -ContentType 'application/x-www-form-urlencoded'`
 `
# Register Cost Management Provider`
$CostMgmtProviderURI = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/providers/Microsoft.CostManagementExports./register?api-version=2021-04-01"`
 `
# Format Header`
$Headers = @{}`
$Headers.Add("Authorization","$($AccessToken.token_type) "+ " " + "$($AccessToken.access_token)")`
 `
#Invoke Cost Management Provider REST API`
$RegisterCostManagementProvider = Invoke-RestMethod -Method Post -Uri $CostMgmtProviderURI -Headers $Headers`
 `
 ### END ###
#Subscription Id.`
$SubscriptionId = "d0e6f74b-b854-4c52-9ad2-4b5606b58335"`
 `
#Tenant Id.`
$TenantId = "cdf709af-1a18-4c74-bd93-6d14a64d73b3"
$Resource = "https://management.core.windows.net/"`
$RequestAccessTokenUri = "https://login.microsoftonline.com/$TenantId/oauth2/token"
$body = "grant_type=client_credentials&client_id=$ClientId&client_secret=$ClientSecret&resource=$Resource"
# Get Access Token`
$AccessToken = Invoke-RestMethod -Method Post -Uri $RequestAccessTokenUri -Body $body -ContentType 'application/x-www-form-urlencoded'
cat (Get-PSReadLineOption).HistorySavePath
Invoke-RestMethod : {"error":"invalid_client","error_description":"AADSTS7000216: 'client_assertion', 'client_secret' or 'request' is required for the`
'client_credentials' grant type.\r\nTrace ID: 4ee67444-a8c6-466e-8530-ef5eda830e00\r\nCorrelation ID: 5671dfb8-3854-4671-982b-7a7e4538279f\r\nTimestamp: 2023-03-16`
13:25:22Z","error_codes":[7000216],"timestamp":"2023-03-16 13:25:22Z","trace_id":"4ee67444-a8c6-466e-8530-ef5eda830e00","correlation_id":"5671dfb8-3854-4671-982b-7a7e45`
38279f","error_uri":"https://login.microsoftonline.com/error?code=7000216"}
At line:2 char:16
+ ... cessToken = Invoke-RestMethod -Method Post -Uri $RequestAccessTokenUr ...
+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (System.Net.HttpWebRequest:HttpWebRequest) [Invoke-RestMethod], WebException
.\Helpers\PS_Invoke-RestMethod_Complete.ps1
$restUri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/providers/Microsoft.CostManagementExports./register?api-version=2021-04-01"`
$response = Invoke-RestMethod -Uri $restUri -Method Post -Headers $authHeader
$AccessToken = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)``
$AuthHeaders = @{}`
$AuthHeaders.Add("Authorization","$($AccessToken.token_type) "+ " " + "$($AccessToken.access_token)")`
$restUri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/providers/Microsoft.CostManagementExports./register?api-version=2021-04-01"`
$response = Invoke-RestMethod -Uri $restUri -Method Post -Headers $AuthHeaders
$azContext = Get-AzContext`
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile`
$profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)`
$AccessToken = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)`
$AuthHeaders = @{}`
$AuthHeaders.Add("Authorization","$($AccessToken.token_type) "+ " " + "$($AccessToken.access_token)")`
$restUri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/providers/Microsoft.CostManagementExports./register?api-version=2021-04-01"`
$response = Invoke-RestMethod -Uri $restUri -Method Post -Headers $AuthHeaders
cat (Get-PSReadLineOption).HistorySavePath
cat (Get-PSReadLineOption).HistorySavePath > .\Helpers\PS_History.txt
$azContext = Get-AzContext``
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile``
$profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)``
$token = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)``
$authHeader = @{``
   'Content-Type'='application/json'``
   'Authorization'='Bearer ' + $token.AccessToken``
}`
$restUri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resources?api-version=2021-04-01"`
$response = Invoke-RestMethod -Uri $restUri -Method Get -Headers $authHeader`
Write-Output $response`
Write-Host $response`
$response`
$RestURIVMs = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/providers/Microsoft.Compute/virtualMachines?api-version=2019-03-01"`
$response = Invoke-RestMethod -Uri $restUriVMs -Method Get -Headers $authHeader`
Write-Host $RestURIVMs`
Write-Host $response`
Write-Host "Virtual Machine Collection : " -ForegroundColor Green``
$RestURIVMs.value | ForEach-Object {``
 Write-Output $_.Name ``
}
$AccessToken = Invoke-RestMethod -Method Post -Uri $RequestAccessTokenUri -Body $body -ContentType 'application/x-www-form-urlencoded'
$restUri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resources?api-version=2021-04-01"`
$response = Invoke-RestMethod -Uri $restUri -Method Get -Headers $authHeader
$azContext = Get-AzContext``
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile``
$profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)``
$token = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)``
$authHeader = @{``
   'Content-Type'='application/json'``
   'Authorization'='Bearer ' + $token.AccessToken``
}
az costmanagement export create --name HEL-WVDesktop-RG --type Usage --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335" --storage-account-id wvdgeneralartifacts --storage-container hitchinfrareports --timeframe MonthToDate --storage-directory hitchinfrareports
$azContext = Get-AzContext`
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile`
$profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)`
$AccessToken = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)`
`
PS C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers> $authHeader = @{`
   'Content-Type'='application/json'`
   'Authorization'='Bearer ' + $token.AccessToken``
}`
$restUri = "https://management.azure.com/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/providers/Microsoft.CostManagementExports/register?api-version=2021-04-01"`
# $response = Invoke-RestMethod -Uri $restUri -Method Post -Headers $AuthHeaders`
Invoke-RestMethod -Uri $restUri -Method Post -Headers $AuthHeaders
Start-Sleep -Seconds 3000; .\ActivityOrchestrator.ps1
az consumption usage list  --end-date 2023-03-31 --start-date 2023-01-31
ls
az consumption usage list  --end-date 2023-03-31 --start-date 2023-01-31 --debug
az consumption usage list  --end-date 2023-03-31 --start-date 2023-01-31 --debug --output table
az costmanagement export create --name "SQLServerVMsUsage" --type "Usage" --dataset-configuration columns="Date" columns="MeterId" columns="InstanceId" columns="ResourceLocation" columns="PreTaxCost" --timeframe "MonthToDate" --storage-container="hitchinfrareports" --storage-account-id="/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-WVDesktop-RG/providers/Microsoft.Storage/storageAccounts/hitchinfrareports" --storage-directory="hitchinfrareports" --recurrence "Weekly" --recurrence-period from="2018-06-01T00:00:00Z" to="2018-10-31T00:00:00Z" --schedule-status "Active" --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-SQL-Management"
az costmanagement export create --name "SQLServerVMsUsage" --type "Usage" --timeframe "MonthToDate" --storage-container="hitchinfrareports" --storage-account-id="/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-WVDesktop-RG/providers/Microsoft.Storage/storageAccounts/hitchinfrareports" --storage-directory="hitchinfrareports" --recurrence "Weekly" --recurrence-period from="2023-03-31T00:00:00Z" to="2023-03-01T00:00:00Z" --schedule-status "Active" --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-SQL-Management"
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
cd C:\Users\
cd .\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
choco search notepadplusplus
choco install notepadplusplus -y
notepadplusplus
history
ls ..\..\..\PowerShell\
cat (Get-PSReadLineOption).HistoryNoDuplicates
cat (Get-PSReadLineOption).HistorySavePath
cat (Get-PSReadLineOption).HistorySavePath > ..\..\..\PowerShell\_PSHistory.ps1
cd .\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd .\S-Khasenye.DFID\WorkingDir\
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
Install-module PSExcel
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
chrome.exe --restore-last-session
& 'C:\Program Files\Google\Ch'
ls 'C:\Program Files\Google\'
'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' --restore-last-session
'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --restore-last-session'
'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
Start-Process 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' -ArgumentList '--restore-last-session'
Start-Process -FilePath 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' -ArgumentList "--restore-last-session"
Start-Process 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' --restore-last-session
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\; ActivityOrchestrator.ps1
ls
.\ActivityOrchestrator.ps1
rsop
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\ActivityOrchestrator.ps1
~\WorkingDir\PowerShell\ActivityGenerator.v2\ActivityOrchestrator.ps1
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
hostname
choco install notepadpluplus -y
choco search notepadpluplus
choco search notepad+
choco search notepadplus
choco install notepadplusplus -y
Install-Module -Name ImportExcel -Scope CurrentUser -Force
cd ~\S-Khasenye.DFID\WorkingDir\
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
cd .\Helpers\
ls
.\ReadExcelFile_Tests.ps1
Import-Module -Name PSExcel
Install-Module -Name PSExcel
.\ReadExcelFile_Tests.ps1
Import-Module -Name PSExcel
.\ReadExcelFile_Tests.ps1
.\ImportExportExcelModule_Test.ps1
ImportExcel
Import-Excel
Import-Excel --?
help Import-Excel
.\ImportExportExcelModule_Test.ps1
[array]$Data = Import-Excel -Path "C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\AzureResourceInventory_HITCH-Production.xlsx" -WorksheetName "AzureVirtualMachines" -ImportColumns @(1,5,6) -StartRow 2
Import-Excel -Path "C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\AzureResourceInventory_HITCH-Production.xlsx" -WorksheetName "AzureVirtualMachines" -ImportColumns @(1,5,6) -StartRow 2
help Import-Excel
.\ImportExportExcelModule_Test.ps1
Install-Module -Name ImportExcel -Force
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers>
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers
Install-Module -Name ImportExcel -Force
.\ImportExportExcelModule_Test.ps1
Connect-AzAccount
.\ImportExportExcelModule_Test.ps1
get-azvm -o table
get-azvm * -o table
get-azvm
0`
`
`
write-host(Get-AzVm -name "Ubuntu-VM").ResourceGroupName
code .\ImportExportExcelModule_Test.ps1
$vmRG = (Get-AzVm -name Ubuntu-VM).ResourceGroupName
 $vmTags =  (Get-AzResource -ResourceGroupName $vmRG -Name Ubuntu-VM).Tags^
 $vmTags =  (Get-AzResource -ResourceGroupName $vmRG -Name Ubuntu-VM).Tags
Write-Host $vmTags
$vmName = "HEL-APC-01"
$vmRG = (Get-AzVm -name $vmName).ResourceGroupName
 $vmTags =  (Get-AzResource -ResourceGroupName $vmRG -Name $vmName).Tags
Write-Host $vmTags
.\ImportExportExcelModule_Test.ps1
Start-Sleep 1800 ;cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
.\ImportExportExcelModule_Test.ps1
get-azvm
get-azvm | Select-String -Pattern 'vpn'
get-azvm | Select-String -Pattern 'checkpoint'
get-azvm | Select-String -Pattern 'CheckPoint'
get-azvm | Select-String -Pattern 'aries'
.\ImportExportExcelModule_Test.ps1
get-azvm | Select-String -Pattern 'hel-pool-vm-0'
get-azvm
get-azvm | Select-String -Pattern 'hel-pool'
.\ImportExportExcelModule_Test.ps1
get-azvm | Select-String -Pattern 'ununtu'
get-azvm | Select-String -Pattern 'ubuntu'
get-azvm
.\ImportExportExcelModule_Test.ps1
get-azvm | Select-String -Pattern 'pool'
get-azvm | Select-String -Pattern 'HED-SQL-10'
.\ImportExportExcelModule_Test.ps1
Start-Sleep 1800 ;cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
ls
ls
hostname
$vmName = "Ubuntu-VM"
$vmRG = (Get-AzVm -name $vmName).ResourceGroupName
Write-Host $vmRG
 .\update-vm-tags.ps1 -ResourceGroup $vmRG -TagName ServiceName -TagValue "CSCJump"
powershell.exe -ExecutionPolicy Bypass -File .\update-vm-tags.ps1 -ResourceGroup $vmRG -TagName ServiceName -TagValue "CSCJump"
powershell.exe -ExecutionPolicy Bypass -File .\update-vm-tags.ps1 -ResourceGroup $vmRG -TagName Purpose -TagValue "CSC Jump Server"
powershell.exe -ExecutionPolicy Bypass -File .\update-vm-tags.ps1 -ResourceGroup $vmRG -TagName "Availability Requirement" -TagValue "24x7"
powershell.exe -ExecutionPolicy Bypass -File .\ImportExportExcelModule_WriteAllResourceTags.ps1
cd ~\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
choco search terminal
choco search terminal | Select-String -Pattern 'microsoft'
choco install microsoft-windows-terminal -y
start chrome --restore-last-session
start chrome
choco search sublime
choco seach atom
choco search atom
choco search sublimetext
choco install sublimetext4 -y
choco install atom -y
hostname
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
cd .\Helpers\
ls
Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\ImportExportExcelModule_WriteAllResourceTags.ps1
help import-excel
hostname
choco search sublimetext
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')); Start-Sleep -Seconds 100; choco install sublimetext4 -y;Start-Sleep -Seconds 30; choco install notepadplusplus -y
choco install microsoft-windows-terminal iy; start-sleep -seconds 15; choco install vscode -y
cd ~\S-Khasenye.DFID\WorkingDir\
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
code .\_ChocolateyManifest.ps1
vscode .\_ChocolateyManifest.ps1
code .\_ChocolateyManifest.ps1
cd .\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
.\ActivityOrchestrator.ps1
cd .\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd .\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd .\WorkingDir\PowerShell\ActivityGenerator.v2\
.\ActivityOrchestrator.ps1
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
lIn the game of Chess, you must never let your adversary see your pieces.s
ls
hostname
cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\
ls
cat .\_ChocolateyManifest.ps1
.\_ChocolateyManifest.ps1; wt -p "PowerShell" /cmd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\ActivityOrchestrator.ps1
wt -p "PowerShell" /cmd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\ActivityOrchestrator.ps1
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
cd .\WorkingDir\PowerShell\
$random_start = (Get-Random -Maximum 100 -Minimum 25)
Write-Host Get-Random
Write-Host $random_start
$random_start = (Get-Random -Maximum 100 -Minimum 25); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
$random_start = (Get-Random -Maximum 1000 -Minimum 250); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
$random_start = (Get-Random -Maximum 1000 -Minimum 250); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
hostname
Connect-AzAccount
hostname
.\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
.\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
Connect-AzAccount
ls
cd .\Helpers\
ls
.\ImportExportExcelModule_WriteAllResourceTags.ps1
hostname
mstsc /v:10.81.1.6
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
cd .\Helpers\
ls
.\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
cd .\Helpers\
Import-AIPScannerConfiguration
.\ImportExportExcelModule_WriteAllResourceTags.ps1
$sleep_for = (Get-Random -Minimum 4500 -Maximum 7200); Write-Host "Sleeping for $sleep_for seconds..."; Start-Sleep -Seconds $sleep_for; .\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
$sleep_for = (Get-Random -Minimum 4500 -Maximum 7200); Write-Host "Sleeping for $sleep_for seconds..."; Start-Sleep -Seconds $sleep_for; .\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
hostname
ls
& '.\Update-VM-Tags - Enhanced.ps1'
history
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'SetExecutionPolicy'
cat (Get-PSReadLineOption).HistorySavePath
powershell.exe -ExecutionPolicy Bypass -File '.\Update-VM-Tags - Enhanced.ps1'
cd .\WorkingDir\Azure\a
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
cd .\Helpers\
ls
az vm list --query "[?name=='Ubuntu'].hardwareProfile.vmSize" -otsv
az vm list --query "[?name=='AzVM'].hardwareProfile.vmSize" -otsv
choco install azcli -y
choco search azurecli
choco install azure-cli -y
az vm list --query "[?name=='Ubuntu-VM'].hardwareProfile.vmSize" -otsv
az vm list --query "[?name=='AzVM'].hardwareProfile.vmSize" -otsv
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
cd ~\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
az login
az account set --subscription "HITCH - Production"
az vm list --query "[?name=='Ubuntu-VM].hardwareProfile.vmSize" -otsv
az vm show -n Ubuntu-VM -g ResourceGroupName --query '[hardwareProfile.vmSize]' -otsv
az vm show -n Ubuntu-VM -g HEL-CSC-RG --query '[hardwareProfile.vmSize]' -otsv
cd .\Helpers\cls
cls
ls
& '.\Update-VM-Tags - Enhanced.ps1'
az
az
$sleep_for = (Get-Random -Minimum 10800 -Maximum 17000); Write-Host "Sleeping for $sleep_for seconds..."; Start-Sleep -Seconds $sleep_for; .\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
$sleep_for = (Get-Random -Minimum 10800 -Maximum 17000); Write-Host "Sleeping for $sleep_for seconds..."; Start-Sleep -Seconds $sleep_for; ~\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
$sleep_for = (Get-Random -Minimum 10800 -Maximum 17000); Write-Host "Sleeping for $sleep_for seconds..."; Start-Sleep -Seconds $sleep_for; ~\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
cd .\Helpers\
cp .\update-vm-tags.ps1 Get-VMSizingDetails.ps1
.\Get-VMSizingDetails.ps1
powershell.exe -ExecutionPolicy Bypass -File .\Get-VMSizingDetails.ps1
$vmResourceGroup = (Get-AzVm -name Ubuntu-VM).ResourceGroupName
Write-Host $vmResourceGroup
$vmSize  = (az vm show -n Ubuntu-VM -g $vmResourceGroup --query '[hardwareProfile.vmSize]' -otsv)
Write-Host $vmSize
powershell.exe -ExecutionPolicy Bypass -File .\Get-VMSizingDetails.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
.\Get-VMSizingDetails.ps1
powershell.exe -ExecutionPolicy Bypass -File .\Get-VMSizingDetails.ps1
cd ~\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
cd .\Helpers\
ls
cat (Get-PSReadLineOption).HistorySavePath
powershell.exe -ExecutionPolicy Bypass -File .\Get-VMSizingDetails.ps1
$vmSizeExtendedDetails = (Get-AzVMSize -VMName $vmName -ResourceGroupName $vmResourceGroup | where{$_.Name -eq $vmSize})
$vmSize  = (az vm show -n Ubuntu-VM -g HEL-CSC-RG --query '[hardwareProfile.vmSize]' -otsv)
Write-Host $vmSize
$vmSizeExtendedDetails = (Get-AzVMSize -VMName Ubuntu-VM -ResourceGroupName HEL-CSC-RG | where{$_.Name -eq $vmSize})
Write-Host $vmSizeExtendedDetails
echo $vmSizeExtendedDetails
Write-Host $vmSizeExtendedDetails.Name
Write-Host $vmSizeExtendedDetails.NameMemoryInMB
Write-Host $vmSizeExtendedDetails.MemoryInMB
Write-Host [char]9
Write-Host [char9]
Write-Host `t
Write-Host `t hello
$DetailString = "$vmSizeExtendedDetails_Name `t $vmSizeExtendedDetails_NumberOfCores `t vmSizeExtendedDetails_MemoryInMB `t $vmSizeExtendedDetails_MaxDataDiskCount" ``
"`t $vmSizeExtendedDetails_OSDiskSizeInMB `t $vmSizeExtendedDetails_ResourceDiskSizeInMB"
$DetailString = "$vmSizeExtendedDetails_Name `t $vmSizeExtendedDetails_NumberOfCores `t vmSizeExtendedDetails_MemoryInMB `t $vmSizeExtendedDetails_MaxDataDiskCount ``
`t $vmSizeExtendedDetails_OSDiskSizeInMB `t $vmSizeExtendedDetails_ResourceDiskSizeInMB"
Write-Host $DetailString
$vmSizeExtendedDetails_Name = $vmSizeExtendedDetails.Name
$vmSizeExtendedDetails_NumberOfCores = $vmSizeExtendedDetails.NumberOfCores
$vmSizeExtendedDetails_MemoryInMB = $vmSizeExtendedDetails.MemoryInMB
$vmSizeExtendedDetails_MaxDataDiskCount = $vmSizeExtendedDetails.MaxDataDiskCount
$vmSizeExtendedDetails_OSDiskSizeInMB = $vmSizeExtendedDetails.OSDiskSizeInMB
$vmSizeExtendedDetails_ResourceDiskSizeInMB = $vmSizeExtendedDetails.ResourceDiskSizeInMB
$DetailString = "$vmSizeExtendedDetails_Name `t $vmSizeExtendedDetails_NumberOfCores `t vmSizeExtendedDetails_MemoryInMB `t $vmSizeExtendedDetails_MaxDataDiskCount ``
`t $vmSizeExtendedDetails_OSDiskSizeInMB `t $vmSizeExtendedDetails_ResourceDiskSizeInMB"
Write-Host $DetailString
$DetailString = "$vmSizeExtendedDetails_Name `t $vmSizeExtendedDetails_NumberOfCores `t $vmSizeExtendedDetails_MemoryInMB `t $vmSizeExtendedDetails_MaxDataDiskCount `t $vmSizeExtendedDetails_OSDiskSizeInMB `t $vmSizeExtendedDetails_ResourceDiskSizeInMB"
Write-Host $DetailString
echo $DetailString
powershell.exe -ExecutionPolicy Bypass -File .\Get-VMSizingDetails.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
az vm show --name Ubuntu-VM --show-details --query "[].properties.storageProfile.osDisk.diskSizeGb * properties.hardwareProfile.vmSize.prices[?location == 'ukwest'].value[].amount" --output tsv
az vm show --name 'Ubuntu-VM' --show-details --query "[].properties.storageProfile.osDisk.diskSizeGb * properties.hardwareProfile.vmSize.prices[?location == 'ukwest'].value[].amount" --output tsv
az vm list-usage --location 'ukwest' --output table
az vm list-usage --location 'ukwest'  --include-meter-details --output table
az vm list-usage --location 'ukwest'  --start-date 2023-03-01 --end-date 2023-03-31 --output table
powershell.exe -ExecutionPolicy Bypass -File '.\Update-VM-Tags - Enhanced.ps1'
get-azyrermusage
get-azurermusage
az account show
az costmanagement export create --name DemoExport --type Usage \--scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335" --storage-account-id hitchinfrareports \--storage-container hitchinfrareports --timeframe MonthToDate --storage-directory hitchinfrareports
az costmanagement export create --name DemoExport --type Usage --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335" --storage-account-id hitchinfrareports --storage-container hitchinfrareports --timeframe MonthToDate --storage-directory hitchinfrareports
az account -show -0 table
az account show -0 table
az account list -0 table
az account list
az costmanagement export create --name AzConsumptionReportExport --type Usage --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335" --storage-account-id hitchinfrareports --storage-container hitchinfrareports --timeframe MonthToDate --storage-directory hitchinfrareports
az login
az costmanagement export create --name AzConsumptionReportExport --type Usage --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335" --storage-account-id hitchinfrareports --storage-container hitchinfrareports --timeframe MonthToDate --storage-directory hitchinfrareports
az costmanagement export create --name AzConsumptionReportExport --type Usage --scope subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335 --storage-account-id hitchinfrareports --storage-container hitchinfrareports --timeframe MonthToDate --storage-directory hitchinfrareports
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" ``
    --start-date "2023-03-01" --end-date "2023-03-31" ``
    | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation ``
    | Set-Content "AzureResourceConsumption_HITCH-Production.csv"
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation Set-Content "AzureResourceConsumption_HITCH-Production.csv"
(az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation Set-Content "AzureResourceConsumption_HITCH-Production.csv"
az costmanagement export create --name "SQLServerVMsUsage" --type "Usage" --timeframe "MonthToDate" --storage-container="hitchinfrareports" --storage-account-id="/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-WVDesktop-RG/providers/Microsoft.Storage/storageAccounts/hitchinfrareports" --storage-directory="hitchinfrareports" --recurrence "Weekly" --recurrence-period from="2023-03-31T00:00:00Z" to="2023-03-01T00:00:00Z" --schedule-status "Active" --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-SQL-Management"
az costmanagement export create --name "SQLServerVMsUsage" --type "Usage" --timeframe "MonthToDate" --storage-container="hitchinfrareports" --storage-account-id="/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-WVDesktop-RG/providers/Microsoft.Storage/storageAccounts/hitchinfrareports" --storage-directory="hitchinfrareports" --recurrence "Weekly" --recurrence-period from="2023-03-01T00:00:00Z" to="2023-03-31T00:00:00Z" --schedule-status "Active" --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-SQL-Management"
az costmanagement export create --name "SQLServerVMsUsage" --type "Usage" --timeframe "MonthToDate" --storage-container="hitchinfrareports" --storage-account-id="/subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-WVDesktop-RG/providers/Microsoft.Storage/storageAccounts/hitchinfrareports" --storage-directory="hitchinfrareports" --recurrence "Weekly" --recurrence-period from="2023-03-31T00:00:00Z" to="2023-03-01T00:00:00Z" --schedule-status "Active" --scope "subscriptions/d0e6f74b-b854-4c52-9ad2-4b5606b58335/resourceGroups/HEL-SQL-Management"
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31"
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" | ConvertTo-Csv -NoTypeInformation Set-Content "AzureResour`
ceConsumption_HITCH-Production.csv"
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" | ConvertTo-Csv -NoTypeInformation Set-Content "AzureResourceConsumption_HITCH-Production.csv"
(az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31") | ConvertTo-Csv -NoTypeInformation Set-Content "AzureResourceConsumption_HITCH-Production.csv"
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" > AzureResourceConsumptionReport.json
ls
$ReportOutput = Get-Content -Path .\AzureResourceConsumptionReport.json | ConvertFrom-Json
$ReportOutput | Export-Csv -Path .\AzureResourceConsumptionReport.json
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" > AzureResourceConsumptionReport.json
cat (Get-PSReadLineOption).HistorySavePath
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" > AzureResourceConsumptionReport.json
rm .\AzureResourceConsumptionReport.json
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" > AzResourceConsumptionReport.json
cat (Get-PSReadLineOption).HistorySavePath
cd  C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
$ReportOutput = Get-Content -Path .\AzureResourceConsumptionReport.json | ConvertFrom-Json
$ReportOutput | Export-Csv -Path .\AzureResourceConsumptionReport.csv
$ReportOutput | Export-Csv -Path .\AzureResourceConsumptionReport.csv -NoTypeInformation
Write-Host $ReportOutput
$ReportOutput = Get-Content -Path .\AzureResourceConsumptionReport.json
Write-Host $ReportOutput
$ReportOutput | Export-Csv -Path .\AzureResourceConsumptionReport.csv -NoTypeInformation
$ReportOutput | Export-Csv -Path .\AzureResourceConsumptionReport.csv -NoTypeInformation
ConvertFrom-Json --?
ConvertFrom-Json -?
Get-Content .\AzResourceConsumptionReport.json | ConvertFrom-Json | ConvertTo-Csv
Get-Content .\AzResourceConsumptionReport.json | ConvertFrom-Json | ConvertTo-Csv | Out-File AzResourceConsumptionReport.csv
cat AzResourceConsumptionReport.csv
cat .\AzResourceConsumptionReport.csv
az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" > AzResourceConsumptionReport.RAW.json
((Get-Content -Path .\AzResourceConsumptionReport.json) | ConvertFrom-Json).results |`
    ConvertTo-Csv -NoTypeInformation |`
    Set-Content .\AzResourceConsumptionReport.csv
ls
((Get-Content -Path .\AzResourceConsumptionReport.RAW.json) | ConvertFrom-Json).results | ConvertTo-Csv -NoTypeInformation | Set-Content .\AzResourceConsumptionReport.csv
Get-Content -Path .\AzResourceConsumptionReport.RAW.json | ConvertFrom-Json | ConvertTo-Csv -NoTypeInformation | Set-Content .\AzResourceConsumptionReport.csv
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'json'
(az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation Set-Content "AzureResourceConsumption_HITCH-Production.csv"
Set-Content -?
(az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2023-03-01" --end-date "2023-03-31" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation | Set-Content "AzureResourceConsumption_HITCH-Production.csv"
hostname
$random_start = (Get-Random -Maximum 7200 -Minimum 1800; write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
$random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
$random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
 cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
 cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
 cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
 cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
ls
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
ls
New-Item -ItemType File .\AzureUsageAndConsuomptionCostsQueries.txt
$random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
$random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
Start-Job -ScriptBlock { (az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2022-01-01" --end-date "2022-01-31" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation | Set-Content "AzConsumption_HITCH-Production_Jan22.csv" }
get-job
.\AzureUsageAndConsuomptionCostsQueries.ps1
get-b
get-job
for($j = 1; $j -le 1000;$j += 1){Start-Sleep -Seconds 1; cls; Get-job;}
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
get-job
Get-Job
for($j = 1; $j -le 1000;$j += 1){Start-Sleep -Seconds 1; cls; Get-job;}
(az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2022-01-01" --end-date "2022-01-31" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation | Set-Content "AzConsumption_HITCH-Production_Jan22.csv"
for($j = 1; $j -le 1000;$j += 1){Start-Sleep -Seconds 1; cls; Get-job;}
cat .\AzConsumption_HITCH-Production_Jan22.csv
for($j = 1; $j -le 1000;$j += 1){Start-Sleep -Seconds 1; cls; Get-job;}
Get-Job
Get-Job job21
.\AzureUsageAndConsumptionCosts_PSQueries.ps1
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
choco search azure-resource-inventory
az extension add --name resource-graph
cd ..\ARI\
ls
.\AzureResourceInventory.ps1
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'poershell.exe'
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'powershell.exe'
powershell.exe -ExecutionPolicy Bypass -File .\AzureResourceInventory.ps1
$random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
(az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2022-09-01" --end-date "2022-09-31" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation | Set-Content "AzConsumption_HITCH-Production_Sep22.csv"
(az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2022-09-01" --end-date "2022-09-30" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation | Set-Content "AzConsumption_HITCH-Production_Sep22.csv"
.\AzureUsageAndConsumptionCosts_PSQueries.ps1
$random_sleep = (Get-Random -Minimum 60 -Maximum 120); Write-Host "Waiting to start in $random_sleep seconds..."; Start-Sleep $random_sleep
powershell.exe -ExecutionPolicy Bypass -File .\AzureResourceInventory.ps1 -SecurityCenter
Write-Host "Querying and saving Sep '22 azure consumption..."
ls *22*
ls *23*
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
for($r=1; $r -le 250; $r =+ 1){start-sleep -seconds 10;cls;ls *22*; ls *23*}
$random_sleep = (Get-Random -Minimum 60 -Maximum 120); Write-Host "Waiting to start in $random_sleep seconds..."; Start-Sleep $random_sleep
Write-Host "Querying and saving Sep '22 azure consumption..."
(az consumption usage list --subscription "d0e6f74b-b854-4c52-9ad2-4b5606b58335" --start-date "2022-09-01" --end-date "2022-09-30" | ConvertFrom-Json) | ConvertTo-Csv -NoTypeInformation | Set-Content "AzConsumption_HITCH-Production_Sep22.csv"
choco search markup
choco install typora -y
powershell.exe -ExecutionPolicy Bypass -File .\AzureResourceInventory.ps1 -Diagram
$random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
hostname
$random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
hostname
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
mv .\Monthly_Reports\*.csv .\Monthly_Reports\CSV\
mv .\Monthly_Reports\*.xlsx .\Monthly_Reports\XLSX\
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
hostname
choco search sublime#
choco search sublime
choco install sublimetext4 -y
az login
az account set --subscription "HITCH - Production"
az account show -o table
ls
& '.\Update-VM-Tags - Enhanced.ps1'
Connect-AzAccount
& '.\Update-VM-Tags - Enhanced.ps1'
'.\Update-VM-Tags - Enhanced.ps1'
.\Update-VM-Tags - Enhanced.ps1
& '.\Update-VM-Tags - Enhanced.ps1'
 $vmRG = (Get-AzVm -name Ubuntu-VM).ResourceGroupName
Write-Host $vmRG.Name
Write-Host $vmRG
& '.\Update-VM-Tags - Enhanced.ps1'
$vmTags =  (Get-AzResource -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1).Tags
Write-Host $vmTags
$vmTags =  (Get-AzResource -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1).Tags
& '.\Update-VM-Tags - Enhanced.ps1'
foreach ($key in $vmTags.Keys) { `
Write-Host "Target ServiceName Tag: $key:Current Value: $($tags[$key])"`
}
$vmTags =  (Get-AzResource -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1).Tags
foreach ($key in $vmTags.Keys) { `
Write-Host "Target ServiceName Tag: $key:Current Value: $($tags[$key])"`
}
foreach ($key in $vmTags.Keys) { `
Write-Host "Target ServiceName Tag: $key:Current Value: $($vmTags[$key])"`
}
Write-Host $vmTags
& '.\Update-VM-Tags - Enhanced.ps1'
$vmName = (Get-AzVm -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1)
Write-Host $vmName
Write-Host $vmName.Name
$vmName = (Get-AzVm -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1).Name
Write-Host $vmName.Name
Write-Host $vmName
& '.\Update-VM-Tags - Enhanced.ps1'
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
& '.\Update-VM-Tags - Enhanced.ps1'
Write-Host $vmName.ReourceId
$vmName = (Get-AzVm -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1)
Write-Host $vmName.ReourceId
get-azresource ubuntu-vm
get-azresource -name ubuntu-vm
Write-Host $vmName.ReourceId
$vmName = get-azresource -name ubuntu-vm
Write-Host $vmName.ReourceId
Write-Host $vmName.ResourceId
$vmName = (Get-AzVm -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1)
Write-Host $vmName.ResourceId
& '.\Update-VM-Tags - Enhanced.ps1'
$vmResourceId = (get-azresource -name ubuntu-vm).ResourceId
Write-Host $vmResourceId
& '.\Update-VM-Tags - Enhanced.ps1'
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
& '.\Update-VM-Tags - Enhanced.ps1'
$vmTags =  (Get-AzResource -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1).Tags
Write-Host $vmTags
foreach ($key in $vmTags.Keys) { `
    Write-Host $key`
    Write-Host $($vmTags[$key])`
}
foreach ($key in $vmTags.Keys) { `
    Write-Host $key`
    Write-Host $vmTags[$key]`
}
foreach ($key in $vmTags.Keys) {Write-Host $vmTags[$key]}
foreach ($key in $vmTags) {Write-Host $vmTags[$key]}
write-host $vmTags
write-host $vmTags.provider
write-host $vmTags.requirement
write-host $vmTags."Availability Requirement"
foreach ($key in $vmTags) { `
    Write-Host $key`
    Write-Host $vmTags[$key]`
}
foreach ($key in $vmTags) { `
    Write-Host $key`
}
foreach ($key in $vmTags.Keys) { `
Write-Host "Target Tag: $key:Current Value: $($vmTags[$key])"`
}
$vmTags =  (Get-AzResource -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1).Tags
foreach ($key in $vmTags.Keys) { `
Write-Host "Target Tag: $key:Current Value: $($vmTags[$key])"`
}
$vmTags =  (Get-AzResource -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1)
Write-Host $vmTage
Write-Host $vmTags
Write-Host $vmTags.Tags
foreach($key in $vmTags){Write-Host $key}
foreach($key in $vmTags){Write-Host $key.Name}
Write-Host $vmTags.Tags.Count
Write-Host $vmTags.Keys
Write-Host $vmTags.Keys.Name
Write-Host $vmTags.Name
Write-Host $vmTags.Name.Keys
Write-Host $vmTags.Name.Tags
Write-Host $vmTags.Name.Tag
foreach ($key in $vmTags.Keys) { `
    Write-Host $key`
    Write-Host $($vmTags[$key])`
if($key -eq "providers"){`
            Write-Host "ServiceName tag already exists"`
Write-Host "Target ServiceName Tag: $key:Current Value: $($vmTags[$key])"`
}`
}
foreach ($key in $vmTags.Keys) { `
    Write-Host $key`
    Write-Host $($vmTags[$key])`
if($key -eq "provider"){`
            Write-Host "ServiceName tag already exists"`
Write-Host "Target ServiceName Tag: $key:Current Value: $($vmTags[$key])"`
}`
}
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
& '.\Update-VM-Tags - Enhanced.ps1'
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
& '.\Update-VM-Tags - Enhanced.ps1'
Write-Host $vmTags.Name
 Write-Host $vmTags.Name
 Write-Host $vmTags.Value
 Write-Host $vmTags.Propertties
 Write-Host $vmTags._$
 Write-Host $vmTags._
 Write-Host ($vmTags)._$
 Write-Host ($vmTags).*
 Write-Host ($vmTags).Names
 Write-Host ($vmTags).Name
 Write-Host $vmTags.Name.Tags
 Write-Host $vmTags.Name.Tag
 Write-Host $vmTags.Name.Array
 Write-Host $vmTags[]
 Write-Host $vmTags[0]
 Write-Host $vmTags[0].Value
 Write-Host $vmTags[0].ToString()
 Write-Host $vmTags[0].Name
 Write-Host $vmTags[0].Tag
 Write-Host $vmTags[0].Tags
 Write-Host $vmTags[1].Tags
 Write-Host $vmTags[2].Tags
& '.\Update-VM-Tags - Enhanced.ps1'
 Write-Host $vmTags[1].Tags
$vmTags = $vmTags[1].Tags
Write-Host $vmTags
history
$vmTags =  (Get-AzResource -ResourceGroupName HEL-CP-GATEWAYS -Name AzureMainGW1)
Write-Host $vmTags
$vmTags = $vmTags[1].Tags
Write-Host $vmTags
& '.\Update-VM-Tags - Enhanced.ps1'
$sleep_for = (Get-Random -Minimum 4500 -Maximum 7200); Write-Host "Sleeping for $sleep_for seconds..."; Start-Sleep -Seconds $sleep_for; .\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
$sleep_for = (Get-Random -Minimum 200 -Maximum 2200); Write-Host "Sleeping for $sleep_for seconds..."; Start-Sleep -Seconds $sleep_for; .\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
hostname
$sleep_for = (Get-Random -Minimum 200 -Maximum 2200); Write-Host "Sleeping for $sleep_for seconds..."; Start-Sleep -Seconds $sleep_for; .\WorkingDir\PowerShell\_PSWorkSpaceLauncher.ps1
$random_start = (Get-Random -Maximum 7200 -Minimum 1800; write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
$random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
cd .\WorkingDir\
ls
cd .\Projects\Azure-HITCH-Migration\AzureResourceInventory\
ls
cd .\Helpers\
hostname
cd ~\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\
cd .\Helpers\
 $random_start = (Get-Random -Maximum 7200 -Minimum 1800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
$random_start = (Get-Random -Maximum 5400 -Minimum 800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
cd .\Projects\Azure-HITCH-Migration\AzureResourceInventory\
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
ls
$random_start = (Get-Random -Maximum 5400 -Minimum 800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; & '.\ActivityOrchestrator.ps1'
$random_start = (Get-Random -Maximum 5400 -Minimum 800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityGenerator.ps1
$random_start = (Get-Random -Maximum 5400 -Minimum 800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
& '.\Update-VM-Tags - Enhanced.ps1'
& '.\Update-VM-Tags - Enhanced.ps1'
$random_start = (Get-Random -Maximum 5400 -Minimum 800); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 15400 -Minimum 8000); write-host "Going to sleep for $random_start seconds..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 5400 -Minimum 800); C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 - Seconds $random_start - Message "Waiting to launch Activity Orchestrator..." ; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 5400 -Minimum 800); powershell.exe -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 - Seconds $random_start - Message "Waiting to launch Activity Orchestrator..." ; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'powershell'
$random_start = (Get-Random -Maximum 5400 -Minimum 800); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 - Seconds $random_start - Message "Waiting to launch Activity Orchestrator..." ; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = 200
 powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 - Seconds $random_start - Message "Waiting to launch Activity Orchestrator..."
 powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 - Seconds $random_start -Message "Waiting to launch Activity Orchestrator..."
 powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start -Message "Waiting to launch Activity Orchestrator..."
$random_start = (Get-Random -Maximum 5400 -Minimum 800); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..." ; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 15400 -Minimum 8000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 15400 -Minimum 6800); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..." ; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
ls
cd .\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory
ls
cd .\Helpers\
ls
history
cat (Get-PSReadLineOption).HistorySavePath
ls
az login
Connect-AzAccount
.\AzureUsageAndConsumptionCosts_PSQueries.ps1
az
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
az
choco
choco search az
choco install azure-cli 
az
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
az login
.\AzureUsageAndConsumptionCosts_PSQueries.ps1
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'xlsx'
$random_start = (Get-Random -Maximum 15400 -Minimum 8000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 10400 -Minimum 1800); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..." ; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
$random_start = (Get-Random -Maximum 10400 -Minimum 1800); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..." ; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\Helpers\
ls
& '.\Update-VM-Tags - Enhanced.ps1'
ls
cd ..
ls .\ARI\
cd .\ARI\
az login
.\AzureResourceInventory.ps1
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'AzureResourceInventory'
powershell.exe -ExecutionPolicy Bypass -File .\AzureResourceInventory.ps1 -SecurityCenter
choco install typora -y
hostname
choco uninstall typora
choco seach notable
choco search notable
choco install notable -y
choco uninstall notable -y
choco search laverna
choco search markably
$random_start = (Get-Random -Maximum 10400 -Minimum 1800); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..." ; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
winget
choco
choco update chocolatey
choco upgrade chocolatey
choco install graphviz
cd .\WorkingDir\Projects\
cd .\Azure-HITCH-Migration\
cd .\AzureResourceInventory\
CD .\AzViz\
cd .\AzViz\
ls
Import-Module .\AzViz.psm1
powershell.exe -ExecutionPolicy Bypass -File .\AzViz.psm1
Install-Module -Name AzViz -Scope CurrentUser -Repository PSGallery -Force
azviz
connect-azaccount
az
az group list -o table
az login
az group list -o table
Export-AzViz -ResourceGroup HEL-WVDesktop-RG -Theme light -OutputFormat png
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\ARI-V3\
ls
history | Select-String -Pattern 'AzureResourceInventory.ps1'
history | Select-String -Pattern 'AzureResourceInventory'
az group list
az account show
/>./AzureResourceInventory.ps1 -TenantID cdf709af-1a18-4c74-bd93-6d14a64d73b3 -SubscriptionID d0e6f74b-b854-4c52-9ad2-4b5606b58335 -SecurityCenter -ResourceGroup HEL-WVDesktop-RG
./AzureResourceInventory.ps1 -TenantID cdf709af-1a18-4c74-bd93-6d14a64d73b3 -SubscriptionID d0e6f74b-b854-4c52-9ad2-4b5606b58335 -SecurityCenter -ResourceGroup HEL-WVDesktop-RG
 powershell.exe -ExecutionPolicy Bypass -File ./AzureResourceInventory.ps1 -TenantID cdf709af-1a18-4c74-bd93-6d14a64d73b3 -SubscriptionID d0e6f74b-b854-4c52-9ad2-4b5606b58335 -SecurityCenter -ResourceGroup HEL-WVDesktop-RG
 powershell.exe -ExecutionPolicy Bypass -File ./AzureResourceInventory.ps1 -SubscriptionID d0e6f74b-b854-4c52-9ad2-4b5606b58335
az vault list -o table
az keyvault list -o table
az keyvault secret list -vaultname InfraCloudOpsKeyVault -o table
az keyvault secret list -vault-name InfraCloudOpsKeyVault -o table
az keyvault secret list --vault-name InfraCloudOpsKeyVault -o table
az keyvault secret list --vault-name InfraCloudOpsKeyVault -o csv
az keyvault secret list --vault-name InfraCloudOpsKeyVault -o tsv
az login
az account set --subscription "HITCH - Production"
az account list -o table
 powershell.exe -ExecutionPolicy Bypass -File ./AzureResourceInventory.ps1 -SubscriptionID d0e6f74b-b854-4c52-9ad2-4b5606b58335
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\ARI-V3\
 powershell.exe -ExecutionPolicy Bypass -File ./AzureResourceInventory.ps1 -SubscriptionID d0e6f74b-b854-4c52-9ad2-4b5606b58335
ls -l
ls
cd .\WorkingDir\
la
ls
ls .\Azure\
ls .\Projects\
cd .\Projects\Azure-HITCH-Migration\
ls
cd .\AzureResourceInventory\ARI-V3\
az login
az account set --subscription "HITCH - Production"; az account list -o table
 powershell.exe -ExecutionPolicy Bypass -File ./AzureResourceInventory.ps1 -SubscriptionID d0e6f74b-b854-4c52-9ad2-4b5606b58335
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory\ARI-V3\
choco search storage
choco search storage | Select-String -Pattern 'explorer'
choco install AzureStorageExplorer -y
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cat (Get-PSReadLineOption).HistorySavePath
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'orchestrator'
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
choco search storage-explorer
choco install AzureStorageExplorer -y
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Projects\Azure-HITCH-Migration\AzureResourceInventory
ls
cd .\ARI-V3\
ls
dism 
DISM /add-capability
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
ping 
ping 10.81.1.7
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
Get-WindowsCapability -Name RSAT* -Online
hostname
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 10800 -Minimum 8000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
choco
choco upgrade choco
choco update choco -y
choco version
choco
choco search 7zip
choco install 7zip -y
az vm image list --output table
az vm image list --output table | Select-String -Pattern 'win10'
az vm image list --all --output table | Select-String -Pattern 'win10'
 az vm image list --all --publisher 'MicrosoftWindowsDesktop' --output table | Select-String -Pattern 'win10'
 az vm image list --publisher 'MicrosoftWindowsDesktop' --output table
 az vm image list --publisher 'MicrosoftWindowsDesktop' --all --output table
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
ls
az login
az account show -o table
.\vm-cleanup.ps1
ls
.\vm-cleanup.ps1
powershell.exe -ExecucutionPolicy Bypass -File .\vm-cleanup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
Install-Module -Name Az
Install-Module -Name Az -AllowClobber -Force
cls
Update-AzWvdSessionHost -HostPoolName DEV_Productivity_Device_Profile -Name hel-dev-ops-5.dfid.gov.uk -ResourceGroupName HEL-WVDesktop -AssignedUser dc-elsdon@dfid.gov.uk
Update-AzWvdSessionHost -HostPoolName DEV_Productivity_Device_Profile -Name hel-dev-ops-5.dfid.gov.uk -ResourceGroupName HEL-WVDesktop-RG -AssignedUser dc-elsdon@dfid.gov.uk
.\vm-cleanup.ps1
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
Get-AzAccount
.\vm-cleanup.ps1$vm = Get-AzVm -Name hel-dev-ops-9
$vm = Get-AzVm -Name hel-dev-ops-9
Write-Host $vm
.\vm-cleanup.ps1$vm = Get-AzVm -Name hel-dev-ops-9.Name
Write-Host $vm.Name
.\vm-cleanup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
Import-Module Az
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Install-Module -Name Az -Repository PSGallery -Force; Update-Module -Name Az -Force; Connect-AzAccount
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
.\vm-cleanup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 4400 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 4400 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 4400 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
(Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL").SecretValueText
(Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL").SecretValue.AsPlainTest
(Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL").SecretValue.AsPlainText
$win10URL = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL").SecretValueText
Write-Host $win10URL
$win10URL = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL" -AsPlainText)
Write-Host $win10URL
$installScript = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBDEVCore-InstallerScriptURL" -AsPlainText)
Write-Host $InformationPreference
Write-Host $installScript
$installScript = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBDEVCore-InstallerScriptURL" -AsPlainText)
Write-Host $installScript
$installScript = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBDEVCore-AppInstallerURL" -AsPlainText)
Write-Host $installScript
$installScript = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBDEVCore-AppInstallerScriptURL" -AsPlainText)
Write-Host $installScript
Write-Host (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBDEVCore-ArchiveURL" -AsPlainText)
Write-Host (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL" -AsPlainText)
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles
.\aib-build-orchestartor.ps1 -BuildLabel "AiBDEVCoreProfile" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "AiBDEVCoreProfile" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
Write-Host $Win10Url = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL" -AsPlainText)
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "AiBDEVCoreProfile" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
$random_start = (Get-Random -Maximum 4400 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
Invoke-WebRequest -uri https://aibsoftwarestore.blob.core.windows.net/coresoftwarerepo/Core_DEV_Apps.zip?sp=r&st=2023-08-21T07:39:33Z&se=2023-08-21T15:39:33Z&sv=2022-11-02&sr=b&sig=eKYLGoJ4eacD5s1IObk7wC8npaRyargmWYTiJIIrZiU%3D
Invoke-WebRequest -uri https://aibsoftwarestore.blob.core.windows.net/coresoftwarerepo/Core_DEV_Apps.zip?sp=r&st=2023-08-21T07:39:33Z&se=2023-08-21T15:39:33Z&sv=2022-11-02&sr=b&sig=eKYLGoJ4eacD5s1IObk7wC8npaRyargmWYTiJIIrZiU%3D -UseBasicParsing
Invoke-WebRequest -Uri sp=r&st=2023-08-21T08:00:27Z&se=2023-08-21T16:00:27Z&sv=2022-11-02&sr=b&sig=zkUxgxKupq3ljiac%2FNU6Kbh1HAm3rLfRAWRnRlpZa%2FY%3D -UseBasicParsing
Write-Host $Win10Url = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL" -AsPlainText)
Invoke-WebRequest -Uri https://aibsoftwarestore.blob.core.windows.net/templates/win10-devcoreapps-template.json?sp=r&st=2023-08-21T08:23:06Z&se=2023-08-21T16:23:06Z&sv=2022-11-02&sr=b&sig=5voCitEaSVkPULVtU4pU5XvbEYoHT7RZjd6AXaoaSR8%3D -UseBasicParsing
Invoke-WebRequest -Uri https://aibsoftwarestore.blob.core.windows.net/templates/win10-devcoreapps-template.json -UseBasicParsing
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "AiBDEVCoreProfile" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
Write-Host $Win10Url = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10DEVCore-TemplateURL" -AsPlainText)
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "AiBDEVCoreProfile" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
Write-Host "'aibWin10DEVCore-20230821-1210-wvd-AiBDEVCoreProfil".Length
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
install module Az Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
hostname
Install-Module -Name Az -Repository PSGallery -Force
Update-Module -Name Az -Force
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
az login
Connect-AzAccount
& $profile
$random_start = (Get-Random -Maximum 10800 -Minimum 8000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
whoami
cls
cd .\WorkingDir\
ls
cd .\Azure\
ls
cs .\cloud-ops-poc\
ls
cd .\cloud-ops-poc\
ls
ls .\ukwest\prod\
cd .\ukwest\prod\
cd .\azure-image-builder\
ls
cd ..\azure-image-builder\
cd ..\wvdesktop\
ls
ls .\scripts\
cd .\scripts\vm-management\
ls
cd .\vm-cleanup\
ls
.\vm-cleanup.ps1
history
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
$random_start = (Get-Random -Maximum 10800 -Minimum 8000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 4400 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
install-module -Name Az.AzureImageBuilder -AllowClobber -Force
Install-Module -Name Az.ImageBuilder
Get-Azureimagebuildertemplate
$random_start = (Get-Random -Maximum 4400 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
Install-Module -name 'Az.ImageBuilder' -AllowPrerelease
Install-Module -name 'Az.ImageBuilder' -AllowClobber -Force
Get-Azureimagebuildertemplate
$random_start = (Get-Random -Maximum 10800 -Minimum 8000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 4400 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd .\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\#
cd .\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\
ls
cd .\artifacts\
ls
cd .\DEV_Device_Profiles\
ls
Get-Azureimagebuildertemplate
Get-AzImageBuilderTemplate
.\aib-build-orchestartor.ps1
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
az login
Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
az image builder list -g hel-wvdesktop-rg
az image builder list -g hel-wvdesktop-rg -o table
$random_start = (Get-Random -Maximum 4400 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 6400 -Minimum 3000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd .\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\
cd .\artifacts\DEV_Device_Profiles\
ls
az login; Start-Sleep -Seconds 10; Connect-AzAccount
.\aib-build-orchestartor.ps1
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
$subscriptionID = (Get-AzContext).Subscription.Id
Write-Host $subscriptionID
Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName
Get-AzImageBuilderTemplate -ResourceGroupName "HEL-AzureImageBuilder-RG" -Name "imageTemplateWin10SingleDEVCore-20230822-0914"
Get-AzImageBuilderTemplate -ResourceGroupName "HEL-AzureImageBuilder-RG" -Name "imageTemplateWin10SingleDEVCore-20230822-0914-wvd-DEVCore"
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
histoty
history
cat (Get-PSReadLineOption).HistorySavePath
Get-AzImageBuilderTemplate -ResourceGroupName "HEL-AzureImageBuilder-RG" -Name "imgTPL-Win10SingleDEVCore-20230822-0957-wvd-DEVCore"
$random_start = (Get-Random -Maximum 6400 -Minimum 3000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
Get-AzImageBuilderTemplate -ResourceGroupName "HEL-AzureImageBuilder-RG" -Name "imgTPL-Win10SingleDEVCore-20230822-0957-wvd-DEVCore" | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
cd .\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\
ls
cd .\artifacts\DEV_Device_Profiles\
ls .\status-checks\
powershell.exe -ExecutionPolicy Bypass -File .\status-checks\auth-setup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\status-checks\get-image-build-distribution-properties.ps1
$random_start = (Get-Random -Maximum 9400 -Minimum 6000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd ..
ls
cd ..
ls
cat (Get-PSReadLineOption).HistorySavePath
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.1.0" -BuildProperties "Win10, Single-User, DEV Core"
cd .\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\
ls
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.1.0" -BuildProperties "Win10, Single-User, DEV Core"
$QualysAgentInstallerSas = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBQualysSoftwareArchiveURL" -AsPlainText)
Import-Module Az.KeyVault
az login
$QualysAgentInstallerSas = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBQualysSoftwareArchiveURL" -AsPlainText)
$archiveSas = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBDEVCore-ArchiveURL" -AsPlainText)
Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.1.0" -BuildProperties "Win10, Single-User, DEV Core"
$random_start = (Get-Random -Maximum 9400 -Minimum 6000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
Get-AzImageBuilderTemplate -ResourceGroupName "HEL-AzureImageBuilder-RG" -Name "imageTemplateWin10SingleDEVCore-20230822-0914-wvd-DEVCore"
Get-AzImageBuilderTemplate -ResourceGroupName "HEL-AzureImageBuilder-RG" -Name "imageTemplateWin10SingleDEVCore-20230822-0914-wvd-DEVCore" | | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
Get-AzImageBuilderTemplate -ResourceGroupName "HEL-AzureImageBuilder-RG" -Name "imageTemplateWin10SingleDEVCore-20230822-0914-wvd-DEVCore" | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
cd .\artifacts\DEV_Device_Profiles\
ls
cd .\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\status-checks\
cd ..\artifacts\DEV_Device_Profiles\
ls .\status-checks\
.\status-checks\auth-setup.ps1
powershell.exe -ExecutioPolicy Bypass -File .\status-checks\auth-setup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\status-checks\auth-setup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\status-checks\get-image-build-distribution-properties.ps1
az login
az account show -o table
powershell.exe -ExecutionPolicy Bypass -File .\status-checks\get-image-build-distribution-properties.ps1
powershell.exe -ExecutionPolicy Bypass -File .\status-checks\get-image-build-status.ps1
$imageTemplateName = "imgTPL-Win10SingleDEVCore-20230822-1347-wvd-DEVCore"
Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
$imageResourceGroup = "HEL-AzureImageBuilder-RG"
Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
az image builder show --name $imageTemplateName  --resource-group $imageResourceGroup
az image builder show --name $imageTemplateName  --resource-group $imageResourceGroup -o table
az image builder show --name $imageTemplateName  --resource-group $imageResourceGroup -o tsv
az image builder show --name $imageTemplateName  --resource-group $imageResourceGroup -o list
az image builder show --name $imageTemplateName  --resource-group $imageResourceGroup
Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName
Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
$random_start = (Get-Random -Maximum 9400 -Minimum 6000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
for($r=0;$r -le 100;$r += 1;){$random = Get-Random -Maximum 20 -Minimum 5;Start-Sleep -Seconds $random;  Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage;$random = Get-Random -Maximum 20 -Minimum 5; Start-Sleep -Seconds $random;} 
for ($r = 0;$r -le 100;$r += 1;){$random = Get-Random -Maximum 20 -Minimum 5;Start-Sleep -Seconds $random;  Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage;$random = Get-Random -Maximum 20 -Minimum 5; Start-Sleep -Seconds $random;} 
 for ($r = 0;$r -le 100;$r += 1){$random = Get-Random -Maximum 20 -Minimum 5;Start-Sleep -Seconds $random;  Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage;$random = Get-Random -Maximum 20 -Minimum 5; Start-Sleep -Seconds $random;}
 for ($r = 0;$r -le 100;$r += 1){$random = Get-Random -Maximum 20 -Minimum 5; Write-Host "Waiting for $random seconds..."; Start-Sleep -Seconds $random;  Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage;$random = Get-Random -Maximum 20 -Minimum 5; Write-Host "Waiting for $random seconds...";Start-Sleep -Seconds $random;}
powershell.exe -ExecutionPolicy Bypass -File .\aib-generic-build-orchestartor.ps1 -BuildLabel "DEVTest" -SiGVersion "1.1.0" -BuildProperties "Win10, Single-User, DEV Core"
cd ..\.\\
cd ..
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\buildArtifacts
ls
Compress-Archive .\Core_DEV_Apps .\Core_DEV_Apps.zip
Expand-Archive .\Core_DEV_Apps.zip .\Core_DEV_Apps
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.0" -BuildProperties "Win10, Single-User, DEV Core"
cat (Get-PSReadLineOption).HistorySavePath
powershell.exe -ExecutionPolicy Bypass -File .\aib-generic-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.1" -BuildProperties "Win10, Single-User, DEV Core"
az login; start-sleep 5; Connect-AzAccount
az account show -o table
powershell.exe -ExecutionPolicy Bypass -File .\aib-generic-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.1" -BuildProperties "Win10, Single-User, DEV Core"
az image builder show --name $imageTemplateName  --resource-group $imageResourceGroup -o list
az image builder show --name $imageTemplateName  --resource-group $imageResourceGroup 
$imageTemplateName = "imgTPL-Win10SingleDEVCore-20230822-1613-wvd-DEVCore"
$imageResourceGroup = "HEL-AzureImageBuilder-RG"
Get-AzImageBuilderTemplate -ResourceGroupName $imageResourceGroup -Name $imageTemplateName | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
powershell.exe -ExecutionPolicy Bypass -File .\aib-generic-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.1" -BuildProperties "Win10, Single-User, DEV Core"
 powershell.exe -ExecutionPolicy Bypass -File .\aib-generic-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.1" -BuildProperties "Win10, Single-User, DEV Core"
Write-Host api-version
Write-Host $templateFilePath
 New-AzResourceGroupDeployment -Name "aiBGenericBuildTest" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile "C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\template\win10-generic-no-customizer-template-20230822-1708-wvd-DEVCore.json" -api-version "2019-05-01-preview" -imageTemplateName "aiBGenericBuildTest" -svclocation "ukwest"
 New-AzResourceGroupDeployment -Name "aiBGenericBuildTest" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile "C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\template\win10-generic-no-customizer-template-20230822-1708-wvd-DEVCore.json" -imageTemplateName "aiBGenericBuildTest" -svclocation "ukwest"
ls
New-AzResourceGroupDeployment -Name "aiBGenericBuildTest" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile ".\win10-template-20230822-1708.json" -api-version "2019-05-01-preview" -imageTemplateName "aiBGenericBuildTest" -svclocation "ukwest"
New-AzResourceGroupDeployment -Name "aiBGenericBuildTest" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile ".\win10-template-20230822-1708.json" -imageTemplateName "aiBGenericBuildTest"
New-AzResourceGroupDeployment -Name "aiBGenericBuildTest" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile ".\win10-template-20230822-1708.json"
New-AzResourceGroupDeployment -Name "aiBGenericBuildTest" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile "win10-template-20230822-1708.json"
New-AzResourceGroupDeployment -Name "aiBGenericBuildTest" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile "win10-template-20230822-1708.json" -imageTemplateName "aibGenericBuildTest"
New-AzResourceGroupDeployment -Name "aiBGenericBuildTest" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile ".\win10-template-20230822-1708.json" -api-version "2019-05-01-preview" -imageTemplateName "aiBGenericBuildTest" -svclocation "ukwest"
Get-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "aiBGenericBuildTest" | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
Start-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "aiBGenericBuildTest"
$random_start = (Get-Random -Maximum 9400 -Minimum 6000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$random_start = (Get-Random -Maximum 900 -Minimum 400); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd .\WorkingDir\
ls
cd .\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
powershell.exe -ExecutionPolicy Bypass -File .\aib-generic-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.2" -BuildProperties "Win10, Single-User, Download Artifacts Only"
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.2" -BuildProperties "Win10, Single-User, Download Artifacts Only"
az login; start-sleep 5; Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.2" -BuildProperties "Win10, Single-User, Download Artifacts Only"
$random_start = (Get-Random -Maximum 900 -Minimum 400); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, Install FSLogix Only"
cd .\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
cd WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
Expand-Archive .\buildArtifacts\Core_DEV_Apps.zip .\buildArtifacts\Core_DEV_Apps
Compress-Archive .\buildArtifacts\Core_DEV_Apps\* .\buildArtifacts\Core_DEV_Apps.zip
Compress-Archive .\buildArtifacts\Core_DEV_Apps\*.* .\buildArtifacts\Core_DEV_Apps.zip
Compress-Archive .\buildArtifacts\_Core_DEV_Apps\*.* .\buildArtifacts\Core_DEV_Apps.zip
Expand-Archive .\buildArtifacts\Core_DEV_Apps.zip .\buildArtifacts\Core_DEV_Apps
Compress-Archive .\buildArtifacts\_Core_DEV_Apps\* .\buildArtifacts\Core_DEV_Apps.zip
Expand-Archive .\buildArtifacts\Core_DEV_Apps.zip .\buildArtifacts\Core_DEV_Apps
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
az login
az login; Connect-AzAccount
.\vm-cleanup.ps1
 powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, Install FSLogix Only"
cat (Get-PSReadLineOption).HistorySavePath
cd
cd ..\..\..
cd ..\azure-image-builder\
ls
ls .\artifacts\
ls .\artifacts\DEV_Device_Profiles\
cd# .\artifacts\DEV_Device_Profiles\
cd .\artifacts\DEV_Device_Profiles\
ls
Connect-AzAccount
New-AzResourceGroupDeployment -Name "AiBFSLogixOnlyBuildTestv1.0.3" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile ".\win10-devcoreapps-template-20230823-0702-wvd-DEVCore.json" -api-version "2022-07-01" -imageTemplateName "AiBFSLogixOnlyBuildTestv1.0.3" -svclocation "ukwest"
Get-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3" | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
start-sleep -Seconds 300; Start-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3"
$random_start = (Get-Random -Maximum 900 -Minimum 400); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
Start-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3"
Start-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3"
start-sleep -Seconds 360; Start-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3"
Start-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3"
Start-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3"
Remove-AzResourceGroupDeployment -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3"
New-AzResourceGroupDeployment -Name "AiBFSLogixOnlyBuildTestv1.0.3" -ResourceGroupName "hel-azureimagebuilder-rg" -TemplateFile ".\win10-devcoreapps-template-20230823-0702-wvd-DEVCore.json" -api-version "2022-07-01" -imageTemplateName "AiBFSLogixOnlyBuildTestv1.0.3" -svclocation "ukwest"
Get-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3" | Select-Object -Property Name, LastRunStatusRunState, LastRunStatusMessage, ProvisioningState, ProvisioningErrorMessage
Start-AzImageBuilderTemplate -ResourceGroupName "hel-azureimagebuilder-rg" -Name "AiBFSLogixOnlyBuildTestv1.0.3"
az logon; start-sleep 5; Connect-AzAccount
az login
cat (Get-PSReadLineOption).HistorySavePath
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\
ls
ls \\
ls c:\\
ls
.\aib-customizer-apps-only.ps1
 powershell.exe -ExecutionPolicy Bypass -File .\aib-customizer-apps-only.ps1
cd .\artifacts\DEV_Device_Profiles\
ls
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, Install FSLogix Only"
Install-Module az -AllowClobber -Force
update-Module az
 . $profile
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, Install FSLogix Only"
az login; start-sleep 5; Connect-AzAccount
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, Install FSLogix Only"
 C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
cd  C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
 az login; start-sleep 5; Connect-AzAccount
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, Install FSLogix Only"
Install-Module -Name Az.ImageBuilder
. $profile
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, Install FSLogix Only"
cd  C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
$random_start = (Get-Random -Maximum 6900 -Minimum 1400); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
 az login; start-sleep 5; Connect-AzAccount
ls
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.2" -BuildProperties "Win10, Single-User, FSLogix Install Only"
 az login; start-sleep 5; Connect-AzAccount
 C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
cd  C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
az login
cd .\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\
ls
CD .\wvdesktop\
ls
ls .\scripts\
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\Deployment-ScalingPlan-UK
ls
$templateFile = "{provide-the-path-to-the-template-file}"
$templateFile = .\deployment.json
$templateFile = ".\deployment.json"
New-AzResourceGroupDeployment -Name
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
ls ..\
hostname
choco version
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco search terminal, notepadplusplus
choco search terminal
choco install microsoft-windows-terminal -y; choco install notepadplusplus -y
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
install-module -Name Az -AllowClobber -Force
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
$PSVersionTable.PSVersion
Get-Module -Name AzureRM -ListAvailable
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Repository PSGallery -Force; Update-Module -Name Az -Force
Connect-AzAccount; az login
choco search azure-cli
choco install azure-cli -y
az login
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
$PSVersionTable.PSVersion
az login
az account show -o table
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
Connect-AzAccount; az login
az account show -o table
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
Get-AzImageBuilderTemplate
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
Get-AzImageBuilderTemplate
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
Install-Module -Name AzPreview -Repository PSGallery -Force
Install-Module -Name AzureRm -Repository PSGallery -Force
Install-Module -Name AzureRm -Repository PSGallery -Force -AllowClobber
Get-AzImageBuilderTemplate
az login; Connect-AzAccount
Get-AzImageBuilderTemplate
Install-Module -Name Az.AzureImageBuilder -Repository PSGallery -Force -AllowClobber
Install-Module -Name Az.ImageBuilder -Repository PSGallery -Force -AllowClobber
Get-AzImageBuilderTemplate
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "1.0.3" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
az login
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
.\vm-cleanup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
$defaultHostPoolToken = az keyvault secret show --name "WVDesktopDEVPoolToken" --vault-name "InfraCloudOpsKeyVault" --query "value"
Write-Host $defaultHostPoolToken
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
ls
cd .\arm-templates\add-vms-to-host-pool\latest_updated\
ls
az login;Connect-AzAccount
 powershell.exe -ExecutionPolicy Bypass -File .\advmtohostpool_orchestrator.ps1 -DeploymentName "AVDHostProvisioner" -InitialNumber 0 -SiGImageVersion "2.0.0"
Get-AzVMImagePublisher
Get-AzVMImagePublisher | Select-String -Pattern 'windows-10'
Get-AzVMImagePublisher -Location "ukwest" | Select-String -Pattern 'windows'
Get-AzVMImagePublisher -Location "ukwest" | Select-String -Pattern 'microsoft'
 powershell.exe -ExecutionPolicy Bypass -File .\advmtohostpool_orchestrator.ps1 -DeploymentName "AVDHostProvisioner" -InitialNumber 0 -SiGImageVersion "2.0.0"
 powershell.exe -ExecutionPolicy Bypass -File .\advmtohostpool_orchestrator.ps1 -DeploymentName "AVDDEVProfile" -InitialNumber 0 -SiGImageVersion "2.0.0"
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\arm-templates\add-vms-to-host-pool\latest_updated\
az login;Connect-AzAccount
 powershell.exe -ExecutionPolicy Bypass -File .\advmtohostpool_orchestrator.ps1 -DeploymentName "AVDDEVProfile" -InitialNumber 0 -SiGImageVersion "2.0.0"
 powershell.exe -ExecutionPolicy Bypass -File .\advmtohostpool_orchestrator.ps1 -DeploymentName "DEVProfile" -InitialNumber 0 -SiGImageVersion "2.0.0"
$random_start = (Get-Random -Maximum 900 -Minimum 400); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
 powershell.exe -ExecutionPolicy Bypass -File .\advmtohostpool_orchestrator.ps1 -DeploymentName "DEVProfile" -InitialNumber 0 -SiGImageVersion "2.0.0"
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
 powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
hostname
ls
az login;Connect-AzAccount
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "2.0.1" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys"
$random_start = (Get-Random -Maximum 900 -Minimum 400); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$Cred = Get-Credential
$ArtifactId = (Get-AzImageBuilderRunOutput -ImageTemplateName $imageTemplateName -ResourceGroupName $imageResourceGroup).ArtifactId
hostname
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles
$random_start = (Get-Random -Maximum 900 -Minimum 400); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd .\arm-templates\add-vms-to-host-pool\latest_updated\
az login; Connect-AzAccount
 powershell.exe -ExecutionPolicy Bypass -File .\advmtohostpool_orchestrator.ps1 -DeploymentName "DEVProfile" -InitialNumber 0 -SiGImageVersion "2.0.1" -
 powershell.exe -ExecutionPolicy Bypass -File .\addvmtohostpool_orchestrator.ps1 -DeploymentName "DEVProfile" -InitialNumber 0 -SiGImageVersion "2.0.1" -
 powershell.exe -ExecutionPolicy Bypass -File .\addvmtohostpool_orchestrator.ps1 -DeploymentName "DEVProfile" -InitialNumber 0 -SiGImageVersion "2.0.1"
hostname
 powershell.exe -ExecutionPolicy Bypass -File .\addvmtohostpool_orchestrator.ps1 -DeploymentName "DEVProfile" -InitialNumber 0 -SiGImageVersion "2.0.1"
$random_start = (Get-Random -Maximum 2000 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
mstsc /v:10.81.1.4
$random_start = (Get-Random -Maximum 2000 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
Invoke-WebRequest -Uri https://qagpublic.qg1.apps.qualys.co.uk/
Invoke-WebRequest -Uri qagpublic.qg1.apps.qualys.co.uk
Invoke-WebRequest -Uri https://qagpublic.qg1.apps.qualys.co.uk/CloudAgent
ls
 powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "DEVCore" -SiGVersion "2.0.2" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys (non-running mode)"
$random_start = (Get-Random -Maximum 2000 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
mstsc /v:10.81.1.4
$random_start = (Get-Random -Maximum 2000 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\scripts\vm-management\set-update-performancediagnostics
ls
 powershell.exe -ExecutionPolicy Bypass -File .\create-diagnostic-configuration-file.ps1
rm *xil
ls
 powershell.exe -ExecutionPolicy Bypass -File .\create-diagnostic-configuration-file.ps1
az login; Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\set-update-performancediagnostics.ps1 -ResourceGroupName "HEL-WVDesktop-RG" -StorageAccountName "wvdservicediagnostics"  -StorageAccountKey "anA3AB1RPVvaSJgOf18rh7g4wiYpqq+F8aGbQCjDddiwJ/Veya+9leQSZcVSeiXqVtbAkDVTimH27X3H8D8CSg=="
az login; Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\set-update-performancediagnostics.ps1 -ResourceGroupName "HEL-WVDesktop-RG" -StorageAccountName "wvdservicediagnostics"  -StorageAccountKey "anA3AB1RPVvaSJgOf18rh7g4wiYpqq+F8aGbQCjDddiwJ/Veya+9leQSZcVSeiXqVtbAkDVTimH27X3H8D8CSg=="
start-sleep -Seconds 120;powershell.exe -ExecutionPolicy Bypass -File .\set-update-performancediagnostics.ps1 -ResourceGroupName "HEL-WVDesktop-RG" -StorageAccountName "wvdservicediagnostics"  -StorageAccountKey "anA3AB1RPVvaSJgOf18rh7g4wiYpqq+F8aGbQCjDddiwJ/Veya+9leQSZcVSeiXqVtbAkDVTimH27X3H8D8CSg=="
start-sleep -Seconds 120;powershell.exe -ExecutionPolicy Bypass -File .\set-update-performancediagnostics.ps1 -ResourceGroupName "HEL-WVDesktop-RG" -StorageAccountName "wvdservicediagnostics"  -StorageAccountKey "anA3AB1RPVvaSJgOf18rh7g4wiYpqq+F8aGbQCjDddiwJ/Veya+9leQSZcVSeiXqVtbAkDVTimH27X3H8D8CSg==";cd ..; powershell.exe -ExecutionPolicy Bypass -File .\set-update-boootdiagnostics.ps1
ls
powershell.exe -ExecutionPolicy Bypass -File .\set-update-bootdiagnostics.ps1
powershell.exe -ExecutionPolicy Bypass -File .\set-update-bootdiagnostics.ps1 -ResourceGroupName "HEL-WVDesktop-RG" -StorageAccountName "wvdservicediagnostics"
Update-AzFunctionAppSetting -Name StartStopWVDSessionHosts-DEV_Device_Profile_Dhaka -ResourceGroupName hel-wvdesktop-rg -AppSetting @{"AzureWebJobs.QueueTrigger.Disabled" = "true"}
Update-AzFunctionAppSetting -Name StartStopWVDSessionHosts -ResourceGroupName hel-wvdesktop-rg -AppSetting @{"AzureWebJobs.QueueTrigger.Disabled" = "true"}
Update-AzFunctionAppSetting -Name StartStopWVDSessionHosts -ResourceGroupName hel-wvdesktop-rg -AppSetting @{"AzureWebJobs.QueueTrigger.Disabled" = "true"} -o table
Update-AzFunctionAppSetting -Name StartStopWVDSessionHosts -ResourceGroupName hel-wvdesktop-rg -AppSetting @{"AzureWebJobs.StartStopWVDSessionHosts-DEV_Device_Profile_Dhaka.Disabled" = "true"}
powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\DEV_Device_Profiles\scripts\AutoScale\EnableFunctionApps.ps1
powershell.exe -command "&{If ((Get-WmiObject -class win32_optionalfeature | Where-Object { $_.Name -eq 'RemoteServerAdministrationTools'}) -ne $null) {Exit 0} else {If ((Get-Module -Name ActiveDirectory -ListAvailable) -ne $null) {Exit 0} else {Exit 1}}}"
If ((Get-WmiObject -class win32_optionalfeature | Where-Object { $_.Name -eq 'RemoteServerAdministrationTools'}) -ne $null) {Exit 0} else {If ((Get-Module -Name ActiveDirectory -ListAvailable) -ne $null) {Exit 0} else {Exit 1}}
exit
powershell.exe -command "&{If ((Get-WmiObject -class win32_optionalfeature | Where-Object { $_.Name -eq 'RemoteServerAdministrationTools'}) -ne $null) {Exit 0} else {If ((Get-Module -Name ActiveDirectory -ListAvailable) -ne $null) {Exit 0} else {Exit 1}}}"
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State
$getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State
Write-Host $getAvailableRSATTools.Count
$getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Select-Object $getAvailableRSATTools.State
$getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Select-Object -Property State
Write-Host $getAvailableRSATTools.Count
$getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | | Where-Object { $_.State -eq "Not Present" }
$getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Where-Object { $_.State -eq "Not Present" }
Write-Host $getAvailableRSATTools.Count
$getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Where-Object { $_.State -eq "NotPresent" }
Write-Host $getAvailableRSATTools.Count
$getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Where-Object { $_.State -eq "Present" }
Write-Host $getAvailableRSATTools.Count
 $getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Where-Object { $_.State -eq "Present" }
 if($getAvailableRSATTools.Count -gt 0){`
    Write-Host "RSAT tools are installed! :-)"`
 }
 else(`
    Write-Host "RSAT tools are not installed :-("`
 )
 $getAvailableRSATTools = Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Where-Object { $_.State -eq "Present" }
 if($getAvailableRSATTools.Count -gt 0){`
    Write-Host "RSAT tools are installed! :-)"`
 }
 else{`
     Write-Host "RSAT tools are not installed :-("`
 }
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\PAW_Device_Profiles
powershell.exe -ExecutionPolicy Bypass -File .\Check-RSAT-Present.ps1
hostname
choco search 7zip
choco install 7zip -y
az login; Connect-AzAccount
$QualysAgentInstallerSas = (Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBQualysSoftwareArchiveURL" -AsPlainText)
$random_start = (Get-Random -Maximum 2000 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
choco search github
choco search gitkraken
choco install github-desktop -y; choco install gitkraken -y
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\helpers
az login; Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\GenerateBlobSASTokens.ps1
for %A IN ("%PATH:;=" "%") DO @ECHO=%~A | Find /I "Python"
for %A IN ("%PATH:;=" "%") DO @ECHO=%~A | Find /I "Python"
powershell.exe -ExecutionPolicy Bypass -File .\GenerateBlobSASTokens.ps1
az
$random_start = (Get-Random -Maximum 2000 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
powershell.exe -ExecutionPolicy Bypass -File .\GenerateBlobSASTokens.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\PAW_Device_Profiles
ls
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "PAWCore" -SiGVersion "0.1.0" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys (non-running mode). RSAT Tools"
(Get-AzKeyVaultSecret -VaultName "InfraCloudOpsKeyVault" -Name "AIBWin10PAWCore-TemplateURL" -AsPlainText)
Import-Module Az.KeyVault
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "PAWCore" -SiGVersion "0.1.0" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys (non-running mode). RSAT Tools"
az storage account list | Select-String -Pattern 'name' | Select-String -Pattern 'Standard_' -NotMatch | Select-String -Pattern ('avd','aib','547','hs9','pr6','rwy') -NotMatch; $array = $packerlogs_storage_account  -split(" "); $string = $array[$array.Length-1]; $packerlogs_storage_account_name = $string.Substring(1,$string.Length-'","'.Length); Write-Host "Packer Logs Storage Account Name: $packerlogs_storage_account_name"
az storage account list | Select-String -Pattern 'name' | Select-String -Pattern 'Standard_' -NotMatch | Select-String -Pattern ('hel*','hepp*','hedd*') -NotMatch; $array = $packerlogs_storage_account  -split(" "); $string = $array[$array.Length-1]; $packerlogs_storage_account_name = $string.Substring(1,$string.Length-'","'.Length); Write-Host "Packer Logs Storage Account Name: $packerlogs_storage_account_name"
az help storage
az goup list | Select-String -Pattern 'IT_'
az group list | Select-String -Pattern 'IT_'
az group list -o tsv| Select-String -Pattern 'IT_'
az group list -o table | Select-String -Pattern 'IT_'
$random_start = (Get-Random -Maximum 2000 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
$aib_resource_grps = az group list -o table | Select-String -Pattern 'IT_'
Write-Host $aib_resource_grps.Name
$aib_resource_grps = az group list -o tsv | Select-String -Pattern 'IT_'
Write-Host $aib_resource_grps
mstsc /v:10.81.1.57
start-sleep 300; az desktopvirtualization hostpool delete --force true --name "Dev_Productivity_Device_Profile" --resource-group "hel-wvdesktop-rg"; az desktopvirtualization hostpool delete --force true --name "Paw_Productivity_Device_Profile" --resource-group "hel-wvdesktop-rg"
mstsc /v:10.81.1.57
$random_start = (Get-Random -Maximum 2000 -Minimum 1000); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Detection";$random_start = (Get-Random -Maximum 2400 -Minimum 80); Clear-Host; powershell.exe -ExecutionPolicy Bypass -File C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\CountDownTimers\Start-CountDown.ps1 -Seconds $random_start  -Message "Waiting to launch Activity Orchestrator..."; start-sleep -Seconds $random_start; cd C:\Users\S-Khasenye.DFID\WorkingDir\PowerShell\ActivityGenerator.v2\; .\ActivityOrchestrator.ps1
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Where-Object { $_.State -eq "Installed" or $_.State -eq "Present" }
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Where-Object { $_.State -eq "Installed" -or $_.State -eq "Present" }
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State | Where-Object { $_.State -eq "Installed" -or $_.State -eq "NotPresent" }
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "PAWCore" -SiGVersion "0.2.0" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys (non-running mode). RSAT Tools"
cd
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\PAW_Device_Profiles
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "PAWCore" -SiGVersion "0.2.0" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys (non-running mode). RSAT Tools"
az storage account list | Select-String -Pattern 'name' | Select-String -Pattern 'Standard_' -NotMatch | Select-String -Pattern ('hel*','hepp*','hedd*') -NotMatch; $array = $packerlogs_storage_account  -split(" "); $string = $array[$array.Length-1]; $packerlogs_storage_account_name = $string.Substring(1,$string.Length-'","'.Length); Write-Host "Packer Logs Storage Account Name: $packerlogs_storage_account_name"
az group list --query "[?contains(name,'IT_imgTBL')].name"
az group list --query "[?contains(name,'IT_imgTPL')].name"
az login
az group list --query "[?contains(name,'IT_imgTPL')].name"
az group list -o table
$resGroups = az group list -o table | Select-Object -Property DisplayName, State | Where-Object { $_.Name -like "IT_HEL*" }
$resGroups = az group list -o table | Select-Object -Property Name | Where-Object { $_.Name -like "IT_HEL*" }
$resGroups = az group list -o table | Select-Object -Property Name | Where-Object { $_.Name -like "IT_HEL" }
$resGroups = az group list -o table | Select-Object -Property Name | Where-Object { $_.Name -contains "IT_HEL" }
Write-Host $resGroups
$resGroups = az group list -o table
Write-Host $resGroups
Write-Host $resGroups.Name
$resGroups = az group list -o table | Select-Object -Property Name
Write-Host $resGroups.Name
az group list --query "[?contains(name,'IT_HEL_')].name"
az group list --query "[?contains(name,'IT_HEL')].name"
Get-AzResourceGroup | ? ResourceGroupName -match $filter | Select-Object ResourceGroupName
Get-AzResourceGroup | ? ResourceGroupName -match 'IT_HEL | Select-Object ResourceGroupName'
Get-AzResourceGroup | ? ResourceGroupName -match 'IT_HEL' | Select-Object ResourceGroupName
az storage blob list
az storage account list
az storage account list -resourcegroup hel-wvdesktop-rg
az storage account list -resourcegroupname hel-wvdesktop-rg
az storage account list -g hel-wvdesktop-rg
$selectedResourceGroups = Get-AzResourceGroup | ? ResourceGroupName -match 'IT_HEL | Select-Object ResourceGroupName'
foreach($g in $selectedResourceGroups)`
{`
    az storage account list -g $g -o table`
}
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\PAW_Device_Profiles\status-checks
powershell.exe -ExecutionPolicy Bypass -File .\ReadPackerLogs.ps1
az storage account list -g hel-wvdesktop-rg
az storage account list -g hel-wvdesktop-rg -o table
powershell.exe -ExecutionPolicy Bypass -File .\ReadPackerLogs.ps1
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
az login; Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
history | Select-String -Pattern 'mstsc'
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'mstsc'
mstsc /v:10.81.1.4
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\PAW_Device_Profiles
ls
az login Connect-AzAccount
az login; Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "PAWCore" -SiGVersion "0.3.0" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys (non-running mode). RSAT Tools"
mstsc /v:10.81.1.4
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\azure-image-builder\artifacts\PAW_Device_Profiles
ls
az login; Connect-AzAccount
powershell.exe -ExecutionPolicy Bypass -File .\aib-build-orchestartor.ps1 -BuildLabel "PAWCore" -SiGVersion "0.4.0" -BuildProperties "Win10, Single-User, FSLogix, ZScaler, Qualys (non-running mode). RSAT Tools"
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management\vm-cleanup
powershell.exe -ExecutionPolicy Bypass -File .\vm-cleanup.ps1
mstsc /v:10.81.1.57
HOSTNAME.EXEn
hostname
gpmc
mmc
avdnettest.exe
iexplore
edge
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\
Invoke-WebRequest -Uri https://raw.githubusercontent.com/Azure/RDS-Templates/master/AVD-TestShortpath/avdnettest.exe
Invoke-WebRequest -Uri https://raw.githubusercontent.com/Azure/RDS-Templates/master/AVD-TestShortpath/avdnettest.exe -OutFile avdnettest.exe
.\avdnettest.exe
powershell.exe -ExecutionPolicy Bypass -File .\Test-Shortpath.ps1
mstsc /v:10.81.1.48
start-sleep -Seconds 100; mstsc /v:10.81.1.48
mstsc /v:10.81.1.50
mstsc /v:10.81.1.49
mstsc /v:10.81.1.48
cd C:\Users\S-Khasenye.DFID\WorkingDir\Azure\cloud-ops-poc\ukwest\prod\wvdesktop\scripts\vm-management
Invoke-Command -ComputerName hel-dev-dhk-0 -filepath .\Create-Remote-Local-Admin.ps1 -credential  $getcredential
ping hel-dev-dhk-0
Enable-PSRemoting -Force
Get-PSSessionConfiguration
$session = New-PSSession -ComputerName localhost -ConfigurationName PowerShell.7
Invoke-Command -Session $session -ScriptBlock { $PSVersionTable }
$session = New-PSSession -ComputerName localhost -ConfigurationName PowerShell
mstsc /v:10.81.1.48 /admin
mstsc /v:10.81.1.48
ping 10.81.1.48
mstsc /v:10.81.1.48
ls .\WorkingDir\PowerShell\
 .\WorkingDir\PowerShell\_PSHistory.ps1
code .\WorkingDir\PowerShell\_PSHistory.ps1
cat (Get-PSReadLineOption).HistorySavePath | Select-String -Pattern 'history'
Get-Date -Format "yyyyMMdd_HHmm"
code .\WorkingDir\PowerShell\_PSHistory\PSHistory.ps1
.\WorkingDir\PowerShell\_PSHistory\PSHistory.ps1
$timestamp = Get-Date -Format "yyyyMMdd_HHmm"
$historyfile = $timestamp"_PSHistory.ps1"
$timestamp = Get-Date -Format "yyyyMMdd_HHmm"
$historyfile = $timestamp + "_PSHistory.ps1"
Write-Host $historyfile
.\WorkingDir\PowerShell\_PSHistory\PSHistory.ps1
