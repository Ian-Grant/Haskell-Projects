import Data.List

dropN :: [a] -> Int -> [a]
dropN [] _ = []
dropN list count = (take (count-1) list) ++ dropN (drop count list) count
