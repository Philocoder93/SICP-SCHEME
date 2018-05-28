(define (nv-lp var val env frst-fnc scnd-fnc error-msg)
	(if (eq? env empty-enviro)
		(error error-msg)
		(let ((frame (first-frame env)))
			(scn
				(frm-vrbls frame)
				(frm-vls frame)
				var
				val
				frame
				env
				frst-fnc
				scnd-fnc))))

(define (scn vars vals var val frame env frst-fnc scnd-fnc)
	(cond
		((null? vars)
			(frst-fnc vars vals var val frame env))
		((eq? var (car vars))
			(scnd-fnc vars vals var val frame env))
		(else
			(scn (cdr vars) (cdr vals) var val frame env))))

(define (lkp-var-val var env)
	(let* (
		(lkp-var var)
		(lkp-val '())
		(lkp-env env)
		(lkp-frst-fnc (lambda
			(frst-vars frst-vals frst-var frst-val frst-frame frst-env)
				(nv-lp (enclosing-environment frst-env))))
		(lkp-scnd-fnc (lambda
			(scnd-vars scnd-vals scnd-var scnd-val scnd-frame scnd-env)
				(car scnd-vals)))
		(lkp-error-msg 'unbound-variable))
		(nv-lp lkp-var lkp-val lkp-env lkp-frst-fnc lkp-scnd-fnc lkp-error-msg)))

(define (st-vrbl-vl! var val env)
	(let* (
		(lkp-var var)
		(lkp-val val)
		(lkp-env env)
		(lkp-frst-fnc (lambda
			(frst-vars frst-vals frst-var frst-val frst-frame frst-env)
				(nv-lp (enclosing-environment frst-env))))
		(lkp-scnd-fnc (lambda
			(scnd-vars scnd-vals scnd-var scnd-val scnd-frame scnd-env)
				(set-car! scnd-vals scnd-val)))
		(lkp-error-msg 'unbound-variable-SET!))
		(nv-lp lkp-var lkp-val lkp-env lkp-frst-fnc lkp-scnd-fnc lkp-error-msg)))

(define (dfn-vrbl var val env)
	(let* (
		(lkp-var var)
		(lkp-val val)
		(lkp-env env)
		(lkp-frst-fnc (lambda
			(frst-vars frst-vals frst-var frst-val frst-frame frst-env)
				(add-binding-to-frame! var val frame)))
		(lkp-scnd-fnc (lambda
			(scnd-vars scnd-vals scnd-var scnd-val scnd-frame scnd-env)
				(set-car! scnd-vals scnd-val)))
		(lkp-error-msg 'unbound-variable-SET!))
		(nv-lp lkp-var lkp-val lkp-env lkp-frst-fnc lkp-scnd-fnc lkp-error-msg)))
