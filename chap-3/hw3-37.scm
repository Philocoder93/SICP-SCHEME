(define (quick- x y)
	(let ((x (make-connector)))
		(add y z x)
	z))


(define (quick* x y)
	(let ((z (make-connector)))
		(multiply x y z)
	z))

(define (quick/ x y)
	(let ((z (make-connector)))
		(multiply y z x)
	z))

(define (quickv x)
	(let ((z (make-connector)))
		(const x z))
	z)

