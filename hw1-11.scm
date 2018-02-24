; these functions will compute f(n) where f(n) = n when n < 3 and
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3


(define (genSubCall X Y)
  (* (recursiveF (- X Y)) Y))

(define (recursiveF N)
  (if (< N 3)
    N
    (+ (genSubCall N 1) (genSubCall N 2) (genSubCall N 3))))


(recursiveF 4)
