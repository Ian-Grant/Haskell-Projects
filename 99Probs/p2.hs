myButLast :: [a] -> a
myButLast [] = error "EMPTY LIST"
myButLast [x,_] = x
myButLast (_:xs) = myButLast xs
