; these procedures are pulled from 1-27
; I'm leaving this one undone for now,
; I'm going to check the answer for this one later
(define (isEven N)
  (= (modulo N 2) 0))

(define (square N)
  (* N N))

(define (halve N)
  (/ N 2))

(define (squaringStep N A E)
  (if ()

    (modulo (square (fastCheckIter N A (halve E))) N)))


(define (fastCheckIter N A E)
  (cond
    ((= E 1) (modulo A N))
    ((isEven E) )
    (else (modulo (* (fastCheckIter N A (- E 1)) A) N))))

(define (fastCheck N A)
  (= (fastCheckIter N A (- N 1)) (modulo 1 N)))
