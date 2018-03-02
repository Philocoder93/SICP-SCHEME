; this will be the infinite continued fraction procedure, first I will write the recursive version of
; this function

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

; this procedure output .6180339850173578
; which is pretty darn close the correct answer of
; 0.61803398875 according to google

; now I will proceed to write this same procedure iteratively
; for this one we work from back to front and take advantage of the fact that when
; we are doing programming we can proceed from step to step we need not have the
; outputs from the steps equal each other as in actual mathematics

(define (infiniteContinuedFractionIterative n d k)
  (define (infiniteContinuedFractionIter a n d k)
    (if (= k 0)
      a
      (infiniteContinuedFractionIter
                                    (/ (n k) (+ (d k) a))
                                    n
                                    d
                                    (- k 1))))
  (infiniteContinuedFractionIter 0 n d k))

(infiniteContinuedFractionIterative
                          (lambda (k) 1.0)
                          (lambda (k) 1.0)
                          20)

; output value from this one is also .6180339850173578
