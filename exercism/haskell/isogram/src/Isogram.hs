module Isogram (isIsogram) where
import Data.Char
isIsogram :: String -> Bool
isIsogram [] = True
isIsogram f@(x:xs) = letter `notElem` string && isIsogram string
    where
        letter = toLower x
        string = map toLower $ filter isLetter xs
