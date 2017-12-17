module IsbnVerifier (isbn) where
import Data.Char
import Data.List
------------2nd Iteration--------------------------
isbn :: String -> Bool
isbn x = isbnHelper2 0 x == 0

isbnHelper2 :: Int -> String -> Int
isbnHelper2 y [] = 0
isbnHelper2 0 x = (ord(x!!0)*10) + isbnHelper2 1 x
isbnHelper2 1 x
    | (x !! 2 /= '-') = (ord(x!!1)*9) + isbnHelper2 2 x
    | (x !! 2 == '-') = (ord(x!!2)*9) + isbnHelper2 2 x
isbnHelper2 2 x
    | (x !! 2 /= '-') = ord(x!!2)*8) + isbnHelper2 3 x
    | (x !! 2 == '-') = ord(x!!3)*8) + isbnHelper2 3 x
isbnHelper2 3 x
    | (x !! 2 /= '-') = ord(x!!3)*7) + isbnHelper2 3 x
    | (x !! 2 == '-') = ord(x!!4)*8) + isbnHelper2 3 x
isbnHelper2 4 x = (ord(x!!4)*6) + isbnHelper2 5 x
    | (x !! 2 /= '-') = ord(x!!4)*6) + isbnHelper2 3 x
    | (x !! 2 == '-') = ord(x!!6)*8) + isbnHelper2 3 x
isbnHelper2 5 x = (ord(x!!5)*5) + isbnHelper2 6 x
    | (x !! 2 /= '-') = ord(x!!5)*5) + isbnHelper2 3 x
    | (x !! 2 == '-') = ord(x!!7)*8) + isbnHelper2 3 x
isbnHelper2 6 x = (ord(x!!6)*4) + isbnHelper2 7 x
    | (x !! 2 /= '-') = ord(x!!6)*4) + isbnHelper2 3 x
    | (x !! 2 == '-') = ord(x!!8)*8) + isbnHelper2 3 x
isbnHelper2 7 x = (ord(x!!7)*3) + isbnHelper2 8 x
    | (x !! 2 /= '-') = ord(x!!7)*3) + isbnHelper2 3 x
    | (x !! 2 == '-') = ord(x!!9)*8) + isbnHelper2 3 x
isbnHelper2 8 x = (ord(x!!8)*2) + isbnHelper2 9 x
    | (x !! 2 /= '-') = ord(x!!8)*2) + isbnHelper2 3 x
    | (x !! 2 == '-') = ord(x!!10)*8) + isbnHelper2 3 x
isbnHelper2 9 x = (ord(x!!9)*1) + isbnHelper2 10 x
    | (x !! 2 /= '-') = ord(x!!9)*1)
    | (x !! 2 == '-') = ord(x!!12)*1)
-----------1st Iteration----------------------
isbnx :: String -> Bool
isbnx x
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