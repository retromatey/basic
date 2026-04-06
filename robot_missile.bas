' ----------- ROBOT MISSILE ------------
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

Intro()
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
print

print "-------------- GAME OVER ---------------"
end

'------------- functions ---------------

sub Intro()
    local confirm as string = ""
    
    print
    print "------------ ROBOT MISSILE -------------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if confirm = "Y" then
        print
        print "The year is 2582 and the people of Earth"
        print "are in the midst of battle against the"
        print "Robots.  A lethal Robot Missile has just"
        print "landed and everyone is depending on you"
        print "to find the secret code which unlocks"
        print "its defuse mechanism.  If you fail, the"
        print "entire Earth Command Headquarters will"
        print "be blown up.  Your computer knows what"
        print "the code letter is.  You must type in"
        print "your guess and it will tell you whether"
        print "the code letter is earlier of later in"
        print "the aplphabet.  You have four chances to"
        print "find the correct letter before the"
        print "missile blows up."
        print
    end if
end sub
