; there may be multiple problems with this idea but this is the one that came immediately
; to mind, imagine that you create a square that relates a and b where b is the square
; lets imagine that they start out unset but then b becomes set, the constraint should
; be able to recognize that if ysquared = x then y = squarerootx, but the constraint
; will not do that, instead it will see that only one of it's values is set and conclude
; that it does not have enough info to set the constraint even though it does
