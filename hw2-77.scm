; the reason this works is that in this system procedures on abstract data objects with more than one implementation are passed through two
; different lookup tables, the procedures from one are not neccesarily accesible in the other one, in this case the generic procedure does not have
; a listing for the procedure and data type combination that it is being passed, however the lookup table for the different implementations of the
; same abstract object do, so what the code from the book does is just have the different implementations package directly expose a bunch of it's operations
; to the next level up, what is confusing to me is how the authors seem to have forgotten about the fact that they are just delivering the bare procedures
; back up the to caller, but this alone will not provide any new functionality, you would have to capture the return and the recall it with the appopriate arguments  
