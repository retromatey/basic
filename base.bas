' ------------ TITLE HERE --------------
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
    print "------------ TITLE HERE --------------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if ucase$(confirm) = "Y" then
        print
        print "instructions here..."
        print
        Pager()
    end if
end sub

sub GameLoop
    local game_over as integer = FALSE
    do
        ' Add logic here...
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
