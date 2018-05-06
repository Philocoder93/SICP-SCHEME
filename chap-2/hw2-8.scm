(define (cons-interval a b) (cons (max a b) (min a b)))

(define (upper-bound int) (car int))

(define (lower-bound int) (cdr int))

(define (dif-interval x y)
  (let ((p1 (- (lower-bound x) (lower-bound y)))
        (p2 (- (upper-bound x) (upper-bound y)))
        (p3 (- (lower-bound x) (upper-bound y)))
        (p4 (- (upper-bound x) (lower-bound y))))
    (cons-interval (max p1 p2 p3 p4) (min p1 p2 p3 p4))))


(dif-interval (cons-interval 2 3) (cons-interval 6 8))
