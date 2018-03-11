(define (cons-interval a b) (cons (max a b) (min a b)))

(define (upper-bound int) (car int))

(define (lower-bound int) (cdr int))

(define (interval-multiplication x y)
  (let ((arg1 (* (lower-bound x) (lower-bound y)))
        (arg2 (* (upper-bound x) (upper-bound y)))
        (arg3 (* (lower-bound x) (upper-bound y)))
        (arg4 (* (upper-bound x) (lower-bound y))))
    (cons-interval (min arg1 arg2 arg3 arg4) (max arg1 arg2 arg3 arg4))))

(define (interval-addition x y)
  (cons-interval (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y))))

(define (interval-division x y)
  (if (and (> (upper-bound y) 0) (< (lower-bound y) 0))
    'cannot_divide_by_an_interval_that_spans_zero
    (interval-multiplication
      x
      (cons-interval
        (/ 1 (upper-bound y))
        (/ 1 (lower-bound y))))))

(define (method1 a b)
  (interval-division (interval-multiplication a b) (interval-addition a b)))

(define (method2 a b)
  (let ((one (cons-interval 1 1)))
    (interval-division one
      (interval-addition (interval-division one a)
                         (interval-division one b)))))

(define (pairToFloatingPoint int)
  (cons-interval (exact->inexact (upper-bound int)) (exact->inexact (lower-bound int))))

(define (takeAverage a b)
  (/ (+ a b) 2))

(define (center-point int)
  (takeAverage (upper-bound int) (lower-bound int)))

(define (percent-from-interval int)
  (let (
        (centerPoint (takeAverage (upper-bound int) (lower-bound int))))
    (exact->inexact (- (/ (upper-bound int) centerPoint) 1))))

; these ^ are the utility methods that I am using to solve this problem

(method1 (cons-interval 6 6) (cons-interval 8 8.5))
(method2 (cons-interval 6 6) (cons-interval 8 8.5))

(center-point (method1 (cons-interval 6 6) (cons-interval 8 8.5)))
; midpoint is 3.476600985221675
(center-point (method2 (cons-interval 6 6) (cons-interval 8 8.5)))
; midpoint is 3.472906403940887

(percent-from-interval (method1 (cons-interval 6 6) (cons-interval 8 8.5)))
; percent variance is .04782146652497343
(percent-from-interval (method2 (cons-interval 6 6) (cons-interval 8 8.5)))
; percent variance is 1.2765957446808418e-2

; one important discovery here: if you run the two methods on intervals with a
; percent zero they produce identical results

; after looking around a bit I think I have an idea of what's going on:
; the second method involves three multiplications while the first method only involves two
; as we have already seen interval multiplication does not behave linearly with respect to the
; percent variance, it jumps all over the place, so I'm guessing that the extra multiplication
; amplifies the variance and the addition in the denominator of method 2 introduces some of that
; amplified variance into the actual center point which accounts for the slight difference of endpoint
; (albeit a slight difference that becomes quite great when you have intervals with a high variance)

(interval-division (cons-interval 2 8) (cons-interval 2 8))
