; this problem uses code from recursive-map

(define (recursive-map x fcn)
  (let (
        (endOfList? (lambda (y)
          (if (pair? y)
            (null? (cdr y))
            #f)))
        )
    (cond
      ((endOfList? x) (cons (recursive-map (car x) fcn) '()))
      ((pair? x) (cons (recursive-map (car x) fcn) (recursive-map (cdr x) fcn)))
      (else (fcn x)))))

(define (squareTree x)
  (recursive-map x (lambda (x) (* x x))))

(squareTree (list 2 3 (list 3 (list 1 3 5) 7)))


(define (squareTree x)
  (let (
        (endOfList? (lambda (y)
          (if (pair? y)
            (null? (cdr y))
            #f)))
        )
    (cond
      ((endOfList? x) (cons (squareTree (car x)) '()))
      ((pair? x) (cons (squareTree (car x)) (squareTree (cdr x))))
      (else (* x x)))))

(squareTree (list 2 3 (list 3 (list 1 3 5) 7)))
