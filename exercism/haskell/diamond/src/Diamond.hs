module Diamond (diamond) where

import Data.Char (ord, chr)

pad :: Int -> String
pad n = replicate n ' '

row :: Char -> (Int, Int) -> String
row c (0, outer) = pad outer ++ [c] ++ pad outer
row c (inner, outer) = pad outer ++ [c] ++ pad inner ++ [c] ++ pad outer

diamond :: Char -> [String]
diamond l = top ++ bot
  where
    -- takes tuple list rows makes and passes it to
    -- row to be zipped with alphabet
    top = zipWith row ['A'..'Z'] $ rows $ subtract 64 $ ord l
    bot = reverse $ init top
    --Rows makes tuples of inside and outside spaceings of the letters
    --1st list is inside
    --2nd list is outside
    rows n = zip (0 : take (n-1) [1, 3..]) [n-1, n-2..0]
