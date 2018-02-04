module DNA (nucleotideCounts) where

import Data.Map (Map)
import qualified Data.Map as Map

valLet = "ACGT"

emptyCount :: Map Char Int
emptyCount = Map.fromList [('A', 0) , ('C', 0) , ('G', 0) , ('T', 0)]

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts = foldr countLet $ Right emptyCount

countLet :: Char -> Either String (Map Char Int) -> Either String (Map Char Int)
countLet _ (Left s) = Left s
countLet ch (Right nucMap)
                | check == True = Right $ Map.insertWith (+) ch 1 nucMap
                | otherwise = Left $ "ERROR: Wrong Char: " ++ [ch]
                where check = elem ch valLet
