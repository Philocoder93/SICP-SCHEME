; this is my version of euclids algorithm

(define (eucAlg A B)
  (cond
    ((= A 0) B)
    ((= B 0) A)
    ((> A B) (eucAlg B (modulo A B)))
    (else (eucAlg A (modulo B A)))))


(define (xor a b)
  (not (boolean=? a b)))

(define (ensureNeg a)
  (- 0 (abs a)))


; this is my improved version of make rat



(define (make_rat x y)
  (let (
    (g (eucAlg (abs x) (abs y)))
    (xpos (positive? x))
    (ypos (positive? y))
    )
    (if (xor xpos ypos)
      (cons (/ (ensureNeg x) g) (/ (abs y) g))
      (cons (/ (abs x) g) (/ (abs y) g) ))))

(make_rat 20 15)
