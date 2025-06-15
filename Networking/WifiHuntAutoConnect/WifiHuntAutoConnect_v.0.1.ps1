# Script configuration path relative to script location
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$configPath = Join-Path $scriptPath "config.json"
$logBasePath = Join-Path $scriptPath "Logs"

# Default configuration
$defaultConfig = @{
    PreferredNetworks = @(
        "HellsGate-5.0G",
        "HellsGate-2.4G",
        "Merlin Wharf",
        "Nyati_CPEPro2_5G",
        "Nyati_CPEPro2_2.4G"
    )
    RetryIntervalMin = 3  # Minimum minutes between retries
    RetryIntervalMax = 7  # Maximum minutes between retries
    MaxLogSizeMB = 5
}

# Function to ensure configuration exists
function Initialize-Configuration {
    try {
        if (-not (Test-Path $configPath)) {
            $defaultConfig | ConvertTo-Json | Set-Content $configPath
            Write-Output "Created default configuration file at $configPath"
        }
        $config = Get-Content $configPath | ConvertFrom-Json
        return $config
    }
    catch {
        Write-Error "Error initializing configuration: $_"
        return $defaultConfig
    }
}

# Function to get current log file path and create directories if needed
function Get-LogFile {
    try {
        $date = Get-Date
        $yearPath = Join-Path $logBasePath $date.ToString("yyyy")
        $monthPath = Join-Path $yearPath $date.ToString("MM")
        $dayPath = Join-Path $monthPath $date.ToString("dd")
        
        # Create directory structure if it doesn't exist
        if (-not (Test-Path $dayPath)) {
            New-Item -ItemType Directory -Path $dayPath -Force | Out-Null
        }
        
        # Get current log file or create new one if needed
        $logFiles = Get-ChildItem $dayPath -Filter "wifi_connect_*.log" | Sort-Object Name -Descending
        $logFile = $null
        
        if ($logFiles.Count -eq 0) {
            $logFile = Join-Path $dayPath "wifi_connect_001.log"
        }
        else {
            $currentLog = $logFiles[0]
            if ((Get-Item $currentLog.FullName).Length/1MB -ge $config.MaxLogSizeMB) {
                # Create new log file with incremented number
                $currentNumber = [int]($currentLog.BaseName -replace "wifi_connect_","")
                $newNumber = $currentNumber + 1
                $logFile = Join-Path $dayPath ("wifi_connect_{0:D3}.log" -f $newNumber)
            }
            else {
                $logFile = $currentLog.FullName
            }
        }
        
        return $logFile
    }
    catch {
        # Fallback to script directory if logging structure fails
        Write-Error "Error creating log file structure: $_"
        return Join-Path $scriptPath "wifi_connect_fallback.log"
    }
}

# Enhanced logging function
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
        
        # Write to log file
        Add-Content -Path $logFile -Value $logMessage
        
        # Also write to console with appropriate color
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

# Enhanced function to get available networks with error handling
function Get-AvailableNetworks {
    try {
        $networks = netsh wlan show networks | Select-String "SSID" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }
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

# Enhanced function to check current connection
function Get-CurrentConnection {
    try {
        $connection = netsh wlan show interfaces | Select-String "SSID" | Select-Object -First 1
        if ($connection) {
            $ssid = $connection.ToString().Split(":")[1].Trim()
            Write-Log "Currently connected to: $ssid"
            return $ssid
        }
        Write-Log "No current WiFi connection" -Level Warning
        return $null
    }
    catch {
        Write-Log "Error checking current connection: $_" -Level Error
        return $null
    }
}

# Enhanced function to connect to a network
function Connect-ToNetwork {
    param($networkName)
    try {
        Write-Log "Attempting to connect to $networkName"
        $result = netsh wlan connect name="$networkName"
        Start-Sleep -Seconds 5  # Wait for connection attempt
        
        # Verify connection
        $currentNetwork = Get-CurrentConnection
        if ($currentNetwork -eq $networkName) {
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

# Enhanced main connection loop
function Start-WiFiConnection {
    try {
        # Load configuration
        $config = Initialize-Configuration
        Write-Log "WiFi connection manager started"
        
        while ($true) {
            try {
                $currentNetwork = Get-CurrentConnection
                
                if ($currentNetwork -and ($config.PreferredNetworks -contains $currentNetwork)) {
                    Write-Log "Already connected to preferred network: $currentNetwork"
                }
                else {
                    Write-Log "Scanning for preferred networks..."
                    $availableNetworks = Get-AvailableNetworks
                    
                    # Try to connect to networks in order of preference
                    $connected = $false
                    foreach ($network in $config.PreferredNetworks) {
                        if ($availableNetworks -contains $network) {
                            if (Connect-ToNetwork $network) {
                                $connected = $true
                                break
                            }
                        }
                    }
                    
                    if (-not $connected) {
                        Write-Log "Could not connect to any preferred networks" -Level Warning
                    }
                }
                
                # Random retry interval
                $waitMinutes = Get-Random -Minimum $config.RetryIntervalMin -Maximum $config.RetryIntervalMax
                Write-Log "Waiting $waitMinutes minutes before next check..."
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

# Create scheduled task with error handling
try {
    $action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    $trigger = New-ScheduledTaskTrigger -AtStartup
    $principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
    
    Register-ScheduledTask -TaskName "WiFiAutoConnect" -Action $action -Trigger $trigger -Principal $principal -Force
    Write-Log "Successfully registered scheduled task"
}
catch {
    Write-Log "Failed to create scheduled task: $_" -Level Error
}

# Start the connection loop
Start-WiFiConnection