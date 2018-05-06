; (define accu (account-make 60))
;
; this ^ call creates a new frame with the account-make procedure
; it binds 50 to the balance symbol in that frame and it
; creates a three new procedures with that frame as their enclosing
; environment

; ((accu 'dep) 40)
; this procedure creates a new frame with the account make frame as it's
; enclosing frame and 'deposit bound to m, this frame in turn creates another
; frame with the account make frame as it's enclosing frame and binds 40 to amount in this new frame
; finally, this new frame runs and rebinds balance from this frames enclosing frame

; ((accu 'wit) 60)
; this frame does basically the same thing as the above call just with subtraction instead

; the local state for acc is kept in the initial account-make frame

; the states are kept distinct by storing their local states in two seperate frames,
; one in the initial account-make frame and one in the second account-make frame

; the only part of the environment structure shared by acc and acc2 is the global frame, other
; than that they were completely seperate
