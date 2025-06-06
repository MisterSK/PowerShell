 $ladbrokes=0;
 $paddypower=0;
 $bet365=0;
 $i=0;
 for($i=1; $i -le 20000; $i += 1){
    $whichbet=(get-random -Maximum 300 -Minimum 0);
    if($whichbet -le 99){
        $ladbrokes += 1
    };
    if($whichbet -ge 100 -and $whichbet -le 199){
        $paddypower += 1
    };
    if($whichbet -ge 200){
        $bet365 += 1
    };
    Write-Host $whichbet
};
Write-Host "Ladbrokes: $ladbrokes";
Write-Host "PaddyPower: $paddypower"; 
Write-Host "Bet365: $bet365";