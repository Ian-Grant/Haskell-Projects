module Coprime where

gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' 0 b = b
gcd' a b = gcd' b rd
    where
      ld = a `div` b
      rd = a `rem` b

coprime' :: Int -> Int -> Bool
coprime' a b = gcd' a b == 1
