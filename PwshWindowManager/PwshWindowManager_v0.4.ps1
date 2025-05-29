[CmdletBinding()]
param(
    [int]$WindowCount,
    [int]$Width,
    [int]$Height,
    [int]$StartX,
    [int]$StartY,
    [int]$Spacing,
    [string]$ConfigPath = "WindowConfig.json"
)

# Function to load configuration
function Get-WindowConfig {
    param([string]$ConfigPath)
    
    if (Test-Path $ConfigPath) {
        try {
            $config = Get-Content $ConfigPath | ConvertFrom-Json
            return $config
        }
        catch {
            Write-Error "Error reading configuration file: $_"
            exit 1
        }
    }
    else {
        Write-Error "Configuration file not found at: $ConfigPath"
        exit 1
    }
}

# Load configuration
$config = Get-WindowConfig -ConfigPath $ConfigPath

# Set values from parameters or defaults from config
$WindowCount = if ($WindowCount) { $WindowCount } else { $config.DefaultWindowCount }
$Width = if ($Width) { $Width } else { $config.WindowDefaults.DefaultWidth }
$Height = if ($Height) { $Height } else { $config.WindowDefaults.DefaultHeight }
$StartX = if ($StartX) { $StartX } else { $config.WindowDefaults.DefaultX }
$StartY = if ($StartY) { $StartY } else { $config.WindowDefaults.DefaultY }
$Spacing = if ($Spacing) { $Spacing } else { $config.WindowDefaults.Spacing }

# Verify credentials file exists
$credsPath = $config.AdminCredsPath
if (-not (Test-Path $credsPath)) {
    Write-Error "Credentials file not found at: $credsPath"
    exit 1
}

# Import credentials
try {
    $creds = Import-Clixml -Path $credsPath
}
catch {
    Write-Error "Error importing credentials: $_"
    exit 1
}

# Function to calculate window position
function Get-WindowPosition {
    param(
        [int]$Index,
        [int]$StartX,
        [int]$StartY,
        [int]$Spacing
    )
    
    $x = $StartX + ($Index * $Spacing)
    $y = $StartY + ($Index * $Spacing)
    
    return @{
        X = $x
        Y = $y
    }
}

# Create the PowerShell windows
for ($i = 0; $i -lt $WindowCount; $i++) {
    $position = Get-WindowPosition -Index $i -StartX $StartX -StartY $StartY -Spacing $Spacing
    
    # Select a random command from the config
    $randomCommand = $config.Commands | Get-Random
    
    # Create a simplified command string
    $commandString = "Write-Host 'Administrator PowerShell Window $($i + 1)' -ForegroundColor Green; " + `
                    "Write-Host 'Waiting 2 seconds before executing command...' -ForegroundColor Yellow; " + `
                    "Start-Sleep -Seconds 2; " + `
                    "Write-Host 'Executing command...' -ForegroundColor Cyan; " + `
                    "$randomCommand; " + `
                    "`$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size($Width, $Height)"
    
    # Launch the new window with credentials
    $processArgs = "-NoExit", "-Command", $commandString
    
    try {
        Start-Process `
            -FilePath "powershell.exe" `
            -ArgumentList $processArgs `
            -Credential $creds
            
        Write-Host "Started window $($i + 1)" -ForegroundColor Green
        
        # Add a small delay to prevent windows from overlapping during creation
        Start-Sleep -Milliseconds 500
    }
    catch {
        Write-Error "Failed to start window $($i + 1): $_"
    }
}

Write-Host "Created $WindowCount administrator PowerShell windows" -ForegroundColor Green