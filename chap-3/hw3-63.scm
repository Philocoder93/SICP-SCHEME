; directly recalling sqrt-stream neutralizes the memoization because it
; creates a new memoizer for each new stream, memoizers have their own
; internal lookup tables where they store the result of previous calls
; if a new memoizer is created each time then there is no advantage to
; memoizing anything because each computation is memoized once and then
; never referenced again
