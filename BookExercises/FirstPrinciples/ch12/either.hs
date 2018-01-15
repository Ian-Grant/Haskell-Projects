module Either where

lefts' :: [Either a b] -> [a]
lefts' = foldr left []
      where
        left (Left x) xs = x:xs
        left (Right _) xs = xs

rights' :: [Either a b] -> [b]
rights' = foldr right []
        where
          right (Right x) xs = x:xs
          right (Left _) xs = xs

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr tup ([],[])
                  where
                    tup (Left x) (xs,ys) = (x:xs,ys)
                    tup (Right y) (xs,ys) = (xs,y:ys)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right x) = Just $ f x

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' lf _ (Left x) = lf x
either' _ rf (Right x) = rf x

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (const Nothing) (Just . f)
