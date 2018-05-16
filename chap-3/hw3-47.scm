; rather than do it the way that the book wanted me to do it, i implemeneted the desired functionality this way first:

(define (make-semafore n)
	(let ((count (list 0 n)))
		(define (the-semafore arg)
			(cond
				((eq? arg 'acquire)
					(if (test! count)
						(the-semafore 'acquire)))
				((eq? arg 'release)
					(decrement! list))))
		the-semafore))

(define (test! count)
	(if (>= (car count) (cadr count))
		#t
		(begin (set-car! count (+ (car count) 1))
			#f)))

(define (decrement! count)
	(if (<= (car count) 0)
		(error "do not decrement below the limit for this semafore, this program has an error")
		(set-car! count (- (car count) 1))))
