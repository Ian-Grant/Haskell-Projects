module Cipher where
import Data.Char (ord,chr)

encode :: Int -> String -> String
encode _ [] = []
encode n (x:xs)
    | y == 'Z' = 'A' : encode n xs
    | otherwise = l : encode n xs
    where
        y = toUpper x
        l = chr $ ord y + n

decode :: Int -> String -> String
decode _ [] = []
decode n (x:xs)
    | x == 'A' = 'Z' : decode n xs
    | otherwise = l : decode n xs
    where
        l = chr $ ord x - n

