; the purpose of this method is to test if two different lists
; are equal

(define (flat-list-equal list1 list2)
  (cond
    ((and (null? list1) (null? list2)) #t)
    ((eq? (car list1) (car list2)) (flat-list-equal (cdr list1) (cdr list2)))
    (else #f)))

(flat-list-equal (list 1 2 3 4) (list 1 2 3 4))

(flat-list-equal (list 1 2 3 4) (list 1 2 3 6))

; this works but after looking at answers from others and looking closer at the book
; realized that they want something that is not restricted to flat lists

(define (list-equal list1 list2)
  (let* (
        ; if list1 and list2 are pairs them split them and store them in these variables
        ; the only reason we deliver anything if they are not pairs is to avoid throwing errors
        (1-is-pair (pair? list1))
        (2-is-pair (pair? list2))
        (lead1 (if 1-is-pair (car list1) 'not-pair))
        (lead2 (if 2-is-pair (car list2) 'not-pair))
        (tail1 (if 1-is-pair (cdr list1) 'not-pair))
        (tail2 (if 2-is-pair (cdr list2) 'not-pair))
        )
    (cond
      ; this caps if you have reached the end of a list
      ; since you have made it this far it means that you did not encounter a mistake on the way to this point
      ; which means the two lists are not equal
      ((and (null? list1) (null? list2)) #t)
      ; this caps if you have reached the primitive data
      ((not (or 1-is-pair 2-is-pair)) (eq? list1 list2))
      ; if the car of both lists is a list then branch off a call to explore that branch
      ((and (list? lead1) (list? lead2)) (and (list-equal lead1 lead2) (list-equal tail1 tail2)))
      ; if the car of the current lists is a pair then hit both of its values with a branch and also hit
      ; the rest of the list with a branch
      ((and (pair? lead1) (pair? lead2)) (and (list-equal (car lead1) (car lead2)) (list-equal (cdr lead1) (cdr lead2)) (list-equal tail1 tail2)))
      ; suppose the car of both of the current lists are simple, unstructured data, in that case simply compare them, if they
      ; are equal then proceed to the next element in the list
      ((eq? (car list1) (car list2)) (list-equal (cdr list1) (cdr list2)))
      ; if none of the above then we have discovered a value where the two lists are not equal,
      ; in that case return false
      (else #f))))

(list-equal (list 1 2 3 (list 1 2 3)) (list 1 2 3 (list 1 2 3)))
(list-equal (list 1 2 3 4) (list 1 2 3 (list 4)))
