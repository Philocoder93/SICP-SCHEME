; i'm not going to draw out the diagram for this but i will
; provide a verbal outline of what is going on here so that
; it is clear that i understand it,

; basically when it is run sequentially what happens is that the
; lambda is run, part of this is that a new frame is extended and
; added to the stack with the lambdas arguments bound to it,
; then the two defines run and sequentially alter the key value
; pairs in the current frame, then the expression is evaluated
; in the context of that modified frame

; when the program is scanned as described what is happening is that the defines
; are being replaced by a let which is syntactic sugar for creating a lambda function
; and then calling it with the provided values

; this means that, as part of executing that new lambda,
; a new frame is extended and the arguments are bound to new
; values in that frame which are then rebound later using the let!
; this means that there is a new frame in the program now

; of course, if you have a well written program this should never be an issue because you
; should declare all your variables at the top and not try to do any computation in the
; middle of them so, from the perspective of your code the variables are, for all intents
; and purposes, simultaneously declared, in addition you should not have recursively defined
; variables, this is part of what is screened out by the screening process

; another possible way of screening all of this out would be to scan through the body of any
; functions and then rewrite the function with all the definitions at the top i.e. "hoist" them
