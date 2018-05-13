(define (averager a b c)
	(let*
		((d (make-connector))
		(e (make-connector)))
		(adder a b e)
		(multiplier d c e)
		(constant 2 d)))

