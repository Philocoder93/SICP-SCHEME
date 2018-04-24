; x is the following structure: ('a ('b '()))
; so the output of (cdr x) is ('b '())

; x is a linked list, the set-cdr! inside append!
; repoints the last element of the linked list to
; the first part of the linked list y, so the structure
; of x is ('a ('b ('c ('d '()))))
; so the output of (cdr x) is ('b ('c ('d '())))
