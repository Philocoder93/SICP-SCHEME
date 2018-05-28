; all I have done here is change the name of the various
; special forms to be more concise, more far ranging changes
; could be made of course but these are the easiest changes
; to implement

(define (quote-clause? exp)
    (tagged-list? exp 'qt))

(define (assignment-clause? exp)
    (tagged-list? exp 'st!))

(define (definition-clause? exp)
    (tagged-list? exp 'dfn))

(define (lambda-clause? exp) (tagged-list? exp 'lmbd))

(define (if-clause? exp) (tagged-list? exp 'y/n))

(define (begin-clause? exp) (tagged-list? exp 'bgn))

(define (cond-clause? exp) (tagged-list? exp 'cnd))

(define (make-lambda-clause? params body)
  (cons 'lmbd (cons params body)))

(define (make-if-clause? pred consq alt)
  (list 'y/n pred consq alt))

(define (make-begin-clause? seq) (cons 'bgn seq))

(define (cond-else-clause? clause)
  (eq? (cond-pred clause) 'ls))
