; there are exactly four cases
; 1. they all have unique values
; 2. they all have the same value
; 3. there is one greatest value
; 4. there is one least value
; by finding out how many of the three are larger than at least one other
; we can easily differentiate between these cases
; if there are two larger than at least one other then those two are the largest
; if there are none larger than at least one other then they are all the same value,
; and you can use any two of them.
; if there is one larger than at least one other then the three inputs have this
; relation: a > b, b = c, a > c, in this case check two inputs, if they are equal
; to one another then the third input is the largest one, if they do not then one of
; two values you just checked is the larger one

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
