import Data.List
--type def
--takes in generic list
--int
--and returns generic list
rotate :: (Enum a) => [a] -> Int -> [a]
--cycles list and pass that into drop which drops
--the length of list plus int passed in by used
--that list is then passed into take which takes the length of the original list
--from the list passed in
rotate xs n = take (length xs) $ drop (length xs + n) $ cycle xs
