' ---------- STARSHIP TAKEOFF ----------
' This program was adapted from the book
' titled "Computer Spacegames" published
' in 1982 by Usborne Publishing.
' "Computer Spacegames" can be freely
' downloaded at
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

dim gravity as integer = int(rnd(1)*20+1)
dim weight as integer = int(rnd(1)*40+1)
dim target as integer = gravity * weight
dim tries as integer = 10
dim force as integer = 0
dim success as integer = FALSE

Intro()
print "Gravity =";gravity
print "Type in force"

do while tries > 0 and not success
    input force

    if force > target then 
        print "Too high, try again."
    else if force < target then 
        print "Too low, try again."
    else
        success = TRUE
    end if

    tries = tries - 1
loop

print
if success then
    print "Good take off"
else
    print "You failed -"
    print "The aliens got you"
end if
print

print "-------------- GAME OVER ---------------"
end

'------------- functions ---------------

sub Intro()
    local confirm as string = ""
    
    print
    print "----------- STARSHIP TAKEOFF -----------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if confirm = "Y" then
        print
        print "You are a starship captain.  You have"
        print "crashed your ship on a strange planet"
        print "and must take off again quickly in the"
        print "alien ship you have captured.  The"
        print "ship's computer tells you the gravity on"
        print "the planet.  You must guess the force"
        print "required for a successful take off.  If"
        print "you guess too low, the ship will not"
        print "lift off the ground.  If you guess too"
        print "high, the ship's fail-safe mechanism"
        print "comes into operation to prevent it being"
        print "burnt up.  If you are still on the"
        print "planet after ten tries, the aliens will"
        print "capture you."
        print
    end if
end sub
