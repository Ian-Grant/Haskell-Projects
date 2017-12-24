import Data.List

countL :: (Eq a) => [a] -> [(Int,a)]
countL = map (\x -> (length x, head x)) . group
