#Requires -Version 5.1
<#
.SYNOPSIS
    Enhanced Cowsay for PowerShell with configuration support and countdown timer
.DESCRIPTION
    This script emulates the functionality of cowsay, fortune, and toilet utilities in PowerShell.
    It displays random quotes with colorful ASCII art animals at configurable intervals,
    with a dynamic countdown timer showing time until the next message.
.NOTES
    Author: Claude
    Version: 1.1
#>

# Script parameters (can be overridden by config file)
param(
    [string]$ConfigPath = "$env:USERPROFILE\.cowsay_config.psd1"
)

#region Functions

function Setup-CustomModules {
    <#
    .SYNOPSIS
        Sets up the custom PSCowSay and PSFortune modules
    #>
    # Get the script's directory path - ensure it works even when called with relative paths
    $scriptPath = $MyInvocation.MyCommand.Path
    $scriptDir = if ($scriptPath) { Split-Path -Parent $scriptPath } else { $PWD.Path }
    
    Write-Host "Script directory is: $scriptDir" -ForegroundColor Cyan
    Write-Host "Setting up required custom modules..." -ForegroundColor Cyan
    
    # Check if PSCowSay module exists in the script directory
    $psCowSayPath = Join-Path -Path $scriptDir -ChildPath "PSCowSay.psm1"
    if (-not (Test-Path -Path $psCowSayPath)) {
        Write-Host "PSCowSay module not found at: $psCowSayPath" -ForegroundColor Yellow
        Write-Host "Please make sure PSCowSay.psm1 is in the same directory as this script." -ForegroundColor Yellow
        return $false
    }
    
    # Check if PSFortune module exists in the script directory
    $psfortunePath = Join-Path -Path $scriptDir -ChildPath "PSFortune.psm1"
    if (-not (Test-Path -Path $psfortunePath)) {
        Write-Host "PSFortune module not found at: $psfortunePath" -ForegroundColor Yellow
        Write-Host "Please make sure PSFortune.psm1 is in the same directory as this script." -ForegroundColor Yellow
        return $false
    }
    
    # Import the modules directly from the script directory
    try {
        Write-Host "Importing PSCowSay module from: $psCowSayPath" -ForegroundColor Cyan
        Import-Module -Name $psCowSayPath -Force -ErrorAction Stop
        
        Write-Host "Importing PSFortune module from: $psfortunePath" -ForegroundColor Cyan
        Import-Module -Name $psfortunePath -Force -ErrorAction Stop
        
        Write-Host "Custom modules imported successfully." -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Failed to import custom modules: $_" -ForegroundColor Red
        return $false
    }
}

function New-DefaultConfig {
    <#
    .SYNOPSIS
        Creates a default configuration file if one doesn't exist
    #>
    if (-not (Test-Path -Path $ConfigPath)) {
        Write-Host "Creating default configuration file at $ConfigPath" -ForegroundColor Cyan
        
        $defaultConfig = @"
@{
    # Time interval in minutes
    MinInterval = 4
    MaxInterval = 15
    
    # Number of cow templates to use (0 = all)
    CowCount = 0
    
    # Fortune settings
    FortuneType = "All"           # Options: All, Wisdom, Funny, Literature, Technology, Motivation
    FortuneLength = "Short"       # Options: Short, Medium, Long
    
    # Display settings
    ColorScheme = "Rainbow"       # Options: Rainbow, BlueGreen, RedYellow, Random
    ShowInterval = `$true
    ClearScreen = `$true
    UpdateFrequency = 1           # How often to update the countdown timer (in seconds)
    
    # Custom cow templates folder (leave empty to use default)
    # CustomCowPath = "C:\Path\To\Custom\Cows"
    CustomCowPath = ""
    
    # Custom fortune files (leave empty to use default)
    # CustomFortunePath = "C:\Path\To\Custom\Fortunes"
    CustomFortunePath = ""
}
"@
        $defaultConfig | Out-File -FilePath $ConfigPath -Encoding utf8
    }
    else {
        Write-Host "Configuration file already exists at $ConfigPath" -ForegroundColor Green
    }
}

