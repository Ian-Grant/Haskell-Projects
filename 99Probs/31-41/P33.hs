module P33 where

import P32

coprime' :: Int -> Int -> Bool
coprime' a b = gcd' a b == 1
