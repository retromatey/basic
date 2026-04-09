' Clear the terminal and reset cursor
print chr$(27) + "[H" + chr$(27) + "[2J"



' Wait for any key press
for counter = 1 to rand_wait
    if inkey$ <> "" then 
        hit = TRUE
        exit for
    end if
    pause 10
next counter
