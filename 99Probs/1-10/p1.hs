--Type Dec
myLast :: [a] -> a
--Pattern match empty list
myLast [] = error "EMPTY LIST"
--list with single item
myLast [x] = x
--list with more than one item
--calls function with rest of list
myLast (_:xs) = myLast xs
