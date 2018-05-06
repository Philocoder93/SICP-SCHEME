(define (reverse-list list)
  (define (reverse-list-iter list newlist)
    (if (null? list)
      newlist
      (reverse-list-iter (cdr list) (cons (car list) newlist))))

  (reverse-list-iter list '()))

(reverse-list (list 1 2 3 4 5))
