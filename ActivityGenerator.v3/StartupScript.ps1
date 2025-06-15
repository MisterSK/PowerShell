param (
    # Random start wait time max seconds
    # [Parameter(Mandatory=$true)]
    [int]$rand_start_wait_max,
    
    # Random start wait time min seconds
    # [Parameter(Mandatory=$true)]
    [int]$rand_start_wait_min
)

if($rand_start_wait_max -ne ''){
    Write-Host "Using user supplied max value $rand_start_wait_max"
    $rand_start_wait_max = $rand_start_wait_max
}else{
    Write-Host "Using app supplied default max value 550"
    $rand_start_wait_max = 550
}
if($rand_start_wait_min -ne ''){
    Write-Host "Using user supplied min value $rand_start_wait_min"
    $rand_start_wait_min = $rand_start_wait_min
}else{
    Write-Host "Using app supplied default min value 35"
    $rand_start_wait_min = 35
}

$random_start = Get-Random -Maximum $rand_start_wait_max -Minimum $rand_start_wait_min; 
Set-Location 'C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v3\' ;
& 'C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\CountDownTimers\Start-Countdown.ps1' -seconds $random_start -message "Waiting to launch Activity Orchestrator"