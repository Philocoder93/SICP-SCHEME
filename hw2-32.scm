(define (get-sub-set s)
  (cond
    ((null? s) (list '()))
    (else
      (let ((remained (get-sub-set (cdr s))))
        (append remained (map
          (lambda () )
          rest))))))
