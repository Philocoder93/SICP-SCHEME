; again, using procedures from previous exercises

(define (infiniteContinuedFractionRecursive n d k)
  (define (infiniteContinuedFractionRecur i n d k)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (infiniteContinuedFractionRecur (+ i 1) n d k)))))

  (infiniteContinuedFractionRecur 1 n d k))


(infiniteContinuedFractionRecursive
                          (lambda (k) 1.0)
                          (lambda (k) 1.0)
                          20)



(define (getN a)
  1)

(define (getD a)
  (cond
    ((= a 1) 1)
    ((= a 2) 2)
    (else
      (if (= (modulo (+ a 1) 3) 0)
        (* 2 (/ (+ a 1) 3))
        1))))


(infiniteContinuedFractionRecursive
                          getN
                          getD
                          20)

; the output from this is 0.71828182845 which is supposed to aproximate e - 2,
; for reference e is 2.718281828459045235
