import Data.List

dup :: [a] -> [a]
dup [] = []
dup (x:xs) = x:x:dup xs
