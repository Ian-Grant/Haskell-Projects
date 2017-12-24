--type def
elementAt :: [a] -> Int -> a
--empty check
elementAt [] y = error "EMPTY LIST"
--takes in a list x and a int i
--return the element a ith place in list 0 indexed
--i-1 because its 0 indexed
elementAt x i = x !! (i-1)
