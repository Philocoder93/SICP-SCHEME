(define (make-acum x)
	(lambda (y)
		(begin
			(set! x 
				(+ x y))
					x)))


(define acum (make-acum 7))

(acum 8)

(acum 9)


(define new-acum (make-acum 7))

(new-acum 9)

(new-acum 17)
