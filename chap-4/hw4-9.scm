(define (eval exp env)
  (cond
; stuff that comes before the for clause
        ((for? expr) (eval-for expr env))
; stuff that comes after the for clause
	))

(define (for? expr)
	(tagged-list? expr 'for))

(define (for-get-body expr)
	(caddr expr))

(define (for-get-num expr)
	(cadr expr))

(define (eval-for expr env)
	(let* (
		(for-body (for-get-body expr))
		(for-num (for-get-num expr))
		)
		(eval
			'(begin
				(define (for num body)
					(if (<= num 0)
						'done
						(begin
							body
							(for (- num 1) body))))
				(for for-num for-body)
			)
			env)))

; example of it being used right here:

(for 5 (display 'fire))

; this would display fire five times in a row
