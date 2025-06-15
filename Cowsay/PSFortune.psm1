# PSFortune Module - Save as "PSFortune.psm1"

<#
.SYNOPSIS
    PowerShell implementation of the Fortune utility
.DESCRIPTION
    This module provides functions to display random quotes and sayings
.NOTES
    Author: Claude
    Version: 1.0
#>

# Initialize the fortune database hashtable
$script:FortuneDatabase = @{}

# Add categories and quotes to the database
$script:FortuneDatabase.Add("Wisdom", @(
    "The obstacle is the path.",
    "Patience is bitter, but its fruit is sweet.",
    "To know that you do not know is the best.",
    "The journey of a thousand miles begins with one step.",
    "What you seek is seeking you.",
    "The wound is the place where the light enters you.",
    "A wise person knows there is something to be learned from everyone.",
    "The quieter you become, the more you can hear.",
    "You will face many defeats in life, but never let yourself be defeated.",
    "Life is really simple, but we insist on making it complicated.",
    "The only true wisdom is in knowing you know nothing.",
    "Your focus determines your reality.",
    "It's not what happens to you, but how you react to it that matters.",
    "The best time to plant a tree was 20 years ago. The second best time is now.",
    "Do not seek to follow in the footsteps of the wise. Seek what they sought."
))

$script:FortuneDatabase.Add("Funny", @(
    "I used to think I was indecisive, but now I'm not so sure.",
    "I'm on a seafood diet. I see food and I eat it.",
    "I told my wife she was drawing her eyebrows too high. She looked surprised.",
    "I'm reading a book about anti-gravity. It's impossible to put down!",
    "What do you call a fake noodle? An impasta!",
    "Why don't scientists trust atoms? Because they make up everything.",
    "I'm not lazy, I'm just on energy-saving mode.",
    "Why did the scarecrow win an award? Because he was outstanding in his field.",
    "I don't have a girlfriend, but I know a girl that would get really mad if she heard me say that.",
    "When life gives you melons, you might be dyslexic.",
    "I used to play piano by ear, but now I use my hands.",
    "The early bird gets the worm, but the second mouse gets the cheese.",
    "I told my computer I needed a break, and now it won't stop sending me vacation ads.",
    "I'm not arguing, I'm just explaining why I'm right.",
    "I asked the gym instructor if he could teach me to do the splits. He replied, 'How flexible are you?' I said, 'I can't make Tuesdays.'"
))

$script:FortuneDatabase.Add("Literature", @(
    "All that we see or seem is but a dream within a dream. - Edgar Allan Poe",
    "It is a far, far better thing that I do, than I have ever done. - Charles Dickens",
    "Not all those who wander are lost. - J.R.R. Tolkien",
    "Whatever our souls are made of, his and mine are the same. - Emily Brontë",
    "It does not do to dwell on dreams and forget to live. - J.K. Rowling",
    "I took a deep breath and listened to the old brag of my heart: I am, I am, I am. - Sylvia Plath",
    "The only way out of the labyrinth of suffering is to forgive. - John Green",
    "Tomorrow is always fresh, with no mistakes in it yet. - L.M. Montgomery",
    "There is no greater agony than bearing an untold story inside you. - Maya Angelou",
    "We accept the love we think we deserve. - Stephen Chbosky",
    "And in the end, we were all just humans, drunk on the idea that love, only love, could heal our brokenness. - F. Scott Fitzgerald",
    "It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife. - Jane Austen",
    "So we beat on, boats against the current, borne back ceaselessly into the past. - F. Scott Fitzgerald",
    "All happy families are alike; each unhappy family is unhappy in its own way. - Leo Tolstoy",
    "Call me Ishmael. - Herman Melville"
))

$script:FortuneDatabase.Add("Technology", @(
    "The best way to predict the future is to invent it. - Alan Kay",
    "Computers are useless. They can only give you answers. - Pablo Picasso",
    "The function of good software is to make the complex appear to be simple. - Grady Booch",
    "Programming isn't about what you know; it's about what you can figure out. - Chris Pine",
    "The most disastrous thing that you can ever learn is your first programming language. - Alan Kay",
    "Any sufficiently advanced technology is indistinguishable from magic. - Arthur C. Clarke",
    "Most good programmers do programming not because they expect to get paid or get adulation by the public, but because it is fun to program. - Linus Torvalds",
    "Hardware: the parts of a computer that can be kicked. - Jeff Pesis",
    "The internet? We are not interested in it. - Bill Gates, 1993",
    "If debugging is the process of removing bugs, then programming must be the process of putting them in. - Edsger W. Dijkstra",
    "It's hardware that makes a machine fast. It's software that makes a fast machine slow. - Craig Bruce",
    "If you think technology can solve your security problems, then you don't understand the problems and you don't understand the technology. - Bruce Schneier",
    "The real danger is not that computers will begin to think like men, but that men will begin to think like computers. - Sydney J. Harris",
    "The question of whether computers can think is like the question of whether submarines can swim. - Edsger W. Dijkstra",
    "Never trust a computer you can't throw out a window. - Steve Wozniak"
))

