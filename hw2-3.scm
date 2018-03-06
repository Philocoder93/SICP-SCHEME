; this answer is implemented with code from 2-2
; for the purpose of this exercise I have decided to write two seperate implementations of
; rectangles, I will first implement rectangles using points as the building blocks of rectangles
; and then again using one point and a heighth and width value as the building block of rectangles

; layer 1
; at this layer it's fine to be clear that points are pairs

(define (make_point x y)
  (if (and (number? x) (number? y))
    (cons x y)
    'int-only))

(define (point? a)
  (pair? a))

(define (x_point point)
  (if (pair? point)
    (car point)
    'point-only))

(define (y_point point)
  (if (pair? point)
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

; implementation one
; rectangles are 4tuples of points
; in other words they are pairs of pairs of points


; for this method I am not going to do any sorting at all,
; I am going to check to make sure that the points were given in the correct order,
; if they were not then throw an error
(define (make_rectangle p1 p2 p3 p4)
  (define (formRectangle? p1 p2 p3 p4)
    (let ((compx (lambda (a b) (= (x_point a) (x_point b)))) (compy (lambda (a b) (= (y_point a) (y_point b)))))
      (and (compy p1 p2) (compx p2 p3) (compy p3 p4) (compx p4 p1))))

  (if (formRectangle? p1 p2 p3 p4)
    (cons (cons p1 p2) (cons p4 p3))
    'top_left_to_bottom_left_only))

(define (top_row_rectangle rec)
  (car rec))

(define (bottom_row_rectangle rec)
  (cdr rec))

(define (top_left_rectangle rec)
  (car (top_row_rectangle rec)))

(define (top_right_rectangle rec)
  (cdr (top_row_rectangle rec)))

(define (bottom_left_rectangle rec)
  (car (bottom_row_rectangle rec)))

(define (bottom_right_rectangle rec)
  (car (bottom_row_rectangle rec)))
