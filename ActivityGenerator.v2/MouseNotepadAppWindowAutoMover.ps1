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

# Function to check and start Notepad
function Ensure-NotepadRunning {
    $notepad = Get-Process notepad -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $notepad) {
        Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): Notepad not running. Starting Notepad..."
        Start-Process notepad
        Start-Sleep -Seconds 2  # Wait for Notepad to initialize
        $notepad = Get-Process notepad -ErrorAction SilentlyContinue | Select-Object -First 1
    }
    return $notepad
}

# Function to bring Notepad to foreground
function Set-NotepadForeground {
    param($notepad)
    
    if ($notepad) {
        $signature = @'
        [DllImport("user32.dll")]
        public static extern bool SetForegroundWindow(IntPtr hWnd);
        
        [DllImport("user32.dll")]
        public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
'@
        Add-Type -MemberDefinition $signature -Name WinAPIForeground -Namespace Win32
        
        # SW_RESTORE = 9 (restore window if minimized)
        [Win32.WinAPIForeground]::ShowWindow($notepad.MainWindowHandle, 9)
        [Win32.WinAPIForeground]::SetForegroundWindow($notepad.MainWindowHandle)
        Start-Sleep -Milliseconds 500  # Give Windows time to bring window to front
    }
}

# Function to move mouse to random position
function Move-MouseRandom {
    $screen = Get-ScreenResolution
    $x = Get-Random -Minimum 0 -Maximum $screen.Width
    $y = Get-Random -Minimum 0 -Maximum $screen.Height
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
}

# Enhanced function to move Notepad window
function Move-NotepadWindow {
    $notepad = Ensure-NotepadRunning
    if ($notepad) {
        Set-NotepadForeground $notepad
        
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

# Initial Notepad check
Write-Host "Performing initial Notepad check..."
$notepad = Ensure-NotepadRunning
if ($notepad) {
    Write-Host "Notepad is ready."
    Set-NotepadForeground $notepad
}

Write-Host "Starting activity simulation..."
Write-Host "Press Ctrl+C to stop the script"

# Initialize timing variables
$lastMouseMove = Get-Date
$lastWindowMove = Get-Date
$lastNotepadCheck = Get-Date
$mouseInterval = Get-RandomInterval -MinMinutes 5 -MaxMinutes 10
$windowInterval = Get-RandomInterval -MinMinutes 6 -MaxMinutes 12
$notepadCheckInterval = Get-RandomInterval -MinMinutes 2 -MaxMinutes 4  # Check Notepad every 2-4 minutes

# Main loop
try {
    while ($true) {
        $now = Get-Date
        
        # Periodic Notepad check
        if (($now - $lastNotepadCheck).TotalMilliseconds -ge $notepadCheckInterval) {
            $notepad = Ensure-NotepadRunning
            $lastNotepadCheck = $now
            $notepadCheckInterval = Get-RandomInterval -MinMinutes 2 -MaxMinutes 4
            Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): Notepad check completed"
        }
        
        # Check if it's time to move the mouse
        if (($now - $lastMouseMove).TotalMilliseconds -ge $mouseInterval) {
            Move-MouseRandom
            $lastMouseMove = $now
            $mouseInterval = Get-RandomInterval -MinMinutes 5 -MaxMinutes 10
            Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): Mouse moved. Next move in $([math]::Round($mouseInterval/60000, 2)) minutes"
        }
        
        # Check if it's time to move the Notepad window
        if (($now - $lastWindowMove).TotalMilliseconds -ge $windowInterval) {
            Move-NotepadWindow
            $lastWindowMove = $now
            $windowInterval = Get-RandomInterval -MinMinutes 6 -MaxMinutes 12
            Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): Notepad window moved. Next move in $([math]::Round($windowInterval/60000, 2)) minutes"
        }
        
        # Sleep for a short time to prevent high CPU usage
        Start-Sleep -Milliseconds 500
    }
}
catch {
    Write-Host "`nScript interrupted. Exiting..."
}