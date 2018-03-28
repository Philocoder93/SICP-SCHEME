; -a
; what was done here is a program that used to contain two different procedures
; one for each of two different methods of abastracting a bit of data
; have been switched to use data-directed-programming, i.e. to send of method name and data type and call the returned
; procedure on the original data, the reason that number? and variable are not able to be switched over is that they are native
; scheme procedures so there is no need to dispatch them

; -b
; not gonna do this one yet because i do not yet understand the underlying math here

; -c
; once again, no hablo es calcules

; -d
; not entirely sure what is being asked here but i think what they want to know is whether having the procedures be indexed in the rows by data type
; and columns by procedure name will matter for the purposes of the procedure i am not at all sure that it will,
; it looks to me that as long as it returns the correct procedure it shouldn't matter at all how it retrieved from the lookup table the
; only possible change that will have to be made is the order of the arguments in the install procedures calls to put will need to be reversed
; other than that no changes that I can see  


















