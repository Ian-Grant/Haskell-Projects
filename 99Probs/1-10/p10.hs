import Data.List
--type def
countL :: (Eq a) => [a] -> [(Int,a)]
--the map maps lambda function on to the result of group function
countL = map (\x -> (length x, head x)) . group
