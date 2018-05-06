; carmichael number checker

(define (isEven N)
  (= (modulo N 2) 0))

(define (square N)
  (* N N))

(define (halve N)
  (/ N 2))

(define (fastCheckIter N A E)
  (cond
    ((= E 1) (modulo A N))
    ((isEven E) (modulo (square (fastCheckIter N A (halve E))) N))
    (else (modulo (* (fastCheckIter N A (- E 1)) A) N))))

(define (fastCheck N A)
  (= (fastCheckIter N A N) (modulo A N)))

(define (fermatPrimeCheckIter N A)
  (cond
    ((= N A) #t)
    ((fastCheck N A) (fermatPrimeCheckIter N (+ A 1)))
    (else #f)))

(define (fermatPrimeCheck N)
  (if (= N 1)
    #f
    (fermatPrimeCheckIter N 2)))


(fermatPrimeCheck 1105)

(fermatPrimeCheck 1729)

; these are both carmichael numbers that fool the algorithm as expected
