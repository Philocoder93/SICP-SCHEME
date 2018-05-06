; this is the iterative improvement procedure
; this article: https://stackoverflow.com/questions/7719004/in-scheme-how-do-you-use-lambda-to-create-a-recursive-function
; helped a lot with this question
; this too: https://en.wikipedia.org/wiki/Fixed-point_combinator#Fixed_point_combinators_in_lambda_calculus


(define (y-comb-iter-improve f ge) (lambda (a) ((lambda (x a) (x x a)) (lambda (x a)
  (display a) (newline )
  (if (ge a)
    a
    (x x (f a)))) a)))

(define (sqrt x)
  ((y-comb-iter-improve
                      (lambda (y) (/ (+ y (/ x y)) 2))
                      (lambda (y) (< (abs (- (* y y) x)) 0.001))) 1))


(sqrt 4)
(sqrt 9)


; these ^^^ return values very close to 2 and 3 respectively


(define (fixed_point f a)
  ((y-comb-iter-improve
                      f
                      (lambda (x) (< (abs (- x (f x))) 0.001))) a))

(fixed_point cos 1.0)

; this returns .7395672022122561 which is in fact the fixed point of the natural cosine function
