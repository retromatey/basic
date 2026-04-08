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
option explicit
option default none

const TRUE = 1
const FALSE = 0

Main()
end


'------------- functions ---------------

sub Main
    cls
    randomize timer()
    Intro()
    GameLoop()
end sub

sub Intro
    local confirm as string = ""
    
    print
    print "--------------- SHOOTOUT ---------------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if ucase$(confirm) = "Y" then
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

sub GameLoop
    local game_over as integer = FALSE
    do
        Paces()
        Delay()
        Shootout()
        game_over = EndGame()
    loop until game_over
end sub

function EndGame() as integer
    local result as integer = TRUE
    local response as string = ""

    print "Press Y to play again or Enter to exit."
    input response

    if ucase$(response) = "Y" then
        result = FALSE
        print
    else
        print "-------------- GAME OVER ---------------"
    end if

    EndGame = result
end function

sub Delay
    local counter as integer = 0

    ' Wait between 500ms to 1000ms
    for counter = 1 to rnd(1)*5+5
        pause 100
    next counter
end sub

sub Pager
    local pressed as string = ""

    ' Flush buffer
    do while inkey$ <> "" : loop
    print "Press any key to continue."
    print
    do
        pressed = inkey$
    loop while pressed = ""
end sub

sub Shootout
    local counter as integer = 0
    local hit as integer = FALSE
    local rand_wait as integer = rnd(1)*40+5

    if inkey$ <> "" then 
        print "Too soon!"
        print
        print "You are dead"
        print
    else
        print "HE DRAWS..... ";

        for counter = 1 to rand_wait
            if inkey$ <> "" then 
                hit = TRUE
                exit for
            end if
            pause 10
        next counter

        if hit then
            print "But you shoot first."
            print
            print "You killed him."
            print
        else
            print "And shoots."
            print
            print "You are dead."
            print
        end if
    end if
end sub

sub Paces
    local counter as integer = 0
     
    print "You are back to back"
    print "Take 10 paces..."

    for counter = 1 to 10
        print counter;"..";
        pause 750
    next counter

    print
end sub
