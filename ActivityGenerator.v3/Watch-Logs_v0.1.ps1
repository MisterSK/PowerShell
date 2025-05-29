# Watch-Logs.ps1
function Get-NextRefreshInterval {
    param (
        [hashtable]$RefreshConfig
    )
    
    $minSeconds = switch ($RefreshConfig.MinInterval.Unit) {
        "Seconds" { $RefreshConfig.MinInterval.Value }
        "Minutes" { $RefreshConfig.MinInterval.Value * 60 }
        "Hours" { $RefreshConfig.MinInterval.Value * 3600 }
    }
    
    $maxSeconds = switch ($RefreshConfig.MaxInterval.Unit) {
        "Seconds" { $RefreshConfig.MaxInterval.Value }
        "Minutes" { $RefreshConfig.MaxInterval.Value * 60 }
        "Hours" { $RefreshConfig.MaxInterval.Value * 3600 }
    }
    
    return Get-Random -Minimum $minSeconds -Maximum $maxSeconds
}

function Get-UpdatedConfiguration {
    param (
        [string]$ConfigPath
    )
    
    try {
        # Create a temporary empty configuration
        $newConfig = @{}
        
        # Source the configuration file
        . $ConfigPath
        
        # Return the new configuration
        return $config
    }
    catch {
        Write-Warning "Error reading configuration file: $_"
        return $null
    }
}

function Compare-Configurations {
    param (
        [hashtable]$OldConfig,
        [hashtable]$NewConfig
    )
    
    $changes = @{
        WatchFolders = Compare-Object -ReferenceObject $OldConfig.WatchFolders -DifferenceObject $NewConfig.WatchFolders
        FilePatterns = Compare-Object -ReferenceObject $OldConfig.FilePatterns -DifferenceObject $NewConfig.FilePatterns
        ConfigRefresh = ($OldConfig.ConfigRefresh | ConvertTo-Json) -ne ($NewConfig.ConfigRefresh | ConvertTo-Json)
    }
    
    return $changes
}

function Start-LogTail {
    param (
        [hashtable]$Configuration
    )

    $nextConfigCheck = Get-NextRefreshInterval -RefreshConfig $Configuration.ConfigRefresh
    $lastConfigCheck = Get-Date
    $currentConfig = $Configuration.Clone()
    
    function Get-FilesToMonitor {
        param (
            [string[]]$WatchFolders,
            [string[]]$FilePatterns
        )
        
        $files = @()
        foreach ($folder in $WatchFolders) {
            if (Test-Path $folder) {
                foreach ($pattern in $FilePatterns) {
                    $files += Get-ChildItem -Path $folder -Filter $pattern -Recurse |
                        Where-Object { !$_.PSIsContainer } |
                        Select-Object -ExpandProperty FullName
                }
            }
            else {
                Write-Warning "Path not found: $folder"
            }
        }
        return $files
    }

    function Start-FileMonitoringJobs {
        param (
            [string[]]$Files,
            [hashtable]$Config
        )
        
        return $Files | ForEach-Object {
            $path = $_
            Start-Job -ScriptBlock {
                $timestamp = if ($using:Config.IncludeTimestamp) {
                    "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
                } else { "" }
                
                try {
                    Get-Content -Wait -Tail $using:Config.TailLines $using:path | ForEach-Object {
                        if ($using:Config.IncludeTimestamp) {
                            "$timestamp [$using:path] $_"
                        } else {
                            "[$using:path] $_"
                        }
                    }
                }
                catch {
                    Write-Warning "Error monitoring $using:path : $_"
                }
            }
        }
    }

    Write-Host "Initial configuration loaded. Will check for updates every $nextConfigCheck seconds"
    $jobs = $null
    
    try {
        while ($true) {
            $now = Get-Date
            
            # Check if it's time to refresh configuration
            if ($now.Subtract($lastConfigCheck).TotalSeconds -ge $nextConfigCheck) {
                Write-Host "Checking for configuration updates..."
                
                $newConfig = Get-UpdatedConfiguration -ConfigPath $Configuration.ConfigPath
                if ($newConfig) {
                    $changes = Compare-Configurations -OldConfig $currentConfig -NewConfig $newConfig
                    
                    if ($changes.WatchFolders -or $changes.FilePatterns) {
                        Write-Host "Configuration changes detected. Restarting file monitoring..."
                        
                        # Clean up existing jobs
                        if ($jobs) {
                            $jobs | Stop-Job
                            $jobs | Remove-Job -Force
                        }
                        
                        # Update current configuration
                        $currentConfig = $newConfig.Clone()
                        
                        # Start new monitoring jobs
                        $filesToMonitor = Get-FilesToMonitor -WatchFolders $currentConfig.WatchFolders -FilePatterns $currentConfig.FilePatterns
                        $jobs = Start-FileMonitoringJobs -Files $filesToMonitor -Config $currentConfig
                        
                        Write-Host "Monitoring restarted with updated configuration"
                    }
                    
                    # Update next check interval
                    $nextConfigCheck = Get-NextRefreshInterval -RefreshConfig $newConfig.ConfigRefresh
                    Write-Host "Next configuration check in $nextConfigCheck seconds"
                }
                
                $lastConfigCheck = $now
            }
            
            # Process current jobs
            if ($jobs) {
                $jobs | Receive-Job
                
                # Check for failed jobs
                $jobs | Where-Object { $_.State -eq 'Completed' -or $_.State -eq 'Failed' } | ForEach-Object {
                    Write-Warning "Job for file monitoring ended unexpectedly. Restarting..."
                    $jobs = $jobs | Where-Object { $_.Id -ne $_.Id }
                }
            }
            
            Start-Sleep -Milliseconds $currentConfig.RefreshInterval
        }
    }
    finally {
        # Cleanup
        if ($jobs) {
            $jobs | Stop-Job
            $jobs | Remove-Job -Force
            Write-Host "`nStopped monitoring all files"
        }
    }
}

# Start monitoring with configuration
Start-LogTail -Configuration $config