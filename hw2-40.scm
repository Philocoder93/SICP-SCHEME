; here I am canabilizing code from 2-33 as well as elsewhere,
; I am also rewriting a ton of these functions and writing new ones whenever I
; need to

(define (pair-equal x y)
  (and (= (car x) (car y)) (= (cadr x) (cadr y))))

(define (includes lst elm)
  (cond
    ((null? lst) #f)
    ((pair-equal elm (car lst)) #t)
    (else (includes (cdr lst) elm))))

(define (accum oper init lst)
   (if (null? lst)
       init
       (oper (car lst)
           (accum oper init (cdr lst)))))

(define (unique-pairs lst)
  (accum
    (lambda (x y)
      (if (includes y x)
        y
        (cons x y)))
        '()
        lst))

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

(define (all-unique-pairs n)
  (unique-pairs
    (flat-mapper
      (lambda (x)
        (mapper
          (lambda (y)
            (list x y))
          (enum-seq x)))
      (enum-seq n))))

(all-unique-pairs 6)
