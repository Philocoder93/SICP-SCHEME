(define (square-the-list lst)
  (if (null? lst)
    '()
    (cons (square (car lst)) (square-the-list (cdr lst)))))

(square-the-list (list 1 2 3 4 5))

(define (square-the-list lst)
  (map square lst))

(square-the-list (list 1 2 3 4 5))
