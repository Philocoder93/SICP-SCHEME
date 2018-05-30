; I have to admit that i had to look this one up but after
; reading up on some other peoples answers i now see what
; they were pointing out, basically before the primitive
; version of map gets run it needs to have both it's keyword
; and args evaluated and then the evaluated args need to be passed
; to the apply-primitive-procedure procedure, this will cause
; big problems if map is using a primitive function as it's mapper function.
; When this occurs the arguments to map will themselves be evaluated
; before being passed into apply in order to apply map, but when this
; occurs the primitive will itself evaluate to a tagged list
; which is not something that map can use
