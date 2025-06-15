for($n = 1; $n -le 4){
    $num = Get-Random -Maximum 9 -Minimum 0;
    $seed_num = Get-Random -Maximum 14 -Minimum 7;
    $final_num = [Math]::Abs($num-$seed_num)
    Write-Host "PIN Number $n => $final_num";
    $n += 1;
}