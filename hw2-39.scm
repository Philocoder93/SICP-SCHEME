; this method will canabilize code from previous answers,
; I am also going to write a new accum-left different than the
; one from the book

(define (accum oper init lst)
   (if (null? lst)
       init
       (oper (car lst)
           (accum oper init (cdr lst)))))

(define (accum-left oper init lst)
  (if (null? lst)
    init
    (let (
          (newInit (oper init (car lst)))
          )
      (accum-left oper newInit (cdr lst)))))

(accum-left + 0 (list 1 2 3 4 5))

(accum + 0 (list 1 2 3 4 5))

(accum-left - 0 (list 1 2 3 4 5))

(accum - 0 (list 1 2 3 4 5))

; the answers are the same in the first case becuase addition is associative and commutative

(define (rever lst)
  (accum
    (lambda (x y) (accum cons (cons x '()) y))
    '()
    lst))

; the challenge here is that rever is a recursive procedure that traverses lst outside to inside,
; left to right, so it calls its way down to the 5 and then the null, here's the problem,
; for the purposes of a reverse you need the null after the one (the final element in the reversed list)
; and not before the five (the first element in the reversed list) so here's what you do,
; at each point on your way back out you take the list produced by the previous return, drill
; down till you find the null set and insert a new pair, the next element and the null set
; in effect you build the new list from the outside in rather than from the inside out which
; is the more obvious and convenient way to do it

(rever (list 1 2 3 4 5))

(define (rever lst)
  (accum-left
    (lambda (x y) (cons y x))
    '()
    lst))

; here the procedure is much more straightforward, here the accum-left procedure is iterative,
; it starts with null and performs op on it and the first element on the list, then we apply op on
; the result of that and the next element and so on, as a result we can build the new array in
; the normal way i.e. null set out

(rever (list 1 2 3 4 5))
