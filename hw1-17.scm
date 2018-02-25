; this procedure will reproduce multiplication with a logarithmic number of steps

(define (isEven N)
  (= (modulo N 2) 0))

(define (double N)
  (* N 2))

(define (halve N)
  (/ N 2))

(define (logMul A B)
  (display A) (display 'X) (display B) (newline )
  (cond
    ((= B 0) 0)
    ((isEven B) (logMul (double A) (halve B)))
    (else (+ A (logMul A (- B 1))))))


(logMul 13 125)
