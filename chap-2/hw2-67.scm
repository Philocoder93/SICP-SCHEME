(define test-tree (new-code-tree
                                (new-code-tree
                                              (new-leaf 'a 5)
                                              (new-leaf 'b 7))
                                (new-code-tree
                                              (new-leaf 'c 8)
                                              (new-leaf 'd 9))))

(define test-message (list 0 0 0 1 0 1 0 0))

(decode-string test-message test-tree)

; (a b b a)
