' ----------- ROBOT MISSILE ------------
' The year is 2582 and the people of
' Earth are in the midst of battle
' against the Robots.  A lethal Robot
' Missile has just landed and everyone
' is depending on you to find the secret
' code which unlocks its defuse
' mechanism.  If you fail, the entire
' Earth Command Headquarters will be
' blown up.  
' Your computer knows what the code
' letter is.  You must type in your
' guess and it will tell you whether the
' code letter is earlier of later in the
' aplphabet.  You have four chances
' to find the correct letter before the
' missile blows up.
' 
' This program was adapted from the book
' titled "Computer Battlegames"
' published in 1982 by Usborne
' Publishing. "Computer Battlegames"
' can be freely downloaded at
' https://usborne.com/us/books/computer-and-coding-books
'
' Compatible with the Pico Pi running
' Picomite

option explicit
option default none

const TRUE = 1
const FALSE = 0

cls
randomize timer()

dim success as integer = 0
dim tries as integer = 4
dim guess as string = ""
dim letter as string = ""
letter = chr$(64+int(rnd(1)*26+1))

print "Robot Missile"
print
print "Type the correct code"
print "Letter (A-Z) to"
print "defuse the missile."
print "You have 4 chances"
print

do while tries > 0 and not success
    input guess

    if guess < letter then
        print "Later than ";guess
    else if guess > letter then
        print "Earlier than ";guess
    else
        success = TRUE
    end if

    tries = tries - 1
loop

print
if success then
    print "TICK...FZZZZ...CLICK..."
    print "YOU DID IT!"
else
    print "BOOOOOOOOMMMMM..."
    print "You blew it"
    print "The correct code was ";letter
end if

end
