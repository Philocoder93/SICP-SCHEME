; interesting fact: these are the methods that
; make programming in js so fun, abstract piping functions
; with an absurb amount of power


(define (reduce a b check seed fcn step acumFunc)
  (if (check a b)
    seed
    (acumFunc (fcn a) (reduce (step a) b check seed fcn step acumFunc))))



(define (check1 a b)
  (> a b))

(define (fcn1 a)
  (+ a 2))

(define (step1 a)
  (+ a 1))

(define (acumFunc1 a b)
  (+ a b))


(reduce 2 9 check1 0 fcn1 step1 acumFunc1)

; this should output the numbers 1 to 10 with 2 added to them and them multiplied together


; @TODO write the iterative version of this procedure

(define (reduceIter a b check acum fcn step acumFunc)
  (if (check a b)
    acum
    (reduceIter (step a) b check (acumFunc (fcn a) acum) fcn step acumFunc)))

(reduceIter 2 9 check1 0 fcn1 step1 acumFunc1)
