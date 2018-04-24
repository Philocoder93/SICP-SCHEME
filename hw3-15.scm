; once again, not gonna type box and pointer diagrams in here but i can explain in text what is going wrong
; in this situation, basically when you run set-wow on z1 and z2 below you are mutating the caar of the
; data structure passed, this results in two different results because in z1 the caar is the exact same object
; in memory as cadr so both get modified while in z2 that was not the case so only caar gets modified in that
; case
