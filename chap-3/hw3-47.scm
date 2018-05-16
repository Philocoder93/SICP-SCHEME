; the most obvious way i can think of implementing semaphores in terms of mutexes is to have
; an array of mutexes and just cycle which mutex is at the front of the array, after some procedure
; accesses a mutex, move that mutex to the back of the array and only then allow the next procedure to attempt
; to acquire the mutex stored in the new first element of the array, as we approach the max number of mutexes in the
; array we draw closer to a procedure attempting to acquire a currently preocupied mutex, the main problem here is that
; there is no garauntee that the mutexes will release in order, it's almost easier to imagine how we might
; implement this entire scheme by redesigning mutexes from the ground up
