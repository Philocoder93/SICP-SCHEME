; for this one I have canabalized some code from 2-18

(define (deep-reverse-list list)
  (define (deep-reverse-list-iter list newlist)
    (cond
      ((null? list) newlist)
      ((list? (car list)) (deep-reverse-list-iter (cdr list) (cons (deep-reverse-list (car list)) newlist)))
      (else (deep-reverse-list-iter (cdr list) (cons (car list) newlist)))))

  (deep-reverse-list-iter list '()))

(deep-reverse-list (list 1 2 3 4 (list 1 2 3 4 5)))

(deep-reverse-list (list 1 2 (list 3 (list 4 3 2)) 5 6 (list (list 7 5 8) 8)))
