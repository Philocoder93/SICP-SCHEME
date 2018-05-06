; for this exercise I am pretty sure that all that we need to do is to have a lookup table for the
; two different representations and then we need to define the term-list 
; for this one we will definitely need to rewrite add terms and multiply terms
; this is the code I wrote for the sparse implementation of term-lists

; we need to export this package seperately and expose these constructors and selectors in order for the term-list
; packages to access them, before they could directly access them because they were all defined right in the same place
(define (install-terms-package)
	(define (make-new-term power coefficient)
		(list power coefficient))
	(define (power term)
		(car term))
	(define (coefficient term)
		(cdr term))
	
	(define (tag-it x) (attach-tag 'term x))
	
	(put 'make-new-term 'any 'any
		(lambda (x y) (tag-it (make-new-term x y))))
	(put 'power 'term
		(lambda (x) (power x)))
	(put 'coefficient 'term
		(lambda (x) (coefficient x)))
	'done)

(define (install-dense-term-list)
	(define (term-adjoin-dense term list-of-terms)
		(if (equals-zero (generically-apply 'coefficient term))
			(list-of-terms)
			(let* (
				(term-power (generically-apply 'power term))
				(list-length (length term-list))
				(terms-to-add (- term-power list-length))
				(blank-terms-to-add (- terms-to-add 1))
				(need-to-add-terms (> terms-to-add 0)))
				(if need-to-add-terms
					(let* (
						(suffix (append (make-list blank-terms-to-add 0) (list term))))
						(append list-of-terms suffix))
					(let* (
						(first-half (list-head list-of-terms (- term-power 1)))
						(term-to-ammend (list-ref list-of-terms term-power))
						(second-half  (list-tail list-of-terms term-power)))
						(append first-half (list (+ (generically-apply 'coefficient term) term-to-ammend)) second-half))))))

	(define (the-empty-termlist-dense) '())

	(define (first-term-dense term-list) (list-tail term-list (- (length term-list) 1)))

	(define (rest-terms-dense term-list) (list-head term-list (- (length term-list) 1)))

	(define (empty-term-list-dense term-list) (null? term-list))

	(define (tag-it x) (attach-tag 'term-list-dense x))
	(put 'term-adjoin 'term 'term-list-dense
		(lambda (x y) (tag-it (term-adjoin-dense x y))))
	(put 'the-empty-termlist-dense
		(lambda () (tag-it (the-empty-termlist-dense ))))
	(put 'first-term 'term-list-dense
		(lambda (x) (first-term-dense x)))
	(put 'rest-terms 'term-list-dense
		(lambda (x) (tag-it (rest-terms-dense x))))
	(put 'empty-term-list 'term-list-dense
		(lambda (x) (empty-term-list-dense x)))
	'done)

(define (install-sparse-term-list)
  ; this does need to get switched back to the old version right here
	(define (term-adjoin-sparse term list-of-terms)
		(if (generically-apply 'equals-zero? (generically-apply 'coefficient term)
			list-of-terms
			(cons term term-list))))

	(define (the-empty-termlist-sparse) '())

	(define (first-term-sparse sparseterm-list) (car term-list))

	(define (rest-terms-sparse term-list) (cdr term-list))

	(define (empty-term-list-sparse term-list) (null? term-list))

	(define (tag-it x) (attach-tag 'term-list-sparse x))

	(put 'term-adjoin-sparse 'term 'term-list-sparse
		(lambda (x y) (tag-it (term-adjoin-sparse x y))))
	(put 'the-empty-termlist-sparce
		(tag-it(the-empty-termlist-sparse )))
	(put 'first-term 'term-list-sparse
		(lambda (x) (first-term-sparse x)))
	(put 'rest-terms 'term-list-sparse
		(lambda (x) (tag-it (rest-terms-sparse x))))
	(put 'empty-term-list 'term-list-sparse
		(lambda (x) (empty-term-list-sparse x)))
	'done)

(define (install-term-list-arithmetic-pack)
	; in here you would install the arithmetic methods but you would replace the calls to internally defined methods with
	; generically apply calls to the generic methods defined above, then, these methods would be exported to the system at large and the
	; the polynomial operations would be defined in terms of calls to these methods)
	; another good idea here would be to have this package handle all the term list construction and have it handle all the different ways
	; that the term lists would be created and modified, that way you could have the constructors dynamically update the implementation of the list
	; depending on how well the current data fits the format that it is realized in
	(define (the-empty-term-list)
		(generically-apply 'the-empty-term-list-sparce))
	(put 'the-empty-term-list
		(lambda () (the-empty-term-list)))
	(put 'add 'term-list
		;the method mentioned should go here
	(put 'mul 'term-list
		;the method mentioned should go here


; from here you just need to change the instances of these generic methods in the various methods that use them
