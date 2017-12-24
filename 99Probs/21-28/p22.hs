import Data.List
--type def
--2 ints passed through
range :: Int -> Int -> [Int]
--using infinite list to create list going from a to b using succ under the covers
range a b = [a..b]
