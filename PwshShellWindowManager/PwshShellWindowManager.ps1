[CmdletBinding()]
param(
    [int]$WindowCount,
    [int]$Width,
    [int]$Height,
    [int]$StartX,
    [int]$StartY,
    [int]$Spacing,
    [string]$ConfigPath = ".\WindowConfig.json",
    [string]$CredsPath = ".\AdminCreds.xml"
)

# Function to load credentians configuration
# function Get-CredsConfig {
#     param([string]$CredsPath)
    
#     if (Test-Path $CredsPath) {
#         try {
#             $creds_config = Get-Content $CredsPath | ConvertFrom-Json
#             return $creds_config
#         } 
#         catch {
#             Write-Error "Error reading configuration file: $_"
#             exit 1
#         }
#     }
#     else {
#         Write-Error "Configuration file not found at: $creds_config"
#         exit 1
#     }
# }

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

# Load credentials
# $creds_config = Get-CredsConfig -ConfigPath $CredsPath

# Load configuration
$config = Get-WindowConfig -ConfigPath $ConfigPath

# Set values from parameters or defaults from config
$CredsPath = if ($CredsPath) { $CredsPath } else { $config.CredsPath }
$WindowCount = if ($WindowCount) { $WindowCount } else { $config.DefaultWindowCount }
$Width = if ($Width) { $Width } else { $config.WindowDefaults.DefaultWidth }
$Height = if ($Height) { $Height } else { $config.WindowDefaults.DefaultHeight }
$StartX = if ($StartX) { $StartX } else { $config.WindowDefaults.DefaultX }
$StartY = if ($StartY) { $StartY } else { $config.WindowDefaults.DefaultY }
$Spacing = if ($Spacing) { $Spacing } else { $config.WindowDefaults.Spacing }

# Verify credentials file exists
$CredsPath = $config.CredsPath
if (-not (Test-Path $CredsPath)) {
    Write-Error "Credentials file not found at: $CredsPath"
    exit 1
}

# Import credentials
try {
    $creds = Import-Clixml -Path $CredsPath
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
    
    $arguments = @(
        "-NoExit",
        "-Command",
        "& {",
        "$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size($Width, $Height);",
        "$host.UI.RawUI.WindowPosition = New-Object System.Management.Automation.Host.Coordinates($($position.X), $($position.Y));",
        "Write-Host 'Administrator PowerShell Window $($i + 1)' -ForegroundColor Green",
        "}"
    )
    
    Start-Process `
        -FilePath "powershell.exe" `
        -ArgumentList $arguments `
        -Credential $creds `
        -WorkingDirectory $PWD `
        -Verb RunAs
    
    # Add a small delay to prevent windows from overlapping during creation
    Start-Sleep -Milliseconds 500
}

Write-Host "Created $WindowCount administrator PowerShell windows" -ForegroundColor Green