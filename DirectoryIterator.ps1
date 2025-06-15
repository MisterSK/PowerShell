$root_path = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\"
$root_folder = Get-ChildItem -Path $root_path -Directory |
Foreach-Object {
    $current_dir = $_.Name
    # Write-Host "$root_path$current_dir"
    $root_dir = "$root_path$current_dir"
    $root_directory = Get-ChildItem -Path $root_dir -File |
    ForEach-Object {
        $current_file = $_.FullName
        # Write-Host $current_file
        if ($file_content -ne "") {
            $file_content = Get-Content $current_file
            Write-Host $file_content
        }
        else{
            Write-Host "$current_file is empty"
            Write-Output $current_file | Out-File -Encoding utf8 empty-files.txt -Append
        }
    }
}

$forler_root = Get-ChildItem -Path . -Directory -Exclude subnet,terraform-azurerm-vmseries-modules-develop,virtual_network |
ForEach-Object {
    $current_folder = $_.FullName
    $folder_name = $_.Name
    Write-Output $("#" * ($folder_name.length + 16)) | Out-File -Encoding utf8 palo_alto_variables.tf -Append
    Write-Output "#  $folder_name Variables  #" | Out-File -Encoding utf8 palo_alto_variables.tf -Append
    Write-Output $("#" * ($folder_name.length + 16)) | Out-File -Encoding utf8 palo_alto_variables.tf -Append
    Write-Output "" | Out-File -Encoding utf8 palo_alto_variables.tf -Append
    $var_file_content = Get-Content "$current_folder\variables.tf"
    Write-Output $var_file_content | Out-File -Encoding utf8 palo_alto_variables.tf -Append
    Write-Output "" | Out-File -Encoding utf8 palo_alto_variables.tf -Append
}
