; once again, the code here was partly developed using code from previous
; exercises

(define (naturalToOdds a)
  (+ 1 (* (- a 1) 2)))

(define (aproxTanRecursive x k)
  (define (aproxTanRecur i x k)
    (cond
      ((> i k) 0)
      ((= i 1) (/ x (- 1 (aproxTanRecur (+ i 1) x k))))
      (else (/ (* x x) (- (naturalToOdds i) (aproxTanRecur (+ i 1) x k))))))

  (aproxTanRecur 1 x k))

(aproxTanRecursive
                  5
                  20)

; function outputs this: -3.38051500625
; according to the internet this: -3.38051500625 is the tangent of 5
