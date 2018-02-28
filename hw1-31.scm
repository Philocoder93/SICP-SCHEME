; this is the recursive version of this function

(define (prod a b fnc step check)
  (if (check a b)
    1
    (* (fnc a) (prod (step a) b fnc step check))))


(define (factorial b)
  (define (fnc a)
    a)

  (define (step a)
    (+ a 1))

  (define (check a b)
    (> a b))

  (prod 1 b fnc step check))


(factorial 7)

; this will be the iterative version of the same function


(define (prodIter a b fnc step check)
  (define (iter a acum)
    (if (check a b)
      acum
      (iter (step a) (* acum (fnc a)))))
  (iter a 1))




(define (factorialIter b)
  (define (fnc a)
    a)

  (define (step a)
    (+ a 1))

  (define (check a b)
    (> a b))

  (prodIter 1 b fnc step check))

(factorialIter 7)


; both of these work now
