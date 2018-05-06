; i don't understand this church encoding thing but this is
; the right answer

(define church-1 (lambda (f) (lambda (x) (f x))))

(define church-2 (lambda (f) (lambda (x) (f (f x)))))
