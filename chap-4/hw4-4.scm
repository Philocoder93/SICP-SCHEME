; example of what would be coming through
; (and expr expr)
; (or expr expr)

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

(define (second-expr expr-lst)
	(cadr expr-lst))

(define (and-eval? expr env)
	(if (not (eval (first-expr expr) env))
		#f
		(if (not (eval (second-expr expr) env))
			#f
			#t)))

(define (or-eval expr env)
	(if (eval (first-expr expr) env)
		#t
		(if (eval (second-expr expr) env)
			#t
			#f)))


; this solution is basically correct but I forgot to account for the fact
; that most scheme ops can take a bazillion args if the operation allows for it
; and "and" and "or" are both just such args, so this needs to be rewritten in a way that\
; accounts for the fact that there could be N number of args
