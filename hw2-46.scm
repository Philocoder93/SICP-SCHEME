; these are my elementary vector operations

(define (cons-vect x y)
  (cons x y))

(define (x-vect vect)
  (car vect))

(define (y-vect vect)
  (cdr vect))

; abstraction barrier here

(define (add-vect a b)
  (cons (+ (x-vect a) (x-vect b)) (+ (y-vect a) (y-vect b))))

(define (sub-vect a b)
  (cons (- (x-vect a) (x-vect b)) (- (y-vect a) (y-vect b))))

(define (scal-vect vect scalar)
  (cons (* (x-vect vect) scalar) (* (y-vect vect) scalar)))

; and an abstraction barrier here from any later applications for these procedures

(scal-vect (cons-vect 3 4) 5)

(add-vect (cons-vect 2 3) (cons-vect 4 5))

(sub-vect (cons-vect 2 3) (cons-vect 4 5))
