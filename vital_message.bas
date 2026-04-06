' --------- The Vital Message ----------
' This program was adapted from the book
' titled "Computer Battlegames"
' published in 1982 by Usborne
' Publishing.  "Computer Battlegames"
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

dim difficulty as integer = 0
dim message as string = ""
dim entry as string = ""

Intro()
difficulty = GetDifficulty()
message = SetMessage(difficulty)

print "Send this message:"
print
print message
DelaySeconds(difficulty)
cls

input entry

print
if entry = message then
    print "Message correct"
    print "The war is over!"
else
    print "You got it wrong"
    print "You should have sent:"
    print message
end if
print

print "-------------- GAME OVER ---------------"
end


'------------- functions ---------------

sub DelaySeconds(d as integer)
    local ms as integer = d * 1000
    pause ms
end sub

function SetMessage(d as integer) as string
    local result as string = ""
    local i as integer = 0

    for i = 1 to d
        result = result + chr$(int(rnd(1)*43+48))
    next i

    SetMessage = result
end function

function GetDifficulty() as integer
    local valid as integer = FALSE
    local result as integer = 0
    do while not valid
        print "How difficult? (4-10)"
        input result
        if result > 3 and result < 11 then
            valid = TRUE
        end if
    loop
    GetDifficulty = result
end function

sub Intro
    local confirm as string = ""

    print
    print "---------- THE VITAL MESSAGE -----------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if confirm = "Y" then
        print
        print "You are a laser communications operator."
        print "Your job is to intercept robot messages"
        print "and relay them to Command HQ. A vital"
        print "code message is expected.  If you relay"
        print "it correctly, the Robot attack will be"
        print "crushed. "
        print "This game tests your skill at"
        print "remembering a group of letters which you"
        print "see for only a very short time. The"
        print "computer will ask you for a difficulty"
        print "from 4 to 10.  When you have typed in"
        print "your answers, letters will appear top"
        print "left of your screen and disappear again"
        print "fairly quickly. Memorize them and then"
        print "type them into the computer and see if"
        print "you were right."
        print
    end if
end sub
