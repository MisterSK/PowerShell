# Tier 2 Medium Risk Bets Randomizer
# This script runs 20,000 iterations to generate a random score for each horse
# Lower scores indicate horses that could potentially be excluded

$Vanillier = 0
$PercevalLegallois = 0
$KandooKid = 0
$NickRockett = 0
$SeniorChief = 0

# Run 20,000 iterations
for($i=1; $i -le 20000; $i += 1){
    # Generate a random number between 0 and 1000
    # Using a weighted system where higher values are more likely for longer odds horses
    $randomValue = Get-Random -Maximum 1000 -Minimum 0
    
    # Distribute the counts based on odds and potential
    if($randomValue -lt 150) {
        $Vanillier += 1  # 10-1 odds
    }
    elseif($randomValue -ge 150 -and $randomValue -lt 320) {
        $PercevalLegallois += 1   # 12-1 odds
    }
    elseif($randomValue -ge 320 -and $randomValue -lt 550) {
        $KandooKid += 1       # 20-1 odds
    }
    elseif($randomValue -ge 550 -and $randomValue -lt 775) {
        $NickRockett += 1      # 25-1 odds
    }
    elseif($randomValue -ge 775) {
        $SeniorChief += 1  # 25-1 odds
    }
    
    # Display progress every 5000 iterations
    if($i % 5000 -eq 0) {
        Write-Host "Progress: $i iterations completed"
    }
}

# Display the results with a clear divider
Write-Host "`n================ TIER 2 MEDIUM RISK BETS RESULTS ================`n" -ForegroundColor Blue

# Create a sorted array of results
$results = @(
    [PSCustomObject]@{Horse = "Vanillier (10-1)"; Count = $Vanillier; Odds = "10-1"; Stake = "£30"}
    [PSCustomObject]@{Horse = "Perceval Legallois (12-1)"; Count = $PercevalLegallois; Odds = "12-1"; Stake = "£30"}
    [PSCustomObject]@{Horse = "Kandoo Kid (20-1)"; Count = $KandooKid; Odds = "20-1"; Stake = "£30"}
    [PSCustomObject]@{Horse = "Nick Rockett (25-1)"; Count = $NickRockett; Odds = "25-1"; Stake = "£30"}
    [PSCustomObject]@{Horse = "Senior Chief (25-1)"; Count = $SeniorChief; Odds = "25-1"; Stake = "£30"}
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
Write-Host "If you need to reduce your medium risk bets, consider excluding the horses with the lowest counts."