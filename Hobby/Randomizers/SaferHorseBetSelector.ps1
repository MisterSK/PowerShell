# Tier 1 Safer Bets Randomizer
# This script runs 20,000 iterations to generate a random score for each horse
# Lower scores indicate horses that could potentially be excluded

$IAmMaximus = 0
$Stumptown = 0
$Iroko = 0
$Hewick = 0
$IntenseRaffles = 0

# Run 20,000 iterations
for($i=1; $i -le 20000; $i += 1){
    # Generate a random number between 0 and 500
    # Using a weighted system where lower values are more likely for better odds horses
    $randomValue = Get-Random -Maximum 500 -Minimum 0
    
    # Distribute the counts based on odds (more ranges for better odds horses)
    if($randomValue -lt 120) {
        $IAmMaximus += 1  # 6-1 odds (largest range)
    }
    elseif($randomValue -ge 120 -and $randomValue -lt 220) {
        $Stumptown += 1   # 8-1 odds (second largest range)
    }
    elseif($randomValue -ge 220 -and $randomValue -lt 310) {
        $Iroko += 1       # 9-1 odds
    }
    elseif($randomValue -ge 310 -and $randomValue -lt 400) {
        $Hewick += 1      # 10-1 odds
    }
    elseif($randomValue -ge 400) {
        $IntenseRaffles += 1  # 10-1 odds
    }
    
    # Display progress every 5000 iterations
    if($i % 5000 -eq 0) {
        Write-Host "Progress: $i iterations completed"
    }
}

# Display the results with a clear divider
Write-Host "`n================ TIER 1 SAFER BETS RESULTS ================`n" -ForegroundColor Green

# Create a sorted array of results
$results = @(
    [PSCustomObject]@{Horse = "I Am Maximus (6-1)"; Count = $IAmMaximus; Odds = "6-1"; Stake = "£75"}
    [PSCustomObject]@{Horse = "Stumptown (8-1)"; Count = $Stumptown; Odds = "8-1"; Stake = "£63"}
    [PSCustomObject]@{Horse = "Iroko (9-1)"; Count = $Iroko; Odds = "9-1"; Stake = "£50"}
    [PSCustomObject]@{Horse = "Hewick (10-1)"; Count = $Hewick; Odds = "10-1"; Stake = "£38"}
    [PSCustomObject]@{Horse = "Intense Raffles (10-1)"; Count = $IntenseRaffles; Odds = "10-1"; Stake = "£25"}
)

# Sort by count (ascending)
$sortedResults = $results | Sort-Object Count

# Display the sorted results
$sortedResults | Format-Table -AutoSize

# Recommendation based on counts
Write-Host "RECOMMENDATION:" -ForegroundColor Yellow
Write-Host "Consider excluding:" -ForegroundColor Yellow
foreach($horse in $sortedResults | Select-Object -First 2) {
    Write-Host " - $($horse.Horse) (lowest count: $($horse.Count))" -ForegroundColor Yellow
}

Write-Host "`nTotal iterations: $i"
Write-Host "Note: Horses with lower counts appeared less frequently in the random sampling."
Write-Host "This could suggest excluding them from your betting strategy if you need to reduce your number of bets."