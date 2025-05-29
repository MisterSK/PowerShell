# Import necessary assemblies for Windows Forms and Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Function to get screen dimensions
function Get-ScreenResolution {
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen
    return @{
        Width = $screen.Bounds.Width
        Height = $screen.Bounds.Height
    }
}

# Function to move mouse to random position
function Move-MouseRandom {
    $screen = Get-ScreenResolution
    $x = Get-Random -Minimum 0 -Maximum $screen.Width
    $y = Get-Random -Minimum 0 -Maximum $screen.Height
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
}

# Function to move Notepad window
function Move-NotepadWindow {
    $notepad = Get-Process notepad -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($notepad) {
        # Get the main window handle
        $windowHandle = $notepad.MainWindowHandle
        
        if ($windowHandle) {
            # Import required Windows API functions
            $signature = @'
            [DllImport("user32.dll")]
            public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
            
            [DllImport("user32.dll")]
            public static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
            
            [StructLayout(LayoutKind.Sequential)]
            public struct RECT
            {
                public int Left;
                public int Top;
                public int Right;
                public int Bottom;
            }
'@
            Add-Type -MemberDefinition $signature -Name WinAPI -Namespace Win32
            
            # Get current window size
            $rect = New-Object Win32.WinAPI+RECT
            [Win32.WinAPI]::GetWindowRect($windowHandle, [ref]$rect)
            $width = $rect.Right - $rect.Left
            $height = $rect.Bottom - $rect.Top
            
            # Get screen resolution
            $screen = Get-ScreenResolution
            
            # Calculate random position (leaving margin for window visibility)
            $maxX = $screen.Width - $width
            $maxY = $screen.Height - $height
            $newX = Get-Random -Minimum 0 -Maximum $maxX
            $newY = Get-Random -Minimum 0 -Maximum $maxY
            
            # Move the window
            [Win32.WinAPI]::MoveWindow($windowHandle, $newX, $newY, $width, $height, $true)
        }
    }
}

# Function to get random interval in milliseconds
function Get-RandomInterval {
    param (
        [int]$MinMinutes,
        [int]$MaxMinutes
    )
    return (Get-Random -Minimum ($MinMinutes * 60 * 1000) -Maximum ($MaxMinutes * 60 * 1000))
}

Write-Host "Starting activity simulation..."
Write-Host "Press Ctrl+C to stop the script"

# Initialize timing variables
$lastMouseMove = Get-Date
$lastWindowMove = Get-Date
$mouseInterval = Get-RandomInterval -MinMinutes 5 -MaxMinutes 10
$windowInterval = Get-RandomInterval -MinMinutes 6 -MaxMinutes 12

# Main loop
try {
    while ($true) {
        $now = Get-Date
        
        # Check if it's time to move the mouse
        if (($now - $lastMouseMove).TotalMilliseconds -ge $mouseInterval) {
            Move-MouseRandom
            $lastMouseMove = $now
            $mouseInterval = Get-RandomInterval -MinMinutes 5 -MaxMinutes 10
            Write-Host "Mouse moved at $now. Next move in $([math]::Round($mouseInterval/60000, 2)) minutes"
        }
        
        # Check if it's time to move the Notepad window
        if (($now - $lastWindowMove).TotalMilliseconds -ge $windowInterval) {
            Move-NotepadWindow
            $lastWindowMove = $now
            $windowInterval = Get-RandomInterval -MinMinutes 6 -MaxMinutes 12
            Write-Host "Notepad window moved at $now. Next move in $([math]::Round($windowInterval/60000, 2)) minutes"
        }
        
        # Sleep for a short time to prevent high CPU usage
        Start-Sleep -Milliseconds 500
    }
}
catch {
    Write-Host "`nScript interrupted. Exiting..."
}