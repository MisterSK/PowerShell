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

# Add the Windows API code for window manipulation
$script:WindowManagement = @'
using System;
using System.Runtime.InteropServices;

public class WindowManagement {
    [DllImport("user32.dll")]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
    
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
    
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
}
'@

Add-Type -TypeDefinition $script:WindowManagement -Language CSharp

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
    
    $windowSetupScript = @"
        Write-Host 'Administrator PowerShell Window $($i + 1)' -ForegroundColor Green
        Write-Host 'Waiting 2 seconds before executing command...' -ForegroundColor Yellow
        Start-Sleep -Seconds 2
        Write-Host 'Executing: $randomCommand' -ForegroundColor Cyan
        $randomCommand

        # Get the current window handle and resize it
        `$handle = [WindowManagement]::GetForegroundWindow()
        [WindowManagement]::MoveWindow(`$handle, $($position.X), $($position.Y), $Width, $Height, `$true)
"@

    # Construct the script block as a single encoded command
    $scriptBlock = @"
        Add-Type -TypeDefinition @'
$script:WindowManagement
'@ -Language CSharp;
$windowSetupScript
"@
    
    # Convert the script to base64 to avoid escaping issues
    $bytes = [System.Text.Encoding]::Unicode.GetBytes($scriptBlock)
    $encodedCommand = [Convert]::ToBase64String($bytes)
    
    # Launch the new window with credentials
    Start-Process `
        -FilePath "powershell.exe" `
        -ArgumentList "-NoExit", "-EncodedCommand", $encodedCommand `
        -Credential $creds `
        -WorkingDirectory $PWD
    
    # Add a small delay to prevent windows from overlapping during creation
    Start-Sleep -Milliseconds 500
}

Write-Host "Created $WindowCount administrator PowerShell windows" -ForegroundColor Green