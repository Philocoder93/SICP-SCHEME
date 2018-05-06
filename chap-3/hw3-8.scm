(define (remember-gen)
	(define counter 'def)
	(lambda (x)
		(if (eq? counter 'def)
			(begin (set! counter x) 0)
			counter)))

(define ef (remember-gen ))

(+ (ef 1) (ef 0))

(define ef (remember-gen ))

(+ (ef 0) (ef 1))
