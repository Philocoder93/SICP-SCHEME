; again, without the atomic operations or data types defined this is basically
; pseudo code

(define (gen-split outer inner)
  (lambda (painter n)
    (cond
      ((= n 0) painter)
      (else (let ((smaller ((gen-split outer inner) painter (- n 1))))
        (outer painter (inner smaller smaller)))))))

; thanks to the poster here: http://community.schemewiki.org/?sicp-ex-2.45
; for reminding me that as an output from this general function you can't refer to the
; name of the function, I could do this with the y-combinator but that would be a giant
; pain in the ass so I won't do it, rather I'm going to follow the posters lead and
; just regenerate the function and then immediately call it
