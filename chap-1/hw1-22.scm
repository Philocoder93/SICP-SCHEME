; this is the part of the hw that I wrote, prime? is the
; function provided by the book

(define (isEven N)
  (= (modulo N 2) 0))

(define (ensureOdd N)
  (if (isEven N) (+ N 1)
    N))

(define (searchForPrimesIter start outList)
  (cond
    ((= (length+ outList) 3) outList)
    ((prime? start) (searchForPrimesIter (+ start 1) (append outList (list start))))
    (else (searchForPrimesIter (+ start 1) outList))))

(define (searchForPrimes start)
  (searchForPrimesIter (ensureOdd start) '()))
