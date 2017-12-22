module IsbnVerifier (isbn) where
import Data.Char
import Data.List
------------3rd Iteration--------------------------
isbn :: String -> Bool
isbn x = (isbnM(isbnF(x)) + getNum(last x)) `mod` 11 == 0 && getNum(last x) > -1 && length(isbnF(x)) == 9 && length (filter (/='-') x) == 10

isbnF :: String -> [Int]
isbnF x = map digitToInt $ filter isDigit $ init x

isbnM :: [Int] -> Int
isbnM num = sum (zipWith (*) [10,9..1] num)

getNum :: Char -> Int
getNum 'x' = 10
getNum 'X' = 10
getNum n | isDigit n = digitToInt n
getNum _ = -1
------------2nd Iteration--------------------------
isbnx :: String -> Bool
isbnx x = (isbnHelper2 0 x) == 0

isbnHelper2 :: Int -> String -> Int
isbnHelper2 0 x = (digitToInt(head x)*10) + isbnHelper2 1 x
isbnHelper2 1 x
    | (x !! 2 /= '-') = (digitToInt(x!!1)*9) + isbnHelper2 2 x
    | (x !! 2 == '-') = (digitToInt(x!!2)*9) + isbnHelper2 2 x
isbnHelper2 2 x
    | (x !! 2 /= '-') = (digitToInt(x!!2)*8) + isbnHelper2 3 x
    | (x !! 2 == '-') = (digitToInt(x!!3)*8) + isbnHelper2 3 x
isbnHelper2 3 x
    | (x !! 2 /= '-') = (digitToInt(x!!3)*7) + isbnHelper2 4 x
    | (x !! 2 == '-') = (digitToInt(x!!4)*7) + isbnHelper2 4 x
isbnHelper2 4 x
    | (x !! 2 /= '-') = (digitToInt(x!!4)*6) + isbnHelper2 5 x
    | (x !! 2 == '-') = (digitToInt(x!!6)*6) + isbnHelper2 5 x
isbnHelper2 5 x
    | (x !! 2 /= '-') = (digitToInt(x!!5)*5) + isbnHelper2 6 x
    | (x !! 2 == '-') = (digitToInt(x!!7)*5) + isbnHelper2 6 x
isbnHelper2 6 x
    | (x !! 2 /= '-') = (digitToInt(x!!6)*4) + isbnHelper2 7 x
    | (x !! 2 == '-') = (digitToInt(x!!8)*4) + isbnHelper2 7 x
isbnHelper2 7 x
    | (x !! 2 /= '-') = (digitToInt(x!!7)*3) + isbnHelper2 8 x
    | (x !! 2 == '-') = (digitToInt(x!!9)*3) + isbnHelper2 8 x
isbnHelper2 8 x
    | (x !! 2 /= '-') = (digitToInt(x!!8)*2) + isbnHelper2 9 x
    | (x !! 2 == '-') = (digitToInt(x!!10)*2) + isbnHelper2 9 x
isbnHelper2 9 x
    | (last x == 'X') = 10
    | (x !! 2 /= '-')&&((last x /= 'X')) = (digitToInt(x!!9)*1)
    | (x !! 2 == '-')&&((last x /= 'X')) = (digitToInt(x!!12)*1)
-----------1st Iteration----------------------
isbnx1 :: String -> Bool
isbnx1 x
    | ((x !! 2 /= '-')&&(last x == 'X')) = isbnHelper' x
    | ((x !! 2 /= '-')&&(last x /= 'X')) = isbnHelper x
    | ((x !! 2 == '-')&&(last x == 'X')) = isbnHelperD' x
    | ((x !! 2 == '-')&&(last x /= 'X')) = isbnHelperD x

isbnHelper :: String -> Bool
isbnHelper x = (ord(x !! 0) * 10 + ord(x !! 1) * 9 + ord(x !! 2) * 8 + ord(x !! 3) * 7 + ord(x !! 4) * 6 + ord(x !! 5) * 5 + ord(x !! 6) * 4 + ord(x !! 7) * 3 + ord(x !! 8) * 2 + ord(x !! 9) * 1) `mod` 11 == 0

isbnHelper' :: String -> Bool
isbnHelper' x = (ord(x !! 0) * 10 + ord(x !! 1) * 9 + ord(x !! 2) * 8 + ord(x !! 3) * 7 + ord(x !! 4) * 6 + ord(x !! 5) * 5 + ord(x !! 6) * 4 + ord(x !! 7) * 3 + ord(x !! 8) * 2 + 10 * 1) `mod` 11 /= 0

isbnHelperD :: String -> Bool
isbnHelperD x = (ord(x !! 0) * 10 + ord(x !! 1) * 9 + ord(x !! 2) * 8 + ord(x !! 3) * 7 + ord(x !! 4) * 6 + ord(x !! 5) * 5 + ord(x !! 6) * 4 + ord(x !! 7) * 3 + ord(x !! 8) * 2 + ord(x !! 9) * 1) `mod` 11 == 0

isbnHelperD' :: String -> Bool
isbnHelperD' x = (ord(x !! 0) * 10 + ord(x !! 1) * 9 + ord(x !! 2) * 8 + ord(x !! 3) * 7 + ord(x !! 4) * 6 + ord(x !! 5) * 5 + ord(x !! 6) * 4 + ord(x !! 7) * 3 + ord(x !! 8) * 2 + 10 * 1) `mod` 11 /= 0
