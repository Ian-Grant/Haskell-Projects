import Data.List

myPack :: (Eq a) => [a] -> [[a]]
myPack x = group x

myPack' :: (Eq a) => [a] -> [[a]]
myPack' [] = []
myPack' (x:xs) = (x:(filter (==x) xs)): (myPack' $ filter (/=x) xs)
