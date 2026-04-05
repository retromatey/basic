' ---------- STARSHIP TAKEOFF ----------
' You are a starship captain.  You have
' crashed your ship on a strange planet
' and must take off again quickly in the
' alien ship you have captured.  The
' ship's computer tells you the gravity
' on the planet.  You must guess the
' force required for a successful take
' off.  If you guess too low, the ship
' will not lift off the ground.  If you
' guess too high, the ship's fail-safe
' mechanism comes into operation to
' prevent it being burnt up.  If you are
' still on the planet after ten tries,
' the aliens will capture you.
' 
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

end
