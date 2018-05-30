; so the book is suggesting that we do a proof by contradiction
; i provide just such a proof below

; 1. suppose that the halt? procedure correctly identifies (with total accuracy)
; whether or not any combination of function and argument will halt

; 2. given 1. we know that when halt? evaluates (try try) it will correctly
; identify whether or not (try try) will halt

; 3. first, suppose that halt? indicates that (try try) will halt, if this is
; is the case then when (try try) is evaluated, the if predicate evaluates to true
; which triggers the (run-forever) procedure to run causing the procedure to run
; infinitely and rendering the prediction of halt? incorrect which violates 1, thus
; halt? must indicate that (try try) will halt

; 4. if halt? indicates that (try try) will not halt then when (try try) gets evaluated
; the if predicate will not evaluate to true and the procedure will halt which violates
; 1, contradiction

; this is interesting because in order to prove this result we rely on a chain of reasoning
; similar to that as in the liars paradox or russels paradox
