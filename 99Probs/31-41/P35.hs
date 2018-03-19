module P35 where

import P34

primeFactors :: Int -> [Int]
primeFactors x = solve x 2
            where
                solve 1 _ = []
                solve x f
                    | x `rem` f == 0 = f : solve (x `quot` f) f
                    | otherwise = solve x (f+1)
