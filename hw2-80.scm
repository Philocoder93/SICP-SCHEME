(define (install-zero-equals)
	(define (scheme-number-zero-equals x)
		(= x 0))

	(define (complex-zero-equals x)
		(= ((get 'make-from-real-imag 'complex) 0 0) x)) 

	(define (rational-number-zero-equals x)
		(= ((get 'make 'rational) 0 1) x)) 

	(put '=zero? '(scheme-number) 
		(lambda (x) (scheme-number-zero-equals x))) 

	(put '=zero? '(complex)
		(lambda (x) (complex-zero-equals x))) 

	(put '=zero? '(rational)
		(lambda (x) (rational-number-zero-equals x))))
