; no it is not a safe change to make,
; serializers work by having a list of procedures
; and only allowing one procedure out of that set to be
; firing at a time, but depending on how this is implemented
; two calls of the very same procedure could be allowed to fire
; at the same time and could interleave (this is a contentious answer,
; most other people seem to think differently about this, I think that
; it depends on how the serializer is implemented)
