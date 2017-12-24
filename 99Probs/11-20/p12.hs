import Data.List

data ListItem a = Single a | Multiple Int a
    deriving (Show)

decodeM :: [ListItem a] -> [a]
decodeM = concatMap dHelp
    where
        dHelp (Single s) = [s]
        dHelp (Multiple n m) = replicate n m
