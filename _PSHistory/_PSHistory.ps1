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
