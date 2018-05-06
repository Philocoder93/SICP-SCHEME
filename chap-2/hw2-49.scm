(define (seg->paint seg-list)
  (lambda (frm)
    (for-each
      (lambda (seg)
        (draw-line
          ((frame-coord-map frm) (start-segment seg))
          ((frame-coord-map frm) (end-segment seg))))
    seg-list)))

; this ^^^ is the procedure that we are supposed to use to create painters

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

; abstraction barrier here

(define (make-segment a b)
  (list a b))

(define (start-segment seg)
  (first seg))

(define (end-segment seg)
  (second seg))

; now the actual answers

(let (
      (top-right (1 1))
      (top-left (0 1))
      (bottom-right (1 0))
      (bottom-left (0 0))
      )
  (let (
        (top (make-segment top-right top-left))
        (right (make-segment top-right bottom-right))
        (left (make-segment top-left bottom-left))
        (bottom (make-segment bottom-left bottom-right))
        )
    (seg-paint (list top right left bottom))))

; this ^^^ is to draw the actual frame

(let (
      (top-right (1 1))
      (top-left (0 1))
      (bottom-right (1 0))
      (bottom-left (0 0))
      )
  (let (
        (tr-bl (make-segment top-right bottom-left))
        (br-tl (make-segment bottom-right top-left))
        )
    (seg-paint (list tr-bl br-tl))))

; this ^^^ is the X

(let (
      (top-mid (0.5 1))
      (right-mid (1 0.5))
      (bottom-mid (0.5 0))
      (left-mid (0 0.5))
      )
  (let (
        (top-right (make-segment top-mid right-mid))
        (bottom-right (make-segment right-mid bottom-mid))
        (bottom-left (make-segment bottom-mid left-mid))
        (top-left (make-segment left-mid top-mid))
        )
    (seg-paint (list top right left bottom))))

; this ^^^ is to draw the diamond
