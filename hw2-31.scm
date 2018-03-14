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

; this procedure from recursive-map is exactly what they are looking for
