; ben means that one could rewrite the evaluator to include
; unless as a special form, alyssa rightly points out that
; this would be merely syntax and would be no good for use
; with higher order functions, what she means by this is that
; if you have some higher order function that expects another
; function as an argument you can't use unless for that because
; unless would be a special form and not a primitive function
; (for instance, 'if' is not a function that you can use in
; higher order functions in the same way that cons is) you could
; try and circumvent this by wrapping the unless syntax in a
; function but this would defeat the purpose because arguments
; the wrapper function would be evaluated applicatively
