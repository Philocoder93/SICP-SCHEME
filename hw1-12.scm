; file will recursively traverse pascals triangle and return as
;many rows of it in a list as you specify in the counter variable


;
;








;(define (nth ind list)
;  (if (= ind 0)
;    (first list)
;    (nth (- ind 1) (list-tail list 1))))

(define (nextRow inlist outlist)
  (if (= (length+ inlist) 1)
    (append! '(1) outlist '(1))
    (nextRow
      (list-tail inlist 1)
      (append!
        outlist
        (list (+ (first inlist) (second inlist)))))))


(define (recursivePascal counter inList)
  (cond
    ((< counter 2) inList)
    (else (append (list inList) (list (recursivePascal (- counter 1) (nextRow inList '())))))))

;(nextRow '(1 5 10 10 5 1) '())

;(nextRow '(1 4 6 4 1) '())

(recursivePascal 3 '(1 1))
