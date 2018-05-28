(define (expr-eval expr env)
	(cond 
	; the clauses that come before let
	((let? expr)
		(eval-let? expr env))
	; and the clauses that come after let
	))

(define (let? expr)
	(tagged? expr 'let))

(define (eval-let? expr env)
	(if (named-let? expr)
		(eval-named-let? expr env)
		(eval-unnamed-let? expr env)))

(define (named-let? expr)
	(= (length expr) 4))

(define (eval-unnamed-let? expr env)
	(eval-expr
		((make-lambda
			(unnamed-let-get-var-lst (unnamed-let-get-asgn-lst expr))
			(unnamed-let-get-body expr))
		(unnamed-let-get-val-lst (unnamed-let-get-asgn-lst expr))
		env)

(define (eval-named-let? expr env)
	(let* (
		(name (named-let-get-name ))
		(arg-lst (named-let-get-asgn-lst ))
		(val-lst (named-let-get-val-lst arg-lst))
		(var-lst (named-let-get-var-lst arg-lst))
		(body (named-let-get-body expr)))
		(eval-expr
			(list
				'begin
				(list
					'define
					name
					(make-lambda
						arg-lst
						body)
				(cons
					name
					val-lst))
			env)))

(define (named-let-get-name expr)
	(cadr expr))

(define (named-let-get-body expr)
	(cadddr expr))

(define (named-let-get-asgn-lst expr)
	(caddr expr))

(define (named-let-get-val-lst asgn-lst)
	(map cadr asgn-lst))

(define (named-let-get-var-lst asgn-lst)
	(map car asgn-lst))

(define (unnamed-let-get-body expr)
	(caddr expr))

(define (unnamed-let-get-asgn-lst expr)
	(cadr expr))

(define (unnamed-let-get-val-lst asgn-lst)
	(map cadr asgn-lst))

(define (unnamed-let-get-var-lst asgn-lst)
	(map car asgn-lst))
