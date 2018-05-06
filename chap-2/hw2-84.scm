; so this is the algorithm that i'm pretty sure we're going to need to use to get the right answer here,
; basically we are going to need a procedure that takes two arguments, it will have one sub procedure, this
; is what the argument will do, it will check to see if the arguments are the same type, (somehow) then, it will choose one of
; the arguments at random and attempt to raise it until it reaches the type of the other one, if it reaches the power of the other one
; before running out of raises then we know that the one that we tried to raise was the one at the higher power to begin with, if at any point
; we reach the point where the raised one reaches
; for the purposes of this problem I am going to assume that there is a general procedure available for checking on the equality of
; two arguments

; as advertised, this procedure checks which one of two arguments are greater in their type
(define (raise-checker arg1 arg2)
	(if (= (tag-type arg1) (tag-type arg2))
		'same-type
		(let* (
			(raised-second-arg ((get 'raise (tag-type arg1)) arg2)))
				(cond
					((not raised-second-arg) 'two_is_greater)
					((= (tag-type arg1) (tag-type raised-second-arg)) 'one_is_greater)
					(else (raise-checker arg1 raised-second-arg))))))

; make sure that you never pass an a/b combo where
; the is greater than the b
(define (raise-a-to-b a b)
	(if (= (type-tag a) (type-tag b))
		a
		(raise-a-to-b ((get 'raise (type-tag a) a) b)))


(define (generically-apply op . args)
	(let ((tagTypes (map type-tag args)))
		(let ((proc (get op tagTypes)))
			(if proc
				(apply proc (map contents args))
				(if (= (length args) 2)
					(let* (
						(first-arg (first args))
						(second-arg (second args))
						(which-higher (raise-checker first-arg second-arg)))
						(cond
							((= which-higher 'one_is_greater) ((get op first-arg (raise-a-to-b second-arg first-arg)) first-arg (raise-a-to-b second-arg first-arg)))
							((= which-higher 'two_is_greater) ((get op second-arg (raise-a-to-b first-arg second-arg)) second-arg (raise-a-to-b first-arg second-arg)))
							((= which-higher 'same-type) (error "arguments are the same type but there is no operation for them, perhaps there is no operation by that name")
							(else (error "wrong number of args"))))
					(error "wrong number of args")))))))
