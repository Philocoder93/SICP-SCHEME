; there needs to be a new paradigm for deqs
; basically they need to be constructed out of something besides
; pairs, i have chosen to build them out of links


(define (make-lnk x) (list '() x '()))

(define (front-point-lnk lnk)  (first lnk))

(define (get-val-lnk lnk) (second lnk))

(define (back-point-lnk lnk) (third lnk))

(define (set-front-lnk lnk x) (set-car! lnk x))

(define (set-back-lnk lnk x) (set-car! (cddr lnk) x))

;abstraction layer

; the book reccomends using more basic operations, i don't think you actually need that many core operations
; you can do a lot of this stuff much more simply with less core operations

(define (make-dek )
	(let ((nu-lnk (make-lnk '())))
		(cons nu-lnk nu-lnk)))

(define (empty-dek dek)
	(eq? (front-dek dek) '()))

(define (front-dek dek)
	(car (get-val-lnk dek)))

(define (rear-dek dek)
	(cdr (get-val-lnk dek)))

(define (insert-front-dek dek x)
	(let ((nu-lnk (make-lnk x)))
		(set-front-lnk (car dek) nu-lnk)
		(set-car! dek nu-lnk)))

(define (insert-rear-dek dek x)
	(let ((nu-lnk (make-lnk x)))
		(set-back-lnk (cdr dek) nu-lnk)
		(set-cdr! dek nu-lnk)))

(define (i






;abstraction layer

(define (make-queue

(define (empty-dek dek) (null? (front-point dek)))

(define (front-dek dek)
	(if (empty-dek dek)
		(error "empty")
		(car (front-point dek))))

(define (back-dek dek)
	(if (empty-dek dek)
		(error "empty")
		(car (back-point dek))))

(define (front-insert-dek! dek x)
	(cond
		((empty-dek dek)
			(set-front! dek x)
			(set-back! dek x))
		(else
			(set-front! dek (cons x (front-point x)))
			)))

(define (back-insert-dek! dek x)
	(cond
		((empty-dek dek)
			(set-front! dek x)
			(set-back! dek x))
		(else
			(let ((new (cons x '())))
				(set-cdr! (back-point x) new)
				(set-back! dek new)))))
	

(define (front-delete-dek! dek)
	(set-front! dek (cdr (front-point dek))))

(define (back-delete-dek! dek)
	(set-front! dek ))
