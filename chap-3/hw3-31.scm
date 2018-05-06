; as far as i can tell (and i'm not entirely sure about this one) the point of
; this is to have the initial state of a circuit recorded in the agenda even when
; that initial state is all 0s for every wire, in that case the first calls won't
; trigger because the wires won't detect any difference from their initial state of
; 0 and won't fire, if they don't fire then none of the rest of the circuit gets fired
; and absolutely nothing goes to the agenda, in that case we end up with nothing in the
; agenda to model the system
