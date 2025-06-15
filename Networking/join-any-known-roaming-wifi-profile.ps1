
$scriptPath = "C:\_SCRIPTS_DO_NOT_DELETE!\PowerShell\Networking"

function Write-Log {
	Param($message)
	Write-Output "$(Get-Date -format 'yyyyMMdd HHmmss') $message" | Out-File -Encoding utf8 "$logFile" -Append
}

$no_known_roaming_wifi_profiles_found = $false

while ($true){

    $logFile = "$scriptPath\Logs\" + (Get-Date -format 'yyyyMMdd') + '_join-any-known-wifi-roaming-profile.log'
    $test_count = Get-Random -Maximum 4 -Minimum 1
    $test_connection = Test-Connection 8.8.8.8 -count $test_count
    
    if($test_connection -eq $null) {

        $connected = $false
        $Nyati_CPEPro2_5G = powershell.exe "$scriptPath\join-wifi-network-Nyati_CPEPro2_5G.ps1"
    
        if ($Nyati_CPEPro2_5G -ne "Connection request was completed successfully."){
            $Nyati_CPEPro2_2_4G = powershell.exe "$scriptPath\join-wifi-network-Nyati_CPEPro2_2.4G.ps1"
            $connected = $true
            if($no_known_roaming_wifi_profiles_found -eq $true){
                Write-Log "Reconnected to Wi-Fi network 'Nyati_CPEPro2_5G'"
                $no_known_roaming_wifi_profiles_found = $false
            }
        }
    
        if ($Nyati_CPEPro2_2_4G -ne "Connection request was completed successfully." -and $connected -eq 'False'){
            $Amboseli = powershell.exe "$scriptPath\join-wifi-network-Amboseli.ps1"
            $connected = $true
            if($no_known_roaming_wifi_profiles_found -eq $true){
                Write-Log "Reconnected to Wi-Fi network 'Amboseli'"
                $no_known_roaming_wifi_profiles_found = $false
            }
        }

        if ($Amboseli -ne "Connection request was completed successfully." -and $connected -eq 'False'){
            $Serengeti_5G = powershell.exe "$scriptPath\join-wifi-network-Serengeti_5G.ps1"
            $connected = $true
            if($no_known_roaming_wifi_profiles_found -eq $true){
                Write-Log "Reconnected to Wi-Fi network 'Serengeti_5G'"
                $no_known_roaming_wifi_profiles_found = $false
            }
        }

        if ($Serengeti_5G -ne "Connection request was completed successfully." -and $connected -eq 'False'){
            $Serengeti_2_4G = powershell.exe "$scriptPath\join-wifi-network-Serengeti_2.4G.ps1"
            $connected = $true
            if($no_known_roaming_wifi_profiles_found -eq $true){
                Write-Log "Reconnected to Wi-Fi network 'Serengeti_2.4G'"
                $no_known_roaming_wifi_profiles_found = $false
            }
        }

        if ($Serengeti_2_4G -ne "Connection request was completed successfully." -and $connected -eq 'False'){
            $Merlin_Wharf = powershell.exe "$scriptPath\join-wifi-network-Merlin_Wharf.ps1"
            $connected = $true
            if($no_known_roaming_wifi_profiles_found -eq $true){
                Write-Log "Reconnected to Wi-Fi network 'Merlin Wharf'"
                $no_known_roaming_wifi_profiles_found = $false
            }
        }

        if ($Merlin_Wharf -ne "Connection request was completed successfully." -and $connected -eq 'False'){
            Write-Log "Wi-Fi disconnected, and failed to join any known Wi-Fi roaming profiles..." 
            $no_known_roaming_wifi_profiles_found = $true
        }        
    
    }
    else {
        $current_connection_profile = Get-NetConnectionProfile -InterfaceAlias "Wi-Fi 2"
        $current_connection_profile_name = $current_connection_profile.Name
        if($no_known_roaming_wifi_profiles_found -eq $true){
            Write-Log "Reconnected to the Internet via Wi-Fi profile '$current_connection_profile_name' after a disconnection or reboot..."
            $no_known_roaming_wifi_profiles_found = $false
        }
    }

    # Pause execution for between 5 to 10 minutes
    $sleeptime = Get-Random -Maximum 600 -Minimum 120
    Start-Sleep -Seconds $sleeptime

}