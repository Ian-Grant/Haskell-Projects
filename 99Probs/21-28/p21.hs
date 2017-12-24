import Data.List
--type def
--take in generic type and generic list and int
--returns the generic list
insertAt :: a -> [a] -> Int -> [a]
--drop first indexth elems of list
--cat that to end of newData passed in
--and cat those two to end of
--the firstTh elems of list
insertAt newData list index = take index list ++ [newData] ++ drop index list
