;for "compute the rest of result recursively"

(rest-of-result
	(let*
		(difference
			(sub-terms L1 (mul-term-by-all-terms (make-term new-o new-c) L2)))
		(div-terms difference l2)))

;for form the result
(adjoin-term (make-term new-o new-c) rest-of-result)

(define (divide-polynomials dvdnd dvsr)
	(if (same-var? (var dvdnd) (var dvsr))
		(divide-terms (term-list dvdnd) (term-list dvsr))
		(error "cannot divide two polynomials if they are of a different variable")))
