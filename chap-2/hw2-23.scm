(define (my-for-each-bkwrds fnc lst)
  (if (null? lst)
    #f
    (let (
          (next (my-for-each-bkwrds fnc (cdr lst)))
          )
      (fnc (car lst)))))

(my-for-each-bkwrds (lambda (x) (display x) (newline )) '(1 2 3 4 5))

; this ^ implementation is cool but loops through the list backwards

(define (my-for-each fnc lst)
  (if (null? lst)
    #f
    (let (
          (call (fnc (car lst)))
          )
      (my-for-each fnc (cdr lst)))))

(my-for-each (lambda (x) (display x) (newline )) '(1 2 3 4 5))

; this ^ is a similar implementation that loops through the list forwards
