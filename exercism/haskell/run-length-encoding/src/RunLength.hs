module RunLength (decode, encode) where
import Data.List
import Data.Char
encode :: String -> String
encode "" = ""
encode f@(x:xs) = count ++ x : encode rest
    where
        len = length $ takeWhile (==x) f
        count = if len == 1 then "" else show len
        rest = drop len f
decode :: String -> String
decode "" = ""
decode f@(x:xs) = replicate count letter ++ decode rest
    where
        num = takeWhile isDigit f
        count = if null num then 1 else read num
        letter = head $ filter (not . isDigit) f
        rest = drop (1+length num) f
