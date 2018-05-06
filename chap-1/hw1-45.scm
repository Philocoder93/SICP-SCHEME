(define (y-comb-iter-improve f ge) (lambda (a) ((lambda (x a) (x x a)) (lambda (x a)
  (display a) (newline )
  (if (ge a)
    a
    (x x (f a)))) a)))

(define (fixed_point f a)
  (display 'fire)
  ((y-comb-iter-improve
                      f
                      (lambda (x) (< (abs (- x (f x))) 0.01))) a))

(define (compose f1 f2)
  (display '3) (newline )
  (lambda (a) (f2 (f1 a))))



(define (NthCompose fa fb n)
  (if (<= n 0)
    fa
    (NthCompose fb (compose fa fb) (- N 1))))

; fun fact, this procedure will be very helpfull in calculating the thing that I am interested in

(define (avg-damp f)
  (display '2) (newline )
  (lambda (a) (/ (+ a (f a)) 2)))

(define (fourthRoot0f12 y)
  (/ 12 (* y y y)))

(define (getNthrootFunc Y Nth)
  (if (= Nth 0)
        1
        (* Y (getNthrootFunc Y (- Nth 1)))))



(define (fRO12DoubleDamped)
  (display '1) (newline )
  (compose (avg-damp fourthRoot0f12) avg-damp) )

(fixed_point (fRO12DoubleDamped ) 1)


(define (Nthroot Num Nth)
  (fixed_point
              (NthCompose
                        (lambda (y) (/ Num (getNthrootFunc y Nth)))
                        avg-damp
                        (- Nth 1))
              1))

(Nthroot 5 5)
