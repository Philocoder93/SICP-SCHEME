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
; as it's cdr, if it has a subset of the linked list then you need a much more elaborate
; procedure

(define (cycle-sniffer arg-lst)

	;this method is an nth cdr method
	(define (nth-cdr n lst)
		(display 'a)
		(if (= n 0)
			lst
			(cdr (nth-cdr (- n 1) lst))))

	;this method is a terminator function
	(define (done x y lst)
		(display 'b)
		(null? (nth-cdr y lst)))

	;this method is a loop checker function
	(define (loop x y lst)
		(display 'c)
		(eq? (nth-cdr x lst) (nth-cdr y lst)))

	;this method is a double loop method
	(define (double-loop x y terminate-func check-func lst)
		(display 'd)
		(cond
			((> x y) (error "loop got out of whack"))
			((= x y) (double-loop 0 (+ y 1) done loop arg-lst))
			((terminate-func x y lst) #f)
			((check-func x y lst) #t)
			(else (double-loop (+ x 1) y done loop arg-lst))))

	(double-loop 0 1 done loop arg-lst))

(define cycle (list 'A 'B 'C 'D 'E))
(cycle-sniffer cycle)
; this returns false

(set-cdr! (last-pair cycle) cycle)
(cycle-sniffer cycle)
; this returns true

(define new-cycle (list 7 8 9))
(set-cdr! (last-pair new-cycle) cycle)
(cycle-sniffer new-cycle)
; this return true
