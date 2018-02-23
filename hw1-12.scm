; this version finds a single number in pascals triangle
; by recursively going up the tree till it encounters base cases

(define (recursivePascal x y)
  (cond
    ((or (= x y) (= x 0)) 1)
    ((> x y) 0)
    (else (+ (recursivePascal x (- y 1)) (recursivePascal (- x 1) (- y 1))))))

; array Zipper method

(define (butFirst list1)
  (list-tail list1 1))

(define (combineFirst list1 list2)
  (+ (first list1) (first list2)))

(define (arrayZipper list1 list2)
  (cond
    ((not (= (length+ list1) (length+ list2))) 'lists_need_to_be_same_length)
    ((= (length+ list1) 1) (list (combineFirst list1 list2)))
    (else (append (list (combineFirst list1 list2)) (arrayZipper (butFirst list1) (butFirst list2))))))

; iterator to wrap the array zipper and implement
; the algorithm i thought up

(define (zeroToFront list1)
  (append '(0) list1))

(define (zeroToBack list1)
  (append list1 '(0)))

; this version computes n rows of pascals triangle depending on the input
(define (computeNRowsPascal count list1)
  (if (= count 1)
    list1
    (append (list list1) (list (computeNRowsPascal (- count 1) (arrayZipper (zeroToFront list1) (zeroToBack list1)))))))


(arrayZipper '(1 1 1 2) '(1 1 1 6))

(computeNRowsPascal 5 '(1))
