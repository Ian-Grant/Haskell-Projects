import Data.List
rotate :: (Enum a) => [a] -> Int -> [a]
rotate xs n = take (length xs) $ drop (length xs + n) $ cycle xs
