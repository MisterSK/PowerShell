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

# Determine theme colors with fallback
$BackgroundColor = if ($config.Theme.BackgroundColor) { $config.Theme.BackgroundColor } else { 'Black' }
$ForegroundColor = if ($config.Theme.ForegroundColor) { $config.Theme.ForegroundColor } else { 'Green' }

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

# Create a temporary script that will be run in each window
$tempScriptPath = Join-Path $env:TEMP "WindowSetup_$(Get-Random).ps1"

# Create the PowerShell windows
for ($i = 0; $i -lt $WindowCount; $i++) {
    $position = Get-WindowPosition -Index $i -StartX $StartX -StartY $StartY -Spacing $Spacing
    
    # Select a random command from the config
    $randomCommand = $config.Commands | Get-Random
    
    # Create a temporary script with the commands for this window
    @"
# Set window title to show Administrator status
`$Host.UI.RawUI.WindowTitle = "Administrator: PowerShell Window $($i + 1)"

# Comprehensive function to set console colors
function Set-ConsoleTheme {
    param(
        [string]`$BackgroundColor = 'Black',
        [string]`$ForegroundColor = 'Green'
    )

    # Set console color
    try {
        # Method 1: Host UI RawUI colors
        `$Host.UI.RawUI.BackgroundColor = '$BackgroundColor'
        `$Host.UI.RawUI.ForegroundColor = '$ForegroundColor'

        # Method 2: Direct color setting
        `$console = `$Host.UI.RawUI
        `$console.BackgroundColor = '$BackgroundColor'
        `$console.ForegroundColor = '$ForegroundColor'

        # Method 3: Color method via console host
        if (`$host.Name -eq 'ConsoleHost') {
            `$rawUI = `$Host.UI.RawUI
            `$rawUI.BackgroundColor = '$BackgroundColor'
            `$rawUI.ForegroundColor = '$ForegroundColor'
        }

        # Clear host to apply colors
        Clear-Host
    }
    catch {
        Write-Warning "Could not set console colors: `$_"
    }
}

# Try to set window size using alternative method
function Set-WindowSize {
    param(`$width, `$height)
    try {
        mode.com con: cols=`$width lines=`$height
    } catch {
        Write-Warning "Could not set window size: `$_"
    }
}

# Set console theme
Set-ConsoleTheme

# Set initial window size
Set-WindowSize -width $Width -height $Height

# Forcibly set color again
`$Host.UI.RawUI.BackgroundColor = '$BackgroundColor'
`$Host.UI.RawUI.ForegroundColor = '$ForegroundColor'
Clear-Host

Write-Host 'Administrator PowerShell Window $($i + 1)' -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor
Write-Host 'Waiting 60 seconds before executing command...' -ForegroundColor Yellow -BackgroundColor $BackgroundColor
Start-Sleep -Seconds 60
Write-Host 'Executing command...' -ForegroundColor Cyan -BackgroundColor $BackgroundColor
$randomCommand
"@ | Out-File -FilePath $tempScriptPath -Force -Encoding UTF8

    # Launch the new window with credentials and Verb RunAs for proper elevation
    try {
        Start-Process `
            -FilePath "powershell.exe" `
            -ArgumentList "-NoExit", "-ExecutionPolicy", "Bypass", "-File", $tempScriptPath `
            -Credential $creds `
            # -Verb RunAs
            
        Write-Host "Started window $($i + 1)" -ForegroundColor Green
        
        # Add a small delay to prevent windows from overlapping during creation
        Start-Sleep -Milliseconds 1500
    }
    catch {
        Write-Error "Failed to start window $($i + 1): $_"
    }
}

# Add self-cleanup to the script content
$cleanupScript = @"
# Self-cleanup: Remove this script file after a brief delay
Start-Sleep -Seconds 5
Remove-Item -Path '$tempScriptPath' -Force -ErrorAction SilentlyContinue
"@

# Append cleanup to the temporary script
Add-Content -Path $tempScriptPath -Value $cleanupScript

Write-Host "Created $WindowCount administrator PowerShell windows" -ForegroundColor Green