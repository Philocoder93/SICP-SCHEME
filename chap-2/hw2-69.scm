; for this one you need a fair amount of
; scaffolding in order for it to work, the only code that is left here is stuff
; that i actually wrote for this exercise

(define (first-leaf-list leaf-list)
  (car leaf-list))

(define (second-leaf-list leaf-list)
  (cadr leaf-list))

(define (but-first-leaf-list leaf-list)
  (cdr leaf-list))

(define (but-first-two-leaf-list leaf-list)
  (cddr leaf-list))

(define (length-leaf-list leaf-list)
  (length leaf-list))

(define (empty-leaf-list leaf-list)
  (null? leaf-list))

(define (front-add-leaf-list elem leaf-list)
  (cons elem leaf-list))

(define test-leaf-set (new-leaf-list (list (list 'a 26) (list 'b 27) (list 'c 29) (list 'd 30) (list 'e 31))))

(define test-code-tree (new-code-tree (new-leaf 'a 8) (new-code-tree
											(new-leaf 'b 9)
											(new-leaf 'c 11))))

(define (insert-tree-in-order whtvr tree)
  (if (empty-leaf-list tree)
	(list whtvr)
	(let* (
		  (whtvr-freq (freq whtvr))
		  (first-freq (freq (first-leaf-list tree)))
		  (less-than (< whtvr-freq first-freq))
		  (equal-to (= whtvr-freq first-freq))
		  (less-than-or-equal (or less-than equal-to))
		  )
	  (if less-than-or-equal
		(front-add-leaf-list whtvr tree)
		(front-add-leaf-list (first-leaf-list tree) (insert-tree-in-order whtvr (but-first-leaf-list tree)))))))

(insert-tree-in-order test-code-tree test-leaf-set)

; time to do the actual computation

(define (huffman-tree leaf-list)
  (if (= 1 (length-leaf-list leaf-list))
	(first-leaf-list leaf-list)
	(let* (
		  (new-tree (new-code-tree (first-leaf-list leaf-list) (second-leaf-list leaf-list)))
		  (rest-of-list (but-first-two-leaf-list leaf-list))
		  (resorted-list (insert-tree-in-order new-tree rest-of-list))
		  )
	  (huffman-tree resorted-list))))

(huffman-tree test-leaf-set)

; when run with the proper scaffolding code this produces the result
; (((leaf c 29) (leaf d 30) (c d) 59) ((leaf e 31) ((leaf a 26) (leaf b 27)
; (a b) 53) (e a b) 84) (c d e a b) 143)
