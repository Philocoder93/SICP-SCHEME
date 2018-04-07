; the purpose of this procedure is to recursively 
; traverse the file tree and find a match for those 
; types and that procedure if one exists
; for the purposes of this example I am going to assume
; that it is not possible that there is some way to transform all arguments
; to some other type that none of them currently are in order to make
; the operation work, that would require a type tree i think, (otherwise there would be no way to know if there
; is some extra transformation that you can do to the types
(define (type-tree-explorer oper . args)
	(define (type-tree-explore-iter oper set args types) 
		(let ((procedure (get oper (append set args))))
			(if procedure
				procedure
				(reduce-right
					(lambda (arg)
						(or
							(eq? type (caar args))
							(get-coercion (caar args) type)
							))
					'()
					types
					)




	(let ((types (map type-tag args)))
		(let ((procedure (get oper types)))
			(if procedure
				procedure
				(








(define (type-tree-explore-iter oper set args types) 
		(let* (
			(set+args (append set args))
			(typeFirst (type-tag (first args)))
			(types (map type-tag set+args))
			(procedure (get oper set+args))
			)
			(if procedure
				procedure
				(let* ( 
					(anyLeft? (> (length args) 0))
					(availableTypes (map
						(lambda (typeList type)
							(if 
								(or
									(eq? typeFirst type)
									(get-coerclon typeFirst type)
								)
								(cons type typeList)
								typeList
							)
						)
						'()
						types
						)
					))
					(if (and (> (length availableTypes) 0) anyLeft?)
						(let* (
							
					



