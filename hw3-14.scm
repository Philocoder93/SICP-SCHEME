; as far as i can tell, what this procedure does is it reverses the list
; but it doesn't just return a new list with the elements from the old
; list rearanged, it literally mutates the elements of the old list in place

; im not going to redraw the box and pointer diagram but sufice it to say that this is what is going
; on here, at each step the procedure strips of the first pair from the list and repoints that
; pairs second part, first to an empty list and after that to the results of previous runs of this
; procedure, so running (define v) as they do here would give you the result ('d 'c 'b 'a)

; after running (define w) w would print out ('a 'b 'c 'd) and v would print out ('d '())
; this is because v pointed to the 'd pair, not to the whole list, after the reorganization of the list
; v would still point to 'd pair instead of the whole list, it would just be the case that the 'd pair
; would not be the first pair in the linked list anymore
