module P32 where

gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' 0 b = b
gcd' a b = gcd' b rd
    where
      ld = a `div` b
      rd = a `rem` b
