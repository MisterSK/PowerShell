# Default
Function GET-Temppassword() {

    Param(
    
    [int]$length=15,
    
    [string[]]$sourcedata
    
    )
    
     
    
    For ($loop=1; $loop –le $length; $loop++) {
    
                $TempPassword+=($sourcedata | GET-RANDOM)
    
                }
    
    return $TempPassword
    
}

# for ($i=1;$i -le 6; $i++) { $current_pass = "<Secret$i>"; 
# $temp_password=GET-Temppassword -length 20 -sourcedata $ascii;
# ((Get-Content -Path .\key_vault_secret.auto.tfvars -Raw) -replace """$current_pass""","""$temp_password""") | Set-Content -Path .\key_vault_secret.auto.tfvars}

$root_module_dir = "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub";
$module_dir = "C:\Users\SanyaKhasenye\WorkingDir\GitHub\NGF-FCO\FTD\idd_aztf_firecrest_production_hub_network_sub\modules\key_vault\key_vault_secret";
for ($i=1;$i -le 5; $i++) { $current_pass_file = "Secret$i.pwd"; $current_pass = "<Secret$i>";
((Get-Content -Path "$root_module_dir\key_vault_secret.auto.tfvars" -Raw) -replace """$current_pass""","""$temp_password""") | Set-Content -Path "$root_module_dir\key_vault_secret.auto.tfvars";
$temp_password=GET-Temppassword -length 20 -sourcedata $ascii;
Write-Output $temp_password | Out-File -Encoding utf8 "$module_dir\secrets\$current_pass_file"}

# Alternate
$PW= GET-Temppassword –length 9 –sourcedata $ascii | CLIP

$PW | CLIP

$SecurePW=CONVERTTO-Securestring $PW -asplaintext -force 