; this is the procedure that i wrote in 3-3
(define (make-an-account pswd amount)
	(define failed-attempts 0)

	(define (call-the-cops) (error "cheese it, it's the cops"))

	(define (acl x)
		(eq? x pswd))

	(define (withdraw-money x)
		(if (>= amount x)
			(begin (set! amount (- amount x))
				amount)
			'not_enough_funds))

	(define (deposit-money x)
		(begin (set! amount (+ amount x))
			amount))

	(define (dispatch-action action pass money)
		(cond
			((> failed-attempts 6) (call-the-cops ))
			((not (acl pass)) (begin (set! failed-attempts (+ failed-attempts 1)) failed-attempts))
			((eq? action 'withdraw) (withdraw-money money))
			((eq? action 'deposit) (deposit-money money))
			(else (error "correct password but not no op by that name"))))

dispatch-action)

(define new-account (make-an-account 'password 100))

(new-account 'withdraw 'not-password 50)
(new-account 'withdraw 'not-password 50)
(new-account 'withdraw 'not-password 50)
(new-account 'withdraw 'not-password 50)
(new-account 'withdraw 'not-password 50)
(new-account 'withdraw 'not-password 50)
(new-account 'withdraw 'not-password 50)
(new-account 'withdraw 'not-password 50)
