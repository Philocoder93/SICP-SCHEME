(define (cons-interval a b) (cons (max a b) (min a b)))

(define (upper-bound int) (car int))

(define (lower-bound int) (cdr int))


(upper-bound (cons-interval 5 6))

(lower-bound (cons-interval 5 6))
