import Data.List
--type def
myPack :: (Eq a) => [a] -> [[a]]
--takes in list returns list of lists
--the inner lists are made of of groups of duplicate items
myPack x = group x
--type def
myPack' :: (Eq a) => [a] -> [[a]]
--empty list return empty list
myPack' [] = []
--cats head to filter of not x to rest of list catted to myPack
--which takes in rest of list with x filtered out
myPack' (x:xs) = (x:(filter (==x) xs)): (myPack' $ filter (/=x) xs)
