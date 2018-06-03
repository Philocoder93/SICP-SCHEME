; in an applicative order language you'll get infinite loop,
; factorial will call itself forever and never hit the
; termination condition, in fact it will never even hit
; the body of unless, evaluating the args
; to unless will trigger another unless and so on

; in a normal order language it should work just fine
