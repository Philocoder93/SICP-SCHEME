; my immediate suspicion is that the aproximate tolerance will be the tolerance of
; their gcf squared

; these are a collection of procedures that I have already written that
; i think will be quite useful in solving this problem

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
    (exact->inexact (- (/ (upper-bound int) centerPoint) 1))))

(define (interval-multiplication x y)
  (let ((arg1 (* (lower-bound x) (lower-bound y)))
        (arg2 (* (upper-bound x) (upper-bound y)))
        (arg3 (* (lower-bound x) (upper-bound y)))
        (arg4 (* (upper-bound x) (lower-bound y))))
    (cons-interval (min arg1 arg2 arg3 arg4) (max arg1 arg2 arg3 arg4))))

(let (
      (inta (cons-interval 3 4.5))
      (intb (cons-interval 5 9))
      )
  (display (percent-from-interval inta))
  (newline )
  (display (percent-from-interval intb))
  (newline )
  (percent-from-interval (interval-multiplication inta intb)))


; after toying around with the above for a while i have determined that the rough equation they
; have in mind is probably percent of A*B equals percent of A plus percent of B
