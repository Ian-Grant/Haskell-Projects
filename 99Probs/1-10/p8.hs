import Data.List
mySet :: (Eq a) => [a] -> [a]
mySet []     = []
mySet (x:xs) = x : (mySet $ dropWhile (==x) xs)

