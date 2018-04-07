; the purpose of this procedure is to recursively 
; traverse the type tree and find a match for those 
; types and that procedure if one exists
; for the purposes of this example I am going to assume
; that it is not possible that there is some way to transform all arguments
; to some other type that none of them currently are in order to make
; the operation work, that would require a type tree i think, (otherwise there would be no way to know if there
; is some extra transformation that you can do to the types)
(define (type-tree-explorer oper . args)

(define (types (map type-tag args)))

(define (type-tree-explore-iter oper set args types) 
		(let* (
			(anyLeft? (> (length args) 0))
			(firstArg (car args))
			(typeFirst (type-tag firstArg))
			(remainingArgs (cdr args))
			(set+args (append set args))
			(procedure (get oper set+args))
			)
			(cond
				( procedure procedure )
				( anyLeft (let*
					((branches (reduce-right
						(lambda (result-list type)
							(let* (
								(coercion (get-coercion typeFirst type))
								)
							(if coercion
								(append (type-tree-explore-iter oper (append set (coercion firstArg)) remainingArgs types) result-list)
								result-list)
							)
						)
						'()
						types
					)))
					(if (> (length branches) 0)
						(first branches)
						'())))
				(else '()))))

(type-tree-explore-iter oper '() args types))

; this procedure should be able to find almost any procedure for a certain method signature

; as to thinking up an answer to the second question imagine this situation, there are 3 types a-type, b-type, c-type, furthermore
; there are three arguments, x, which is a, y which is b, and z which is c, now suppose that there are only two coercion rules, b to a, and b to c
; in this case there is no way to coerce the arguments into the same type, if the first argument is a then it will coerce b to a
; but will not know what to do with c, in the case that the first type is b then neither a nor c will be able to be coerced to match b
; in the case that the first type is c then there will be no way to coerce a to c, so the procedure will, fail

;another situation where the procedure will fail is the situation where a certain procedure requires different types of arguments, in this case even if the
;procedure suceeds in coercing all the types to the same type the procedure will still not run correctly
