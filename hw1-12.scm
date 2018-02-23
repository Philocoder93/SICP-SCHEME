; file will recursively traverse pascals triangle and return as
;many rows of it in a list as you specify in the counter variable

(define (recursivePascal counter inList)
  )





 (if (> counter 1)
   ((append! pasc (recursivePascal (- counter 1) (nextRow pasc '()))))))








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

(nextRow '(1 5 10 10 5 1) '())

;(nextRow '(1 4 6 4 1) '())

;(recursivePascal 2 '(1))
