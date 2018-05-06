;i have chosen to construct new deks out of a new data structure called a lnk

(define (make-lnk x) (list '() x '()))

(define (front-point-lnk lnk)  (first lnk))

(define (get-val-lnk lnk) (second lnk))

(define (rear-point-lnk lnk) (third lnk))

(define (set-front-lnk lnk x) (set-car! lnk x))

(define (set-rear-lnk lnk x) (set-car! (cddr lnk) x))

;abstraction layer

(define (make-dek )
	(let ((nu-lnk (make-lnk '())))
		(cons nu-lnk nu-lnk)))

(define (empty-dek dek)
	(eq? (front-dek dek) '()))

(define (front-dek dek)
	(get-val-lnk (car dek)))

(define (rear-dek dek)
	(get-val-lnk (cdr dek)))

(define (insert-front-dek dek x)
	(display 'start)
	(if (null? (front-dek dek))
		(let ((nu-lnk (make-lnk x)))
			(display 'fire1)
			(set-car! dek nu-lnk)
			(display 'fire2)
			(set-cdr! dek nu-lnk))
		(let ((nu-lnk (make-lnk x)))
			(set-front-lnk (car dek) nu-lnk)
			(set-rear-lnk nu-lnk (car dek))
			(set-car! dek nu-lnk))))

(define (insert-rear-dek dek x)
	(display 'staaaart)
	(if (null? (front-dek dek))
		(let ((nu-lnk (make-lnk x)))
			(display 'fire3)
			(set-car! dek nu-lnk)
			(display 'fire4)
			(set-cdr! dek nu-lnk))
		(let ((nu-lnk (make-lnk x)))
			(set-rear-lnk (cdr dek) nu-lnk)
			(set-front-lnk nu-lnk (cdr dek))
			(set-cdr! dek nu-lnk))))

(define (delete-front-dek dek)
	(if (eq? (car dek) (cdr dek))
		(let ((nu-lnk (make-lnk '())))
			(set-car! dek nu-lnk)
			(set-cdr! dek nu-lnk))
		(let ((nu-lnk (rear-point-lnk (car dek))))
			(set-front-lnk nu-lnk '())
			(set-car! dek nu-lnk))))

(define (delete-rear-dek dek)
	(if (eq? (car dek) (cdr dek))
		(let ((nu-lnk (make-lnk '())))
			(set-car! dek nu-lnk)
			(set-cdr! dek nu-lnk))
		(let ((nu-lnk (front-point-lnk (cdr dek))))
			(set-rear-lnk nu-lnk '())
			(set-cdr! dek nu-lnk))))

;testing out the data abstraction layer

(empty-dek (make-dek ))

(define newdek (make-dek ))

(insert-front-dek newdek 'this)

(insert-rear-dek newdek 'that)

(front-dek newdek)

(rear-dek newdek)

(insert-front-dek newdek 'other)

(insert-rear-dek newdek 'whatevs)

(front-dek newdek)

(rear-dek newdek)

(delete-front-dek newdek)

(delete-rear-dek newdek)

(front-dek newdek)

(rear-dek newdek)

(delete-front-dek newdek)

(front-dek newdek)

(rear-dek newdek)

(delete-front-dek newdek)

(front-dek newdek)

(rear-dek newdek)
