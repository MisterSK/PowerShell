Function Get-ZappQuote {
   $QuoteList = @(
       "Stop exploding, you cowards.",
       "Uh-huh.Uh-huh. That's whatever you were talking about for ya.",
       "Kif! Where's the little umbrella? That's what makes it a scotch on the rocks.",
       "If we hit that bullseye, the rest of the dominoes should fall like a house of cards. Checkmate.",
       "I am the man with no name, Zapp Brannigan at your service!",
       "Don't be such a chicken, Kif. Teenagers smoke, and they seem pretty on-the-ball.",
       "Fire all weapons and set a transmission frequency for my victory yodel.",
       "I got your distress call and came here as soon as I wanted to.",
       "We'll just set a new course for that empty region over there, near that blackish, holeish thing.",
       "In the game of Chess, you must never let your adversary see your pieces.",
       "I've always thought of myself as a father figure to some of my more pathetic men.",
       "You win again, Gravity!",
       "Has my fame preceded me? Or was I too quick for it?",
       "Care for some champaggin?",
       "I have made it with a woman. Inform the men!",
       "If there's an alien out there I can't kill, I haven't met them and killed them yet",
       "As you all know, the key to victory is the element of surprise.  ...surprise!",
       "When I'm in command, every mission is a suicide mission.",
       "Come on girdle... hold!",
       "Fly the white flag of war."
   )
   $QuoteList | Get-Random
}