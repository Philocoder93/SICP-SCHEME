(define (accum oper init lst)
   (if (null? lst)
       init
       (oper (car lst)
           (accum oper init (cdr lst)))))

(define (accum-n oper init lstlst)
  (if (null? (car lstlst))
      '()
      (cons (accum oper init (map
          (lambda (y) (car y))
          lstlst))
        (accum-n oper init (map
          (lambda (y) (cdr y))
          lstlst)))))


(accum-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
