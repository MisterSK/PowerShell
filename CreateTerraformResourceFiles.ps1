C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\modules\subscriptions\scripts
$files = Get-Content -Path "C:\Users\SanyaKhasenye\WorkingDir\Terraform\azurerm_resource_provisioning_list_sorted.txt"
ForEach ($file in $files) {
        $filename = "$file.tf"
        New-Item -Name $filename -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\terraform_azure_modules_noncafdevtest" -ItemType "file" | Out-Null
        New-Item -Name $file -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\terraform_azure_modules_noncafdevtest\modules" -ItemType "directory" | Out-Null
    } 