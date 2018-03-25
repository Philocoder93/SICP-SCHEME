(define test-tree (new-code-tree
                                (new-code-tree
                                              (new-leaf 'a 5)
                                              (new-leaf 'b 7))
                                (new-code-tree
                                              (new-leaf 'c 8)
                                              (new-leaf 'd 9))))

(define test-message (list 0 0 0 1 0 1 0 0))

; for this one we need a helper method

(define (is-in? val list)
  (cond
    ((null? list) #f)
    ((equal? val (car list)) )
    (else (is-in? val (cdr list)))))

(define (encode-symbol sym tree)
  (if (is-leaf? tree)
    '()
    (let (
          (in-left (is-in? sym (syms (left-fork tree))))
          (in-right (is-in? sym (syms (right-fork tree))))
          )
      (cond
        ( in-left (cons 0 (encode-symbol sym (left-fork tree))))
        ( in-right (cons 1 (encode-symbol sym (right-fork tree))))
        (else (error "not present in tree"))))))

; i have personally tested this one, it works when it has the other methods available
; and it works when it is used as helper method to encode-string
