; the two procedures will produce the exact same list as output,
; for any fork like the following:

;    1     2
;       3

; either procedure will append, in order, the result of calling the procedure at 1 then the value
; 3, then the result of evaluating the procedure at 2

; thus they produce the exact same outputs,

; as for the time complexity i am not sure,
; some answers on the internet claim yes but i am not at all sure that i understand their
; reasoning, it seems to me that the third commentor here: http://community.schemewiki.org/?sicp-ex-2.63

; after doing some more reading i can say that there is a lot about time complexity that
; i don't know

; here: https://www.quora.com/How-can-we-check-for-the-complexity-log-n-and-n-log-n-for-an-algorithm
; is some reading

; here: http://www.billthelizard.com/search/label/sicp
; is some more reading
