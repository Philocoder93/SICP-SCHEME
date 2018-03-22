; again, this is basically pseudo code right here,
; not a whole lot I can do about that
; this section assumes the existence of a method called shift-painter
; which transforms a painter by resetting its origin and it's first two edges

; remember that rotating something 180 degrees has the same effect
; whether they are flipped clockwise or counterclockwise
(define (flip-painter-180deg painter)
  (shift-painter painter
                 (cons-vect 1.0 1.0)
                 (cons-vect 0.0 1.0)
                 (cons-vect 1.0 0.0)))

; remember that rotating something 90 degrees clockwise is the same as rotating it 270 degrees
; counterclockwise, so this is the answer to the 270 degrees question
(define (flip-painter-90deg painter)
  (shift-painter painter
                 (cons-vect 0.0 1.0)
                 (cons-vect 0.0 0.0)
                 (cons-vect 1.0 1.0)))

; this one simply produces a left-right mirror image of the original
; painter
(define (flip-painter-horiz painter)
  (shift-painter painter
                 (cons-vect 1.0 0.0)
                 (cons-vect 0.0 0.0)
                 (cons-vect 1.0 1.0)))
