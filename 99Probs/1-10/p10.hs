import Data.List

myPack' (x:xs) = (x:(filter (==x) xs)): (myPack' $ filter (/=x) xs)

countL :: (Eq a) => [a] -> [(Int,a)]
countL = map (\x -> (length x, head x)) . group
