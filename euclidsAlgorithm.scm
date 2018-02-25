; this is my implementation of euclids algorithm based on my
; preliminary reading of 1.2.5 in SICP


; always make b the smaller number
(define (euclidsAlgorithm A B)
  (cond
    ((= (modulo A B) 0) B)
    ((> A B) (euclidsAlgorithm B (modulo A B)))
    (else (euclidsAlgorithm A (modulo B A)))))

(euclidsAlgorithm 123567 535656)

; answer outputs as 3
