; for the time being i cannot test this out
; without painters this effectively just pseudo code

(define (my-up-split painter n)
  (cond
    ((= n 0) painter)
    (else (let ((smaller (my-up-split painter (- n 1))))
      (below painter (beside smaller smaller))))))
