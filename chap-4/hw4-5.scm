(define (arrow-clause expr)
	(tagged-list? (cond-actions expr) '=>))

(define (arrow-clause-func expr)
	(cdr (cond-actions expr)))

(define (clause-expand clauses)
	; lines 2 through 5 from the book
	(cond (
		((else-clause? frst) (if (null? rst)
			(seq->expr (cond-act frst))
			(error "else should always be last in the clause order"))
		((arrow-clause rst) (if (one-arg-fnc (arrow-clause-func expr))
			(if (eval (cond-predicate))
			(error "must be one arg func")))
		(else )))))

