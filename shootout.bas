' -------------- SHOOTOUT --------------
' This program was adapted from the book
' titled "Computer Battlegames"
' published in 1982 by Usborne
' Publishing. "Computer Battlegames"
' can be freely downloaded at
' https://usborne.com/us/books/computer-and-coding-books
'
' Compatible with the Pico Pi running
' Picomite

' TODO:
' - Add "play again?" logic
' - make the fire back time random
' - extra refactoring

option explicit
option default none

const TRUE = 1
const FALSE = 0

cls
randomize timer()

dim counter as integer = 0
dim hit as integer = FALSE

Intro()

print "You are back to back"
print "Take 10 paces..."

for counter = 1 to 10
    print counter;"..";
    pause 750
next counter

print

for counter = 1 to rnd(1)*5+5
    pause 100
next counter

if inkey$ <> "" then 
    print "Too soon!"
    print "You're dead"
else
    print "HE DRAWS..... ";

    for counter = 1 to 40
        if inkey$ <> "" then 
            hit = TRUE
            exit for
        end if
        pause 10
    next counter

    if hit then
        print "But you shoot first."
        print "You killed him."
    else
        print "And shoots."
        print "You are dead."
    end if
end if

print "-------------- GAME OVER ---------------"
end

'------------- functions ---------------

sub Pager()
    local pressed as string = ""

    ' Flush buffer
    do while inkey$ <> "" : loop
    print "Press any key to continue."
    do
        pressed = inkey$
    loop while pressed = ""
end sub

sub Intro()
    local confirm as string = ""
    
    print
    print "--------------- SHOOTOUT ---------------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if confirm = "Y" then
        print
        print "You are standing back to back. You take"
        print "10 paces, turn and reach for your gun."
        print "How quick are you? Can you shoot first?"
        print "Your computer prints the numbers 1 to 10"
        print "to represent the 10 paces, pauses and"
        print "then prints HE DRAWS... You must be"
        print "ready to press a key (any one will do)"
        print "the instant these words come on the"
        print "screen. If you are quick enough, you"
        print "will win. Don't press a key before HE"
        print "DRAWS comes up or you will automatically"
        print "lose."
        print
        Pager()
    end if

end sub

