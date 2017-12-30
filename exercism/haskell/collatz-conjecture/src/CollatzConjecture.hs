module CollatzConjecture (collatz) where

collatz' :: Integer -> Integer -> Maybe Integer
collatz' x y
    | y == 1 = Just x
    | even y = collatz' (x+1) (y `div` 2)
    | otherwise = collatz' (x+1) ((3*y)+1)

collatz :: Integer -> Maybe Integer
collatz y = if y <= 0 then Nothing else collatz' 0 y
