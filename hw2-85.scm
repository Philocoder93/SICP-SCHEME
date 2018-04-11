; this will be a generic procedure that we will have to put in here, selector methods
; will have to be exported by each package so we can check to make sure that the one selector
; that is going to be eliminated is already empty
(define (install-rational)
	(define (get-denominator x)
		(denom x))
	(define (get-numerator x)
		(numer x))
	(put 'get-denominator 'rational
		(lambda (x) (get-denominator x)))
	(put 'get-numerator 'rational
		(lambda (x) (get-numerator x)))
)

(define (install-real)
	(define (express-as-rational x)
		; here i am not exactly sure what to put
		; i am sure that there is some algorithm for
		; checking to see if some real number can be
		; expresse as an integer but i really dont
		; want to get it working right now
	)
	(put 'express-as-rational 'real
		(lambda (x) (express-as-rational x)))
)

(define (install-complex
	(define (get-complex-part x)
		(imag-part x))
	(put 'get-complex-part 'complex
		(lambda (x) (get-complex-part x)))))

(define (install-drop)
	(define (scheme-number-drop x)
		(error "can't drop a number"))

	(define (rational-number-drop x)
		(/ (get-numerator x) (get-denominator x)))

	(define (rational-number-zero-equals x)
		((get 'equals 'rational) ((get 'make 'rational) 0 0) x)) 

	(define (rational-number-zero-equals x)
		((get 'equals 'rational) ((get 'make 'rational) 0 0) x)) 


	(put 'drop '(scheme-number) 
		(lambda (x) (scheme-number-zero-equals x))) 

	(put 'drop '(rational)
		(lambda (x) (complex-zero-equals x))) 

	(put 'drop '(real)
		(lambda (x) (rational-number-zero-equals x))))

	(put 'drop '(complex)
		(lambda (x) (rational-number-zero-equals x))))

