$file = "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\palo_alto\app_gateway\variables.tf"
foreach($line in Get-Content $file) {
#   if($line -match $regex){
  if($line -like "Variable *"){
    Write-Host $line
  }
}