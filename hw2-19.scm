; i am not going to reproduce the counting procedure here becuase i am pretty sure
; that i dont need to for the purposes of this exercise


(define (none-left list)
  (null? list))

(define (except-first-denom list)
  (cdr list))

(define (only-first-denom list)
  (car list))

; no because any valid combination of coins that add up to exactly one dollar
; can be listed starting with the larger denominations or listed starting with
; the smaller denominations, the algorithm will explore every possible combination
; of the supplied currencies so it will find any possible combination
