# Auto WiFi Connector
# Place this script in the Windows startup folder: "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

# Script Configuration
$scriptPath = $PSScriptRoot
$configPath = Join-Path $scriptPath "config.json"
$logBasePath = Join-Path $scriptPath "Logs"

# Ensure base log directory exists
if (-not (Test-Path $logBasePath)) {
    New-Item -ItemType Directory -Path $logBasePath | Out-Null
}

function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO"
    )
    
    $dateFolder = Get-Date -Format "yyyy\\MM\\dd"
    $logFolder = Join-Path $logBasePath $dateFolder
    
    if (-not (Test-Path $logFolder)) {
        New-Item -ItemType Directory -Path $logFolder -Force | Out-Null
    }
    
    $logFile = Join-Path $logFolder "wifi_connector.log"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    
    # Check if log file exists and its size
    if (Test-Path $logFile) {
        $fileInfo = Get-Item $logFile
        if ($fileInfo.Length -ge 5MB) {
            $newLogFile = Join-Path $logFolder ("wifi_connector_" + (Get-Date -Format "yyyyMMddHHmmss") + ".log")
            Move-Item $logFile $newLogFile
        }
    }
    
    Add-Content -Path $logFile -Value $logMessage
}

function Get-DefaultConfig {
    return @{
        PreferredNetworks = @(
            "HomeWiFi",
            "OfficeWiFi",
            "BackupWiFi"
        )
        ScanIntervalMinutes = 5
        RetryIntervalMinutes = 2
        ConnectedCheckIntervalMinutes = 15
        MinRetryInterval = 1
        MaxRetryInterval = 10
    }
}

function Initialize-Config {
    if (-not (Test-Path $configPath)) {
        $defaultConfig = Get-DefaultConfig
        $defaultConfig | ConvertTo-Json | Set-Content $configPath
        Write-Log "Created default configuration file" "INFO"
    }
    
    try {
        $config = Get-Content $configPath | ConvertFrom-Json
        return $config
    }
    catch {
        Write-Log "Error reading configuration file: $_" "ERROR"
        return Get-DefaultConfig
    }
}

function Test-WiFiConnection {
    try {
        $network = Get-NetConnectionProfile -ErrorAction Stop | Where-Object {$_.NetworkCategory -ne 'NoNetwork'}
        if ($network) {
            $ssid = (Get-NetAdapter | Where-Object {$_.InterfaceDescription -match 'Wireless'} | Get-NetConnectionProfile).Name
            return @{
                Connected = $true
                SSID = $ssid
            }
        }
    }
    catch {
        Write-Log "Error checking WiFi connection: $_" "ERROR"
    }
    
    return @{
        Connected = $false
        SSID = $null
    }
}

function Connect-PreferredNetwork {
    param (
        [array]$PreferredNetworks
    )
    
    try {
        $availableNetworks = (netsh wlan show networks) | Select-String '(?<=SSID\s+\d+\s+:)(.*)' | ForEach-Object {$_.Matches[0].Value.Trim()}
        
        foreach ($preferredNetwork in $PreferredNetworks) {
            if ($availableNetworks -contains $preferredNetwork) {
                Write-Log "Attempting to connect to $preferredNetwork" "INFO"
                
                try {
                    netsh wlan connect name="$preferredNetwork"
                    Start-Sleep -Seconds 5
                    
                    $connectionTest = Test-WiFiConnection
                    if ($connectionTest.Connected -and $connectionTest.SSID -eq $preferredNetwork) {
                        Write-Log "Successfully connected to $preferredNetwork" "INFO"
                        return $true
                    }
                }
                catch {
                    Write-Log "Failed to connect to $preferredNetwork: $_" "ERROR"
                }
            }
        }
    }
    catch {
        Write-Log "Error scanning for networks: $_" "ERROR"
    }
    
    return $false
}

# Main execution loop
try {
    $config = Initialize-Config
    
    while ($true) {
        $connectionStatus = Test-WiFiConnection
        
        if ($connectionStatus.Connected) {
            Write-Log "Currently connected to: $($connectionStatus.SSID)" "INFO"
            
            # If connected but not to a preferred network
            if ($connectionStatus.SSID -notin $config.PreferredNetworks) {
                Write-Log "Connected to non-preferred network. Checking for better options." "INFO"
                if (Connect-PreferredNetwork $config.PreferredNetworks) {
                    Write-Log "Successfully switched to preferred network" "INFO"
                }
            }
            
            $sleepTime = $config.ConnectedCheckIntervalMinutes * 60
        }
        else {
            Write-Log "Not connected. Attempting to connect..." "INFO"
            Connect-PreferredNetwork $config.PreferredNetworks
            
            # Random retry interval between min and max
            $sleepTime = Get-Random -Minimum ($config.MinRetryInterval * 60) -Maximum ($config.MaxRetryInterval * 60)
        }
        
        Start-Sleep -Seconds $sleepTime
    }
}
catch {
    Write-Log "Critical error in main loop: $_" "ERROR"
}