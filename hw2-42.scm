; here goes nothing

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

; (define (empty-board n)
;   )

(define (adjoin-position x y rest-of-queens)
  (display x) (display '__) (display y) (display '__) (display rest-of-queens) (newline )
  (cons (cons x y) rest-of-queens))
; for the purposes of this exercise, configurations of already placed queens will be
; arrays of ordered pairs, the empty-board will serve this purpose by generating an array of arrays
; of all the ordered pairs along the right side of the board, also for the purpose of this exercise
; the

; (define (safe? pos)
;   (display pos)
;   (if (null? pos)
;     #t
;     (let (
;           (sameY (= () (sec pos)))
;           )
;       (if (sameY)
;         #f
;         #t))))

(define (safe? pos)
    (if (> (length+ pos) 1)
      (cond
        ((not (= (cdar pos) (cdadr pos))) (safe? (cons (car pos) (cddr pos))))
        (else #f))
      #t))

(define (my-queens-puzzle n)
  (define (my-queens-col k)
    (if (= k 0)
      (list '())
      (filter
        (lambda (positions) (safe? positions))
        (flat-mapper
          (lambda (rest-of-queens)
            (mapper (lambda (new-row)
                    (adjoin-position k new-row rest-of-queens))
                 (enum-seq n)))
          (my-queens-col (- k 1))))))
  (my-queens-col n))

(my-queens-puzzle 3)
