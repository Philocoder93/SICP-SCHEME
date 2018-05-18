; imagine that you have two procedures, one access memory location A (using a serializer) and then accesses
; memory location B (using a serializer) the other access memory location B (using a serializer) then
; runs through some control flow logic in order to determine where to go next,
; let us suppose that both processes start simultaneously, the first process accessing location A and the second
; accessing location B, let us then suppose that after proceeding through it's control flow logic the second process
; tries to access memory location A, voila, deadlock.
