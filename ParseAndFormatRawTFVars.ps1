$base_dir = "C:\Users\SanyaKhasenye\WorkingDir\Terraform\Test\tf_resource_tfvars\tfvars"
$file_path = "production_sub\private_dns_zone_virtual_network_link.auto.tfvars"

# foreach($line in [System.IO.File]::ReadLines("$base_dir\$file_path")){
#     Write-Host $line
# }

foreach($line in Get-Content "$base_dir\$file_path"){
    Write-Host $line
}