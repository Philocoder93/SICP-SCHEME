(define (tag-it type-tag contents)
	(if (number? contents)
		contents
		(cons 'type-tag contents)))

(define (what-type-tag datum)
	(cond
		((number? datum) 'scheme_number)
		((pair? datum) (car datum))
		(else (error "bad datum, need typed datum"))))

(define (get-contents datum)
	(cond
		((number? datum) datum)
		((pair? datum) (cdr datum))
		(else (error "bad datum, need typed datum"))))
