module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance "" "" = Just 0
distance _ "" = Nothing
distance "" _ = Nothing
distance xs ys
            | xs == ys = Just 0
            | length xs /= length ys = Nothing
            | otherwise = Just $ countDif $ zipWith cmp xs ys

cmp :: Char -> Char -> Bool
cmp x y = x==y

countDif :: [Bool] -> Int
countDif [] = 0
countDif (x:xs) = if x then 0+countDif xs else 1 + countDif xs
