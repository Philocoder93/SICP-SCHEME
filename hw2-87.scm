(define (poly-install-pack)
	(define (poly-equals-zero x)
		(empty-termlist? (term-list x)))
	(put 'eq-zero? 'poly
		(lambda (x) (poly-equals-zero x))))
