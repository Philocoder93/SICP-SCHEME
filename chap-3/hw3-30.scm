(define (rip-carry-adder a-list b-list s-list cin)
	(if (or (null? a-list) (null? b-list))
		'ok
		(let (
			(cout (makewire )))
			(full-adder (first a-list) (first b-list) cin (first s-list) cout)
			(rip-carry-adder (cdr a-list) (cdr b-list) s-list cout))))

