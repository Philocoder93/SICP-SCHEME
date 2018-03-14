(define (get-sub-set s)
  (cond
    ((null? s) (list '()))
    (else
      (let ((remained (get-sub-set (cdr s))))
        (append remained (map
          (lambda (y) (append (list (car s)) y))
          remained))))))


(get-sub-set (list 1 2 3 4))

; so the method works this way, the method cdrs down the array until it hits the
; null terminator which it returns wrapped in another list to the previous call
; (so that the null set doesn't disappear into the append), after that the next
; call appends remained (right now just a list containing the null set) to the
; result of appending a list containing next element in the array to each element of remained,
; since the very first element put into remained is the null set at each element
; it appends a list containing that element to a list with no elements resulting
; in...a list containing each element, in addition, it also constructs each and every
; subset, for any two elements a and b either a will append itself to be or b will append
; itself to a, once you have these combos later elements will append to the combos creating
; combos with even more elements
