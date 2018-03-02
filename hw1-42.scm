; this is my compose function

(define (mashUp fnc1 fnc2)
  (lambda (arg) (fnc2 (fnc1 arg))))


((mashUp
        (lambda (a) (* a 2))
        (lambda (a) (+ a 2))
        ) 5)

((mashUp
        (lambda (a) (+ a 2))
        (lambda (a) (* a 2))
        ) 5)

; note that the order matters here
