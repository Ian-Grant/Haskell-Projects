import Data.List
--func type def
--takes in a list and returns a list
mySet :: (Eq a) => [a] -> [a]
--if empty list return empty list
mySet []     = []
--list return head of list cat with mySet and
--it takes in rest of list but filters out duplicates of x
mySet (x:xs) = x : (mySet $ dropWhile (==x) xs)

