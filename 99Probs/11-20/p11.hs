import Data.List
--data type listitem
--it is either single generic type or multiple #of how many generic types
--and the type dereives show type
data ListItem a = Single a | Multiple Int a
    deriving (Show)
--type def
countL :: (Eq a) => [a] -> [(Int,a)]
--maps the lambda function to the result of group
countL = map (\x -> (length x, head x)) . group
--type def
countLM :: (Eq a) => [a] -> [ListItem a]
--map chelp into result of countL
--chelp is pattern matched to # of xs in list
countLM = map cHelp . countL
    where
        cHelp (1,x) = Single x
        cHelp (n,x) = Multiple n x
