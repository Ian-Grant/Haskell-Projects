import Data.List
--type def
dropN :: [a] -> Int -> [a]
--empty list return empty list
dropN [] _ = []
--takes count-1 elements of list then cats it to
--result of function with drop count list passed in
--
--take takes n number of elements from front and drops rest
--drop drops n number of elements from front and keeps rest
dropN list count = (take (count-1) list) ++ dropN (drop count list) count
