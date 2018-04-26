(define (gen-memoized-count-pairs)

	(define completed-list '())

	(define (completed? x)
		(define (completed-iter x x-list)
			(cond
				((null? x-list) #f)
				((eq? x (first x-list)) #t)
				(else (completed-iter x (cdr x-list)))))
		(completed-iter x completed-list))

	(define (add-to-completed x)
		(if (null? completed-list)
			(set! completed-list (cons x '()))
			(set-cdr! (last-pair completed-list) (cons x '()))))

	(define (memoized-count-pairs x)
		(cond
			((not (pair? x)) 0)
			((completed? x) 0)
			(else (begin
				(add-to-completed x)
				(+
					(memoized-count-pairs (car x))
					(memoized-count-pairs (cdr x))
					1)))))

	memoized-count-pairs
)


(define count-pairs (gen-memoized-count-pairs ))

count-pairs

(define test-example (cons (cons 'a (cons 'b 'e)) (cons 'c 'd)))

(count-pairs test-example)

