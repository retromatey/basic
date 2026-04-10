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
    local score as integer = 0
    local counter as integer = 0
    local enemy_pos as integer = 0
    local hit as integer = TRUE

    do
        score = 0

        for counter = 1 to 10
            enemy_pos = PrintWall()
            hit = TakeShot(enemy_pos)

            if hit then
                print "Good shot"
                score = score + 1
            else
                print "Missed"
            end if

            ' A slight pause to prevent
            ' the next button click from
            ' carrying over.
            pause 300
        next counter

        print "You hit ";score;" out of 10"
        print

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

function PrintWall() as integer
    local wall as string = ""
    local enemy_pos as integer = 0
    local counter as integer = 0

    enemy_pos = int(rnd(1)*9+1)

    for counter = 1 to 9
        if counter = enemy_pos then 
            wall = wall + "O"
        else
            wall = wall + "."
        end if
    next counter

    print wall,
    PrintWall = enemy_pos
end function

function TakeShot(enemy_pos as integer) as integer
    local delay as integer = 0
    local count_down as integer = 0
    local key_pressed as string = ""
    local position as integer = 0
    local hit as integer = FALSE

    ' Flush buffer
    do while inkey$ <> "" : loop

    delay = 10
    count_down = delay * 110

    do
        key_pressed = inkey$
        position = val("0" + key_pressed)
        if position = enemy_pos then 
            hit = TRUE
        end if
        count_down = count_down - delay
        pause delay
    loop while not hit and key_pressed = "" and count_down > 0

    TakeShot = hit
end function
