(define (let? expr)
	(tagged? expr 'let))

(define (eval-let? expr env)
	(eval-expr
		((make-lambda
			(let-get-vars (let-get-asgn-lst expr))
			(let-get-body expr))
		(get-vals (let-get-asgn-lst expr))
		env)

(define (let-get-asgn-lst expr)
	(cadr expr))

(define (let-get-body expr)
	(caddr expr))

(define (let-get-vars asgn-lst)
	(define (let-get-vars-iter vars asgn-lst)
		(if (null? asgn-lst)
			vars
			(let-get-vars-iter (cons (caar asgn-lst) vars) (cdr asgn-lst))))
	(let-get-vars-iter '() asgn-lst))

(define (let-get-vals asgn-lst)
	(define (let-get-vals-iter vals asgn-lst)
		(if (null? asgn-lst)
			vals
			(let-get-vals-iter (cons (cdar asgn-lst) vals) (cdr asgn-lst))))
	(let-get-vals-iter '() asgn-lst))

(define (expr-eval expr env)
	(cond 
	; the clauses that come before let
	((let? expr)
		(eval-let? expr env))
	; and the clauses that come after let
	))
