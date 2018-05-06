; funnily enough this procedure is quite similar to what I wrote for
; the reverse string method, the problem is this: the procedure iterates
; through the initial list from front to back but it constructs the new list back to front
; so the first element of the old list becomes the last element of the new list and so on
; reversing the order of the arguments doesn't change which element is last one in the list
; it just changes the way that you need to iterate through it, rather than accessing
; the first element with car and the rest of the list with cdr you access the first element
; with cdr and the rest of the list with car
