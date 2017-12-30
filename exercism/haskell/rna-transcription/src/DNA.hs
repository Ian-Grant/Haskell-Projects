module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA xs = if checkRNA xs then Just $ map rna xs else Nothing
    where
        rna x
            | x == 'A' = 'U'
            | x == 'T' = 'A'
            | x == 'C' = 'G'
            | x == 'G' = 'C'
checkRNA :: String -> Bool
checkRNA rnaS = check rnaS
    where
        check :: String -> Bool
        check [] = True
        check (x:xs)
            | x == 'A' || x == 'T' || x == 'C' || x == 'G' = check xs
            | otherwise = False
