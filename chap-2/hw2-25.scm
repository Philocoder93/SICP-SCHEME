(define x (cons 1 (cons 3 (cons (cons 5 (cons 7 '())) (cons 9 '())))))

(cadr (caddr x))

(define y (cons (cons 7 '())'()))

(caar y)

(define z (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 (cons 7 '()))))))))

(caddr (cddddr z))

; technically this ^ is correct for the literal data structure that it is manipulating here
; but remember that progressively nesting lists does not "flatten out" the list
; into a single list which is what I originally put up there ^

(define w
  (cons 1 (cons
    (cons 2 (cons
      (cons 3 (cons
        (cons 4 (cons
          (cons 5 (cons
            (cons 6 (cons 7 '())) '())) '())) '())) '())) '())))


; this ^ is really the cons analog to what you doing when you nest lists, you creating
; a series of three membered lists with a list as their second element and null as their third element
; this means that you need to navigate to the second element of each list in order to progress
; to the next list , the way to do this is (cadr )

(cadadr (cadadr (cadadr w)))
