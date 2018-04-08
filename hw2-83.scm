(define (install-generic-raise-package)
	(put 'raise 'scheme-number
		(lambda (x) ((get 'make 'rational) x 1)))
; for this one i assumed that there actually would be a real package installed and further assumed that
; the rational package would expose some methods for pulling of the numerator and the denominator, without them i don't
; think you could actually make a real number
	(put 'raise 'rational
		(lambda (x) ((get 'make 'real) (/ ((get 'get-num 'rational) x) ((get 'get-denom 'rational) x)))))
	(put 'raise 'real
		(lambda (x) ((get 'make-from-real-imaginary 'complex) x 0)))
	(put 'raise 'complex
		(lambda (x) x)))

(define (raise x)
	(apply-generic 'raise x))
