# Grand National Betting Randomizer
# This script runs simulations for all 14 horses across all tiers
# Results will help identify which horses to exclude from each tier

# Define horse arrays by tier - using plain numbers for stakes to avoid parsing issues
$tier1Horses = @{
    "I Am Maximus" = @{Odds = "6-1"; Count = 0; Stake = 75; Tier = 1}
    "Stumptown" = @{Odds = "8-1"; Count = 0; Stake = 63; Tier = 1}
    "Iroko" = @{Odds = "9-1"; Count = 0; Stake = 50; Tier = 1}
    "Hewick" = @{Odds = "10-1"; Count = 0; Stake = 38; Tier = 1}
    "Intense Raffles" = @{Odds = "10-1"; Count = 0; Stake = 25; Tier = 1}
}

$tier2Horses = @{
    "Vanillier" = @{Odds = "10-1"; Count = 0; Stake = 30; Tier = 2}
    "Perceval Legallois" = @{Odds = "12-1"; Count = 0; Stake = 30; Tier = 2}
    "Kandoo Kid" = @{Odds = "20-1"; Count = 0; Stake = 30; Tier = 2}
    "Nick Rockett" = @{Odds = "25-1"; Count = 0; Stake = 30; Tier = 2}
    "Senior Chief" = @{Odds = "25-1"; Count = 0; Stake = 30; Tier = 2}
}

$tier3Horses = @{
    "Celebre DAllen" = @{Odds = "150-1"; Count = 0; Stake = 25; Tier = 3; Return = 3750}
    "Royale Pagaille" = @{Odds = "125-1"; Count = 0; Stake = 25; Tier = 3; Return = 3125}
    "Idas Boy" = @{Odds = "100-1"; Count = 0; Stake = 25; Tier = 3; Return = 2500}
    "Fil Dor" = @{Odds = "100-1"; Count = 0; Stake = 25; Tier = 3; Return = 2500}
}

# Function to run a simulation for a tier
function Run-TierSimulation {
    param (
        [Parameter(Mandatory=$true)]
        [hashtable]$Horses,
        
        [Parameter(Mandatory=$true)]
        [int]$MaxRandom,
        
        [Parameter(Mandatory=$true)]
        [string]$TierName,
        
        [Parameter(Mandatory=$true)]
        [int]$Iterations
    )
    
    Write-Host "Starting simulation for $TierName..." -ForegroundColor Cyan
    
    # Get horse names as an array
    $horseNames = @($Horses.Keys)
    $horseCount = $horseNames.Count
    
    for($i=1; $i -le $Iterations; $i++) {
        # Generate a random number
        $randomValue = Get-Random -Maximum $MaxRandom -Minimum 0
        
        # Determine which range the random number falls into
        $rangeSize = $MaxRandom / $horseCount
        $selectedIndex = [Math]::Min([int]($randomValue / $rangeSize), $horseCount - 1)
        
        # Increment the count for the selected horse
        $selectedHorse = $horseNames[$selectedIndex]
        $Horses[$selectedHorse].Count++
        
        # Show progress
        if($i % 5000 -eq 0) {
            $percentage = [Math]::Round(($i / $Iterations) * 100)
            Write-Host "$TierName Progress: $percentage% complete" -ForegroundColor Gray
        }
    }
    
    # Add a small random factor to break ties
    foreach($horseName in $horseNames) {
        $Horses[$horseName].Count += Get-Random -Maximum 10 -Minimum 1
    }
}

# Display the results
function Show-TierResults {
    param (
        [Parameter(Mandatory=$true)]
        [hashtable]$Horses,
        
        [Parameter(Mandatory=$true)]
        [string]$TierName,
        
        [Parameter(Mandatory=$true)]
        [System.ConsoleColor]$Color
    )
    
    Write-Host "`n================ $TierName RESULTS ================`n" -ForegroundColor $Color
    
    # Convert hashtable to array and sort by count
    $results = @()
    foreach($horseName in $Horses.Keys) {
        $returnValue = if($Horses[$horseName].ContainsKey("Return")) { 
            "£" + $Horses[$horseName].Return 
        } else { 
            "N/A" 
        }
        
        $results += [PSCustomObject]@{
            Horse = "$horseName ($($Horses[$horseName].Odds))"
            Count = $Horses[$horseName].Count
            Odds = $Horses[$horseName].Odds
            Stake = "£" + $Horses[$horseName].Stake
            PotentialReturn = $returnValue
        }
    }
    
    # Sort and display
    $sortedResults = $results | Sort-Object Count
    $sortedResults | Format-Table -AutoSize
    
    # Recommendation
    Write-Host "RECOMMENDATION:" -ForegroundColor Yellow
    Write-Host "Consider excluding from $TierName :" -ForegroundColor Yellow
    foreach($horse in $sortedResults | Select-Object -First 2) {
        $horseName = $horse.Horse.Split('(')[0].Trim()
        Write-Host " - $horseName (lowest count: $($horse.Count))" -ForegroundColor Yellow
    }
}

