; the essential difference between the exchange problem and the transfer problem is that
; in the exchange problem the procedure assumes that during the course of running
; (between the reads and the writes) the quantity in question will not change
; however, the transfer problem makes no such assumptions because it does not
; read the state of either of the accounts, the operations that it needs to achieve
; are state indendent, regardless of the state of the account, you can succesfully
; deposit 50 dollars in it and what you have accomplished will definitely be a
; fifty dollar deposit (the one exception here is withdrawing below a 0$ balance
; but the problem specifically tells us to ignore that possibility)
