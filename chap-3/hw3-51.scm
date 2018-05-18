; my best guess is that the output for the two lines would look like this:
; 0
; 1 2 3 4 5
; 6 7

; the first line comes from the initial declaration (remember that the car of a stream
; is not delayed) the next line comes from the next expression (obviously) and the final
; line comes from the fact that the calls to 1 2 3 4 5 were all memoized and (contrary to
; my initial impression) the memoization does in fact work because each deferred cdr returns
; back a function the next successive cdr accesses and which is then memoized, long story short:
; memoization is the reason for this
