(define (limit-stream strm tolerance)
	(cond
		((null-stream? strm) 'the-null-stream)
		((null-stream? (car-stream! strm)) 'the-null-stream)
		(else (let* (
			(first (car-stream! strm))
			(second (car-stream! (cdr-stream! strm)))
			(within-tolerance? (< (abs (- first second)) tolerance)))
				(if within-tolerance?
					second
					(limit-stream (stream-cdr! strm) tolerance))))))
