(define (combo-or-gate o1 o2 output)
	(define A (make-wire ))
	(define B (make-wire ))
	(define C (make-wire ))
	(inverter o1 A)
	(invertar o2 B)
	(and-gate A B C)
	(inverter C output)
	'ok)
