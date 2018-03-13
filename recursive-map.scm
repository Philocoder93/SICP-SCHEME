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

(recursive-map (list 1 2 (list 3 4 (list 5 6)) (list 7 8)) (lambda (y) (* 2 y)))

; this works though i think i could benefit greatly from a diagram to
; show exactly how it works 
