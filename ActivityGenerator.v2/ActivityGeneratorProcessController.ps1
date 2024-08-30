function GetProcesControlConfig($config_param) {

    $config_file_exists = Test-Path "C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v2\ActivityGenerator.cfg"
    if($config_file_exists -eq $true){
        # foreach($line in [System.IO.File]::ReadLines("C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v2\ActivityGenerator.cfg"))
        foreach($line in Get-Content "C:\Users\SanyaKhasenye(Sensit\WorkingDir\PowerShell\ActivityGenerator.v2\ActivityGenerator.cfg")
        {
            $line_array = $line.Split("=")
            switch( $line_array[0] | Select-String -Pattern 'SHUTDOWN' )
            {
                'SHUTDOWN' {  
                    $shutdown = $line_array[1] 
                    if($shutdown -eq 0){ $shutdown = $false } else { $shutdown = $true }
                    # Write-Host "SHUTDOWN :: $shutdown"
                }
            }
            switch( $line_array[0] | Select-String -Pattern 'SHUTDOWN_WINDOW' )
            {
                'SHUTDOWN_WINDOW' { 
                    $shutdown_window = $line_array[1]
                    # Write-Host "SHUTDOWN_WINDOW :: $shutdown_window"
                }
                
            }
            switch( $line_array[0] | Select-String -Pattern 'USE_TERMINATE' )
            {
                'USE_TERMINATE' { 
                    $use_terminate = $line_array[1]
                    if($use_terminate -eq 0){ $use_terminate = $false } else { $use_terminate = $true }
                    # Write-Host "USE_TERMINATE :: $use_terminate"
                }
            }
            switch( $line_array[0] | Select-String -Pattern 'TERMINATE_WINDOW' )
            {
                'TERMINATE_WINDOW' { 
                    $terminate_window = $line_array[1]
                    # Write-Host "TERMINATE_WINDOW :: $terminate_window"
                }
            }
        }
    }

    $control_configs = @($shutdown, $shutdown_window, $use_terminate, $terminate_window)
    return $control_configs[$config_param]

}