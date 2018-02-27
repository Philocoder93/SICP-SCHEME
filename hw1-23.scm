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


(smallestDivisor 357)

; 3, as it should be

(smallestDivisor 917)

; 7 as it should be
