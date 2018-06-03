(define (let? expr)
	(tagged-list? expr 'let))

(define (get-lam expr)
	(list
		'lambda
		(map car (cadr expr))
		(caddr expr)))

(define (get-args expr)
	(map cadr (cadr expr)))

(define (analyze-let expr)
	(let* (
		(lam-expr (get-lam expr))
		(lam-args (get-args expr))
		(proc (analyze-lambda lam-expr))
		(args (map analyze lam-args)))
		(lambda (env)
			(execute-application
				(proc env)
				(map
					(lambda (argproc) (argproc env))
					args)))))

; the above is what i came up with, everyone other answer i looked at just did
; this though:
; ((let? exp) (analyze (let->combination exp)))
; basically the same thing, i just redid the work
