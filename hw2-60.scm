; so this implemetation is different from the previous one in that
; it will allow duplicates in the representation of sets, right off the bat I will
; say that this implementation will save time when adding elements to sets
; or when adjoining sets to other sets
; but massively waste time when looking for elements in sets or especially waste time when removing
; elements from sets, I can only think of one time when it would be a good idea to use this implementation
; and that is the case when you are sure that duplicates will *not* be added to the set

(define (elem-in-set? elem set)
  (cond
    ((null? set) #f)
    ((equal? elem (car set)) #t)
    (else (elem-in-set? elem (cdr set)))))

(define (add-to-set elem set)
  (cons elem set))

(define (union-of-sets seta setb)
  (append seta setb))

(define (intersection-of-sets seta setb)
  (cond
    ((or (null? seta) (null? setb)) '())
    ((elem-in-set? (car seta) setb) (cons (car seta) (intersection-of-sets (cdr seta) setb)))
    (else (intersection-of-sets (cdr seta) setb))))

(elem-in-set? 3 (list 1 2 3))

(add-to-set 4 (list 1 2 3))

(union-of-sets (list 1 2 3) (list 4 5))

(intersection-of-sets (list 1 2 3) (list 2 3 4))
