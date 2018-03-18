module P34 where

gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' 0 b = b
gcd' a b = gcd' b rd
    where
      ld = a `div` b
      rd = a `rem` b

coprime' :: Int -> Int -> Bool
coprime' a b = gcd' a b == 1

totient :: Int -> Int
totient 1 = 1
totient x = count
            where
                count = sum $ map check l
                check z = if coprime' x z then 1 else 0
                l = [0,1..(x-1)]
