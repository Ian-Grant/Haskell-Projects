module CreditCardVal where

val :: Integer -> Bool
val x = sumDigits (doubleEveryOther $ toDigits x) `mod` 10 ==0

toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits x = toDigits (div x 10) ++ [mod x 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x:y:xs) = x*2 : y : doubleEveryOther xs

sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (x:xs)
        | x < 10 = x + sumDigits xs
        | x > 10 = quot x 10 + rem x 10 + sumDigits xs
sumDigits _ = 0



