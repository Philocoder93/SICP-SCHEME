; i'm not going to draw it out but this will create a looped list
; the last pointer in the list, the one that would normally point to
; the empty list will instead point back to the the beginning of the list
; (more precisely it will point to the local variable x which will point
; to the beginning of the list)

; if you try to compute last pair then you will be stuck in an infinite loop,
; the machine will loop through the list infinitely because there is no empty list
; at the end of the linked list to find and therefore there is no termination point
; for the procedure
