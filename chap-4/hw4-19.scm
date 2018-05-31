; perhaps surprisingly, i am 100% with ben on this one
; i disagree with alyssa, mutual recursion does not require
; the simultaneous scope rule, procedure bodies are evaluated
; when they are called so as long as your mutually recursing procedures
; are all defined before any are called then mutual recursion will work just fine
; moreover, i think that any implementation that interprets all declerations
; from a function as being simultaneous will pay a hefty price in readability
; humans (at least american ones) read left to right top to bottom in a sequence
; an implementation that handles variable decleration as simultaneous risks having
; humans misinterpret programs because at the time that they read an expression they
; haven't yet read the redefinition of one of the variables that the interpreter will
; hoist over the expression in question, i.e. if expressions early in a program utilize
; A but A is redefined at the end of the program then the reader will have to go back
; and reread the entire program over again with the new value of A in mind
