; this will be an iterative procedure that will be able to calculate the
; value of a certain base raised to a certain power, it will have a logarithmic growth rate
; of steps

; one possible way of improving this algorithm is to have it approach the desired
; power from both sides, ie, if the desired power is just below the power that could be reached by
; squaring the current accumulator then we should square the current accumulator and then iterate down
; by dividing a couple of times by the base
; just a thought for future

(define (isEven N)
  (= (modulo N 2) 0))

(define (square N)
  (* N N))

(define (canSquare N NA)
  (<= (* NA 2) N))

;(define (shouldSquare N NA)
;  )

(define (exponentiateIter B N A NA)
  (cond
    ((<= N NA) A)
    ((and (isEven NA) (canSquare N NA)) (exponentiateIter B N (square A) (* NA 2)))
    (else (exponentiateIter B N (* B A) (+ NA 1)))))

(define (exponentiate B N)
  (exponentiateIter B N B 1))

(isEven 5)

(square 5)

(canSquare 15 4)

(exponentiate 2 37)

; end of stream
