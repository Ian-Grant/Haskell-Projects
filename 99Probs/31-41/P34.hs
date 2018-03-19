module P34 where

import P33

totient :: Int -> Int
totient 1 = 1
totient x = count
            where
                count = sum $ map check l
                check z = if coprime' x z then 1 else 0
                l = [0,1..(x-1)]
