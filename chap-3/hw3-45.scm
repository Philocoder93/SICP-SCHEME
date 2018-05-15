; it would fail because it would allow procedures to become double serialized
; what does this mean? a procedure would be fed into a serializer and then
; that serialized procedure would itself be serialized, this would cause an eternal
; loop were it ever to be run. the reason for this is that the procedure would hit
; the first serializer, activate it, then hit the next serializer and not be able to
; proceed, in effect the procedure would be waiting for itself to complete before
; completing, no bueno
