; this is code cannabilized from previous exercises, it is neccesary to use
; these methods as utility methods

(define (flip-painter-180deg painter)
  (shift-painter painter
                 (cons-vect 1.0 1.0)
                 (cons-vect 0.0 1.0)
                 (cons-vect 1.0 0.0)))

(define (flip-painter-90deg painter)
  (shift-painter painter
                 (cons-vect 0.0 1.0)
                 (cons-vect 0.0 0.0)
                 (cons-vect 1.0 1.0)))

(define (flip-painter-horiz painter)
  (shift-painter painter
                 (cons-vect 1.0 0.0)
                 (cons-vect 0.0 0.0)
                 (cons-vect 1.0 1.0)))

; once again this is basically pseudo because i do not have access to the basic
; operations required to make this work

; also we are assuming that there is a procedure available to us called beside
; that places painters next to each other

(define (below-painter painter1 painter2)
  (let* (
        (midpoint (cons-vect 0.5 0.0))
        (top (shift-painter
                          painter1
                          midpoint
                          (cons-vect 1.0 0.5)
                          (cons-vect 0.0 1.0)))
        (bottom (shift-painter
                              (cons-vect 0.0 0.0)
                              (cons-vect 1.0 0.0)
                              midpoint))
        )
    (lambda (frame)
      (top frame)
      (bottom frame))))

(define (below-painter painter1 painter2)
  (let* (
        (rotated1 (flip-painter-90deg painter1))
        (rotated2 (flip-painter-90deg painter2))
        (flipped-beside (beside rotated1 rotated2))
        (270degreeturn (lambda (painter) (flip-painter-180deg (flip-painter-90deg painter))))
        )
    (270degreeturn flipped-beside)))
