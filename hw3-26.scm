; so i can actually think of a scheme that would do this pretty easily,
; the easiest way to do this would be to have a binary tree where "right facing"
; branches are lists of table names, basically as you traverse the tree you have
; a queu of the table headers, as you go through the tree you always go right
; unless the name of the node you just reached is the same as the name on the
; beginning of the queu, in that case you remove that name from the beginning of
; the queu and go left, then you rinse and repeat until you hit a leaf and voila,
; you've got yourself the correct value, the problem is that this will be no faster
; the scanning method because it basically *is* the scanning method

; another way to do it would be to copy the method that we used for generating the
; huffman encoding trees, you could generate a tree for each sub table and then mount them to
; leaves of other trees generated for higher level tables, this would drastically cut down on the
; time that it would take to search for things using sequences of keys
