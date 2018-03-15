(define (accum oper init lst)
   (if (null? lst)
       init
       (oper (car lst)
           (accum oper init (cdr lst)))))

(define (get-fringe lst)
  (cond
    ((null? lst) '())
    ((list? lst) (append (get-fringe (car lst)) (get-fringe (cdr lst))))
    (else (list lst))))

(define (leaf-count t)
  (accum (lambda (x y) (+ y 1)) 0 (car (map get-fringe (list t)))))


(leaf-count (list 4 5 5 (list 1 2 3 (list 3 4 5))))
