; this one right here

(define (add lmbd a step b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (step a) (+ result (lmbd a)))))
  (iter a 0)
