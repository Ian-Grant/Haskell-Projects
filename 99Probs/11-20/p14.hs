import Data.List
--type def
dup :: [a] -> [a]
--empty list returns empty list
dup [] = []
--repeates begining of list then calls dup on rest of list
dup (x:xs) = x:x:dup xs
