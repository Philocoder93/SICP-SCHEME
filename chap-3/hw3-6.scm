(define (gen-new-rand initial)
	(let* (
		(state initial)
		)
		(lambda (sym)
			(cond
				((eq? sym 'reset)
					(lambda (newState)
						(set! state newState)
						'state_reset))
				((eq? sym 'generate)
					(begin
						(set! state (update-rand state))
						state))
				(else 'command_not_recognized)))))
