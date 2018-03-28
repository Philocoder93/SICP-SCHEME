; ok, so the data is structured in the following way:
; for each division a set of records keyed on employees names
; value is a record with various sub values keyed on strings like (among other things) address, salary

; -a

(define (get-single-record name division)
	((get 'get-single-record division) name))

; what is needed here is for the various divisions to register a particular function type pair with the lookup table,
; this needs to be the pair "get-single-record-name" and that particular division name so that the
; lookup table knows where to find the appropriate procedure 

; -b

(define (get-salary-record name division)
	((get 'get-salary-record dvivision) name)) 

; -c 
; to be clear here, the procedure in the lookup table 'find-employee-record just returns a true or false if the provided user is in the division provided
(define (find-employee-record name div-list)
	(cond
		((null? div-list) #f)
		(((get 'find-employee-record (car div-list)) name) (get-single-record name (car div-list)))
		(else (find-employee-record name (cdr div-list)))))

; -d
; the new company would need to provide an install-new-company method that would insert its particular impementations of the
; generic procedures into the lookup table and that is basically it 
