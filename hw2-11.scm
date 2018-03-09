; one obvious move you could make here would be to
; test the sign of the lower bounds, if they are both
; positive then multiply lower by lower and upper by upper

; next test the signs of the upper bounds,
; if they are both negative then multiply the lower by the lower
; and the upper by the upper

; next check for the case where one of the intervals has double positive bounds while the other has
; one positive and one negative, in this case multiply negative lower by positive upper
; and positive upper by positive upper

; next check for the case where one of the intervals has double negative bounds while the other
; has one positive and one negative, in this case multiply the negative lower by the negative lower
; and the positive upper by the negative lower

; 
