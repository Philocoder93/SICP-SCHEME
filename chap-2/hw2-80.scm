(define (install-zero-equals)
	(define (scheme-number-zero-equals x)
		(= x 0))

	(define (complex-zero-equals x)
		((get 'equals 'complex) ((get 'make-from-real-imag 'complex) 0 0) x)) 

	(define (rational-number-zero-equals x)
		((get 'equals 'rational) ((get 'make 'rational) 0 0) x)) 

	(put '=zero? '(scheme-number) 
		(lambda (x) (scheme-number-zero-equals x))) 

	(put '=zero? '(complex)
		(lambda (x) (complex-zero-equals x))) 

	(put '=zero? '(rational)
		(lambda (x) (rational-number-zero-equals x))))


; i have seen other answers to this question that get the correct result but do so
; by messing with the correct way that packages are supposed to work, namely, they
; assume knowledge about the way that certain packages are implemented, but these procedures are only supposed to
; know about the methods of the rational number package that have been installed in the lookup table and as far as I can tell
; these do not include any selectors or an equals operation,
; in order for any of this to work (without involving gross violations of modularity) 
; one of these two things would have to be present, for the purposes of this exercise I assume that 
; the later has been implemented, scheme-numbers (which I am assuming are implemented as
; vanilla numbers) and the complex number package, they do *not* have access to the interal getter and setter 
