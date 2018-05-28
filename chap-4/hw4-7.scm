(define (expr-eval expr env)
	(cond 
	; the clauses that come before let
	((let*? expr)
		(eval-let*? expr env))
	; and the clauses that come after let
	))

(define (let*? expr)
	(tagged? expr '*let))

(define (eval-let*? expr env)
	(let* (
		(body (let*-get-body expr))
		(asgn-lst (let*-get-asgn-lst expr))
		(vars (let*-get-vars asgn-lst))
		(vals (let*-get-vals asgn-lst)))
		(eval
			(let*->let
				vars
				vals
				body)
			env)))

(define (let*-get-body expr)
	(caddr expr))

(define (let*-get-asgn-lst expr)
	(cadr expr))

(define (let*-get-vars asgn-lst)
	(map car asgn-lst))

(define (let*-get-vals asgn-lst)
	(map cadr asgn-lst))

(define (let*->let vars vals body)
	(if (last-var-val vars vals)
		(list
			(make-lambda
				(get-first-var vars)
				body)
			(get-first-val vals))
		(list
			(make-lambda
				(get-first-var vars)
				(let*->let (get-rest-vars vars) (get-rest-vals vals) body))
			(get-first-val vals))))

(define (last-var-val vars vals)
	(and
		(= (length vars) 1)
		(= (length vals) 1)))

(define (get-first-var var-lst)
	(car var-lst))

(define (get-first-val val-lst)
	(car val-lst))

(define (get-rest-var var-lst)
	(cdr var-lst))

(define (get-rest-val val-lst)
	(cdr val-lst))
