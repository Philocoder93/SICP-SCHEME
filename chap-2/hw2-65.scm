; for the purposes of this exercise lets assume that
; we have access to the procedures
; tree-to-list and list-to-tree which both run in O(N)

; lets also cannabilize some code from 2-62

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

; and write a little bit more of our own

(define (intersection-of-ordered-sets seta setb)
  (cond
    ((null? seta) '())
    ((null? setb) '())
    (else
      (let (
            (a1 (car seta))
            (b1 (car setb))
            (resta (cdr seta))
            (restb (cdr setb))
            )
        (cond
          ((= a1 b1) (cons a1 (intersection-of-ordered-sets resta restb)))
          ((> a1 b1) (intersection-of-ordered-sets seta restb))
          ((< a1 b1) (intersection-of-ordered-sets resta setb)))))))

; and here are the operations in terms of tree-to-list and list-to-tree

(define (union-binary-set seta setb)
  (let (
        (listA (tree-to-list seta))
        (listB (tree-to-list setb))
        )
    (list-to-tree (union-of-ordered-sets listA listB))))

(define (intersection-binary-set seta setb)
  (let (
        (listA (tree-to-list seta))
        (listB (tree-to-list setb))
        )
    (list-to-tree (intersection-of-ordered-sets listA listB))))

; if we assume that tree-to-list and list-to-tree run in O(N) then we can assume
; that these ^ procedures run in O(N) because both union and intersection of ordered sets run in
; O(N)
