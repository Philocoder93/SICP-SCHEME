(define (make-proxy f)
	(define count 0)
	(lambda (input)
		(cond
			((eq? input 'num_calls?) count)
			((eq? input 'reset) (set! count 0))
			(else (begin (set! count (+ count 1)) (f input))))))


(define (add-to-7 x)
	(+ x 7))

(define proxy-to-7 (make-proxy add-to-7))

(proxy-to-7 15)


(proxy-to-7 18)

(proxy-to-7 2)


(proxy-to-7 'num_calls?)

(proxy-to-7 'reset)

(proxy-to-7 'num_calls?)
