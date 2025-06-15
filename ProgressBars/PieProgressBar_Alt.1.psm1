function Show-PieProgressBar1 {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Duration,
        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$ActivityName = "Operation in Progress",
        [Parameter(Mandatory = $false)]
        [switch]$ShowPercent
    )

    # Parse duration input
    if ($Duration -notmatch '^(\d+)(h|m|s)$') {
        throw "Invalid duration format. Use: ##h, ##m, or ##s (e.g., 1h, 30m, 45s)"
    }
    
    $value = [int]$matches[1]
    $timeSpan = switch ($matches[2]) {
        'h' { New-TimeSpan -Hours $value }
        'm' { New-TimeSpan -Minutes $value }
        's' { New-TimeSpan -Seconds $value }
    }

    # Configure progress indicators
    $pieEmojis = @{
        0   = "⭕"    # Empty circle
        25  = "🕐"    # Quarter filled
        50  = "🕕"    # Half filled
        75  = "🕘"    # Three-quarters filled
        100 = "⚫"    # Fully filled
    }

    $startTime = Get-Date
    $endTime = $startTime + $timeSpan
    $totalSeconds = $timeSpan.TotalSeconds
    $updateInterval = $totalSeconds / 100

    # Progress bar characters
    $progressChar = "█"
    $emptyChar = "░"
    $barLength = 50

    for ($i = 0; $i -le 100; $i++) {
        $currentTime = Get-Date
        $timeRemaining = $endTime - $currentTime
        
        # Alternative 1 - Using ToString directly
        $timeDisplay = $timeRemaining.ToString("hh\:mm\:ss")

        $currentPie = switch ($i) {
            { $_ -eq 0 }   { $pieEmojis[0] }
            { $_ -le 25 }  { $pieEmojis[25] }
            { $_ -le 50 }  { $pieEmojis[50] }
            { $_ -le 75 }  { $pieEmojis[75] }
            default        { $pieEmojis[100] }
        }

        $completedLength = [math]::Floor($i * $barLength / 100)
        $remainingLength = $barLength - $completedLength
        $progressBar = "$($progressChar * $completedLength)$($emptyChar * $remainingLength)"

        $percentDisplay = if ($ShowPercent) { " $i%" } else { "" }
        $status = "$currentPie [$progressBar]$percentDisplay - Time Remaining: $timeDisplay"

        Write-Progress -Activity $ActivityName -Status $status -PercentComplete $i

        if ($i -lt 100) {
            Start-Sleep -Seconds $updateInterval
        }
    }

    Write-Host "`n$($pieEmojis[100]) $ActivityName completed successfully!" -ForegroundColor Green
}