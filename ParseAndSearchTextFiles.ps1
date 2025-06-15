# $root_path = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\20220510.formatted-for-terraform\"
$root_path = "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\"
# $root_folder = Get-ChildItem -Path $root_path -Directory |
$root_folder = Get-ChildItem -Path $root_path -Directory -Filter *idd_aztf* |
Foreach-Object {
    $current_dir = $_.Name
    # Write-Host "$root_path$current_dir"
    $root_dir = "$root_path$current_dir"
    $root_dir_name_length = $root_dir.Length

    Write-Host $("#" * ($root_dir_name_length + 6))
    Write-Host "#  $root_dir  #"
    Write-Host $("#" * ($root_dir_name_length + 6))

    Write-Output $("#" * ($root_dir_name_length + 6)) | Out-File -Encoding utf8 "$current_dir.auto.tfvars" -Append
    Write-Output "#  $root_dir  #" | Out-File -Encoding utf8 "$current_dir.auto.tfvars" -Append
    Write-Output $("#" * ($root_dir_name_length + 6)) | Out-File -Encoding utf8 "$current_dir.auto.tfvars" -Append

    $root_directory = Get-ChildItem -Path $root_dir -File -Filter *.auto.tfvars* |
    # $root_directory = Get-ChildItem -Path $root_dir -File |
    
    ForEach-Object {
        $current_file = $_.FullName
        $file_name_length = $current_file.Length

        Write-Host $("#" * ($file_name_length + 6))
        Write-Host "#  $current_file  #"
        Write-Host $("#" * ($file_name_length + 6))

        Write-Output $("#" * ($file_name_length + 6)) | Out-File -Encoding utf8 "$current_dir.auto.tfvars" -Append
        Write-Output "#  $current_file  #" | Out-File -Encoding utf8 "$current_dir.auto.tfvars" -Append
        Write-Output $("#" * ($file_name_length + 6)) | Out-File -Encoding utf8 "$current_dir.auto.tfvars" -Append

        foreach($line in Get-Content -Path $current_file) {
            # if($line -match $regex){
            #     # Work here
            # }
            Write-Host $line
            Write-Output $("#" * ($file_name_length + 6)) | Out-File -Encoding utf8 "$current_dir.auto.tfvars" -Append
        }
    }
}