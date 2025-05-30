<#
.SYNOPSIS
    Provide a graphical countdown if you need to pause a script for a period of time
.PARAMETER Seconds
    Time, in seconds, that the function will pause
.PARAMETER Message
    Message you want displayed while waiting
.EXAMPLE
    Start-Countdown -Seconds 30 -Message "Please wait while Active Directory replicates data..."
.NOTES
    Author:            Martin Pugh
    Twitter:           @thesurlyadm1n
    Spiceworks:        Martin9700
    Blog:              www.thesurlyadmin.com
   
    Changelog:
       2.1             Fixed parameter conflict issue
       2.0             New release uses Write-Progress for graphical display while counting down.
       1.0             Initial Release
.LINK
    http://community.spiceworks.com/scripts/show/1712-start-countdown
#>

param(
    [Parameter(Mandatory=$true)]
    [Int32]$Seconds,
    [Parameter(Mandatory=$true)]
    [string]$Message
)

Function Start-Countdown {
    Param(
        [Int32]$CountdownSeconds,
        [string]$CountdownMessage
    )
    
    try {
        ForEach ($Count in (1..$CountdownSeconds)) {
            Write-Progress -Id 1 -Activity $CountdownMessage -Status "Waiting for $CountdownSeconds seconds, $($CountdownSeconds - $Count) left" -PercentComplete (($Count / $CountdownSeconds) * 100)
            Start-Sleep -Seconds 1
        }
        Write-Progress -Id 1 -Activity $CountdownMessage -Status "Completed" -PercentComplete 100 -Completed
        Write-Host "Countdown completed successfully" -ForegroundColor Green
    }
    catch {
        Write-Error "Countdown Error: $_"
        throw
    }
}

# Main execution
try {
    Write-Host "Starting countdown: $Message ($Seconds seconds)" -ForegroundColor Cyan
    Start-Countdown -CountdownSeconds $Seconds -CountdownMessage $Message
    Write-Host "Countdown finished. Proceeding..." -ForegroundColor Green
}
catch {
    Write-Error "Countdown failed: $_"
    exit 1
}