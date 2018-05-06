;the thing that ben is not getting is that since the car portion
;of the queu is a pointer to the first pair in the queu then it is
;a pointer to the *entire list*, meanwhile the cdr portion is a pointer
;to merely the last pair, when ben adds the first pair to the list
;and then complains that it has added it twice this is only because both the car
;and the cdr are pointing to the same pair, so when he prints it out he has
;printed out the very same pair twice, then when he adds another element
;to the queu he sees both elements printed in the car, just as expected,
;but he sees the last element printed in the cdr, which looks like a duplicate,
;finally, when all the elements are pulled of the front of the list then nothing
;gets printed in the car but the previous last element is still in the cdr,
;whats going on? well, when the last element in the queu was removed the
;front pointer for the queu was repointed to the cdr of it's former value
;which, in this case, means it was pointed to the empty list at the back of
;queu, so know the car is pointing to the cdr of the value that the cdr is pointing
;to, when a new element is added to the queue it will reasign the cdr of the
;value that the cdr is currently pointing at (which is the value that the car is pointing at)
;to that new value and then repoint the cdr to it, once again the car and the cdr will
;be pointing to the same thing, it will be like we just created a new queue,
;all of this implies that the best way to print out the queue is the following:

(define (print-Q Q)
	(display (front-ptr Q))
	(newline ))
