; i can confirm that this does indeed work, it is an
; instance of the y combinator

((lambda (fib)
	(fib fib n))
	(lambda (fib n)
		(cond
			((= n 1) 0)
			((= n 2) 1)
			(else (+ (fib fib (- n 1)) (fib fib (- n 2)))))))

; the missing expressions are:
; od? ev? od? (- n 1)
; ev? ev? od? (- n 1)
