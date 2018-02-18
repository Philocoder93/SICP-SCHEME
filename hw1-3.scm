; there are exactly four cases
; 1. they all have unique values
; 2. they all have the same value
; 3. there is one greatest value
; 4. there is one least value
; by finding out how many of the three are larger than at least one other
; we can easily differentiate between these cases
; if there are two larger than at least one other then those two are the largest
; 

(define (sumOfSquares x y)
  (+ (* x x) (* y y))
)

(define (biggestTwo x y z)
  (define biggest (append
    (biggerThanOne x y z)
    (biggerThanOne y x z)
    (biggerThanOne z y x)))
  (cond
    ((= (length+ biggest) 2) biggest)
    ((= (length+ biggest) 0) (list x y))
    ((= (length+ 1))
      (if (= x y)
        (list x z)
        (list x y)))
  )
)

(define (biggerThanOne x other1 other2)
  (if (or (> x other1) (> x other2))
    (list x)
    (list))
)

(define (sumOfSquaresOfBiggestTwo x y z)
  (define big2 (biggestTwo x y z))
  (sumOfSquares (first big2) (second big2))
)

(sumOfSquaresOfBiggestTwo 9 7 14)

;output is 277 as it should be
