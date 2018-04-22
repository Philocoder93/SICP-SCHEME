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
			(else 'login_succesfull_operation?)))

dispatch-action)

(define (make-account-joint acc old-pswd new-pswd)
	(if (eq? (acc 'not_an_opp old-pswd 0) 'login_succesfull_operation?)
		(lambda (actionL passL moneyL)
			(if (eq? passL new-pswd)
				(acc actionL old-pswd moneyL)
				(error "wrong password")))
		(error "must have correct old password to create an account")))

(define myaccount (make-an-account 'pass 100))

(define jerrysaccount (make-account-joint myaccount 'pass 'word))

(jerrysaccount 'deposit 'word 50)
