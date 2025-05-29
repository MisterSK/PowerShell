Add-Type -AssemblyName System.Web

$minLength = 15
$maxLength = 15
$minLength = Get-Random - Minimum $minLength -Maximum $maxLength
$nonAlhaChars = 5
$password = [System.Web.Security.Membership]::GeneratePassword($length,$nonAlhaChars)
Write-Host "Your new password ($length characters) is $password"