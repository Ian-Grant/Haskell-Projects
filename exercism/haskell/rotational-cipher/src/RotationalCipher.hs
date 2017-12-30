module RotationalCipher (rotate) where
import Data.Char
rotate :: Int -> String -> String
rotate rot xs = map crypt xs
    where
        crypt x = iterate succ' x !! rot
        succ' x
            | x == ' ' = ' '
            | isLetter x && x/= 'z' && x/= 'Z' = succ x
            | (isLetter x) && (x== 'z' || x== 'Z') = if isUpper x then 'A' else 'a'
            | otherwise = x
