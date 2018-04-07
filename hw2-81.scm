; -a
; from my reading of the procedure this is what should happen
; first the procedure will check the lookup table for that signature
; it won't find anything, then it will go check the lookup table for
; coercion of complex into complex, it will find it, pull it in and
; call it in another attempt to apply-generic that signature,
; this call will fail just like the last one because it is the same exact
; call, furthermore, because there is no way for the procedure to exit
; the procedure will be caught in an infinite loop

; -b
; suppose that you are attempting to call some procedure with two
; arguments of the same type, further suppose that that procedure is not defined for those
; two arguments, this is what should happen as things stand now,
; first the procedure will check to see if there is indeed some way to coerce some procedure into
; itself when it finds out that there is no way to do this it will return
; nothing for both of the possible procedure variables, when these both fail the procedure will proceed
; to the else clause and throw an error, this seems pretty much alright to me, it doesn't look like
; anything here needs to be fixed

; -c
; in order to do this you will need to replace line 6 with the following line
(if (or (= (length args) 2) (eq? (car type-tags) (cadr type-tags)))
