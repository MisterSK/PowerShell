# Tier 3 High Risk Bets Randomizer
# This script runs 20,000 iterations to generate a random score for each horse
# Lower scores indicate horses that could potentially be excluded from your longshot bets

$CelebreDAllen = 0
$RoyalePagaille = 0
$IdasBoy = 0
$FilDor = 0

# Run 20,000 iterations
for($i=1; $i -le 20000; $i += 1){
    # Generate a random number between 0 and 2000
    # Using a very wide range to reflect the longer odds and higher variance
    $randomValue = Get-Random -Maximum 2000 -Minimum 0
    
    # Distribute the counts based on odds and other factors
    # For high risk bets, we're creating a much wider spread of possibilities
    if($randomValue -lt 400) {
        $CelebreDAllen += 1  # 150-1 odds (most extreme longshot)
    }
    elseif($randomValue -ge 400 -and $randomValue -lt 850) {
        $RoyalePagaille += 1   # 125-1 odds
    }
    elseif($randomValue -ge 850 -and $randomValue -lt 1400) {
        $IdasBoy += 1       # 100-1 odds
    }
    elseif($randomValue -ge 1400) {
        $FilDor += 1      # 100-1 odds
    }
    
    # Display progress every 5000 iterations
    if($i % 5000 -eq 0) {
        Write-Host "Progress: $i iterations completed"
    }
}

# Display the results with a clear divider
Write-Host "`n================ TIER 3 HIGH RISK BETS RESULTS ================`n" -ForegroundColor Magenta

# Create a sorted array of results
$results = @(
    [PSCustomObject]@{Horse = "Celebre D'Allen (150-1)"; Count = $CelebreDAllen; Odds = "150-1"; Stake = "£25"; PotentialReturn = "£3,750"}
    [PSCustomObject]@{Horse = "Royale Pagaille (125-1)"; Count = $RoyalePagaille; Odds = "125-1"; Stake = "£25"; PotentialReturn = "£3,125"}
    [PSCustomObject]@{Horse = "Idas Boy (100-1)"; Count = $IdasBoy; Odds = "100-1"; Stake = "£25"; PotentialReturn = "£2,500"}
    [PSCustomObject]@{Horse = "Fil Dor (100-1)"; Count = $FilDor; Odds = "100-1"; Stake = "£25"; PotentialReturn = "£2,500"}
)

# Sort by count (ascending)
$sortedResults = $results | Sort-Object Count

# Display the sorted results
$sortedResults | Format-Table -AutoSize

# Add potential returns information
$sortedByReturn = $results | Sort-Object -Property @{Expression={[int]($_.PotentialReturn -replace "[£,]", "")}; Descending=$true}

# Recommendation based on counts and potential returns
Write-Host "RECOMMENDATION:" -ForegroundColor Yellow
Write-Host "Consider excluding:" -ForegroundColor Yellow
foreach($horse in $sortedResults | Select-Object -First 2) {
    Write-Host " - $($horse.Horse) (lowest count: $($horse.Count))" -ForegroundColor Yellow
}

Write-Host "`nHowever, if keeping highest potential returns is your priority:" -ForegroundColor Cyan
Write-Host " - Keep $($sortedByReturn[0].Horse) and $($sortedByReturn[1].Horse) for highest return potential" -ForegroundColor Cyan

Write-Host "`nTotal iterations: $i"
Write-Host "Note: For high risk bets, the count differences may be more pronounced due to the extreme odds."
Write-Host "Consider your risk tolerance when making the final decision on which longshots to back."