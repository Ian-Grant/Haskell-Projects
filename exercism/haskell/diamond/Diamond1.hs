--module Diamond (diamond) where
import Data.Char

pad :: Int -> String
pad x = replicate x ' '

diamond :: Char -> [String]
diamond x = fst ++ snd
    where
        fst = diamond' x
        snd = reverse . init $ fst

getNum :: Char -> Int
getNum x = ord x - 65

getLet :: Int -> Char
getLet x = ord $ x + 65
