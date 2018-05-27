(define (arrow-clause expr)
	(tagged-list? (cond-actions expr) '=>))

(define (get-arrow-clause-pred expr)
	(car expr))

(define (get-arrow-clause-body expr)
	(cddr expr))

(define (arrow-clause-apply expr pred)
	(cons expr pred))

(define (one-arg-fnc input)
	; returns true if the input is a one arg function
	; not sure how to check this, i think if it's possible
	; then it would have to be a special keyword exposed by
	; the language itself
		)

(define (clause-expand clauses)
; lines 2 through 5 from the book
	(cond (
		((else-clause? frst) (if (null? rst)
			(seq->expr (cond-act frst))
			(error "else should always be last in the clause order"))
		((arrow-clause rst) (if (one-arg-fnc (get-arrow-clause-body frst))
			(make-if
				(get-arrow-clause-pred frst)
				(arrow-clause-apply
					(get-arrow-clause-body frst)
					(get-arrow-clause-pred frst)
					(clause-expand rst)))
			(error "must be one arg func")))
; the rest of this crap
		))))
