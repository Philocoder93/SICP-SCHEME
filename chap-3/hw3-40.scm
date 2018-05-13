; 1-(* x x)
; 2-(* x x x)

; so the two operations together contain a total of
; 5 read operations and two set operations,
; not only can one entire function during another operations run but
; they can interleave multiple times

; pos1: normal operations, 10 to the sixth

; pos2: 1 interupts 2, if it interrupts after the first read then there will be
; one good read of x as 10 and two bad reads of x as 100, 10*100*100 = 100,000
; if it interrupts after two reads then it will have two good reads as 10 and one bad read as 100, 10*10*100 = 10,000
; if it interrupts after all three reads then the procedure will get three good reads of x = 10 and store that as
; the value to assign x to, then proc1 fires, resets x, then proc2 finishes and sets x to 1,000 anyway.

; pos3: 2 interupts 1, same general analysis as above, possible outcomes: 10,000, 100

; pos4: proc2 starts slightly before proc1, both fully complete their (normal) reads at exactly the same time then
; they both write to x, whichever writes second has it's value persisted, possible outcomes: 100, 1000

; the only possibility when there is a serializer is the output 1,000,000 i.e. 10 to the sixth

