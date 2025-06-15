<#
.SYNOPSIS
    A configurable countdown timer that displays real-time updates.

.DESCRIPTION
    Start-Countdown is a PowerShell function that creates a countdown timer with 
    color-coded display. The timer can be configured to count down from a specified 
    number of seconds, minutes, or a combination of minutes and seconds.

.PARAMETER Duration
    Specifies the duration for the countdown.
    
.PARAMETER Type
    Specifies the unit of time for the Duration parameter.
    Valid values are: 'seconds', 'minutes'
    
.PARAMETER Minutes
    Specifies the number of minutes for the countdown when using minutes and seconds together.
    
.PARAMETER Seconds
    Specifies the number of seconds for the countdown when using minutes and seconds together.
    
.PARAMETER Message
    Specifies the message to display during the countdown.

.EXAMPLE
    Start-Countdown -Duration 30 -Type seconds -Message "Time until break"
    
    Counts down from 30 seconds with the message "Time until break"

.EXAMPLE
    Start-Countdown -Minutes 2 -Seconds 30 -Message "Pizza will be ready in"
    
    Counts down from 2 minutes and 30 seconds with the message "Pizza will be ready in"

.EXAMPLE
    Start-Countdown -Duration 5 -Type minutes -Message "Meeting starts in"
    
    Counts down from 5 minutes with the message "Meeting starts in"

.NOTES
    Author: AI Assistant
    Date: June 15, 2025
#>

function Start-Countdown {
    [CmdletBinding(DefaultParameterSetName='ByDuration')]
    param (
        [Parameter(Mandatory=$true, ParameterSetName='ByDuration')]
        [ValidateRange(1, [int]::MaxValue)]
        [int]$Duration,
        
        [Parameter(Mandatory=$true, ParameterSetName='ByDuration')]
        [ValidateSet('seconds', 'minutes')]
        [string]$Type,
        
        [Parameter(Mandatory=$true, ParameterSetName='ByMinSec')]
        [ValidateRange(0, [int]::MaxValue)]
        [int]$Minutes,
        
        [Parameter(Mandatory=$true, ParameterSetName='ByMinSec')]
        [ValidateRange(0, 59)]
        [int]$Seconds,
        
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Message
    )
    
    begin {
        try {
            # Calculate total seconds based on parameter set
            if ($PSCmdlet.ParameterSetName -eq 'ByDuration') {
                $totalSeconds = if ($Type -eq 'minutes') { $Duration * 60 } else { $Duration }
            }
            else {
                # Ensure at least one of Minutes or Seconds is greater than 0
                if ($Minutes -eq 0 -and $Seconds -eq 0) {
                    throw "At least one of -Minutes or -Seconds must be greater than 0."
                }
                $totalSeconds = ($Minutes * 60) + $Seconds
            }
            
            # Store original console color
            $origColor = $Host.UI.RawUI.ForegroundColor
        }
        catch {
            Write-Error "Error initializing countdown: $_"
            return
        }
    }
    
    process {
        try {
            # Set up trap for Ctrl+C
            trap [System.Management.Automation.PipelineStoppedException] {
                Write-Host "`nCountdown cancelled." -ForegroundColor $origColor
                $Host.UI.RawUI.ForegroundColor = $origColor
                break
            }
            
            # Display the countdown message
            Write-Host $Message -ForegroundColor Cyan
            
            # Run the countdown loop
            for ($remaining = $totalSeconds; $remaining -gt 0; $remaining--) {
                # Calculate minutes and seconds for display
                $mm = [int]($remaining / 60)
                $ss = $remaining % 60
                
                # Determine color based on remaining time
                $color = if ($remaining -le 10) { 'Red' } else { 'Yellow' }
                
                # Display the countdown timer
                Write-Host ("`r{0:00}:{1:00}" -f $mm, $ss) -ForegroundColor $color -NoNewline
                
                # Wait for 1 second
                Start-Sleep -Seconds 1
            }
            
            # Emit system beep
            [Console]::Beep(800, 300)
            
            # Display completion
            Write-Host "`r00:00  " -ForegroundColor Green -NoNewline
            Write-Host "`nCountdown complete!" -ForegroundColor Green
        }
        catch {
            Write-Error "Error during countdown: $_"
        }
        finally {
            # Reset console color
            $Host.UI.RawUI.ForegroundColor = $origColor
        }
    }
}

# Export the function if being imported as a module
if ($MyInvocation.InvocationName -ne '.') {
    Export-ModuleMember -Function Start-Countdown
}

