(define (cons-interval a b) (cons (max a b) (min a b)))

(define (upper-bound int) (car int))

(define (lower-bound int) (cdr int))

(define (takeAverage a b)
  (/ (+ a b) 2))

(define (make-interval-center-percent center percent)
  (cons-interval (+ center (* center percent)) (- center (* center percent))))

(define (percent-from-interval int)
  (let (
        (centerPoint (takeAverage (upper-bound int) (lower-bound int))))
    (- (/ (upper-bound int) centerPoint) 1)))

(make-interval-center-percent 4 0.75)

(percent-from-interval (make-interval-center-percent 4 0.75))
