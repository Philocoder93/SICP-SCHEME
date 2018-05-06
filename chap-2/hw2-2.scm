; make-segment cons
; start-segment sel
; end-segment sel
;
; make-point cons
; x-point sel
; y-point sel

; layer 1
; at this layer it's fine to be clear that points are pairs

(define (make_point x y)
  (if (and (number? x) (number? y))
    (cons x y)
    'int-only))

(define (point? a)
  (pair? a))

(define (x_point point)
  (if (point? point)
    (car point)
    'point-only))

(define (y_point point)
  (if (point? point)
    (cdr point)
    'point-only))

; layer 2
; at this layer we only reference the functions from layer one, this allows us to
; abstract away from data manipulation as well as input checking, we can however
; reference the fact that segments are pairs of *points*

(define (make_segment p1 p2)
  (if (and (point? p1) (point? p2))
    (cons p1 p2)
    'point-only))

(define (segment? a)
  (if (pair? a)
    (and (point? (car a)) (point? (cdr a)))
    #f))

(define (start_segment seg)
  (if (segment? seg)
    (car seg)
    'seg-only))

(define (end_segment seg)
  (if (segment? seg)
    (cdr seg)
    'seg-only))

; layer 3
; at this layer we only use the methods defined in the layers above

(define (midpoint_segment seg)
  (if (segment? seg)
    (let ((start (start_segment seg)) (end (end_segment seg)))
      (make_point (/ (+ (x_point start) (x_point end) ) 2) (/ (+ (y_point start) (y_point end) ) 2)))
    'seg-only))

; the following is a test of this data abstraction



(midpoint_segment (make_segment (make_point 1 1) (make_point 5 5)))

(midpoint_segment (make_segment (make_point 1 6) (make_point 7 5)))

(midpoint_segment (make_segment (make_point 2 3) (make_point 3 2)))
