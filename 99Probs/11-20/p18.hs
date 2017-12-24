import Data.List

sliceN :: [a] -> Int -> Int -> [a]
sliceN list a b = drop a list ++ (take (b-a) $ drop a list)
