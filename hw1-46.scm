; this is the iterative improvement procedure
; this article: https://stackoverflow.com/questions/7719004/in-scheme-how-do-you-use-lambda-to-create-a-recursive-function
; helped a lot with this question


; (lamda (a)
;   (if (ge a)
;     a
;     (improveIter f ge (f a))))




(define (improve f ge)
  ((lambda (x) (x x f ge 1)) (lambda (improveGen f ge a)
    (lambda (a)
      (display 'here)
      (if (ge a)
        a
        (improveGen improveGen f ge (f a)))))))

; (improve
;         (lambda (a) (+ a 1))
;         (lambda (a) (> a 35))

(improve)