# Function to generate summary recommendations
function Get-ExclusionRecommendations {
    param (
        [Parameter(Mandatory=$true)]
        [hashtable]$Tier1,
        
        [Parameter(Mandatory=$true)]
        [hashtable]$Tier2,
        
        [Parameter(Mandatory=$true)]
        [hashtable]$Tier3
    )
    
    # Get the bottom 2 from each tier
    $tier1Bottom = @($Tier1.GetEnumerator() | Sort-Object { $_.Value.Count } | Select-Object -First 2)
    $tier2Bottom = @($Tier2.GetEnumerator() | Sort-Object { $_.Value.Count } | Select-Object -First 2)
    $tier3Bottom = @($Tier3.GetEnumerator() | Sort-Object { $_.Value.Count } | Select-Object -First 2)
    
    # Calculate savings
    $tier1Savings = ($tier1Bottom | ForEach-Object { $_.Value.Stake } | Measure-Object -Sum).Sum
    $tier2Savings = ($tier2Bottom | ForEach-Object { $_.Value.Stake } | Measure-Object -Sum).Sum
    $tier3Savings = ($tier3Bottom | ForEach-Object { $_.Value.Stake } | Measure-Object -Sum).Sum
    
    $totalSavings = $tier1Savings + $tier2Savings + $tier3Savings
    
    Write-Host "Based on random simulations, here are horses to consider excluding:" -ForegroundColor White
    
    Write-Host "`nFrom Tier 1 (Safer Bets):" -ForegroundColor Green
    foreach($horse in $tier1Bottom) {
        Write-Host " - $($horse.Key) ($($horse.Value.Odds)) - Stake: £$($horse.Value.Stake)" -ForegroundColor White
    }
    
    Write-Host "`nFrom Tier 2 (Medium Risk):" -ForegroundColor Blue
    foreach($horse in $tier2Bottom) {
        Write-Host " - $($horse.Key) ($($horse.Value.Odds)) - Stake: £$($horse.Value.Stake)" -ForegroundColor White
    }
    
    Write-Host "`nFrom Tier 3 (High Risk):" -ForegroundColor Magenta
    foreach($horse in $tier3Bottom) {
        Write-Host " - $($horse.Key) ($($horse.Value.Odds)) - Stake: £$($horse.Value.Stake)" -ForegroundColor White
    }
    
    Write-Host "`nTotal potential savings: £$totalSavings" -ForegroundColor Yellow
    Write-Host "This would reduce your bet from £500 to £$(500-$totalSavings) across $(14-6) horses" -ForegroundColor Yellow
    
    # Alternative approach with just one horse from each tier
    Write-Host "`nALTERNATIVE BALANCED APPROACH:" -ForegroundColor Cyan
    Write-Host "If you want to exclude just 1 horse from each tier:" -ForegroundColor Cyan
    
    $tier1Lowest = $Tier1.GetEnumerator() | Sort-Object { $_.Value.Count } | Select-Object -First 1
    $tier2Lowest = $Tier2.GetEnumerator() | Sort-Object { $_.Value.Count } | Select-Object -First 1
    $tier3Lowest = $Tier3.GetEnumerator() | Sort-Object { $_.Value.Count } | Select-Object -First 1
    
    $balancedSavings = $tier1Lowest.Value.Stake + $tier2Lowest.Value.Stake + $tier3Lowest.Value.Stake
    
    Write-Host " - Tier 1: Exclude $($tier1Lowest.Key) (£$($tier1Lowest.Value.Stake))" -ForegroundColor Green
    Write-Host " - Tier 2: Exclude $($tier2Lowest.Key) (£$($tier2Lowest.Value.Stake))" -ForegroundColor Blue
    Write-Host " - Tier 3: Exclude $($tier3Lowest.Key) (£$($tier3Lowest.Value.Stake))" -ForegroundColor Magenta
    
    Write-Host "`nThis saves £$balancedSavings and keeps your spread across risk categories" -ForegroundColor Yellow
}

# Main script execution
$iterationsPerTier = 20000
Write-Host "Running Grand National betting simulations with $iterationsPerTier iterations per tier..." -ForegroundColor White

# Run simulations for each tier
Run-TierSimulation -Horses $tier1Horses -MaxRandom 500 -TierName "Tier 1 (Safer Bets)" -Iterations $iterationsPerTier
Run-TierSimulation -Horses $tier2Horses -MaxRandom 1000 -TierName "Tier 2 (Medium Risk)" -Iterations $iterationsPerTier
Run-TierSimulation -Horses $tier3Horses -MaxRandom 2000 -TierName "Tier 3 (High Risk)" -Iterations $iterationsPerTier

# Show results for each tier
Show-TierResults -Horses $tier1Horses -TierName "TIER 1 SAFER BETS" -Color Green
Show-TierResults -Horses $tier2Horses -TierName "TIER 2 MEDIUM RISK BETS" -Color Blue 
Show-TierResults -Horses $tier3Horses -TierName "TIER 3 HIGH RISK BETS" -Color Magenta

# Overall summary
Write-Host "`n================ OVERALL RECOMMENDATION ================`n" -ForegroundColor Cyan

# Show summary recommendations
Get-ExclusionRecommendations -Tier1 $tier1Horses -Tier2 $tier2Horses -Tier3 $tier3Horses

Write-Host "`nRemember: These are random simulations to help with your decision."
Write-Host "The most important factors are still your own research and intuition about the race."
Write-Host "Good luck with your Grand National betting!"