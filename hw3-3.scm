; i modified the intended design from the book a little for simplicities sake,
; it seemed to me that there was no reason to expose the withdraw or deposit methods
; in the way that they do here, in fact it is probably a security risk because
; you only need to input the password once to get access to the method forever
; in my redesign you have to input your password every time you want to use the method

(define (make-an-account pswd amount)

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
			((not (acl pass)) (error "wrong password"))
			((eq? action 'withdraw) (withdraw-money money))
			((eq? action 'deposit) (deposit-money money))
			(else (error "correct password but not no op by that name"))))

dispatch-action)


(define new-account (make-an-account 'password 100))

(new-account 'withdraw 'password 50)

(new-account 'deposit 'password 75)

(new-account 'withdraw 'notpassword 50)
