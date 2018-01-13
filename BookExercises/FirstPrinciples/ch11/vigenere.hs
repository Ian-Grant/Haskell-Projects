module Vigenere where
import Data.Char (ord)

shift :: Char -> Char
shift 'z' = 'a'
shift 'Z' = 'A'
shift c   = succ c

vigenere :: String -> String -> String
vigenere "" _ = ""
vigenere mess key = zipWith vig mess numShift
    where
        vig m k = if m/=' ' then iterate shift m !! k else ' '
        numShift = map (capCheck . ord) key
        capCheck x
            --lowercase
            | x < 91 && x > 64 = x `rem` 65
            --uppercase
            | x > 96 && x < 123 = x `rem` 97
            --non alpha charecters
            | otherwise = error "Not a letter"
