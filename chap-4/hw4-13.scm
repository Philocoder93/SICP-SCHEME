(define (mk-nbnd var env)
	(if (eq? env mpt-nvrmnt)
		'done
		(let* (
			(frame (first-frame env))
			(var-lst (get-vars frame))
			(val-lst (get-vals frame))
			(next-env (nclsng-nvrmnt env))
			(filter-fnc (lambda (vr vl) (eq? var vr)))
			(filtered (dub-filter filter-fnc var-lst val-lst))
			(new-vars (map car filtered))
			(new-vals (map cdr filtered))
			(new-frame (cons new-vars new-vals)))
			(begin
				(set-car! env new-frame)
				(mk-nbnd var next-env)))))

(define (dub-filter fltr lsta lstb)
	(cond
		((or (null? lsta) (null? lstb))
			'())
		((fltr (car lsta) (car lstb))
			(dub-filter fltr (cdr lsta) (cdr lstb)))
		(else (cons (cons (car lsta) (car lstb)) (dub-filter fltr (cdr lsta) (cdr lstb))))))

; this version unbinds the val all the way up to the top level
; the reasoning here is that when you unbind something you should
; expect it to be unbound but unless you unbind all the way up
; then it is really still bound, just not in your current frame
