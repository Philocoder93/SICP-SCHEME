; example of what would be coming through
; (and expr expr ...)
; (or expr expr ...)
; also remember, from the perspecive of the interpreter
; all this stuff is interpretable as a list of various things

(define (eval-this expr env)
	(cond
	; some stuff right here
		((and? expr) (and-eval (sub-exprs expr) env))
		((or? expr) (or-eval (sub-exprs expr) env))
	; all the rest of it
	))

(define (and? expr)
	(tagged-list? expr 'and))

(define (or? expr)
	(tagged-list? expr 'or))

(define (sub-exprs expr)
	(cdr expr))

(define (first-expr expr-lst)
	(car expr-lst))

(define (rest-expr expr-lst)
	(cdr expr-lst))

(define (expr-empty expr-lst)
	(null? expr-lst))

(define (and-eval? expr-lst env)
	(cond (
		((exp-empty expr-lst) #t)
		((not (eval (first-expr expr-lst) env)) #f)
		(else (and-eval? (rest-expr expr-lst) env)))))

(define (or-eval? expr-lst env)
	(cond (
		((exp-empty expr-lst) #f)
		((eval (first-expr expr-lst) env) #t)
		(else (or-eval? (rest-expr expr-lst) env)))))
