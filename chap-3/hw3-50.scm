(define (map-strm prc . streamargs)
	(if (null-stream? (cr argstreams))
		the-empty-stream
		(stream-cons
			(apply proc (map car-stream streamargs))
			(apply map-stream
				(cons proc (map cdr-stream streamargs))))))
