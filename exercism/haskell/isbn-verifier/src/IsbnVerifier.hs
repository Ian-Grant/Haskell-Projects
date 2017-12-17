module IsbnVerifier (isbn) where
import Data.Char
import Data.List

isbn :: String -> Bool
isbn x
    | ((x !! 2 /= '-')&&(last x == 'X')) = isbnHelper' x
    | ((x !! 2 /= '-')&&(last x /= 'X')) = isbnHelper x
    | ((x !! 2 == '-')&&(last x == 'X')) = isbnHelperD' x
    | ((x !! 2 == '-')&&(last x /= 'X')) = isbnHelperD x

isbnHelper :: String -> Bool
isbnHelper x = (ord(x !! 0) * 10 + ord(x !! 2) * 9 + ord(x !! 3) * 8 + ord(x !! 4) * 7 + ord(x !! 6) * 6 + ord(x !! 7) * 5 + ord(x !! 8) * 4 + ord(x !! 9) * 3 + ord(x !! 10) * 2 + ord(x !! 12) * 1) `mod` 11 == 0

isbnHelper' :: String -> Bool
isbnHelper' x = (ord(x !! 0) * 10 + ord(x !! 2) * 9 + ord(x !! 3) * 8 + ord(x !! 4) * 7 + ord(x !! 6) * 6 + ord(x !! 7) * 5 + ord(x !! 8) * 4 + ord(x !! 9) * 3 + ord(x !! 10) * 2 + 10 * 1) `mod` 11 /= 0

isbnHelperD :: String -> Bool
isbnHelperD x = (ord(x !! 0) * 10 + ord(x !! 1) * 9 + ord(x !! 2) * 8 + ord(x !! 3) * 7 + ord(x !! 4) * 6 + ord(x !! 5) * 5 + ord(x !! 6) * 4 + ord(x !! 7) * 3 + ord(x !! 8) * 2 + ord(x !! 9) * 1) `mod` 11 == 0

isbnHelperD' :: String -> Bool
isbnHelperD' x = (ord(x !! 0) * 10 + ord(x !! 1) * 9 + ord(x !! 2) * 8 + ord(x !! 3) * 7 + ord(x !! 4) * 6 + ord(x !! 5) * 5 + ord(x !! 6) * 4 + ord(x !! 7) * 3 + ord(x !! 8) * 2 + 10 * 1) `mod` 11 /= 0
