$source_folder = Get-ChildItem "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test" -Filter *.tf | 
Foreach-Object {
    $source_filename = $_.Name
    Write-Host "Checking if $source_filename exists in 'C:\Users\SanyaKhasenye\WorkingDir\GitHub\idd_azure_terraform'"
    Start-Sleep 1
    $targete_folder = Get-ChildItem "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_azure_terraform" -Filter *.tf |
    Foreach-Object {
        $target_filename = $_.Name
        Write-Host "Looking for $source_filename in 'C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test'"
        $file_exists
        if (Test-Path "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\$target_filename" -e $false) {
            Write-Host "File Doesn't Exists in 'C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test'. Remove from current folder..."
            Remove-Item "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_azure_terraform\$tartget_filename"
            Start-Sleep 1
        }
        else
        {
            Write-Host "File Exists in 'C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test'. Leave in place..."
            Start-Sleep 1
        }
    }
}