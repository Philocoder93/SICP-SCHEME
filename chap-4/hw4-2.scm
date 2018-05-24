; the first problem is that the predicate for apply is written assuming
; that it doesn't have to do any work to screen out special forms, as things
; stand after louis changes the interpreter will try to apply special forms and
; will probably throw an error when things like define or if aren't compound
; procedures or atomic procedures

; if we wanted to humor louis we would need to rewrite the core eval
; function to have apply come first but we would also need to rewrite
; the predicate and some other functions used to abstract away from the
; implementation of apply

(define (applying expr) (list-tagged? expr 'call))

(define (operation expr) (cadr expr))

(define (get-operands expr) (cddr sexpr))

; other than these i'm not sure what changes would need to be made
