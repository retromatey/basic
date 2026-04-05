do
    InpErr:
    print
    input "Enter a number: "; a
    if a < 2 then
        print "Number must be equal or greater than 2"
        goto InpErr
    endif

    divs = 0
    for x = 2 to sqr(a)
        r = a/x
        if r = fix(r) then divs = divs + 1
    next x

    print a " is ";
    if divs > 0 then print "not ";
    print "a prime number."
loop
