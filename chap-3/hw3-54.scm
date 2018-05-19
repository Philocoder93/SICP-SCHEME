(define (multiply-the-streams str1 str2)
	(map-the-streams * str1 str2))

(define (fact-stream
		(stream-cons 1
			(multiply-the-streams
				(stream-cdr! integers)
					fact-stream))))

; this ^^^ works because as fact-stream goes along it's self reference is one
; index behind it's generation, in nth step it references n-1th step and in
; n+1th step it references nth step
