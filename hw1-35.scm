; golden ration using the fixed point procedure
; first I will write my own approximation of the fixed point procedure

(define (myFixedPointProcedure lmbd a)
  (display a)
  (let ((goodEnough (lambda (a b) (< (abs (- a b)) 0.00001))) (next (lmbd a)))
  (display 'next) (display next) (newline )
    (cond
      ((goodEnough next a) a)
      (else (myFixedPointProcedure lmbd next)))))

(myFixedPointProcedure
                      (lambda (x) (+ 1 (/ 1 x)))
                      1)


; the output of this 1.61803713528, which is a pretty good aproximation of
; the golden mean
