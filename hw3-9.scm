; rather than draw out the frame diagram like the question asked for (because it makes no sense in this text file)
; i will instead explain my answer, so first I thought that the point of this question was to show that
; for one of these two methods the frames for each successive call would stack "down" rather than "sideways"
; that is, each successive call would take the previous calls frame as it parent frame, but after thinking about
; this for a little bit i realized that this wouldn't be true for either of the two methods, both involve repeated
; calls to the same method, a method defined at the global scale so both of them would stack sideways,
; after looking at some other peoples answers i realized that this wasn't the point of the question at all
; rather the point was that for the recursive method there were two more bindings occuring at each succesive call
; and there was one irregular frame (the wrapper for the iterator function) to start the whole chain off,
; in fact depending on whether or not the iterative version has the iterator defined inside the wrapper function
; or not the iterator may actually go "down one" before it goes "over"
