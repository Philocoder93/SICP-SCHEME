; this procedure is an iterative process for multiplying two integers in terms of
; adding doubling and halving

(define (isEven N)
  (= (modulo N 2) 0))

(define (double N)
  (* N 2))

(define (halve N)
  (/ N 2))

(define (iterLogMul A B C)
  (cond
    ((= B 0) C)
    ((isEven B) (iterLogMul (double A) (halve B) C))
    (else (iterLogMul A (- B 1) (+ C A)))))

(define (logMul A B)
  (iterLogMul A B 0))

(logMul 12 12)
