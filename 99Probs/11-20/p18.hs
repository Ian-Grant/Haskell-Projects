import Data.List
--type def
--takes in 2 int
--returns list of generic type
sliceN :: [a] -> Int -> Int -> [a]
--takes bth plus 1 num of elements from list
--then pas that into drop which drops first ath num of elements
--then returns that list
sliceN list a b = drop a $ take (b+1) list
