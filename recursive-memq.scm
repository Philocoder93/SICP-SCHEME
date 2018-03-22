; this procedure takes a value and a list and returns a boolean
; indicating whether or not that value is present in that
; list

; the only disadvantage that i can see to a method like this one is that it doesnt return
; the index where the value is in the array, but to be fair, the other one didn't either
; it only returns the sub array starting with the matched element, not sure what good that
; does,

(define (member? val list)
  (if (null? list)
    #f
    (or (eq? val (car list)) (member? val (cdr list)))))



(member? 5 (list 1 2 3 4 5))

(member? 7 (list 1 2 3))
