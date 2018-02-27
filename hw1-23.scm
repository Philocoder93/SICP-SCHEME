(define (divisor? N D)
  (= (modulo N D) 0))

(define (smallestDivisorIter N D)
  (cond
    ((divisor? N D) D)
    ((= D 2) (smallestDivisorIter N 3))
    (else (smallestDivisorIter N (+ D 2)))))

(define (smallestDivisor N)
  (smallestDivisorIter N 2))
