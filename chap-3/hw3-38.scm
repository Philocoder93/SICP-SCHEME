; starting value 100

; ops:
; 1: deposit 10
; 2: withdraw 20
; 3: withdraw half of the current money in the account

; different ways of doing these operations:

; 1, 2, 3 : 45
; 1, 3, 2 : 35
; 2, 1, 3 : 45
; 2, 3, 1 : 50
; 3, 1, 2 : 40
; 3, 2, 1 : 40

; so total output values for serialized runs = [35, 40, 45, 50]

; one example of an interleaved (i.e. non-serialized) process that could occur

; 1: process #1 reads the current state of the account
; 2: #3 fires and completes it's run
; 3: #1, with the value of 110 as it's second argument (since it read the initial state
; of the account in order to generate that argument) sets the account back to 110
; 4: #2 fires leaving the account at 90, not a value that it should be able to reach
