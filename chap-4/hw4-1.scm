(define (list_val_left_to_right expr env)
	(if (no_oper expr)
		'()
		(let (
			(first-arg (eval (frst_oper expr) env)))
			(cons
				first-arg
				(list_vals (rest_oper expr) env) ))))

(define (list_val_right_to_left expr env)
	(if (no_oper expr)
		'()
		(let (
			(second-arg (list_vals (rest_oper expr) env)))
			(cons
				(eval (frst_oper expr) env)
				second-arg))))
