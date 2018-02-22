; the purpose of this procedure is to find an approximation
; to the cube root of x that falls withing a predetermined
; tolerance

(define (newGuess guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (goodEnough guess x)
  (> 0.001 (abs (- (* guess guess guess) x))))

(define (cubeRoot guess x)
  (if (goodEnough guess x)
    guess
    (cubeRoot (newGuess guess x) x)))

(goodEnough 3 9)

(cubeRoot 1 16)

(goodEnough 1 3)

(newGuess 1 3)

; end the input stream
; i got it fairly quickly once I remembered that I was calculating cubes
