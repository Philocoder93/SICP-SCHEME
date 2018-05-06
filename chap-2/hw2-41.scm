(define (my-filter fcn lst)
  (flat-mapper
    (lambda (y)
      (if (fcn y)
        (list y)
        '()))
    lst))

(define (flat-mapper p lst)
  (accum (lambda (x y) (append (p x) y)) '() lst))


(define (accum oper init lst)
   (if (null? lst)
       init
       (oper (car lst)
           (accum oper init (cdr lst)))))

(define (mapper p lst)
  (accum (lambda (x y) (cons (p x) y)) '() lst))

(define (flat-mapper p lst)
  (accum (lambda (x y) (append (p x) y)) '() lst))

(define (enum-seq n)
  (define (enum-seq-iter strt stp)
    (cond
      ((> strt stp) '())
      (else (cons strt (enum-seq-iter (+ 1 strt) stp)))))
  (enum-seq-iter 1 n))

(define (all-unique-triples-sum-to-S n S)
  (my-filter
    (lambda (a)
      (let (
            (distinct (not (= (car a) (cadr a) (caddr a))))
            (sumToS (= S (+ (car a) (cadr a) (caddr a))))
            )
        (and distinct sumToS)))
    (flat-mapper
      (lambda (x)
        (flat-mapper
          (lambda (y)
            (mapper
              (lambda (z)
                (list x y z))
              (enum-seq n)))
            (enum-seq n)))
          (enum-seq n))))

(all-unique-triples-sum-to-S 3 7)

; output of this is ((1 3 3) (2 2 3) (2 3 2) (3 1 3) (3 2 2) (3 3 1))
