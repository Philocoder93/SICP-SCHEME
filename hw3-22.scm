(define (new-Q )
	(let*
		((Q (cons '() '()))
		(front-point (lambda () (car Q)))
		(back-point (lambda () (cdr Q)))
		(set-front! (lambda (y) (set-car! Q y)))
		(set-back! (lambda (y) (set-cdr! Q y)))
		;abstraction layer
		(empty-Q? (lambda () (null? (front-point ))))
		(front-Q? (lambda ()
			(if (empty-Q? )
				(error "Q is empty")
				(car (front-point )))))
		(insert-Q (lambda (x)
			(let*
				((new (cons x '())))
				(cond
					((empty-Q? )
						(set-front! new)
						(set-back! new))
					(else
						(set-cdr! (back-point ) new)
						(set-back! new))))))
		(delete-Q (lambda () (set-front! (cdr (front-point ))))))
		(lambda (m)
			(cond
				((eq? m 'insert) insert-Q)
				((eq? m 'front) front-Q?)
				((eq? m 'empty?) empty-Q?)
				((eq? m 'delete) delete-Q)))))


(define dispatch (new-Q ))

(define insert (dispatch 'insert))
(define front (dispatch 'front))
(define delete (dispatch 'delete))

(insert 'A)
(front )
(insert 'B)
(insert 'C)
(insert 'D)
(front )
(delete )
(front )
(delete )
(front )
