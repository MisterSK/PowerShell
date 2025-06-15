# config.ps1
$config = @{
    WatchFolders = @(
        "C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v3\Logs\2025\01\08"
    )
    FilePatterns = @(
        "*.log"
        # "*.txt"
    )
    TailLines = 10
    RefreshInterval = 100  # Milliseconds
    IncludeTimestamp = $true
    # Configuration refresh settings
    ConfigRefresh = @{
        MinInterval = @{
            Value = 5
            Unit = "Minutes"    # Seconds, Minutes, or Hours
        }
        MaxInterval = @{
            Value = 15
            Unit = "Minutes"
        }
    }
    ConfigPath = "C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v3\Config.ps1"  # Path to this config file
}