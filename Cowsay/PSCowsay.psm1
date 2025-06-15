# PSCowSay Module - Save as "PSCowSay.psm1"

<#
.SYNOPSIS
    PowerShell implementation of the Cowsay utility
.DESCRIPTION
    This module provides functions to display ASCII art cows with speech bubbles
.NOTES
    Author: Claude
    Version: 1.0
#>

# Default cow templates
$script:DefaultCows = @{
    "default" = @"
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
"@

    "tux" = @"
        \
         \
          \
            .--.
           |o_o |
           |:_/ |
          //   \ \
         (|     | )
        /'\_   _/`\
        \___)=(___/
"@

    "dragon" = @"
      \                    / \  //\
       \    |\___/|      /   \//  \\
            /0  0  \__  /    //  | \ \    
           /     /  \/_/    //   |  \  \  
           @_^_@'/   \/_   //    |   \   \ 
           //_^_/     \/_ //     |    \    \
        ( //) |        \///      |     \     \
      ( / /) _|_ /   )  //       |      \     _\
    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
 (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
 (( /// ))      `.   {            }                   /      \  \
  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
             ///.----..>        \             _ -~             `.  ^-`  ^-_
               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
                                                                  /.-~
"@

    "stegosaurus" = @"
\                             .       .
 \                           / `.   .' " 
  \                  .---.  <    > <    >  .---.
   \                 |    \  \ - ~ ~ - /  /    |
         _____          ..-~             ~-..-~
        |     |   \~~~\.'                    `./~~~/
       ---------   \__/                        \__/
      .'  O    \     /               /       \  " 
     (_____,    `._.'               |         }  \/~~~/
      `----.          /       }     |        /    \__/
            `-.      |       /      |       /      `. ,~~|
                ~-.__|      /_ - ~ ^|      /- _      `..-'   
                     |     /        |     /     ~-.     `-. _  _  _
                     |_____|        |_____|         ~ - . _ _ _ _ _>
"@

    "sheep" = @"
  \
   \
       __     
      UooU\.'@@@@@@`.
      \__/(@@@@@@@@@@)
           (@@@@@@@@)
           `YY~~~~YY'
            ||    ||
"@

    "moose" = @"
  \
   \   \_\_    _/_/
    \      \__/
           (oo)\_______
           (__)\       )\/\
               ||----w |
               ||     ||
"@
}

function Get-PSCowSayList {
    <#
    .SYNOPSIS
        Gets a list of available cow templates
    .DESCRIPTION
        Returns a list of all available cow template names
    .EXAMPLE
        Get-PSCowSayList
    #>
    
    # Return the names of all default cows
    return $script:DefaultCows.Keys
}

function Invoke-PSCowSay {
    <#
    .SYNOPSIS
        Displays a cow with a speech bubble containing a message
    .DESCRIPTION
        Creates a text-based ASCII art cow with a speech bubble
    .PARAMETER Message
        The message to display in the speech bubble
    .PARAMETER Cow
        The name of the cow template to use
    .EXAMPLE
        Invoke-PSCowSay -Message "Hello, world!" -Cow "default"
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Message,
        
        [Parameter(Mandatory = $false, Position = 1)]
        [string]$Cow = "default"
    )
    
    # Check if the cow template exists
    if (-not $script:DefaultCows.ContainsKey($Cow)) {
        $Cow = "default"
    }
    
    # Get the cow template
    $cowTemplate = $script:DefaultCows[$Cow]
    
    # Split the message into lines
    $lines = $Message -split "`n"
    
    # Find the longest line to determine the width of the speech bubble
    $maxLength = ($lines | Measure-Object -Property Length -Maximum).Maximum
    $width = [Math]::Min([Math]::Max($maxLength, 10), 50)
    
    # Create the speech bubble
    $result = " " + "_" * ($width + 2) + "`n"
    
    if ($lines.Count -eq 1) {
        # Single line message
        $result += "< " + $lines[0].PadRight($width) + " >`n"
    }
    else {
        # Multi-line message
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($i -eq 0) {
                # First line
                $result += "/ " + $lines[$i].PadRight($width) + " \`n"
            }
            elseif ($i -eq $lines.Count - 1) {
                # Last line
                $result += "\ " + $lines[$i].PadRight($width) + " /`n"
            }
            else {
                # Middle lines
                $result += "| " + $lines[$i].PadRight($width) + " |`n"
            }
        }
    }
    
    $result += " " + "-" * ($width + 2) + "`n"
    
    # Add the cow template
    $result += $cowTemplate
    
    return $result
}

Export-ModuleMember -Function Get-PSCowSayList, Invoke-PSCowSay