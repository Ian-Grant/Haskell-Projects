module PerfectNumbers (classify, Classification(..)) where
import Data.Char
data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
    | x < 1 = Nothing
    | aSum == x = Just Perfect
    | aSum > x = Just Abundant
    | aSum < x = Just Deficient
    | otherwise = Nothing
        where
            n = (x `div` 2)
            aSum = sum $ filter ((0==) . mod x) [1..n]
