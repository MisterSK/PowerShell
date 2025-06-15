Function Get-ZappQuote {
   $QuoteList = @(
       Get-Content -Path ".`\QuotesList.txt"
   )
   $QuoteList | Get-Random
}