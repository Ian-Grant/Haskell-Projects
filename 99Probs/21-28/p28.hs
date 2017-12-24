import List
import Data.Ord
--takes in nested list and returns nested list
lsort :: [[a]] -> [[a]]
--sorts by comparing the length of 1st list and 2nd list
lsort = sortBy (\xs ys -> compare (length xs) (length ys))
