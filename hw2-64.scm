; so, as best as i can tell the procedure works like this:
; first the procedure is called on a list of numbers
; partial-tree is then passed the list as well as the length of the list
; at this point the procedure calculates the length of one "half" of the list
; the length of one "half" is the length of the list minus one divided by two,
; this is because the central element is the top level node and will not be on either
; the left half or the right half

;
