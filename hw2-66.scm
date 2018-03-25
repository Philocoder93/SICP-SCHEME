; for the purposes of this exercise we can assume
; that binary trees are implemented like they were in previous exercises:
; as nested three membered lists with the current node as the first value
; the left branch as the second value and the right hand branch as the third value

; we can also assume that the records themselves (the thing sitting inside the binary trees)
; are two membered lists with their numerical ID as the first value and some other data
; payload as the second value (whatever is in there it really doesn't matter for the purposes of
; these exercises)

; this means

(define (make-record key payload)
  (list key payload))

(define (get-key record)
  (first record))

(define (get-payload record)
  (second record))

(define (get-val junction)
  (first junction))

(define (get-left-branch junction)
  (second junction))

(define (get-right-branch junction)
  (third junction))

(define (make-junctions val left right)
  (list val left right))

(define (lookup-from-db key db)
  (cond
    ((null? db) #f)
    ((= key (get-key (get-val db))) (get-val db))
    ((> key (get-key (get-val db))) (lookup-from-db key (get-right-branch db)))
    ((< key (get-key (get-val db))) (lookup-from-db key (get-left-branch db)))))


(define test
  (make-junctions (make-record 4 4)
    (make-junctions (make-record 2 2)
      (make-junctions (make-record 1 1) '() '())
      (make-junctions (make-record 3 3) '() '()))
    (make-junctions (make-record 6 6)
      (make-junctions (make-record 5 5) '() '())
      (make-junctions (make-record 7 7) '() '()))))

(lookup-from-db 3 test)

(lookup-from-db 4 test)

(lookup-from-db 7 test)
