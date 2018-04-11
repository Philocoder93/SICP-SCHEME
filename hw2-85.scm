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
	(define (get-real-part x)
		(real-part x))
	(put 'get-complex-part 'complex
		(lambda (x) (get-complex-part x)))
	(put 'get-real-part 'complex
		(lambda (x) (get-real-part x)))))

(define (install-drop)
	(define (scheme-number-drop x)
		(error "can't drop a number"))

	(define (rational-number-drop x)
		(if (= 0 (modulo (numer x) (denom x)))
			(/ (generically-apply 'get-numerator x) (generically-apply 'get-denominator x))
			(error "can't drop this rational number")))

	(define (real-number-drop x)
		(if (generically-apply 'express-as-rational x)
			(generically-apply 'express-as-rational x)
			(error "can't drop this real number")))

	(define (complex-number-drop x)
		(if (= 0 (generically-apply 'get-complex-part x))
			(generically-apply 'get-real-part x)
			(error "can't drop this complex number")))

	(put 'drop '(scheme-number)
		(lambda (x) (scheme-number-drops x))) 

	(put 'drop '(rational)
		(lambda (x) (rational-number-drop x))) 

	(put 'drop '(real)
		(lambda (x) (real-number-drop x)))

	(put 'drop '(complex)
		(lambda (x) (complex-number-drop x))))
