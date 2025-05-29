$root_folder = Get-ChildItem -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD" -Directory -Recurse -Filter *idd_aztf* | 
Foreach-Object {
    $current_folder = $_.Name
    if ($current_folder -like "idd_aztf_firecrest_production_global"){
        # Write-Host $current_folder
        # continue
    }
    Write-Host "Looking through '$current_folder' folder..."
    Start-Sleep 1
    $target_folder = Get-ChildItem "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder" -File -Filter *.tf |
    Foreach-Object {
        $current_filename = $_.Name
        # Write-Host "Moving $current_filename to 'C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder'"
        # Write-Host $current_filename
        Start-Sleep 1
        # Create resource folder
        $new_resource_folder = $current_filename.substring(0,$current_filename.length - 3)
        # New-Item -ItemType Directory -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder\$new_resource_folder"
        
        # Move resource file to its resource folder
        Write-Host "Moving $current_filename to 'C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder\$new_resource_folder'"
        Move-Item "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder\$current_filename" "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder\$new_resource_folder"

        # Create resource module files to modules folder
        # New-Item -ItemType Directory -Path "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder\modules\$new_resource_folder"
        
        # Move file to its resource folder
        Write-Host "Copying $current_filename to 'C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder\$new_resource_folder'"Write-Host "Moving $current_filename to 'C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder'"
        Copy-Item "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder\$new_resource_folder\$current_filename" "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\$current_folder\modules\$new_resource_folder"

        # Copy resource files from resource_group resource template


        # Copy module files from resource_group module template



        # $file_exists
        # if (Test-Path "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\$target_filename" -e $false) {
        #     Write-Host "File Doesn't Exists in 'C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test'. Remove from current folder..."
        #     Remove-Item "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_azure_terraform\$tartget_filename"
        #     Start-Sleep 1
        # }
        # else
        # {
        #     Write-Host "File Exists in 'C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test'. Leave in place..."
        #     Start-Sleep 1
        # }
    }
}