module Grains (square, total) where

import Data.Maybe

square :: Integer -> Maybe Integer
square n
    | n <= 0 = Nothing
    | n > 64 = Nothing
    | otherwise = Just $ 2^ pred n

total :: Integer
total = sum $ concatMap (maybeToList . square) [1..64]
