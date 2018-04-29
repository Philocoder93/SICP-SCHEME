(define (make-dek ) (cons '() '()))

(define (front-point dek)  (car x))

(define (back-point dek) (cdr x))

(define (set-front! dek x) (set-car! dek x))

(define (set-back! dek x) (set-cdr! dek x))

;abstraction layer

(define (empty-dek dek) (null? (front-point dek)))

(define (front-dek x)
	(if (empty-dek x)
		(error "empty")
		(car (front-point x))))

(define (back-dek x)
	(if (empty-dek x)
		(error "empty")
		(car (back-point x))))

(define (front-insert-dek! dek x)
	(cond
		((empty-dek dek)
			(set-front! dek x)
			(set-back! dek x))
		(else
			(set-front! dek )
			))

(define (back-insert-dek! x)
	(cond
		((empty-dek dek)
			(set-front! dek x)
			(set-back! dek x))
		(else
			()
			)))

(define (front-delete-dek! x))

(define (back-delete-dek! x))
