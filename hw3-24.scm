; i could completely rewrite this entire procedure but instead i
; am just going to explain the extremely minor change that needs
; to be made here, basically you just need to add a parameter to the
; procedure that is already there, call it equals check or whatever,
; and then pass it into every single call of association as the first
; argument and keep the other arguments as they are already, with that
; done we now need to modify the association method to accomodate that
; new parameter

(define (association eq-check rec-key recs)
	(cond
		((null? recs) false)
		((eq-check? rec-key (caar recs)) (car recs))
		(else (association rec-key (cdr recs)))))
