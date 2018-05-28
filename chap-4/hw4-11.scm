(define (mk-frm vars vals)
	(map cons vars vals))
(define (frm-vars frame) (map car frame))
(define (frm-vals frame) (map cdr frame))
(define (frm+bndng! var val frame)
	(let (
		(new-bndng (cons var val)))
		(set!
			frame
			(cons new-bndng frame))))