$script:FortuneDatabase.Add("Motivation", @(
    "The only way to do great work is to love what you do. - Steve Jobs",
    "It always seems impossible until it's done. - Nelson Mandela",
    "Don't watch the clock; do what it does. Keep going. - Sam Levenson",
    "Believe you can and you're halfway there. - Theodore Roosevelt",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
    "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
    "You are never too old to set another goal or to dream a new dream. - C.S. Lewis",
    "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
    "Do what you can, with what you have, where you are. - Theodore Roosevelt",
    "Act as if what you do makes a difference. It does. - William James",
    "Your talent determines what you can do. Your motivation determines how much you are willing to do. Your attitude determines how well you do it. - Lou Holtz",
    "The harder the conflict, the greater the triumph. - George Washington",
    "You don't have to be great to start, but you have to start to be great. - Zig Ziglar",
    "The secret of getting ahead is getting started. - Mark Twain",
    "Don't count the days, make the days count. - Muhammad Ali"
))

function Get-PSFortune {
    <#
    .SYNOPSIS
        Gets a random fortune quote
    .DESCRIPTION
        Returns a random quote from the specified category
    .PARAMETER Category
        The category of quotes to choose from
    .PARAMETER MaxLength
        Maximum length of the quote
    .PARAMETER CustomPath
        Path to a directory containing custom fortune files
    .EXAMPLE
        Get-PSFortune -Category "Wisdom"
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$Category = "All",
        
        [Parameter(Mandatory = $false)]
        [int]$MaxLength = 0,
        
        [Parameter(Mandatory = $false)]
        [string]$CustomPath = ""
    )
    
    # Initialize an array to hold all available quotes
    $allQuotes = @()
    
    # Get quotes from the specified category or all categories
    if ($Category -eq "All") {
        foreach ($cat in $script:FortuneDatabase.Keys) {
            $allQuotes += $script:FortuneDatabase[$cat]
        }
    }
    elseif ($script:FortuneDatabase.ContainsKey($Category)) {
        $allQuotes += $script:FortuneDatabase[$Category]
    }
    else {
        # If category doesn't exist, default to all
        foreach ($cat in $script:FortuneDatabase.Keys) {
            $allQuotes += $script:FortuneDatabase[$cat]
        }
    }
    
    # If custom path is provided and exists, add custom fortunes
    if (-not [string]::IsNullOrEmpty($CustomPath) -and (Test-Path -Path $CustomPath)) {
        # Get all text files in the directory
        $customFiles = Get-ChildItem -Path $CustomPath -Filter "*.txt"
        
        foreach ($file in $customFiles) {
            try {
                # Read all lines from the file
                $customQuotes = Get-Content -Path $file.FullName -ErrorAction Stop
                
                # Add non-empty lines to the quotes collection
                foreach ($quote in $customQuotes) {
                    if (-not [string]::IsNullOrWhiteSpace($quote)) {
                        $allQuotes += $quote
                    }
                }
            }
            catch {
                Write-Warning "Failed to read custom fortune file: $($file.FullName)"
            }
        }
    }
    
    # Filter quotes by length if specified
    if ($MaxLength -gt 0) {
        $allQuotes = $allQuotes | Where-Object { $_.Length -le $MaxLength }
    }
    
    # If no quotes match the criteria, return a default message
    if ($allQuotes.Count -eq 0) {
        return "Fortune not found. Perhaps you should make your own luck."
    }
    
    # Return a random quote
    return $allQuotes | Get-Random
}

# Add function to get available fortune categories
function Get-PSFortuneCategories {
    <#
    .SYNOPSIS
        Gets all available fortune categories
    .DESCRIPTION
        Returns a list of all fortune categories in the database
    .EXAMPLE
        Get-PSFortuneCategories
    #>
    [CmdletBinding()]
    param()
    
    return $script:FortuneDatabase.Keys
}

# Add function to add custom fortunes to the database
function Add-PSFortune {
    <#
    .SYNOPSIS
        Adds a custom fortune to the database
    .DESCRIPTION
        Adds a new quote to the specified category or creates a new category
    .PARAMETER Quote
        The quote to add
    .PARAMETER Category
        The category to add the quote to
    .EXAMPLE
        Add-PSFortune -Quote "This is a custom quote" -Category "Custom"
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Quote,
        
        [Parameter(Mandatory = $true, Position = 1)]
        [string]$Category
    )
    
    # Check if the category exists
    if (-not $script:FortuneDatabase.ContainsKey($Category)) {
        # Create a new category
        $script:FortuneDatabase[$Category] = @()
    }
    
    # Add the quote to the category
    $script:FortuneDatabase[$Category] += $Quote
    
    Write-Host "Quote added to category '$Category'" -ForegroundColor Green
}

# Export the module functions
Export-ModuleMember -Function Get-PSFortune, Get-PSFortuneCategories, Add-PSFortune