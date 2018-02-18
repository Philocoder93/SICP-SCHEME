(define (sumOfSquares x y)
  (+ (* x x) (* y y))
)

(define (func x y z)
  (define sorted (recursiveInsertionSort (list x y z)))
  (display (first sorted))
  (display (second sorted))
  (sumOfSquares (first sorted) (second sorted))
)

;;; this procedure accounts for all cases,
;;; there are exactly four cases
;;; 1. they all have unique values
;;; 2. they all have the same value
;;; 3. there is one greatest value
;;; 4. there is one least value
;;; finding the least will cover three of these cases 1, 2, 4.
;;; in 1 and 4 exclude the least, in 2 use any two values

; this works but is crazy inneficient
(define (recursiveInsertionSort input)
  (cond
    ((= (length+ input) 1)
      input)
    ((> (first input) (first (recursiveInsertionSort (cdr input))))
      (append (list (first input)) (recursiveInsertionSort (cdr input))))
    (else
      (append (recursiveInsertionSort (cdr input)) (list (first input))))
  )
)

(func 2 15 4)

; (define (whichLeast x y z)
;   (cond
;     ((isLeast? x y z) x)
;     ((isLeast? y x z) y)
;     ((isLeast? z x y) z)
;     (else #f)
;   )
; )

; (define (isLeast? least? other1 other2)
;   (and (< least? other1) (< least? other2))
; )

; (whichLeast 1 4 567)

;;; maybe rewrite this entire thing with recursion?
