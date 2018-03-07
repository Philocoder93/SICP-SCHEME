; this exercise plunders code from 1-16 and refactors it to use in this procedure
; I was going to use isEven and square but then i realized that there are native methods that will do
; those things for you

; this procedure takes a base and a power and raises the base to that power
(define (Nth B P)
  (cond
    ((= P 0) 1)
    ((even? P) (square (Nth B (/ P 2))))
    (else (* B (Nth B (- P 1))))))



; this procedure takes the log of a certain number at a certain base
; note: this will not work when the log is not a whole number
(define (varLog N B)
  (define (varLogIter N B C)
    (cond
      ((= N 1) C)
      ((not (= (modulo N B) 0)) 'can_only_return_whole_number_logs)
      (else (varLogIter (/ N B) B (+ C 1)))))
  (varLogIter N B 0))


; Now that I think about it more I realize that the above procedure is actually pretty much useless for our
; purposes here, what you really need is a procedure that takes a number and runs it through
; modulo 2 until it returns something other than a 0 keeping a counter of the number of times it is rerun


; i.e. we need the procedure below
(define (num2s3s N)
  (define (num2s3sIter N 2C 3C)
    (cond
      ((= (modulo N 2) 0) (num2s3sIter (/ N 2) (+ 2C 1) 3C))
      ((= (modulo N 3) 0) (num2s3sIter (/ N 3) 2C (+ 3C 1)))
      ((= N 1) (cons 2C 3C))
      (else 'error)))

  (num2s3sIter N 0 0))

(num2s3s 72)
