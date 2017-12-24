import Data.List
--type def
--takes in generic type list
--and int
--returns nested list of generic type
splitN :: [a] -> Int -> [[a]]
--empty list returns empty list
splitN [] _ = []
--takes in list and count
--returns list containing list created by the first counntTh number of elements
--then cated with rest of list excluding the first countNth num of elems
splitN list count = [(take (count) list)] ++ [(drop count list)]
