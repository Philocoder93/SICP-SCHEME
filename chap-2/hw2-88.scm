; first we need to install the generic negation operation, in order to do this we first need to
; have each of the types in our tower install a negation operation for that type

; this answer works but it is much less elegant than the one found here: http://community.schemewiki.org/?sicp-ex-2.88
(define (scheme-number-install)
	(define (negate-scheme-number x)
		(- 0 x))
	(put 'negate 'scheme-number
		(lambda (x) (negate-scheme-number))))

(define (rational-number-install)
	(define (negate-rational-number x)
		(let* (
			(newNumer (- 0 (numer x)))
			(newDenom (denom x)))
			(make-rat newNumer newDenom)))
	(put 'negate 'rational
		(lambda (x) (negate-rational-number x))))

(define (complex-number-install)
	(define (negate-complex-number x)
		(let* (
			(arg-real (- 0 (real-part x)))
			(arg-imag (- 0 (imag-part x))))
			(make-from-real-imag arg-real arg-imag)))
	(put 'negate 'complex
		(lambda (x) (negate-complex-number x))))

(define (poly-pack-install)
	(define (sub-terms x y)
		(cond
			((empty? x) (generically-apply 'negate y))
			((empty? y) y)
			(else
				(let* (
					(first-of-x (first x))
					(first-of-y (first y))
					(order-of-first-x (order first-of-x))
					(order-of-first-y (order first-of-y))
					(cond
						((> order-of-first-x order-of-first-y)
							(term-adjoin first-of-x (sub-terms (term-rest-of x) y)))
						((> order-of-frist-y order-of-first-x)
							(term-adjoin (generically-apply 'negate first-of-y) (sub-terms x (term-rest-of y))))
						((= order-of-frist-y order-of-first-x)
							(term-adjoin (+ first-of-x (generically-apply 'negate first-of-y)) (sub-terms (term-rest-of x) (term-rest-of y))))))))))

	(define (sub-poly x y)
		(if (same-var? (get-var x) (get-var y))
			(make-poly (get-var x)
				(sub-terms (list-of-terms x)
					(list-of-terms y)))
			(error "can't let you do that")))

	(put 'subtract '(poly poly)
		(lambda (x y) (sub-poly x y))))
