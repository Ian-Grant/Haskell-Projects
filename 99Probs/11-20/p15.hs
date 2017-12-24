import Data.List
--type def
repli :: [a] -> Int -> [a]
--if empty list return empty list
repli [] _ = []
--replicat first element of list n times and cat it to rest of list passed into function
repli (x:xs) n = replicate n x ++ repli xs n
