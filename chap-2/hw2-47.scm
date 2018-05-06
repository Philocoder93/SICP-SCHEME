(define (new-frame orgn edg1 edg2)
  (list orgn edg1 edg2))

(define (get-frame-origin frame)
  (first frame))

(define (get-frame-edge-1 frame)
  (second frame))

(define (get-frame-edge-2 frame)
  (third frame))

; this ^ is the first implementation

(get-frame-origin (new-frame 1 2 3))

(get-frame-edge-1 (new-frame 1 2 3))

(get-frame-edge-2 (new-frame 1 2 3))

(define (new-frame orgn edg1 edg2)
  (cons orgn (cons edg1 edg2)))

(define (get-frame-origin frame)
  (car frame))

(define (get-frame-edge-1 frame)
  (cadr frame))

(define (get-frame-edge-2 frame)
  (cddr frame))

; this ^ is the second implementation

(get-frame-origin (new-frame 1 2 3))

(get-frame-edge-1 (new-frame 1 2 3))

(get-frame-edge-2 (new-frame 1 2 3))
