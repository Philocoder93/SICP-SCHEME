(define (partially-summated stream)
	(define output-stream
		(stream-cons
			(car-stream! stream)
				(add-streams output-stream (cdr-stream! stream))))
	output-stream)
