(define (square-constraint a b)
	(define (process-have-val)
		(if (has-value? b)
			(if (< (get-value b) 0)
				(error "no such thing as a square less than 0")
				(set-value! a (sqrt (get-value b)) myself))
			(if (has-value? a)
				(set-value! b (square (get-value a)) myself))))
	(define (process-no-value)
		(lose-value a myself)
		(lose-value b myself)
		(process-have-val))
	(define (myself request)
		(cond
			((eq? request 'have-val)
				(process-have-val))
			((eq? request 'no-val)
				(process-no-value))
			(else (error "not a procedure present"))))
	(connect a myself)
	(connect b myself)
	myself)