(define (cons-interval a b) (cons (max a b) (min a b)))

(define (upper-bound int) (car int))

(define (lower-bound int) (cdr int))

(define (interval-addition x y)
  (cons-interval (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y))))

(define (interval-multiplication x y)
  (let ((arg1 (* (lower-bound x) (lower-bound y)))
        (arg2 (* (upper-bound x) (upper-bound y)))
        (arg3 (* (lower-bound x) (upper-bound y)))
        (arg4 (* (upper-bound x) (lower-bound y))))
    (cons-interval (min arg1 arg2 arg3 arg4) (max arg1 arg2 arg3 arg4))))


(define (width-interval int)
  (/ (abs (- (upper-bound int) (lower-bound int))) 2))



; first we will show that delta in width before and after is purely a function of
; the width of the argument intervals

(define arg1 (cons-interval 5 6))

(define arg2 (cons-interval 8 12))

(width-interval arg1)
; returns 1/2

(width-interval arg2)
; returns 2

(width-interval (interval-addition arg1 arg2))
; returns 5/2 a.k.a. 2 + 1/2

(define arg1 (cons-interval 3 15))

(define arg2 (cons-interval 2 12))

(width-interval arg1)
; returns 6

(width-interval arg2)
; returns 5

(width-interval (interval-addition arg1 arg2))
; returns 11 a.k.a. 6 + 5

; now lets try it with multiplication

(define arg1 (cons-interval 3 6))

(define arg2 (cons-interval 2 8))

(width-interval arg1)
; returns 3/2

(width-interval arg2)
; returns 3

(width-interval (interval-multiplication arg1 arg2))
; returns 21

; same width in these intervals as the previous calls

(define arg1 (cons-interval 0.5 3.5))

(define arg2 (cons-interval 2 8))

(width-interval arg1)
; returns 3/2

(width-interval arg2)
; returns 3

(width-interval (interval-multiplication arg1 arg2))
; returns 13.5 NOT 21
; despite the fact that the intervals are exactly the same
