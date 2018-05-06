; Use your vector representation from exercise 2.46 to define a
; representation for segments with a constructor make-segment and selectors start-segment and
; end-segment.

; these are my elementary vector operations

(define (cons-vect x y)
  (cons x y))

(define (x-vect vect)
  (car vect))

(define (y-vect vect)
  (cdr vect))

; abstraction barrier here

(define (add-vect a b)
  (cons-vect (+ (x-vect a) (x-vect b)) (+ (y-vect a) (y-vect b))))

(define (sub-vect a b)
  (cons-vect (- (x-vect a) (x-vect b)) (- (y-vect a) (y-vect b))))

(define (scal-vect vect scalar)
  (cons-vect (* (x-vect vect) scalar) (* (y-vect vect) scalar)))

; abstraction barrier here, although to be honest, since i'm not putting in type
; restrictions or error handling this isn't even that big of a deal

(define (make-segment a b)
  (list a b))

(define (start-segment seg)
  (first seg))

(define (end-segment seg)
  (second seg))

(start-segment (make-segment (cons-vect 3 5) (cons-vect 5 5)))

(end-segment (make-segment (cons-vect 3 5) (cons-vect 5 5)))
