module P35 where

gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' 0 b = b
gcd' a b = gcd' b rd
    where
      ld = a `div` b
      rd = a `rem` b

coprime' :: Int -> Int -> Bool
coprime' a b = gcd' a b == 1

primeFactors :: Int -> [Int]
primeFactors x = solve x 2
            where
                solve 1 _ = []
                solve x f
                    | x `rem` f == 0 = f : solve (x `quot` f) f
                    | otherwise = solve x (f+1)
