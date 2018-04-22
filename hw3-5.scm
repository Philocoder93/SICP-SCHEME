(define (make-circle-predicate radius centerx centery)
	(lambda (x y)
		(<=
			(+ (square (- x centerx)) (square (- y centery)))
			(square radius))))

(define (make-experiment p x1 y1 x2 y2)
	(let* (
		(highx (if (> x1 x2) x1 x2))
		(lowx (if (< x1 x2) x1 x2))
		(highy (if (> y1 y2) y1 y2))
		(lowy (if (< y1 y2) y1 y2))
		(rangex (- highx lowx))
		(rangey (- highy lowy))
		(new-x-in-range (lambda () (+ lowx (random rangex))))
		(new-y-in-range (lambda () (+ lowy (random rangey))))
		)
		(lambda () (p (new-x-in-range ) (new-y-in-range )))))



(define (m-c-proc-integrate P x1 y1 x2 y2 trials)
	(let* (
		(experiment (make-experiment P x1 y1 x2 y2))
		)
		(m-c-proc trials experiment)))


(define unit-circle-pred (make-circle-predicate 1.0 0.0 0.0))

(m-c-proc-integrate unit-circle-pred 1.0 1.0 -1.0 -1.0 400)

; obviously this model is probabilistic but the the average with a lot of runs is normally 79/100,
; when you multiply this by 4 (the area of the two by two cube that the unit circle is in
; you end up with 3.16 which is pretty darn close to pi
; the only thing that is missing from this is the monte-carlo procedure from the book,
; if you insert that procedure everywhere that you see (m-c-proc) this will work
