--type def list to list of tuple(int,generic type)
encode' :: Eq a => [a] -> [(Int,a)]
--fold helper right into empty list
encode' = foldr helper []
    where
        helper x [] = [(1,x)] --data and empty lilst
        helper x (y@(a,b):ys) --if not empty list
            | x == b    = (1+a,x):ys --checks if data is repeatd if so inc conter
            | otherwise = (1,x):y:ys --otherwise cat current turple with res of list
--type def
encodeDirect :: Eq a => [a] -> [ListItem a]
--maps eh into result of encode
encodeDirect = map encodeHelper . encode'
    where
        encodeHelper (1,x) = Single x --if turple only has 1 it's a single
        encodeHelper (n,x) = Multiple n x --else it has more than it's a multiple
