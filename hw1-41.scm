; this is my answer to hw 1.41

(define (squareFnctn fnctn)
  (lambda (arg) (fnctn (fnctn arg))))



((squareFnctn
            (lambda (arg) (* arg 2))) 5)
