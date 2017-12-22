myDrop n xs = if n <= 0 || null xs
            then xs
            else myDrop (n-1) (tail xs)

isOdd n = mod n 2 == 1
newOr a b = if a then a else b


lastButOne :: [a] -> a
lastButOne xs = if length xs > 1 then last . init $ xs else error("Too Short of List")
