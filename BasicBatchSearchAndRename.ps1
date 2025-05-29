# $root_folder = Get-ChildItem -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_sub" -File | 
# $root_folder = Get-ChildItem -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub" -File |
# $root_folder = Get-ChildItem -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_idam_sub" -File |
# $root_folder = Get-ChildItem -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub" -File |
$root_path = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_hub_network_sub"
$root_folder = Get-ChildItem -Path "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_hub_network_sub" -File |
Foreach-Object {
    $current_file = $_.Name
    # $skip_array = @('.terraform.lock.hcl','production_sub.terraform.tfstate','production_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    # $skip_array = @('.terraform.lock.hcl','production_hub_network_sub.terraform.tfstate','production_hub_network_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    # $skip_array = @('.terraform.lock.hcl','production_idam_sub.terraform.tfstate','production_idam_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    $skip_array = @('.terraform.lock.hcl','production_management_sub.terraform.tfstate','production_management_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    'resource_group.tf','resource_group.auto.tfvars','key_vault.auto.tfvars','key_vault.tf','storage_account.tf','storage_account.auto.tfvars') `
    # 'virtual_network.auto.tfvars','virtual_network.tf')
    if ($skip_array.Contains($current_file)){
        Write-Host "Skipping $current_file ..."
    }
    else{
        if($current_file -notcontains ".disabled"){
            Write-Host "Renaming $current_file to $current_file.disabled ..."
            Rename-Item "$root_path\$current_file" "$root_path\$current_file.disabled"
        }
    }
}

$root_path = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_idam_sub"
$root_folder = Get-ChildItem -Path "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_idam_sub" -File |
Foreach-Object {
    $current_file = $_.Name
    # $skip_array = @('.terraform.lock.hcl','production_sub.terraform.tfstate','production_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    # $skip_array = @('.terraform.lock.hcl','production_hub_network_sub.terraform.tfstate','production_hub_network_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    # $skip_array = @('.terraform.lock.hcl','production_idam_sub.terraform.tfstate','production_idam_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    $skip_array = @('.terraform.lock.hcl','production_management_sub.terraform.tfstate','production_management_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    'resource_group.tf','resource_group.auto.tfvars','key_vault.auto.tfvars','key_vault.tf','storage_account.tf','storage_account.auto.tfvars') `
    # 'virtual_network.auto.tfvars','virtual_network.tf')
    if ($skip_array.Contains($current_file)){
        Write-Host "Skipping $current_file ..."
    }
    else{
        if($current_file -notcontains ".disabled"){
            Write-Host "Renaming $current_file to $current_file.disabled ..."
            Rename-Item "$root_path\$current_file" "$root_path\$current_file.disabled"
        }
    }
}

$root_path = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_management_sub"
$root_folder = Get-ChildItem -Path "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_management_sub" -File |
Foreach-Object {
    $current_file = $_.Name
    # $skip_array = @('.terraform.lock.hcl','production_sub.terraform.tfstate','production_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    # $skip_array = @('.terraform.lock.hcl','production_hub_network_sub.terraform.tfstate','production_hub_network_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    # $skip_array = @('.terraform.lock.hcl','production_idam_sub.terraform.tfstate','production_idam_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    $skip_array = @('.terraform.lock.hcl','production_management_sub.terraform.tfstate','production_management_sub.terraform.tfstate.backup','variables.tf','providers.tf', `
    'resource_group.tf','resource_group.auto.tfvars','key_vault.auto.tfvars','key_vault.tf','storage_account.tf','storage_account.auto.tfvars') `
    # 'virtual_network.auto.tfvars','virtual_network.tf')
    if ($skip_array.Contains($current_file)){
        Write-Host "Skipping $current_file ..."
    }
    else{
        if($current_file -notcontains ".disabled"){
            Write-Host "Renaming $current_file to $current_file.disabled ..."
            Rename-Item "$root_path\$current_file" "$root_path\$current_file.disabled"
        }
    }
}