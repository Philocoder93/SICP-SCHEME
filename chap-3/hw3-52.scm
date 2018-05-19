; for the longest time i didn't realize that accum was returning *sum*
; and not *x*, this will make the problem make absolutely no sense so make
; sure that you pay attention to stupid stuff like that

; 0
; 1
; 6
; 10
; 136

; some explanation for this ^^^ 
; the zero is from the initial declaration
; the 1 is from the initial creation of the mapped stream
; (because it evaluates the first link and then delays the
; rest of the stream) the 6 is from the evens filter (because
; it checks 1, which is odd, then 3, 2+1, which is odd,
; then checks 6 which is even and it delays the rest of the
; stream, the 10 is from the modulo 5 checker, which checked 6
; then 10, which is 5*2 and stopped evaluating, then the 136
; is from the stream-ref 7 of the even-filtered stream which
; continues checking till it finds the *eighth* even member of
; the even-filtered stream, which happens to be 136 (it takes in
; number of cdr operations to perform, or, alternatively, the index
; to check) i had to use the following python code to check this:

; count = 0
; for i in range(1, 50):
;     count = count + i
;     if count % 2 == 0:
;             print(count)

; the printed output of stream-ref should be 136

; the printed value of display-stream should be: 
; 10
; 15
; 45
; 55
; 105
; 120
; 190
; 210

; yes, the earlier responses would have been different at least because
; the lack of memoization would have meant that the state variable would have
; incremented every time you attempt to access a value from the stream even if
; it is a value that you have already accessed before, this would result in a stream
; with a changing value and would have resulted in much different outputs

