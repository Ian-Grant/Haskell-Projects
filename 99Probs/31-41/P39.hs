module P39 where

import Data.List (filter,nub,dropWhile)
import P35

primeRange :: Int -> Int -> [Int]
primeRange x y = dropWhile (< x) $ nub $ primeFactors y
