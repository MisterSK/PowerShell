Function GET-Temppassword() {

Param(

[int]$length=15,

[string[]]$sourcedata

)

 

For ($loop=1; $loop –le $length; $loop++) {

            $TempPassword+=($sourcedata | GET-RANDOM)

            }

return $TempPassword

}

# Opt 1
$ascii=$NULL;
For ($a=33;$a –le 126;$a++) {$ascii+=,[char][byte]$a }

# Opt 2
$ascii=$NULL;
For ($a=48;$a –le 122;$a++) {$ascii+=,[char][byte]$a }