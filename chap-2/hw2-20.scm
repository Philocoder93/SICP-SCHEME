(define (same-parity-as-first . x)
  (let (
        (is-even (lambda (a) (= 0 (modulo a 2))))
        (xor (lambda (a b) (not (boolean=? a b))))
        (base-case (lambda (a) (null? (cdr x))))
        (but-first (lambda (list) (cdr list)))
        (but-second (lambda (list) (cons (car list) (cddr list))))
        )
    (cond
      ((base-case x) x)
      ((xor (is-even (first x)) (is-even (second x))) (apply same-parity-as-first (but-second x)))
      (else (cons (first x) (apply same-parity-as-first (but-first x)))))))

(same-parity-as-first 2 3 4 5 7 13 28)

(same-parity-as-first 1 2 3 4 5 7 13 28)

; the reason we need the apply here is that it deconstructs the list passed to
; it into seperate arguments and then calls the provided function at those
; arguments rather than calling a provided function at a *one* argument, namely
; *the list*
