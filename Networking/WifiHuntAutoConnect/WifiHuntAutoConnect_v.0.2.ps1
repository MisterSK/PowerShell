# Script configuration path relative to script location
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$configPath = Join-Path $scriptPath "config.json"
$logBasePath = Join-Path $scriptPath "Logs"

# Default configuration
$defaultConfig = Get-Content -Raw -Path $configPath | ConvertFrom-Json

# Function to validate configuration
function Test-Configuration {
    param ($config)
    try {
        # Verify required sections exist
        $requiredSections = @('preferredNetworks', 'connectionSettings', 'logging')
        foreach ($section in $requiredSections) {
            if (-not $config.$section) {
                Write-Log "Missing required configuration section: $section" -Level Error
                return $false
            }
        }

        # Verify preferred networks are properly configured
        if ($config.preferredNetworks.Count -eq 0) {
            Write-Log "No preferred networks configured" -Level Error
            return $false
        }

        # Verify timing settings
        if ($config.connectionSettings.scanIntervalSettings.minMinutes -gt 
            $config.connectionSettings.scanIntervalSettings.maxMinutes) {
            Write-Log "Invalid scan interval settings: min > max" -Level Error
            return $false
        }

        if ($config.connectionSettings.connectedCheckSettings.minMinutes -gt 
            $config.connectionSettings.connectedCheckSettings.maxMinutes) {
            Write-Log "Invalid connected check settings: min > max" -Level Error
            return $false
        }

        return $true
    }
    catch {
        Write-Log "Error validating configuration: $_" -Level Error
        return $false
    }
}

# Function to get current connection status with signal strength
function Get-ConnectionStatus {
    try {
        $interface = netsh wlan show interfaces | Select-String "SSID|Signal" | Out-String
        if ($interface -match "SSID\s+:\s+(.+)[\r\n]+.*Signal\s+:\s+(\d+)%") {
            return @{
                SSID = $matches[1].Trim()
                Signal = [int]$matches[2]
                IsConnected = $true
            }
        }
        return @{
            SSID = $null
            Signal = 0
            IsConnected = $false
        }
    }
    catch {
        Write-Log "Error getting connection status: $_" -Level Error
        return @{
            SSID = $null
            Signal = 0
            IsConnected = $false
        }
    }
}

# Function to check if current connection is preferred
function Test-PreferredConnection {
    param($currentSSID, $preferredNetworks)
    
    try {
        $currentNetwork = $preferredNetworks | Where-Object { $_.ssid -eq $currentSSID }
        if ($currentNetwork) {
            $betterNetworks = $preferredNetworks | 
                Where-Object { $_.priority -lt $currentNetwork.priority }
            return @{
                IsPreferred = $true
                HasBetterOptions = ($betterNetworks.Count -gt 0)
                CurrentPriority = $currentNetwork.priority
            }
        }
        return @{
            IsPreferred = $false
            HasBetterOptions = $true
            CurrentPriority = [int]::MaxValue
        }
    }
    catch {
        Write-Log "Error checking preferred connection: $_" -Level Error
        return @{
            IsPreferred = $false
            HasBetterOptions = $true
            CurrentPriority = [int]::MaxValue
        }
    }
}

# Enhanced main connection loop
function Start-WiFiConnection {
    try {
        # Load and validate configuration
        $config = Get-Content -Raw -Path $configPath | ConvertFrom-Json
        if (-not (Test-Configuration $config)) {
            throw "Invalid configuration"
        }

        Write-Log "WiFi connection manager started with $(
            $config.preferredNetworks.Count) preferred networks"
        
        # Initial delay
        Start-Sleep -Seconds $config.connectionSettings.initialScanDelaySeconds
        
        while ($true) {
            try {
                $connectionStatus = Get-ConnectionStatus
                
                if ($connectionStatus.IsConnected) {
                    $preferredStatus = Test-PreferredConnection -currentSSID $connectionStatus.SSID -preferredNetworks $config.preferredNetworks
                    
                    if ($preferredStatus.IsPreferred -and -not $preferredStatus.HasBetterOptions) {
                        Write-Log "Connected to optimal network: $($connectionStatus.SSID) (Signal: $($connectionStatus.Signal)%)"
                        
                        # Use longer wait time when optimally connected
                        $waitMinutes = Get-Random -Minimum $config.connectionSettings.connectedCheckSettings.minMinutes `
                                                -Maximum $config.connectionSettings.connectedCheckSettings.maxMinutes
                    }
                    else {
                        $message = if ($preferredStatus.IsPreferred) {
                            "Connected to preferred network but better options exist"
                        }
                        else {
                            "Connected to non-preferred network"
                        }
                        Write-Log "$message: $($connectionStatus.SSID) (Signal: $($connectionStatus.Signal)%)"
                        
                        # Scan for better networks
                        $availableNetworks = Get-AvailableNetworks
                        $betterOptions = $config.preferredNetworks | 
                            Where-Object { $_.priority -lt $preferredStatus.CurrentPriority -and 
                                         $availableNetworks -contains $_.ssid }
                        
                        if ($betterOptions) {
                            foreach ($network in $betterOptions) {
                                if (Connect-ToNetwork $network.ssid) {
                                    break
                                }
                            }
                        }
                        
                        # Use standard scan interval
                        $waitMinutes = Get-Random -Minimum $config.connectionSettings.scanIntervalSettings.minMinutes `
                                                -Maximum $config.connectionSettings.scanIntervalSettings.maxMinutes
                    }
                }
                else {
                    Write-Log "No WiFi connection, attempting to connect..."
                    $availableNetworks = Get-AvailableNetworks
                    
                    # Try to connect to networks in order of priority
                    $connected = $false
                    foreach ($network in ($config.preferredNetworks | Sort-Object priority)) {
                        if ($availableNetworks -contains $network.ssid) {
                            if (Connect-ToNetwork $network.ssid) {
                                $connected = $true
                                break
                            }
                        }
                    }
                    
                    if (-not $connected) {
                        Write-Log "Could not connect to any preferred networks" -Level Warning
                    }
                    
                    # Use standard scan interval
                    $waitMinutes = Get-Random -Minimum $config.connectionSettings.scanIntervalSettings.minMinutes `
                                            -Maximum $config.connectionSettings.scanIntervalSettings.maxMinutes
                }
                
                Write-Log "Next check in $waitMinutes minutes"
                Start-Sleep -Seconds ($waitMinutes * 60)
            }
            catch {
                Write-Log "Error in main connection loop: $_" -Level Error
                Start-Sleep -Seconds 60  # Wait a minute before retrying after error
            }
        }
    }
    catch {
        Write-Log "Critical error in WiFi connection manager: $_" -Level Error
        throw
    }
}

# Start the connection loop
Start-WiFiConnection