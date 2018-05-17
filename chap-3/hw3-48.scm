; the reason that this procedure would avoid deadlock is that it would prevent
; the two exchanges from attempting to go in two different *directions* through
; the serialized procedures, while neglecting it allows the two different exhanges
; to do just this very thing

; say procedure A goes from account 1 to account 2 and
; procedure B goes from account 2 to account 1
; in this example the procedures can deadlock because both 1 and 2's mutexes get
; acquired and neither procedure can proceed on their way, but now suppose that
; both A and B proceed from 1 to 2, in that case the worst that could happen is that
; A could *step on B's toes* or vica versa, for instance A could attempt to acquire 1 while
; B is still running in which case A would just hang until B is finished. In effect what
; this does is it hides the second mutex acquisition inside the first mutex acquisition,
; this means that, for all intents and purposes, there is only one mutex acquisition
; and it seems impossible for a program to deadlock when there is only one mutex in play

(define (serialized-Xchange ac1 ac2)
	(let* (
		(ac-check (lambda (x y) (> (x 'id) (y 'id))))
		(higher-ac (if (ac-check ac1 ac2)
			(ac1 'serializer)
			(ac2 'serializer)))
		(lower-ac (if (ac-check ac1 ac2)
			(ac2 'serializer)
			(ac1 'serializer))))
	((lower-ac (higher-ac exchange))
	ac1
	ac2)))
