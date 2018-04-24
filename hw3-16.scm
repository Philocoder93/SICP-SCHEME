; the most obvious problem with the procedure is that it assumes that the
; pair structure it is traversing is not a looped list
; when it is a looped list it will go on infinitely or throw an error

; as regards the other structures, to get three you just have your
; standard list (a(b(c '()))) and that will give you three

; for seven you have a pair whose car and cdr point to
; the next pair both of whose car and cdr point to the next pair
; both of whose car and cdr are empty list
; the reason this works is that the top level list logs one,
; it calls the next list twice, once for it's car and it's cdr,
; both of these calls return one, for a total of 3,
; next, each of those calls on the second list makes two calls to the final list
; resulting in four more calls for a total of 7 calls.

; finally, you can get four calls total by having the same structure as above but repointing
; the cdr of the top level list to a null, this produces one log at the top level
; one log at the middle level and two at the bottom most level
