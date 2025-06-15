# Multiple tfvars files
$root_folder = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\"
Get-ChildItem -Path $root_folder -File | 
ForEach-Object { 
    $current_file = $_.Name;
    # $file_content = Get-Content $current_file | Select-String -Pattern 'idd_firecrest_production_sub';
    $file_content = Get-Content $current_file | Select-String -Pattern 'idd_firecrest_production_idam_sub';
    # Write-Host $file_content
    # Remove-Item -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file.disabled";
    Write-Host "Writing config variables into $current_file ..."
    Write-Host "######################################################################################"
    Write-Host $file_content
    Write-Host "######################################################################################"
    # Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file" -Append;
    Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_idam_sub\$current_file" -Append;
    Start-Sleep 2
}

# Single tfvars file
$root_folder = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\"
$sub_pattern1 = "idd_firecrest_production_sub"
$sub_pattern2 = "idd_firecrest_production_hub_network_sub"
$sub_pattern3 = "idd_firecrest_production_idam_sub"
$sub_pattern4 = "idd_firecrest_production_management_sub"
$resource_files = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\resource_files.txt"
foreach($line in Get-Content -Path $resource_files) {
    $resource_file = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\$line"
    Get-ChildItem -Path $root_folder -File | 
    ForEach-Object { 
        $current_file = $_.Name
        $current_file_path = $_.FullName;
        if ($current_file_path -eq "$resource_file") {

            # $file_content = Get-Content $current_file | Select-String -Pattern 'idd_firecrest_production_sub';
            Write-Host "Start colllating per subscription variables for $sub_pattern1 ..."
            $file_content = Get-Content $current_file | Select-String -Pattern "$sub_pattern1"; 
            if($file_content -ne $null){
                # Write-Host $file_content
                # Remove-Item -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file.disabled";
                Write-Host "Writing config variables into $current_file ..."
                Write-Host "######################################################################################"
                Write-Host $file_content
                Write-Host "######################################################################################"
                # Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file" -Append;
                Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_sub\$current_file" -Append;
                Start-Sleep 2
            }
            else{
                Write-Host ""
                Write-Host "The file $current_file_path does not have resources for subscription $sub_pattern1"
                Write-Host ""
            }

            # $file_content = Get-Content $current_file | Select-String -Pattern 'idd_firecrest_production_sub';
            Write-Host "Start colllating per subscription variables for $sub_pattern2 ..."
            $file_content = Get-Content $current_file | Select-String -Pattern "$sub_pattern2";
            if($file_content -ne $null){
            # Write-Host $file_content
            # Remove-Item -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file.disabled";
                Write-Host "Writing config variables into $current_file ..."
                Write-Host "######################################################################################"
                Write-Host $file_content
                Write-Host "######################################################################################"
                # Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file" -Append;
                Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_hub_network_sub\$current_file" -Append;
                Start-Sleep 2
            }
            else{
                Write-Host ""
                Write-Host "The file $current_file_path does not have resources for subscription $sub_pattern2"
                Write-Host ""
            }

            # $file_content = Get-Content $current_file | Select-String -Pattern 'idd_firecrest_production_sub';
            Write-Host "Start colllating per subscription variables for $sub_pattern3 ..."
            $file_content = Get-Content $current_file | Select-String -Pattern "$sub_pattern3";
            if($file_content -ne $null){
                # Write-Host $file_content
                # Remove-Item -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file.disabled";
                Write-Host "Writing config variables into $current_file ..."
                Write-Host "######################################################################################"
                Write-Host $file_content
                Write-Host "######################################################################################"
                # Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file" -Append;
                Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_idam_sub\$current_file" -Append;
                Start-Sleep 2
            }
            else{
                Write-Host ""
                Write-Host "The file $current_file_path does not have resources for subscription $sub_pattern3"
                Write-Host ""
            }

            # $file_content = Get-Content $current_file | Select-String -Pattern 'idd_firecrest_production_sub';
            $file_content = Get-Content $current_file | Select-String -Pattern "$sub_pattern4";
            if($file_content -ne $null){
                # Write-Host $file_content
                # Remove-Item -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file.disabled";
                Write-Host "Writing config variables into $current_file ..."
                Write-Host "######################################################################################"
                Write-Host $file_content
                Write-Host "######################################################################################"
                # Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_management_sub\$current_file" -Append;
                Write-Output $file_content | Out-File "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\production_management_sub\$current_file" -Append;
                Start-Sleep 2
            }
            else{
                Write-Host ""
                Write-Host "The file $current_file_path does not have resources for subscription $sub_pattern4"
                Write-Host ""
            }

            Write-Host "Completed colllating per subscription variables into $current_file_path!"
        }
    }
}