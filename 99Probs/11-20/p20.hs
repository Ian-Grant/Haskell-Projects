import Data.List

removeN :: [a] -> Int -> [a]
removeN list n = (take n list ++ drop (n+1) list)
