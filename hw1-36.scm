; this starts of with my solution to hw1-36

(define (myFixedPointProcedure lmbd a)
  (let ((goodEnough (lambda (a b) (< (abs (- a b)) 0.00001))) (next (lmbd a)))
  (display next) (newline )
    (cond
      ((goodEnough next a) a)
      (else (myFixedPointProcedure lmbd next)))))

(define (myFixedPointProcedureDampen lmbd a)
  (let ((goodEnough (lambda (a b) (< (abs (- a b)) 0.00001))) (next (lmbd a)))
  (display next) (newline )
    (cond
      ((goodEnough next a) a)
      (else (myFixedPointProcedureDampen lmbd (/ (+ next a) 2))))))

(myFixedPointProcedure
                      (lambda (x) (/ (log 1000) (log x)))
                      2)

(myFixedPointProcedureDampen
                      (lambda (x) (/ (log 1000) (log x)))
                      2)


; that is crazy, dampening reduces the number of steps by ~ 75% 
