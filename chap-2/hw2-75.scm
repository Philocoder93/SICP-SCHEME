(define (make-from-magnitude-angle x y)
	(define (dispatch op-name)
		(cond ((eq? op-name 'magnitude) x)
		      ((eq? op-name 'angle) y)
		      ((eq? op-name 'real) (* x (cos y)))
		      ((eq? op-name 'imaginary) (* x (sin y)))
		      (else 'error_invalid_op_name_for_mag_angle)))
	dispatch)

