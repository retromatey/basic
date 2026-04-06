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

cls
randomize timer()

Intro()



print "-------------- GAME OVER ---------------"
end

'------------- functions ---------------

sub Intro()
    local confirm as string = ""
    
    print
    print "-------------- TITLE HERE --------------"
    print
    print "Type Y for instructions"
    print "or Enter to continue."

    input confirm

    if confirm = "Y" then
        print
        print "Some instructions will go here..."
        print
    end if
end sub
