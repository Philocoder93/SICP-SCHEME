(define (final_pair list)
  (if (null? (cdr list))
    list
    (final_pair (cdr list))))


(final_pair (list 1 2 3 4 5 6 7))
