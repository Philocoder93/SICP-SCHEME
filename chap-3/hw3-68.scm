; it would not only not work, it would put your computer into an infinite
; regress, interleave is not a special form and we haven't started lazy
; evaluation yet so in order to evaluate (pairs s t) it must first evaluate
; (pairs (stream-cdr s) (stream-cdr t)) and in order to evaluate that...
; (and so on)
