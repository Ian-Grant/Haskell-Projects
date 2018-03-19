--Check if # is prime or not
import Data.List
--type def
--takes in int ret bool
isPrime :: (Integral a) => a -> Bool
-- # less than 4
isPrime n | n < 4 = n /= 1
-- checks if all of the elements in list doesn't equal 0
-- takes while elements from infinite list l are less than m
-- pips that into mod n then checks if all elementss are zero
isPrime n = all ((/=0) . mod n) $ takeWhile (<= m) l
        where
            --makes a inifinite list to use above
            -- makes inifinite list [2,3 then offset of -1 & 1 of infitie list
            -- increasing by 6
            -- ex: [2,3,5,7,11,13]
            l = 2:3:[x + i | x <- [6,12..], i <- [-1,1]]
            -- square roots the input and the rounds that number down
            m = floor . sqrt $ fromIntegral n
