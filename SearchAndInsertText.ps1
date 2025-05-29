$quotedText = '"Terraform"'
$charToReplace1 = " "; $charToReplaceWith1 = "";
$charToReplace2 = "'£erraform'"; $charToReplaceWith2 = '"Terraform"';
# $root_path = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars\20220510.formatted-for-terraform\"
$root_path = "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\"
$root_folder = Get-ChildItem -Path $root_path -Directory -Filter *idd_aztf* |
Foreach-Object {
    $current_dir = $_.Name
    # Write-Host "$root_path$current_dir"
    $root_dir = "$root_path$current_dir"
    $root_directory = Get-ChildItem -Path $root_dir -File -Filter *.auto.tfvars* |
    ForEach-Object {
        $current_file = $_.FullName
        # Write-Host $current_file
        $line1 = Get-Content -Path $current_file | Select-Object -Index 0
        $line2 = Get-Content -Path $current_file | Select-Object -Index 1
        $line3 = Get-Content -Path $current_file | Select-Object -Index 2
        $line4 = Get-Content -Path $current_file | Select-Object -Index 3

        if ($line1 -ne "global_tags = {" -and $line2 -ne "  Provisioner = $quotedText" -and $line3 -ne "}" -and $line4 -ne "") {
            @("global_tags = {","  Provisioner = $quotedText","}","") + (Get-Content $current_file) | Set-Content $current_file
            Write-Host "$current_file does not have global tags set. Tags now added."
            Write-Output $current_file | Out-File -Encoding utf8 files-previously-without-global-tags-set.txt -Append
        }
        else{
            Write-Host "$current_file already has global tags set"
            Write-Output $current_file | Out-File -Encoding utf8 files-with-global-tags-set.txt -Append
        }
    }
}