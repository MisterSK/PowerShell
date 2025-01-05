$filePaths = @(
    "C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v3\Logs\2025\01\03\ActivityGenerator_Runtime.log",
    "C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v3\Logs\2025\01\04\ActivityGenerator_Runtime.log",
    "C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v3\Logs\2025\01\05\ActivityGenerator_Runtime.log"
)

$jobs = $filePaths | ForEach-Object {
    $path = $_
    Start-Job -ScriptBlock {
        Get-Content -Wait -Tail 10 $using:path | ForEach-Object {
            "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') [$using:path] $_"
        }
    }
}

while ($true) {
    $jobs | Receive-Job
    Start-Sleep -Milliseconds 2000
}

# To clean up when done (after Ctrl+C):
$jobs | Remove-Job -Force