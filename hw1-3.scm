(define (func x y z)
  (define )
  (if ((not (not (least x y z))))
    ()
    ()
  )
)

;;; this procedure accounts for all cases,
;;; there are exactly four cases
;;; 1. they all have unique values
;;; 2. they all have the same value
;;; 3. there is one greatest value
;;; 4. there is one least value
;;; finding the least will cover three of these cases 1, 2, 4.
;;; in 1 and 4 exclude the least, in 2 use any two values


(define (least x y z)
  (cond
    ((leastSub x y z) (x))
    ((leastSub y x z) (y))
    ((leastSub z x y) (z))
    (else #f)
  )
)

(define (leastSub least? other1 other2)
  (and (< least? other1) (< least? other2))
)

(define (sumOfSquares x y)
  (+ (* x x) (* y y))
)

;;; maybe rewrite this entire thing with recursion?
