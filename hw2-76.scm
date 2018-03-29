; first lets look at what would need to be added to insert new data types into the three styles

; for generic procedures with explicit dispatching you would need to go
; to each of the generic operations everytime you added a new data type and
; add in the new implementation of that procedure for that data type


; for data-directed style you would need to modify the lookup table to include the data type in whatever procedures it supports 

; for the message passing style i don't think that literally anything would have to be changed with the inclusion of a new data type
; except data of that type would need to get made, assuming that the smart data has all the methods that it needs from the get go
; there should be no issue here 


; now lets look at what would need to change if we were to implement new procedures

; for the generic procedures with explicit dispatching we would need to create new generic procedures with explicit dispatching to
; the package specific implementations of the generic methods

; for the data-directed style you would need to add a new row to the lookup table and make sure that there were new implementations of that
; procedure from all the packages that need to support it

; for the message passing style you would need to rewrite the constructors for every variety of smart data that would need to support the new procedures

; long story short: for constantly implementing new procedures i would favor data-directed programming, for
; constantly implementing new data types i would probably still favor data-directed but might favor message passing becuase it is exceptionally frictionless 
