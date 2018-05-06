; (define (proc A B Q P)
;   (define APrime
;     (+ (* B Q) (* A Q) (* A P)))
;   (define BPrime
;     (+ (* B P) (* A Q)))
;   (list APrime BPrime))

(define (APrime A B Q P)
    (+ (* B Q) (* A Q) (* A P)))

(define (BPrime A B Q P)
    (+ (* B P) (* A Q)))

(define (isEven N)
  (= (modulo N 2) 0))

(define (canSquare count countUp)
  (and (isEven countUp) (>= count (* countUp 2))))

(define (logFibIter A B count countUp)
  (cond
    ((<= count countUp) (list A B))
    ((canSquare count countUp) (logFibIter (APrime A B A B) (BPrime A B A B) count (* countUp 2)))
    (else (logFibIter (+ A B) A count (+ countUp 1)))))

(define (logFib count)
  (logFibIter 1 0 count 1))


(logFib 100)

; output is 354224848179261915075 as it should be
