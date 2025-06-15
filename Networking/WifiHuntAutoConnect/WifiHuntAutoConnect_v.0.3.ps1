# Script configuration path relative to script location
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$configPath = Join-Path $scriptPath "config.json"
$logBasePath = Join-Path $scriptPath "Logs"

# Default configuration
$defaultConfig = Get-Content -Raw -Path $configPath | ConvertFrom-Json

# Function to ensure configuration exists
function Initialize-Configuration {
    try {
        $defaultConfig = @{
            preferredNetworks = @(
                @{
                    ssid = "Merlin Wharf"
                    priority = 1
                    description = "Default network configuration"
                }
            )
            connectionSettings = @{
                initialScanDelaySeconds = 30
                scanIntervalSettings = @{
                    minMinutes = 3
                    maxMinutes = 7
                }
                connectedCheckSettings = @{
                    minMinutes = 15
                    maxMinutes = 20
                }
            }
            logging = @{
                maxLogSizeMB = 5
                logLevels = @("Information", "Warning", "Error")
            }
        }

        if (-not (Test-Path $configPath)) {
            $defaultConfig | ConvertTo-Json -Depth 10 | Set-Content $configPath
            Write-Host "Created default configuration file at $configPath"
        }
        return Get-Content -Raw -Path $configPath | ConvertFrom-Json
    }
    catch {
        Write-Error "Error initializing configuration: $_"
        return $defaultConfig
    }
}

# Function to get log file
function Get-LogFile {
    try {
        $date = Get-Date
        $yearPath = Join-Path $logBasePath $date.ToString("yyyy")
        $monthPath = Join-Path $yearPath $date.ToString("MM")
        $dayPath = Join-Path $monthPath $date.ToString("dd")
        
        if (-not (Test-Path $dayPath)) {
            New-Item -ItemType Directory -Path $dayPath -Force | Out-Null
        }
        
        $logFile = Join-Path $dayPath "wifi_connect.log"
        return $logFile
    }
    catch {
        return Join-Path $scriptPath "wifi_connect_fallback.log"
    }
}

# Function to write to log
function Write-Log {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Message,
        [ValidateSet('Information','Warning','Error')]
        [string]$Level = 'Information'
    )
    
    try {
        $logFile = Get-LogFile
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        $logMessage = "[$timestamp] [$Level] $Message"
        
        Add-Content -Path $logFile -Value $logMessage
        
        switch ($Level) {
            'Warning' { Write-Host $logMessage -ForegroundColor Yellow }
            'Error' { Write-Host $logMessage -ForegroundColor Red }
            default { Write-Host $logMessage }
        }
    }
    catch {
        Write-Error "Failed to write to log: $_"
    }
}

# Function to get available networks
function Get-AvailableNetworks {
    try {
        $networks = netsh wlan show networks | 
            Select-String "SSID\s+:\s+(.+)$" | 
            ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
        
        if ($networks.Count -eq 0) {
            Write-Log "No WiFi networks found" -Level Warning
        }
        else {
            Write-Log "Found $($networks.Count) networks"
        }
        return $networks
    }
    catch {
        Write-Log "Error getting available networks: $_" -Level Error
        return @()
    }
}

# Function to connect to network
function Connect-ToNetwork {
    param($networkName)
    try {
        Write-Log "Attempting to connect to $networkName"
        $result = netsh wlan connect name="$networkName"
        Start-Sleep -Seconds 5  # Wait for connection attempt
        
        $currentNetwork = Get-ConnectionStatus
        if ($currentNetwork.IsConnected -and $currentNetwork.SSID -eq $networkName) {
            Write-Log "Successfully connected to $networkName"
            return $true
        }
        Write-Log "Failed to connect to $networkName" -Level Warning
        return $false
    }
    catch {
        Write-Log "Error connecting to $networkName`: $_" -Level Error
        return $false
    }
}

# Modified start sequence
try {
    # Create Logs directory if it doesn't exist
    if (-not (Test-Path $logBasePath)) {
        New-Item -ItemType Directory -Path $logBasePath -Force | Out-Null
    }

    # Initialize configuration
    $config = Initialize-Configuration

    # Start the main loop
    Start-WiFiConnection
}
catch {
    Write-Error "Critical startup error: $_"
    exit 1
}

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