function Get-CowsayConfig {
    <#
    .SYNOPSIS
        Loads the configuration file or creates a default one
    #>
    # Create default config if it doesn't exist
    New-DefaultConfig
    
    # Load the configuration
    try {
        $config = Import-PowerShellDataFile -Path $ConfigPath
        Write-Host "Configuration loaded successfully from $ConfigPath" -ForegroundColor Green
        
        # Add default value for UpdateFrequency if not present (for backward compatibility)
        if (-not $config.ContainsKey('UpdateFrequency')) {
            $config['UpdateFrequency'] = 1
        }
        
        return $config
    }
    catch {
        Write-Host "Error loading configuration file: $_" -ForegroundColor Red
        Write-Host "Using default settings" -ForegroundColor Yellow
        
        return @{
            MinInterval = 4
            MaxInterval = 15
            CowCount = 0
            FortuneType = "All"
            FortuneLength = "Short"
            ColorScheme = "Rainbow"
            ShowInterval = $true
            ClearScreen = $true
            UpdateFrequency = 1
            CustomCowPath = ""
            CustomFortunePath = ""
        }
    }
}

function Get-RandomCow {
    <#
    .SYNOPSIS
        Gets a random cow template name
    .PARAMETER Config
        The configuration object
    #>
    param (
        [hashtable]$Config
    )
    
    # Get all available cows
    $allCows = Get-PSCowSayList
    
    # If there's a custom cow path and it exists, add custom cows
    if (-not [string]::IsNullOrEmpty($Config.CustomCowPath) -and (Test-Path -Path $Config.CustomCowPath)) {
        $customCows = Get-ChildItem -Path $Config.CustomCowPath -Filter "*.cow" | 
                      ForEach-Object { [System.IO.Path]::GetFileNameWithoutExtension($_.Name) }
        $allCows += $customCows
    }
    
    # Remove duplicates
    $allCows = $allCows | Select-Object -Unique
    
    # If CowCount is specified and not 0, select a random subset
    if ($Config.CowCount -gt 0 -and $Config.CowCount -lt $allCows.Count) {
        $selectedCows = $allCows | Get-Random -Count $Config.CowCount
    }
    else {
        $selectedCows = $allCows
    }
    
    # Return a random cow from the selected set
    return $selectedCows | Get-Random
}

function Get-RandomFortune {
    <#
    .SYNOPSIS
        Gets a random fortune quote
    .PARAMETER Config
        The configuration object
    #>
    param (
        [hashtable]$Config
    )
    
    $fortuneParams = @{}
    
    # Set fortune type
    if ($Config.FortuneType -ne "All") {
        $fortuneParams.Category = $Config.FortuneType
    }
    
    # Set fortune length
    switch ($Config.FortuneLength) {
        "Short" { $fortuneParams.MaxLength = 100 }
        "Medium" { $fortuneParams.MaxLength = 200 }
        "Long" { $fortuneParams.MaxLength = 500 }
    }
    
    # Use custom fortune path if specified
    if (-not [string]::IsNullOrEmpty($Config.CustomFortunePath) -and (Test-Path -Path $Config.CustomFortunePath)) {
        $fortuneParams.CustomPath = $Config.CustomFortunePath
    }
    
    # Get a random fortune
    $fortune = Get-PSFortune @fortuneParams
    
    return $fortune
}

function Format-TimeRemaining {
    <#
    .SYNOPSIS
        Formats a total number of seconds into a readable time string
    .PARAMETER TotalSeconds
        The total number of seconds to format
    #>
    param (
        [int]$TotalSeconds
    )
    
    $hours = [math]::Floor($TotalSeconds / 3600)
    $minutes = [math]::Floor(($TotalSeconds % 3600) / 60)
    $seconds = $TotalSeconds % 60
    
    if ($hours -gt 0) {
        return "{0:00}:{1:00}:{2:00}" -f $hours, $minutes, $seconds
    }
    else {
        return "{0:00}:{1:00}" -f $minutes, $seconds
    }
}

