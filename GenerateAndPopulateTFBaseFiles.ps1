$tf_file = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\azurerm_virtual_machine_data_disk_attachment.tf"
Write-Output $(Get-Clipboard) | out-file $tf_file
# $tf_content = Get-Content -Path $tf_file
# Write-Host $tf_content
$clipboard = $(Get-Clipboard)
Write-Host $clipboard