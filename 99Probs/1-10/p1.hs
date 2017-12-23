myLast :: [a] -> a
myLast [] = error "EMPTY LIST"
myLast [x] = x
myLast (_:xs) = myLast xs