function Show-EnhancedCowsay {
    <#
    .SYNOPSIS
        Displays a colorized cowsay message with countdown timer
    .PARAMETER Config
        The configuration object
    #>
    param (
        [hashtable]$Config
    )
    
    # Get a random interval
    $intervalSeconds = Get-Random -Minimum ($Config.MinInterval * 60) -Maximum (($Config.MaxInterval * 60) + 1)
    
    # Get a random cow
    $cow = Get-RandomCow -Config $Config
    
    # Get a random fortune
    $fortune = Get-RandomFortune -Config $Config
    
    # Get cowsay output
    $cowsayOutput = Invoke-PSCowSay -Message $fortune -Cow $cow
    
    # Split the output into lines for colorization
    $lines = $cowsayOutput -split "`n"
    
    # Prepare color array based on the color scheme
    $colors = switch ($Config.ColorScheme) {
        "Rainbow" { @("Red", "Yellow", "Green", "Cyan", "Blue", "Magenta") }
        "BlueGreen" { @("Blue", "Cyan", "Green", "DarkCyan", "DarkBlue", "DarkGreen") }
        "RedYellow" { @("Red", "Yellow", "DarkRed", "DarkYellow") }
        "Random" { @("Red", "Yellow", "Green", "Cyan", "Blue", "Magenta", 
                     "DarkRed", "DarkYellow", "DarkGreen", "DarkCyan", "DarkBlue", "DarkMagenta") }
        default { @("White") }
    }
    
    # Initialize the countdown timer
    $startTime = Get-Date
    $endTime = $startTime.AddSeconds($intervalSeconds)
    $updateFrequency = $Config.UpdateFrequency
    
    # Main display loop
    while ((Get-Date) -lt $endTime) {
        # Clear screen if configured
        if ($Config.ClearScreen) {
            Clear-Host
        }
        
        # Calculate time remaining
        $timeRemaining = ($endTime - (Get-Date)).TotalSeconds
        if ($timeRemaining -lt 0) { $timeRemaining = 0 }
        
        # Format countdown display
        $countdown = Format-TimeRemaining -TotalSeconds $timeRemaining
        
        # Display header with countdown
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host "Enhanced PowerShell Cowsay" -ForegroundColor Magenta
        Write-Host "Next message in: " -ForegroundColor Yellow -NoNewline
        Write-Host $countdown -ForegroundColor White -BackgroundColor DarkGray
        Write-Host "Using cow template: $cow" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host ""
        
        # Display the colorized cowsay
        for ($i = 0; $i -lt $lines.Count; $i++) {
            # Determine color based on the scheme
            if ($Config.ColorScheme -eq "Random") {
                $color = $colors | Get-Random
            }
            else {
                $color = $colors[$i % $colors.Count]
            }
            
            Write-Host $lines[$i] -ForegroundColor $color
        }
        
        # Wait before updating the display
        Start-Sleep -Seconds $updateFrequency
    }
    
    # Return zero to indicate the timer has completed
    return 0
}

#endregion

#region Main Script

# Main function
function Start-EnhancedCowsay {
    # Setup the custom modules
    $modulesReady = Setup-CustomModules
    if (-not $modulesReady) {
        Write-Host "Failed to set up required modules. Please ensure the PSCowSay.psm1 and PSFortune.psm1 files are in the same directory as this script." -ForegroundColor Red
        return
    }
    
    # Load configuration
    $config = Get-CowsayConfig
    
    # Display welcome message
    Write-Host "Enhanced PowerShell Cowsay Starting..." -ForegroundColor Magenta
    Write-Host "Press Ctrl+C to exit at any time" -ForegroundColor Yellow
    Start-Sleep -Seconds 2
    
    # Main loop
    try {
        while ($true) {
            # Show cowsay with countdown timer
            $result = Show-EnhancedCowsay -Config $config
            
            # No need to sleep after the function since the countdown already handles the timing
        }
    }
    catch {
        Write-Host "Enhanced PowerShell Cowsay terminated: $_" -ForegroundColor Red
    }
}

# Start the script
Start-EnhancedCowsay

#endregion