; assume that these are taking place in the context of a local-table
; listy thingy that defines what

(define (make-table eq-check?)
(let ((local-table (list '*table*)))

(define (association eq-check rec-key recs)
	(cond
		((null? recs) false)
		((eq-check? rec-key (caar recs)) (car recs))
		(else (association rec-key (cdr recs)))))

(define (lookup key-list)
	(define (lookup-iter key-list lcl-table)
		(cond
			((< (length key-list) 1) (error "Need at least one key"))
			(else (let* (
				(more-keys (> (length key-list) 1))
				(first-key (first key-list))
				(record (association eq-check? first-key (cdr lcl-table))))
					(cond
						((and record more-keys) (lookup-iter (cdr key-list) record))
						( record (cdr record))
						(else false))))))
	(lookup-iter key-list local-table))

(define (insert! key-list value)
	(define (insert-iter! key-list value lcl-table)
		(let* (
			(too-few-keys? (< (length key-list) 1))
			(no-keys-remaining? (<= (length key-list) 1))
			(first-key (if too-few-keys?
				#f
				(first key-list)))
			(second-key (if no-keys-remaining?
				#f
				(second key-list)))
			(record (if too-few-keys?
				#f
				(association eq-check? first-key (cdr lcl-table)))))
				(display 'makingitthisfar)
				(cond
					( too-few-keys? (error "Need key list"))
					( (and no-keys-remaining? record)
						(set-cdr! record value))
					( (and no-keys-remaining? (not record))
						(set-cdr! lcl-table
							(cons
								(cons first-key value)
								(cdr lcl-table))))
					( record
						(insert-iter! (cdr key-list) value record))
					( (not record)
						(set-cdr! lcl-table
							(cons
								(cons first-key (list 'listHeader))
								(cdr lcl-table))
						(insert-iter! key-list value lcl-table)))
					(else (error "something is broken, you should never hit this part")))))
	(insert-iter! key-list value local-table))

(define (dispatch m)
	(cond
		((eq? m 'lookup) lookup)
		((eq? m 'insert!) insert!)
		(else (error "You need to pass in procedure name that actually exists"))))

dispatch))





(define dispatch (make-table eq?))

(define lookup (dispatch 'lookup))

(define insert (dispatch 'insert!))

(insert (list 'first) 'val)
(insert (list 'first 'second) 'val)

(lookup (list 'first))
