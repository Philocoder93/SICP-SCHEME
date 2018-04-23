; the two structures have identical behavior but don't create identical
; frame sctructures, rather, the procedure that uses the let creates an
; extra frame between the frame created by invoking make withdraw and
; the frame created by invoking the lambda whose output is delivered to
; W2, namely the frame created by the let, i completely forgot that let was
; syntactic sugar for immediately invoking a lambda but there was a good 
; reminder about this in the book

; this will not produce a change in behavior however because there is no difference
; between having your local state stored in a frame that is 1 "level down" from the
; global and having your local state stored in a frame that is 5 "levels down" from
; the global as long as no other procedures can access or mess with your local
; state
