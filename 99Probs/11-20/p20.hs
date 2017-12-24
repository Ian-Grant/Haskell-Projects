import Data.List
--type def
--generic list and int passed in
--return generic list
removeN :: [a] -> Int -> [a]
--drops the nth plus 1 elements from list
--then pass that into take which keeps first
--nth elements of that list
removeN list n = (take n list ++ drop (n+1) list)
