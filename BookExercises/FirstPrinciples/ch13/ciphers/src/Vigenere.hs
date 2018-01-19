module Vigenere where

import Data.Char (isUpper,ord,chr,isLetter)
import System.IO

shift :: Char -> Char
shift 'z' = 'a'
shift 'Z' = 'A'
shift c = if isLetter c then succ c else c

vigenere :: String -> String -> String
vigenere "" _ = ""
vigenere mess key = zipWith vig mess numShift
    where
        vig m k = if isLetter m then iterate shift m !! k else m
        numShift = map (capCheck . ord) key
        capCheck x
            --lowercase
            | x < 91 && x > 64 = x `rem` 65
            --uppercase
            | x > 96 && x < 123 = x `rem` 97
            --space
            | x == 32 = 32
            --non alpha charecters
            | otherwise = error "Not a letter"
{-
main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStr "Enter your message: "
    mess <- getLine
    putStrLn ""
    putStr "Enter key: "
    key <- getLine
    putStrLn $ "Encrypted message: " ++ (vigenere mess key)
    -}
