(define (accum oper init lst)
   (if (null? lst)
       init
       (oper (car lst)
           (accum oper init (cdr lst)))))

(define (my-horner-eval x coeffic-sequence)
  (accum (lambda (coeffic recur)
    (+ coeffic (* x recur))) 0 coeffic-sequence))

(my-horner-eval 3 (list 1 2 3))
