module SumOfMultiples (sumOfMultiples) where
import Data.List (nub)
--
--------------------2nd Iteration-------------------------------------
-- Recursive Solution that works with any length list
--
sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples [] _ = 0
sumOfMultiples factors limit = sum $ nub $ sumOfMultiples' factors limit

sumOfMultiples' :: [Integer] -> Integer -> [Integer]
sumOfMultiples' [] _ = []
sumOfMultiples' factors limit = if length factors > 1
        then list ++ sumOfMultiples' (tail factors) limit
        else list
        where
            x = factors !! 0
            list = nub $ takeWhile (< limit) [x,x*2..]
--
---------------------1st Iteration---------------------------------------
-- Not Recursive just checks for length of list
--
sumOfMultiplesV1 factors limit = sum $ nub listT
        where
            x = factors !! 0
            y = factors !! 1
            z = factors !! 2
            listT = case length factors of
                             3 -> listx ++ listy ++ listz
                             2 -> listx ++ listy
                             1 -> listx
            listx = takeWhile (< limit) [x,x*2..]
            listy = takeWhile (< limit) [y,y*2..]
            listz = takeWhile (< limit) [z,z*2..]

