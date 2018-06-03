(define (letrec? expr) (tagged-list? expr 'letrec?))

(define (get-vars expr) (map car (cadr expr)))

(define (get-vals expr) (map cdr (cadr expr)))

(define (get-body expr) (cddr expr))

(define (init-vars vars)
	(map (lambda (var) (list 'define var '*unassigned)) vars))

(define (set-vars vars vals)
	(map (lambda (var val) (list 'set! var val)) vars vals))

(define (letrec->let expr)
	(cons 'begin
		(append!
			(init-vars (get-vars expr))
			(set-vars (get-vars expr) (get-vals expr))
			(get-body expr))))

; part b
; for this part I am definitely not going to draw out the environment diagrams but i will
; explain what is wrong with this, basically the core problem with louis thinking is that
; the let statement is syntactic sugar for creating a lambda and passing values to it,
; but when you pass arguments to a function the arguments are evaluated before being
; sent into the function, in the case of lambdas that means that they gain their enclosing environment
; and this means that their enclosing environment is an environment that does not
; include their own name, so when they are evaluated in the context of a let statement
; they will look in their enclosing environment for their own name which will not the context
; in which they were called but will be the environment in which they were evaluated which
; is one environment up and which would not include their own names, thus calling them would return
; an error
