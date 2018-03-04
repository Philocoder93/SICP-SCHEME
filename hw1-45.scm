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



(define (NthCompose fb fa n)
  (if (<= n 0)
    fa
    (NthCompose fb (compose fb fa) (- N 1))))

(define (avg-damp f)
  (display '2) (newline )
  (lambda (a) (/ (+ a (f a)) 2)))

(define (fourthRoot0f12 y)
  (/ 12 (* y y y)))

(define (fRO12DoubleDamped)
  (display '1) (newline )
  (compose (avg-damp fourthRoot0f12) avg-damp) )

(fixed_point (fRO12DoubleDamped ) 1)
