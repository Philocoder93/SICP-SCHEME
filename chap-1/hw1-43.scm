
(define (mashUp fnc1 fnc2)
  (lambda (arg) (fnc2 (fnc1 arg))))

(define (NthCallIter f a k)
  (if (= k 0)
    a
    (NthCallIter
            f
            (mashUp f a)
            (- k 1))))


((NthCallIter
            (lambda (a) (+ a 1))
            (lambda (a) a) 7) 8)
