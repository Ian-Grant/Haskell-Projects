myLength :: [a] -> Int
myLength [] = error "EMPTY LIST"
myLength [x] = 1
myLength (_:xs) = 1 + myLength xs
