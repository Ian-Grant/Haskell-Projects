import Data.List

splitN :: [a] -> Int -> [[a]]
splitN [] _ = []
splitN list count = [(take (count-1) list)] ++ [(drop count list)]
