; for this question i am going to first have to rewrite a number of
; methods that the book assumes that we already have

(define (elem-in-set? elem set)
  (cond
    ((null? set) #f)
    ((equal? (car set) elem) #t)
    (else (elem-in-set? elem (cdr set)))))

; (elem-in-set? 6 (list 1 2 3))

(define (add-to-set elem set)
  (if (elem-in-set? elem set)
    set
    (append (list elem) set)))

(define (intersection-of-sets seta setb)
  (cond
    ((or (null? seta) (null? setb)) '())
    ((elem-in-set? (car setb) seta) (cons (car setb) (intersection-of-sets seta (cdr setb))))
    (else (intersection-of-sets seta (cdr setb)))))

; (intersection-of-sets (list 1 'e 3) (list 2 3 'e))

(define (union-of-sets seta setb)
  (cond
    ((null? setb) seta)
    ((elem-in-set? (car setb) seta) (union-of-sets seta (cdr setb)))
    (else (union-of-sets (add-to-set (car setb) seta) (cdr setb)))))

(union-of-sets (list 1 2 3 4) (list 3 4 5 6))

;not sure that the data abstraction is totally optimal here, might need some improvement
