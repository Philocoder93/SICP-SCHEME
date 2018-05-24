(define (get-type expr)
	(car expr))

(define (evaluate-this! expr env)
	(let (
		(proc (get 'eval (get-type expr))))
		(if (not (null? proc))
			(proc expr env)
			(cond
				((eval-self? expr) expr)
				((var? expr) (var-lookup expr env))
				((apply-this? expr)
					(apply
						(evaluate-this! (get-func expr) env)
						(list-of-vals (get-args expr) env)))
				(else (error "not an expression type that is supported"))
				))))
