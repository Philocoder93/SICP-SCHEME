; for this implementation we assume that the set will be ordered from least to greatest

(define (adjoin-to-ordered-set elem set)
  (cond
    ((= elem (car set)) set)
    ((< elem (car set)) (cons elem set))
    (else (cons (car set) (adjoin-to-ordered-set elem (cdr set))))))

(adjoin-to-ordered-set 3 (list 1 3 5 6))

(adjoin-to-ordered-set 3 (list 1 2 4 5))
