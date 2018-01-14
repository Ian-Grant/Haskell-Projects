module StringProcessing where

notThe :: String -> Maybe String
notThe "The" = Just "A"
notThe "the" = Just "a"
notThe _ = Nothing

--replaceThe :: String -> String
--replaceThe x = concatmap $ map theCheck wordList
--          wordList = words x
theCheck :: String -> Maybe String
theCheck x = if notThe x == Nothing then Just x else notThe x

vowels = "aeiouAEIOU"

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel = undefined

countVowels :: String -> Int
countVowels [] = 0
countVowels (x:xs) = if elem x vowels then 1 + countVowels xs else countVowels xs

newtype Word' = Word' String deriving (Eq, Show)

mkWord :: String -> Maybe Word'
mkWord x = if countVowels x <= (length x `div` 2) then Just (Word' x) else Nothing

data Nat = Zero | Succ Nat deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger x = 1 + natToInteger x

integerToNat :: Integer -> Maybe Nat
integerToNat 0 = Just Zero
integerToNat x
    | x < 0 = Nothing
    | otherwise = Just $ num x
      where
        num 0 = Zero
        num n = Succ $ num $ n - 1
