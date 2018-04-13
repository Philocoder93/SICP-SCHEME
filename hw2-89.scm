(define (install-poly-pack)
	(define (term-adjoin term list-of-terms)
		(if (=zero? (co-efic term))
			(list-of-terms)
			(let* (
				(term-power (power term))
				(list-length (length term-list))
				(terms-to-add (- term-power list-length))
				(blank-terms-to-add (- terms-to-add 1))
				(need-to-add-terms (> terms-to-add 0)))
				(if need-to-add-terms
					(let* (
						(suffix (append (make-list blank-terms-to-add 0) (list term))))
						(append list-of-terms suffix))
					(let* (
						(first-half (list-head list-of-terms (- term-power 1)))
						(term-to-ammend (list-ref list-of-terms term-power))
						(second-half  (list-tail list-of-terms term-power)))
						(append first-half (list (+ (co-efic term) term-to-ammend)) second-half))))))

	(define (the-empty-termlist) '())

	(define (first-term term-list) (list-tail term-list (- (length term-list) 1)))

	(define (rest-terms term-list) (list-head term-list (- (length term-list) 1)))

	(define (empty-term-list term-list) (null? term-list)))
	;i'll let you imagine all the boilerplate needed to do this exporting
