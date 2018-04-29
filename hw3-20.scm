; again rather than draw out a diagram in this text file
; i am simply going to explain what is happening here,
; so first x gets bound to a pair, the car pointing to 1
; and the cdr pointing to 2, then z gets both its car and cdr bound to x
; after that the cdr of z, x, gets its car pointer rebound to 17,
; at this point x has had it's car rebound so when we
; car x we end up with 17, because all of this is happening outside of functions
; all of this if just binding, rebinding and querying things in the global scope
