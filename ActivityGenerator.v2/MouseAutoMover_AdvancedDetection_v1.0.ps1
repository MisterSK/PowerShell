# Required for Windows Forms
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Function to get a random position on screen
function Get-RandomScreenPosition {
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    return @{
        X = Get-Random -Minimum 0 -Maximum ($screen.Width - 10)
        Y = Get-Random -Minimum 0 -Maximum ($screen.Height - 10)
    }
}

# Function to move notepad window
function Move-NotepadWindow {
    $notepad = Get-Process notepad -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($notepad) {
        $position = Get-RandomScreenPosition
        $handle = $notepad.MainWindowHandle
        
        # Get window size
        $rect = New-Object RECT
        [Window]::GetWindowRect($handle, [ref]$rect)
        $width = $rect.right - $rect.left
        $height = $rect.bottom - $rect.top
        
        # Ensure window stays within screen bounds
        $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
        $x = [Math]::Min($position.X, $screen.Width - $width)
        $y = [Math]::Min($position.Y, $screen.Height - $height)
        
        [Window]::MoveWindow($handle, $x, $y, $width, $height, $true)
    }
}

# Required Windows API definitions
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Window {
    [DllImport("user32.dll")]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
    
    [DllImport("user32.dll")]
    public static extern bool GetWindowRect(IntPtr hWnd, ref RECT lpRect);
}

public struct RECT {
    public int left;
    public int top;
    public int right;
    public int bottom;
}
"@

# Variables to track last activity
$lastMousePosition = [System.Windows.Forms.Cursor]::Position
$lastInputTime = Get-Date

# Main loop
while ($true) {
    # Generate random intervals
    $mouseInterval = Get-Random -Minimum 300 -Maximum 600  # 5-10 minutes in seconds
    $windowInterval = Get-Random -Minimum 360 -Maximum 720 # 6-12 minutes in seconds
    $timeToNextMouse = $mouseInterval
    $timeToNextWindow = $windowInterval
    
    # Reset times if activity detected
    $currentMousePosition = [System.Windows.Forms.Cursor]::Position
    if ($currentMousePosition -ne $lastMousePosition) {
        $timeToNextMouse = $mouseInterval
        $timeToNextWindow = $windowInterval
        $lastMousePosition = $currentMousePosition
        $lastInputTime = Get-Date
    }
    
    # Check for keyboard activity
    if ([System.Windows.Forms.Control]::IsKeyLocked('NumLock') -ne [System.Windows.Forms.Control]::IsKeyLocked('NumLock')) {
        $timeToNextMouse = $mouseInterval
        $timeToNextWindow = $windowInterval
        $lastInputTime = Get-Date
    }
    
    # Update progress bars
    Write-Progress -Id 1 -Activity "Time until next mouse movement" -Status "Seconds remaining:" -PercentComplete (($mouseInterval - $timeToNextMouse) / $mouseInterval * 100) -SecondsRemaining $timeToNextMouse
    Write-Progress -Id 2 -Activity "Time until next window movement" -Status "Seconds remaining:" -PercentComplete (($windowInterval - $timeToNextWindow) / $windowInterval * 100) -SecondsRemaining $timeToNextWindow
    
    # Move mouse if interval elapsed
    if ($timeToNextMouse -le 0) {
        $position = Get-RandomScreenPosition
        [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($position.X, $position.Y)
        $timeToNextMouse = $mouseInterval
    }
    
    # Move notepad window if interval elapsed
    if ($timeToNextWindow -le 0) {
        Move-NotepadWindow
        $timeToNextWindow = $windowInterval
    }
    
    # Wait 1 second before next check
    Start-Sleep -Seconds 1
    $timeToNextMouse--
    $timeToNextWindow--
}