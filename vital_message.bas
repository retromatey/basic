cls
print "VITAL MESSAGE"
print
Config: print "How difficult? (4-10)"
input d
if d < 4 or d > 10 then goto Config
let m$=""
for i = 1 to d
    let m$ = m$ + chr$(int(rnd(1)*26+38))
next i
cls
print "Send this message:"
print
print m$
for i = 1 to d*8
next i
cls
input n$
if n$ = m$ then goto Success
print "You got it wrong"
print "You should have sent:"
print m$
end
Success: print "Message correct"
print "The war is over!"
end
