[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string] $path
)

# Search the path provided
$test = Get-Content -path "$($path)\*.tf"
$hash = @{}
$test | foreach-object {
    If ($_ -match 'hashicorp/*') {
      Write-Output "Found Match for provider: $($_)"
      $provider = ($_ -split '/')[1]
      $provider = $provider -replace '"', ""
      $hash.Add($provider, $provider)
    }
}
# For each provider, find the latest version and download
foreach ($Key in $hash.Keys) {
  # Get the list of available Terraform provider versions
  $Response = Invoke-WebRequest -Uri "https://releases.hashicorp.com/terraform-provider-$($Key)" -UseBasicParsing
  # Find the latest version
  $LatestProviderVersion = $Response.Links[1].href.Split("/")[2]
  Write-Output "Latest version of $($Key) is $($LatestProviderVersion) on HashiCorp release page"
  # Contruct the download URL for the latest version on Nexus server
  $RelativePath = 	"/terraform-provider-$($Key)_v$($LatestProviderVersion)_x5.exe"
  $URL = "http://172.25.2.9:8081/repository/Signed_Binaries/terraform$RelativePath"
  Write-Output "Setting Nexus URL download for $($Key) tp $($URL)"
  #Create the Folder Structure
  $FileName = Split-Path $url -Leaf
  $FolderPath = "\registry.terraform.io\hashicorp\$($Key)\$($LatestProviderVersion)\windows_amd64"
  $FilePath = "$path$FolderPath\$FileName"
  Write-Output "Creating folder structure for signed provider [$($path)$($FolderPath)]"
  New-Item -ItemType Directory -Path $path$FolderPath -ErrorAction SilentlyContinue | Out-Null
  # Download and extract Terraform provider to the path
  Write-Output "Downloading Terraform Provider ($FileName) to $path$FolderPath..."
  Invoke-WebRequest -Uri $URL -OutFile $FilePath -UseBasicParsing
}
# SIG # Begin signature block
# MIIMJgYJKoZIhvcNAQcCoIIMFzCCDBMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUiWSnEkpItNlJN1pP9TkCZuY3
# cfagggm4MIIEjDCCA3SgAwIBAgIQJjF7249NnGRizB/9RGMzdjANBgkqhkiG9w0B
# AQsFADAjMSEwHwYDVQQDExhOR1ggU3RlcCBJbnRlcm1lZGlhdGUgQ0EwHhcNMjIw
# MjIzMTUxMTAxWhcNMjcwMjIzMDkxMjAxWjAcMRowGAYDVQQDDBFPc3ByZXlfQ29k
# ZVNpZ25lcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOZJnEqSujmq
# h2qJJC0HZohChkpLs6qiCWVLLnvP+7mSr15fvXh2FWfi6Q1cmqwivakDnDj4lRKH
# dY/4q1q9QBfhosoEizhL+9hkpPUZBRAFomJP5gH2tDgBUWaegqXKisahCDZoWgWp
# Qo68PsnJzDh2koW96RIizAaMiBiXenYtM9dl4ifCqdH/ycLCWAKcAa1Z79poFsOO
# TQbIm4m6syVXprMLMB6Jxe//bSZtQmPbm7A8/+Z/L+F9qqTr4nNTOUzPzigc5H2o
# 7ABDlW/M/7SB9+XC1tvQIHEv0NUwP9YRdMZUKGu+SlUvRnuZ7XA/UkUiJL++nNeh
# SA/QHDSyE7MCAwEAAaOCAcEwggG9MA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAK
# BggrBgEFBQcDAzAdBgNVHQ4EFgQULA70hLTgxdGyhVgP6mKO+gosF8AwHwYDVR0j
# BBgwFoAURl/ablbQHu6OKxG9NlsD3MeoO1wwHAYDVR0RBBUwE4IRT3NwcmV5X0Nv
# ZGVTaWduZXIwgdYGA1UdHwSBzjCByzCByKCBxaCBwoaBv2h0dHBzOi8vZmx1a3Nz
# cGx1bmtjcmwwMDEuZmlsZS5jb3JlLndpbmRvd3MubmV0L2NkcC9OR1hfaW50ZXJD
# QS5jcmw/c3A9cmwmc3Q9MjAyMS0wNy0yN1QxMzo1MTozOVomc2U9MjAzMS0wNy0y
# OFQxMzo1MTowMFomc3Y9MjAyMC0wOC0wNCZzaWc9SDRqMmF4Z2lmY01hN1l1dnhN
# WUNJV1JkUW9ia2ZORTRib2tURXJHZFFSMCUzRCZzcj1mMF8GDCsGAQQBgqRkxihA
# AQRPME0CAQEEG2NvZGVzaWduQG5neHN0ZXBjYS5pbnRlcm5hbAQrYnc5MGlYbUhf
# ck9GUlEtR2tVampzRnNha3JEMTFQVjlScV9kdmhqb3lPRTANBgkqhkiG9w0BAQsF
# AAOCAQEAb0ncOkWeOy5RLqqozPFTU0itTWuu9cNSJG6zpZb+Gk+cW611gOtcDvDO
# JxVZC0d2j6Il7BN2SucoVUHu7nS8kiRUDx7qY8+bVzfIUNC8Bo4FEodajms3lxwu
# zGoWqsbbBW/TnyKPFLD3RBjbGQKym22IdcolegTWFeoRCxfvrIqqkiOqgUAXSgxM
# MIutOyZhBxkW7vFhjh4eIz3xAiA1rywGc7dnslGBh1EPApeIFYrvM53LatY0Kfce
# giNFY8qfZkSxZIWi2dkBgKru48wOTZuVtDncYYV0H5kvw4nsJVE52yEtM1Ggt/Wc
# utbDpHASiSUQulvhQOfh5oRNO+xlZTCCBSQwggMMoAMCAQICE3YAAAAJMbq1vpdl
# +i0AAAAAAAkwDQYJKoZIhvcNAQELBQAwNTELMAkGA1UEBhMCR0IxDTALBgNVBAoT
# BEZDRE8xFzAVBgNVBAMTDkZBTENPTiBSb290IENBMB4XDTIxMDcyNjA4NTk0M1oX
# DTMwMDcyNjA5MDk0M1owIzEhMB8GA1UEAxMYTkdYIFN0ZXAgSW50ZXJtZWRpYXRl
# IENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApaH32SUszc+bAa2U
# VZ4ZKRcsOJ6rbYLMGFjrKMMN2CQYfuQ/vbEVkORbwh51caGIaEjyp4EvsIivIWgW
# h8WkDJCIIYyt4CHrIcqJI7GNUlD1BDn+UBTQeQru9DupZMaySxbtYultNUfiiuZh
# hMNr71Qd1ijUPV25gA2wDISvI73xFOB63aJ4w0rbzKYmMz/cu5guu/NZNLIBsqTw
# 8y1SUW52Ig8NsfqczhwQIH9AC8NkedVPNjDO3JCJ7xZBP3RC8R7SL4iU7ZSNLKW0
# q3yOympRiwULnWvXO3D1ZlWWPWAwrjEwnGXE8dDj2rKAbx784PFK1ylRAf/RL40G
# GPTW3QIDAQABo4IBPTCCATkwIwYDVR0RBBwwGoIYTkdYIFN0ZXAgSW50ZXJtZWRp
# YXRlIENBMB0GA1UdDgQWBBRGX9puVtAe7o4rEb02WwPcx6g7XDAfBgNVHSMEGDAW
# gBT+nrd7Qu+LUTS4soZbooBnj4x1lTBGBgNVHR8EPzA9MDugOaA3hjVodHRwOi8v
# cGtpLm9wcy5mY2RvLmdvdi51ay9jZHAvRkFMQ09OJTIwUm9vdCUyMENBLmNybDBR
# BggrBgEFBQcBAQRFMEMwQQYIKwYBBQUHMAKGNWh0dHA6Ly9wa2kub3BzLmZjZG8u
# Z292LnVrL2NkcC9GQUxDT04lMjBSb290JTIwQ0EuY3J0MBkGCSsGAQQBgjcUAgQM
# HgoAUwB1AGIAQwBBMA8GA1UdEwEB/wQFMAMBAf8wCwYDVR0PBAQDAgGGMA0GCSqG
# SIb3DQEBCwUAA4ICAQCXDKoPJiYjmW8Fwy421Fz5hwPdFJYFdi/ga4/bmEZc7A4f
# TccnRlTHmy2mu6DFgyMHl21RU9VonW8YfP/DMKBrciS8vcpr0J7kDIUs+p7AL5EB
# wlAm+c+QW4Nf49jbFQt6epCPhlcasZx1QKyGyCH3cVMYStIspORRSwXYutc/HOZb
# FHuFAp8Pboo+pR4HrCF9SSDej7icbdIX4AWJChzhNldAWcSGMwE8SN3jBnGz4BCm
# kL2kfTpmZnI4b8iMDrPDmVuMXxd2J5BK63F9r+7k9Ja2eQ5nsTlXveLolrPbqqPH
# ZBpa+T5xVuy/LgPCyANaYi6joGJwNNYv2IFZPswcgeAwdeWM3fltxhQTQsYnjtAJ
# 6yZ6QZsbkONi0K04htXWWgJ0sIPDMMt2wR52Hk2qFQ7jkPcoN4NxVnGSUkz+H4gB
# 4v9Hnm/K8dz0OUetCVQI9xC5aVPadMxKZ6BlCJ96W0erkmEgwC/UG5HukiAa+n8a
# jQNhTJLsorcy8dK0FiqWGlxPzScSto5+f4r3vl0ygylHFLf483jjZIz8+3V2DAm7
# zbGcPvtyz6Ps9iDo7BrJyyvleIyFfkbiwLs8LJBd0OPJwFt5KYWf6iN1BEZ43Sl+
# +YDtus2kXX971ISDFSM/FlRf8Zton5EDA2gBT5YN2nWN8pWgvoQbzikurom3ozGC
# AdgwggHUAgEBMDcwIzEhMB8GA1UEAxMYTkdYIFN0ZXAgSW50ZXJtZWRpYXRlIENB
# AhAmMXvbj02cZGLMH/1EYzN2MAkGBSsOAwIaBQCgeDAYBgorBgEEAYI3AgEMMQow
# CKACgAChAoAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcC
# AQsxDjAMBgorBgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBQGwvfAKylh3pt6Zpny
# 6DuH2lNHGDANBgkqhkiG9w0BAQEFAASCAQAixo33R4RzYmQPYxVANlBMLV5yZ58H
# d8PL0GeI7uhSnjxAmjNUp9XJ9jDbA7LDRWp0mTrUENGx5GNufTprbCpGNKFoz+aK
# Ygywp0dVMO50LY04AYBwPPMzfu5nNqpEIpxWGISgYBAxwNOviBgCeSNiJH8RpJjH
# NmCzjLl6Hc/gr7FCgdcBPGkb5vGTylHrJWx+oBdc79tHabYxygTb6VnPG9Jn44oR
# xmx/rU2XDOZvvY7AhusUleljEjmniyNVu8WuyI4IjVOyAGGVpF0Y+NtS0ad41UEQ
# WE+PNaR/sID583/twTc4WFixlTuIFPnvZMWwxAab1zukGKtGlNX0GaXp
# SIG # End signature block
