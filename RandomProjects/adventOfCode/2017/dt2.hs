module Main(main) where

import Text.Parsec
import Text.ParserCombinators.Parsec.Number


main :: IO ()
main = do
        text <- readFile "data/advent02.txt"
        let sheet = successfulParse $ parseFile text
        print $ part1 sheet
        print $ part2 sheet


part1 :: [[Int]] -> Int
part1 = sum . map p1cSum

part2 :: [[Int]] -> Int
part2 = sum . map p2cSum


p1cSum :: [Int] -> Int
p1cSum row = (maximum row) - (minimum row)

p2cSum :: [Int] -> Int
p2cSum digits = sum [a `div` b | a <- digits, b <- digits, a /= b, a `mod` b == 0]

