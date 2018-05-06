(define (get-fringe lst)
  (cond
    ((null? lst) '())
    ((list? lst) (append (get-fringe (car lst)) (get-fringe (cdr lst))))
    (else (list lst))))

; there's a longer and slower way to do this where at each node you check to see
; if the cdr of the list you are at is null and if so you get-fringe just the car
; but i forgot that the accumulator op is actually append and you can feed null
; to append and it will just end up with the non null list

(get-fringe (list 2 (list 3 (list 3 7 9) 1 2) 2 3 4))

; returns (2 3 3 7 9 1 2 2 3 4)
