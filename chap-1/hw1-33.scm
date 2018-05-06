; the initial code for this is drawn from 1-32

; this is the prime checker needed later on

(define (prime? a)
  (define (divisor? N D)
    (= (modulo N D) 0))

  (define (smallestDivisorIter N D)
    (cond
      ((> (square D) N) N)
      ((divisor? N D) D)
      ((= D 2) (smallestDivisorIter N 3))
      (else (smallestDivisorIter N (+ D 2)))))

  (define (smallestDivisor N)
    (smallestDivisorIter N 2))

  (= a (smallestDivisor a))
)


(define (reduceFilter a b check seed fcn step acumFunc filter)
(display 'call) (newline )
  (if (check a b)
    seed
    (acumFunc (fcn (filter a)) (reduceFilter (step a) b check seed fcn step acumFunc filter))))

(reduceFilter
            1
            10
            (lambda (a b) (> a b))
            0
            (lambda (a) (+ a 2))
            (lambda (a) (+ a 1))
            (lambda (a b) (+ a b))
            (lambda (a) (cond
              ((= (modulo a 2) 0)
                (display 'hitexception) (newline )
                5)
              (else a))))

; sum of the squares of the primes 1 -10

(reduceFilter
            3
            6
            (lambda (a b) (> a b))
            0
            (lambda (a) (* a a))
            (lambda (a) (+ a 1))
            (lambda (a b) (+ a b))
            (lambda (a) (cond
              ((prime? a)
                (display 'hitexception) (newline )
                0)
              (else a))))
