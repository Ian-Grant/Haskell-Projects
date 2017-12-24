import Data.List

data ListItem a = Single a | Multiple Int a
    deriving (Show)

countL :: (Eq a) => [a] -> [(Int,a)]
countL = map (\x -> (length x, head x)) . group

countLM :: (Eq a) => [a] -> [ListItem a]
countLM = map cHelp . countL
    where
        cHelp (1,x) = Single x
        cHelp (n,x) = Multiple n x
