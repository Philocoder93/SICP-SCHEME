(define (union-of-ordered-sets seta setb)
  (cond
    ((null? seta) setb)
    ((null? setb) seta)
    (else
      (let (
           (a1 (car seta))
           (b1 (car setb))
           (resta (cdr seta))
           (restb (cdr setb))
           )
        (cond
          ((= a1 b1) (cons a1 (union-of-ordered-sets resta restb)))
          ((> a1 b1) (cons b1 (union-of-ordered-sets seta restb)))
          ((< a1 b1) (cons a1 (union-of-ordered-sets resta setb))))))))


(union-of-ordered-sets (list 4 5 6 7) (list 2 3 4 5))
