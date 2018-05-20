; it will cdr across the top row much faster than it will go through any of the
; rows below, this is because it interleaved a stream that cdrs across the
; top row with a stream that will itself produce an interleaving of streams
; and one of those will cdr across the next row while the next one will
; produce *another* interleaving of streams, all of this will mean that there
; will simply be a lot more elements computed for the top row of the sideways
; pyramid than there will be for anywhere else in the pyramid at any one time
; for reference, here is a representation of the elements in the stream
; 1: initial diagonal element
; 2: first cdr across the top row
; 3: second diagonal element
; 4: second cdr across the top row
; 5: first cdr across the second row
; 6: third cdr across the top row
; 7: third diagonal element
; 8: fourth cdr across the top row
; etc.
