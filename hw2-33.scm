; this is basically pseudo code, it won't work without an accumulator function
; but if it matches other peoples solutions on the interwebs then i'm just gonna
; write the pseudo and call it a day

(define (mapper p lst)
  (accum (lambda (x y) (cons (p x) y)) '() lst))

(define (appender lst1 lst2)
  (accum cons lst2 lst1))

(define (length-getter lst)
  (accum (lambda (x y) (+ y 1)) 0 lst))
