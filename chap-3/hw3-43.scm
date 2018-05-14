; so if you were using the first version of the program one way you could break
; the first condition really easily is, if you had three accounts, 1,2,3 initialize a
; swap between 1 and 2 *and* 1 and 3 simultaneously, so for instance the accounts have balances
; as follows:

; account 1: 50
; account 2: 40
; account 3: 30

; you simultaneously trigger a transfer from 1 to 3 and from 2 to 3,
; first both of the procedures calculate the difference before either can fire and change
; the value in any account

; transfer 1 dif: 20
; transfer 2 dif: 10

; both transfers fire simultaneously (or sequentially at this point)
; 3 now has 60, 1 has 30 and 2 has 30

; but notice that the overall amount is preserved

; even if the account changes underneath the procedure in order for the total amount in all accounts
; to change then there would have to be a mismatch between inputs and outputs into the system,
; but in order for this to happen "difference" would have to change value between the withdrawal and deposit
; phase of some swap procedure and this impossible

; an example of how this could fail in preserving amount is as follows

; suppose that you set out to transfer from 1 to 2 and also to transfer from 1 to 3, let us further suppose that transactions on
; 1 are not serialized, in that case let us suppose that both of the withdrawal operations fire on 1 at the same time,
; in that instance both of the withdrawal operations read the current balance simultaneously and then set the balance in the account twice,
; resulting ultimately in the value that it would have had had only one of the withdrawals occured.
