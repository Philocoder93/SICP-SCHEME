; this will be an iterative procedure that will be able to calculate the
; value of a certain base raised to a certain power, it will have a logarithmic growth rate
; of steps

(define (isEven N)
  (= (modulo N 2) 0))

(define (isOdd N)
  (not (isEven N)))

(define (exponentiateEven A)
  (display 'Even) (newline )
  (* A A))

(define (exponentiateOdd B A)
  (display 'Odd) (newline )
  (* B A))

(define (exponentiateIter B N A)
  (display B) (display 'X) (display N) (display 'X) (display A) (newline )
  (cond
    ((= N 0) A)
    ((isEven N) (exponentiateIter B (- N 2) (exponentiateEven A)))
    ((isOdd N) (exponentiateIter B (- N 1) (exponentiateOdd B A)))))

(define (exponentiate B N)
  (exponentiateIter B (- N 1) B))


(exponentiate 5 5)
