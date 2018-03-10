; one obvious move you could make here would be to
; test the sign of the lower bounds, if they are both
; positive then multiply lower by lower and upper by upper

; next test the signs of the upper bounds,
; if they are both negative then multiply the lower by the lower
; and the upper by the upper

; both of these ^ are taken care of in the first check

; next check for the case where one of the intervals has double positive bounds while the other has
; one positive and one negative, in this case multiply negative lower by positive upper
; and positive upper by positive upper

; same as above only with order inverted

; next check for the case where one of the intervals has double negative bounds while the other
; has one positive and one negative, in this case multiply the negative lower by the negative lower
; and the positive upper by the negative lower

; same as above only with order inverted

; all four of these ^ are taken care of in the next two checks (which can almost certainly be abstracted
; into one check)

; next you need to check for the case where one of the intervals lower bounds is positive
; and the other intervals upperbound is negative, in this case lower bound of all negative times upper bound
; of all positive equals new lower bound and upper bound of all negative times lower bound of all positive
; equals new upper bound

; same as above only with order inverted

; next check for the case where there both of the intervals have a negative lower bound and a positive upper
; bound, in this case you need to check if both positives multiplied together are greater than both
; negatives multiplied together use whichever of those is greater for the upper, then check which positive
; and which negative have the greatest combined absolute value and multiply those together

; now that we have all these present we can move on to actually writing the function:
; first the stuff that we have from previous exercises:

(define (cons-interval a b) (cons (max a b) (min a b)))

(define (upper-bound int) (car int))

(define (lower-bound int) (cdr int))

; the only issue with this solution is that it is not guaranteed to work in
; all situations where a zero is passed (although so far it has passed all
; the tests that I have given it)
(define (intervalMultiplication int1 int2)
  (let (
        (1up (upper-bound int1))
        (2up (upper-bound int2))
        (1low (lower-bound int1))
        (2low (lower-bound int2))
        (1upsgn (positive? (upper-bound int1)))
        (2upsgn (positive? (upper-bound int2)))
        (1lowsgn (positive? (lower-bound int1)))
        (2lowsgn (positive? (lower-bound int2)))
        (nor (lambda (a b) (not (or a b))))
        (xor (lambda (a b) (not (boolean=? a b))))
        (greaterMag (lambda (a b) (if (> (abs a) (abs b)) a b)))
        (likeTimesLike (lambda (1up 2up 1low 2low) (cons-interval (* 1up 2up) (* 1low 2low))))
        (mainTimBoth (lambda (main a b) (cons-interval (* main a) (* main b))))
        (crissCross (lambda (1up 2up 1low 2low) (cons-interval (* 1up 2low) (* 2up 1low))))
        (doubleMixed (lambda (1up 2up 1low 2low) (cons-interval (max (* 1up 2up) (* 1low 2low)) (min (* 1up 2low) (* 2up 1low)))))
        )
    (cond
      ((or (and 1lowsgn 2lowsgn) (nor 1upsgn 2upsgn)) (likeTimesLike 1up 2up 1low 2low))
      ((and (boolean=? 1upsgn 1lowsgn) (xor 2upsgn 2lowsgn)) (mainTimBoth (greaterMag 1up 1low) 2up 2low))
      ((and (boolean=? 2upsgn 2lowsgn) (xor 1upsgn 1lowsgn)) (mainTimBoth (greaterMag 2up 2low) 1up 1low))
      ((or (and 1lowsgn (not 2upsgn)) (and 2lowsgn (not 1upsgn))) (crissCross 1up 2up 1low 2low))
      ((and (xor 1upsgn 1lowsgn) (xor 2upsgn 2lowsgn)) (doubleMixed 1up 2up 1low 2low)))))

(intervalMultiplication (cons-interval 2 -3) (cons-interval 4 5))

(intervalMultiplication (cons-interval 2 -3) (cons-interval 4 -5))

(intervalMultiplication (cons-interval 2 3) (cons-interval -4 -5))

(intervalMultiplication (cons-interval 2 3) (cons-interval 4 5))

(intervalMultiplication (cons-interval -2 -3) (cons-interval -4 -5))

(intervalMultiplication (cons-interval 3 -5) (cons-interval -1 -9))

; this one passed even with a zero in there
(intervalMultiplication (cons-interval 3 0) (cons-interval 1 9))
; this one also passed with a zero
(intervalMultiplication (cons-interval -3 0) (cons-interval 9 -1))
; and this one
(intervalMultiplication (cons-interval 3 0) (cons-interval 9 -1))
; wow, and this one
(intervalMultiplication (cons-interval -3 0) (cons-interval 9 0))

(intervalMultiplication (cons-interval -3 0) (cons-interval -4 -5))
(intervalMultiplication (cons-interval 3 0) (cons-interval -4 -5))
