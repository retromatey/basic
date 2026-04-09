' ---- BATTLE AT TRAITOR'S CASTLE ------
' This program was adapted from the book
' titled "Computer Battlegames"
' published in 1982 by Usborne
' Publishing. "Computer Battlegames"
' can be freely downloaded at
' https://usborne.com/us/books/computer-and-coding-books
'
' Compatible with the Pico Pi running
' Picomite
'option explicit
'option default none

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
    print "------ BATTLE AT TRAITOR'S CASTLE ------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if ucase$(confirm) = "Y" then
        print
        print "The King is waging a fierce and bloody"
        print "battle against his deadliest enemy - the"
        print "Traitor Baron. You are one of the King's"
        print "crack bowmen and at this very moment you"
        print "are crouching behind the bushes outside"
        print "the Baron's Castle, shooting at his men"
        print "as they lift their heads above the"
        print "battlements."
        print 
        print "Your computer will print a row"
        print "containing eight dots and an O. The"
        print "number keys 1 to 9 correspond to the"
        print "position of the O in the row. You have a"
        print "short time to press the correct key, and"
        print "hit the O, before it disappears."
        print 
        print "How many of the Baron's men can you hit?"
        print
        Pager()
    end if
end sub

sub GameLoop
    local game_over as integer = FALSE
    do


' **************************************
' begin original game
' **************************************

let s = 0
for g = 1 to 10
    let r$ = ""
    let t = int(rnd(1)*9+1)

    for l = 1 to 9
        if l = t then let r$ = r$ + "O"
        if l <> t then let r$ = r$ + "."
    next l

    print r$, ' what's up with the comma?

    ' Flush buffer
    do while inkey$ <> "" : loop
    loop_delay = 10
    total_delay = loop_delay * 150
    do
        let i$ = inkey$
        if val("0" + i$) = t then goto Hit
        pause loop_delay
        total_delay = total_delay - loop_delay
    loop while i$ = "" and total_delay > 0

    print "Missed"
    goto Miss

    Hit:
    print "Good shot"
    let s = s + 1

    Miss:
next g

print "You hit ";s;" out of 10"
print


' **************************************
' end original game
' **************************************


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

