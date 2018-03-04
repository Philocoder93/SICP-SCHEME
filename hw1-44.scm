; this starts of with code originally written in 1-43

(define (mashUp fnc1 fnc2)
  (lambda (arg) (fnc2 (fnc1 arg))))

(define (NthCallIter f a k)
  (if (= k 0)
    a
    (NthCallIter
            f
            (mashUp f a)
            (- k 1))))


((NthCallIter
            (lambda (a) (+ a 1))
            (lambda (a) a) 7) 8)



(define (smooth f)
  (let ((dx 0.001))
    (lambda (a)
      (/ (+ (f (+ a dx))
            (f (- a dx))
            (f a)) 3))))

(define (square a) (* a a))


(((NthCallIter
            smooth
            (lambda (a) a) 15) square) 5)

; whats going on here is that we are passing the NthCallIter the smoother function
; and a base function along with the number 15, this returns the 15fold smoother function which we are
; immediately calling on the square function to get the 15fold smoothed square function,
; which are immediately calling on 5 to get a return value of 25.000009999999975,
