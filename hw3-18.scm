(define (nth-cdr n lst)
	(if (= n 0)
		lst
		(cdr (nth-cdr (- n 1) lst))))

(define test-list (list 'A 'B 'C 'D 'E))
(set-cdr! (last-pair test-list) test-list)


(car (nth-cdr 0 test-list))

(car (nth-cdr 2 test-list))

(car (nth-cdr 4 test-list))

(eq? (nth-cdr 0 test-list) (nth-cdr 5 test-list))


(error "stop here")
(define (ultra-cycle-sniffer hlst)
	(define (cycle-sniffer lst)
		(define initial lst)
		(display 'fireinner)
		(newline )
		(define (cycle-catcher-iter cur)
			(cond
				((not (pair? cur)) #f)
				((null? (cdr cur)) #f)
				((eq? initial (cdr cur)) #t)
				(else (cycle-catcher-iter (cdr cur)))))
		(cycle-catcher-iter lst))
(display 'fire)
(newline )
	(cond
		((not (pair? hlst)) #f)
		((cycle-sniffer hlst) #t)
		(else (ultra-cycle-sniffer (cdr hlst)))))


(define cycle (list 'A 'B 'C 'D 'E))

(ultra-cycle-sniffer cycle)

(set-cdr! (last-pair cycle) cycle)

(ultra-cycle-sniffer cycle)

(define new-cycle (list 'x 'y))

(set-cdr! (last-pair new-cycle) cycle)

(ultra-cycle-sniffer new-cycle)


; so the solution needs to go like this, the top level procedure needs to go down the list and point to what each pair points to in turn
; (so first it points to what the first pairs cdr points to, then it points to what the second pairs cdr points to, then it points to what the
; third pairs cdr points to and so on, then it needs to check that value against all the preceding car values of the previous links, if it finds
; no match then proceed to the next cdr, the only exit condition is that you run out of cdrs or you find a match (in which case indicate that there are
; cycles).


(define (cycle-sniffer lst)
	(define initial lst)
	(define (cycle-catcher-iter cur)
		(cond
			((not (pair? cur)) #f)
			((null? (cdr cur)) #f)
			((eq? initial (cdr cur)) #t)
			(else (cycle-catcher-iter (cdr cur)))))
	(cycle-catcher-iter lst))
; this ^^^ algorithm works if we assume that the cycle is going to be end to end
; that is, if the last pair in the linked list will have the entire original list
; as it's cdr, if it has a subset of the linked list then you need a modified version
; of this
















(define (top-level func lst)
	(










