; not going to draw out a diagram here but i can explain the relevant features
; that diagram would have: basically the most important thing to note would be that any
; calls to a memoized procedure would manipulate variables in the frame set by the initial
; call to the memoize function regardless of the specific frame structure of the
; memoized function

; memo fib computes the nth fibonacci number in theta n because
; even though it uses tree recursion to do it, it stores the result of every
; calculation so even if tree recursion would normally run the same function
; call multiple times memoization prevents that from happening, in effect,
; it computes it in the same number of calls as an iterative algorithm computing
; succesive fib numbers would do it, this means


; no, i don't think it would, in order for it work you would need to memoize the internal
; recursive calls as well as the initial external call
