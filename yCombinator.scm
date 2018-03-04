; ((lambda (x) (display 'fire) (newline ) (x x)) (lambda (x) (display 'fire) (newline ) (x x)))

; this is the general form of the y combinator^^^

; ((lambda () ((lambda (x) (display 'fire) (newline ) (x x))
; (lambda (x) (display 'fire) (newline ) (x x)))) )

; this is y combinator explicitly declared wrapped in a lambda but with no logic being done in it ^

(define (wrap a f ge) (lambda (a f ge) ((lambda (x a) (x x a)) (lambda (x a)
  (if (ge a)
    a
    (x x (f a)))) a) a f ge))

(wrap
  1
  (lambda (a) (+ a 1))
  (lambda (a) (> a 24)))


; this expression here ^^^ has some more interesting things being done in it
; rather than having two copies of the same lambda right next to each other in here
; we have a lambda function whose only job is to take the next lambda and apply it to itself,
; in this case with the arguments that we have passed it,
; furthermore, in the third lambda decleration ge and f are free variables so they take
; their reference from the top level lambda


(define (y-comb-iter-improve f ge) (lambda (a) ((lambda (x a) (x x a)) (lambda (x a)
  (if (ge a)
    a
    (x x (f a)))) a)))

((y-comb-iter-improve
              (lambda (a) (+ a 1))
              (lambda (a) (> a 24))) 35)

; this expression up here ^^^ is the prize, what this is is a function that takes a fixed point procedure
; and a 'good enough' checker and returns a function that takes a starting point and then calls a self caller
; method on an iterative improvement method created with the y combinator
