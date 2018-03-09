(define (cons-interval a b) (cons (max a b) (min a b)))

(define (upper-bound int) (car int))

(define (lower-bound int) (cdr int))

(define (interval-multiplication x y)
  (let ((arg1 (* (lower-bound x) (lower-bound y)))
        (arg2 (* (upper-bound x) (upper-bound y)))
        (arg3 (* (lower-bound x) (upper-bound y)))
        (arg4 (* (upper-bound x) (lower-bound y))))
    (cons-interval (min arg1 arg2 arg3 arg4) (max arg1 arg2 arg3 arg4))))

(define (interval-division x y)
  (if (and (> (upper-bound y) 0) (< (lower-bound y) 0))
    'cannot_divide_by_an_interval_that_spans_zero
    (interval-multiplication
      x
      (cons-interval
        (/ 1 (upper-bound y))
        (/ 1 (lower-bound y))))))

(interval-division (cons-interval 1 3) (cons-interval 4 5))

(interval-division (cons-interval 1 3) (cons-interval -4 5))
