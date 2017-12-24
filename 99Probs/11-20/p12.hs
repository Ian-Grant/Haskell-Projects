import Data.List
--data type list
data ListItem a = Single a | Multiple Int a
    deriving (Show)
--type def
--list of listems generic type into list of generic types
decodeM :: [ListItem a] -> [a]
--concatMap dhelps
--flattens list into list and converts single a and multiple n a into just as
decodeM = concatMap dHelp
    where
        dHelp (Single s) = [s]
        dHelp (Multiple n m) = replicate n m
