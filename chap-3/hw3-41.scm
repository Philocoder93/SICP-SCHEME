; not as far as I can see,
; the main concern with interleaving operations is that procedures assume
; that state variables will not change their value over the course of the operation
; unless explicitly told to by the operation itself, but reading the state of the variable
; has absolutely no effect on the state of the variable, as far as the rest of the program
; is concerned it is exactly as if there was no operation on the variable at all
