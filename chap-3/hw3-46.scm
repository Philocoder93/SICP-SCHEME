; imagine the following series of events from two processes attempting
; to acquire the mutex at the same time:

; process one and two run through acquiring a mutex at the exact same instant,
; they both check to see if the mutex is currently set, it isn't so both of them
; set the mutex to true (the second time it just resets the mutex from true to...true)
; and then both processes fire and access the same memory simultaneously, thereby (possibly)
; causing problems
