; to compute the nth fib number the procedure does n - 1 additions
; (side note, my initial evaluation of this problem was that it
; would take n - 2 additions but i forgot that technically n starts
; at 0 so the third number in the sequence, the one that requires
; 1 addition, is actually n = 2, thus n -1) the reason that
; running this procedure without memoization would
; run exponentially slower than it would with memoization is that
; the procedure results in tree recursion to the base cases of 0
; and 1 in exactly the same way that a recursive procedure would
; have done, consider: in order to cdr to the next link of fib,
; the underlying call to stream-map must cdr through it's argument
; lists, but in this instance the argument list just is an attempt
; to cdr through the same stream, just a link behind, which means
; *that* attempt to cdr must cdr through it's own arg stream list
; but this is just recursion, the only way to get out of this
; is to arrive at the base case, the instance where cdring the list
; results in one of the base cases
