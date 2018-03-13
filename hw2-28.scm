(define (get-fringe lst)
(newline ) (display lst)
  (let (
        (endOfList? (lambda (lst)
          (newline )(display 'fireleaf)
          (if (list? lst)
            (null? (cdr lst))
            #f))))
    (cond
      ((endOfList? lst)
        (newline )(display 'first-path)
        (list (car lst)))
      ((list? lst)
        (newline )(display 'second-path)
        (append (get-fringe (car lst)) (get-fringe (cdr lst))))
      (else

        (list lst)))))

(get-fringe (list 2 (list 3 (list 3 7 9) 5) 2 3 4) )
