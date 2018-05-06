; so for this exercise it is not clear if the procedure needs to work for all possible
; combinations of the number types mentioned or if it just needs to work for two numbers
; of the same type, first of all I will do for numbers of the same type.

(define (install-generic-equals)
	; these procedures are based on procedures define in the
	; scheme-number, complex-number, and rational-number packages
	(define (scheme-number-equals x y)
		(= (- x y) 0))
	
	(define (rational-number-equals x y)
		(= 0 ((get 'sub '(rational rational)) x y)))

	(define (complex-number-equals x y)
		(= 0 ((get 'sub '(complex complex)) x y)))

	;these here are the externally exposed procedures	

	(put 'equ? '(complex complex)
		(lambda (x y) (complex-number-equals x y)))

	(put 'equ? '(rational rational)
		(lambda (x y) (rational-number-equals x y)))

	(put 'equ? '(scheme-number scheme-number)
		(lambda (x y) (scheme-number-equals x y))))
		
