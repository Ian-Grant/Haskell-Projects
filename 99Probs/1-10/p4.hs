--type def
myLength :: [a] -> Int
--empty check
myLength [] = error "EMPTY LIST"
--if at end of list return 1
myLength [x] = 1
--if array not at end
--return 1 plus function called on rest of list
myLength (_:xs) = 1 + myLength xs
