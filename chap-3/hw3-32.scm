; image a series of changes to the two bits

; A (which is turned off right now) and
; B (which is turned on right now)

; suppose the changes proceeded in this order:

; 1: turn off B
; 2: turn on A

; notice that at no point were the two bits turned on
; at the same time, so the and gate that listens to
; both of them never turned on, but suppose that
; rather then running a FIFO queu we instead did
; things LIFO style, in that case the following steps would be run
; in the following order:

; 1: turn on A
; 2: turn off B

; which would result in the and gate evaluating to true in the middle
; of this queu and potentially causing a lot of unintended activity

; more generally the point is simply that when your doing this simulation you
; are assuming that things will happen in the order that you added them to the
; agenda and not in some other order

