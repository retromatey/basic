' -------- DESERT TANK BATTLE ----------
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
    print "---------- DESERT TANK BATTLE ----------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if ucase$(confirm) = "Y" then
        print
        print "The last major stronghold of Robot"
        print "forces outside the U.R.S. (United Robot"
        print "States) is hidden in ancient castle"
        print "ruins in the middle of the desert. A"
        print "fleet of desert hovertanks has been sent"
        print "to destroy it and you are the commander."
        print "Your tank controls the five remaining"
        print "missiles."
        print
        print "You must assess carefully the direction"
        print "and elevation before you launch each"
        print "one.  Your computer will ask you for a"
        print "direction angle between -90 degrees"
        print "(extreme left) and +90 degrees (extreme"
        print "right) and an elevation angle between 0"
        print "degrees (along the ground) and 45"
        print "degrees (farthest distance). The"
        print "elevation determines the distance the"
        print "missile will travel."
        print
        print "Is your aim good enough to destroy the "
        print "robot stronghold?"
        print
        Pager()
    end if
end sub

sub GameLoop
    local game_over as integer = FALSE

    do
        DesertTankBattle()
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

sub DesertTankBattle
    local dir_enemy as integer = 0
    local dir as integer = 0
    local dist_enemy as float = 0
    local dist as float = 0.0
    local elevation as integer = 0

    local missiles as integer = 5
    local hit as integer = FALSE
    local dir_hit as integer = FALSE
    local dist_hit as integer = FALSE

    ' Assign a whole number for between
    ' -90 and 90 for the direction.
    dir_enemy = int(rnd(1)*181)-90
    ' Assign a number between 0 and 1
    ' for the distance of the castle
    ' from you.
    dist_enemy = rnd(1)

    do
        print 
        print "Missiles remaining:";missiles
        print "Direction (-90 to 90) ?"
        input dir
        print "Elevation (0 to 45) ?"
        input elevation
        ' Use the elevation angle to
        ' calculate the distance the
        ' missile traveled.
        dist = sin(2*(elevation/180*PI))

        ' You have hit the castle if:
        ' 1) Your direction was within 2
        '    degrees
        ' AND
        ' 2) Your distance was within
        '    0.05
        dir_hit = abs(dir_enemy - dir) < 2
        dist_hit = abs(dist_enemy - dist) < 0.05

        if dir_hit and dist_hit then
            hit = TRUE
        else
            ResolveMissile(dir, dir_enemy, dist, dist_enemy)
        end if
        
        print

        missiles = missiles - 1
    loop until missiles = 0 or hit

    if hit then
        print
        print "*KABOOOMMM*"
        print "You've done it!"
        print
    else
        print
        print "Disaster - you failed"
        print "Retreat in disgrace"
        print
    end if
end sub

sub ResolveMissile(dir as integer, dir_e as integer, dist as float, dist_e as float)
    print "Missile landed ";

    if dir < dir_e then 
        print "to the left ";
    else if dir > dir_e then 
        print "to the right ";
    end if 

    if abs(dist - dist_e) > 0.05 then
        if dir <> dir_e then
            print "and ";
        end if
    end if
    
    if dist_e - dist > 0.05 then 
        print "not far enough";
    else if dist - dist_e > 0.05 then 
        print "too far";
    end if
end sub
