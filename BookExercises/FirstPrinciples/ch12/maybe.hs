module Maybe where

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing (Just _) = False

mayybee :: b -> (a->b) -> Maybe a -> b
mayybee _ f (Just g) = f g
mayybee x _ Nothing = x

fromMaybe :: a -> Maybe a -> a
fromMaybe _ (Just y) = y
fromMaybe x Nothing = x

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:xs) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (Nothing:xs) = catMaybes xs
catMaybes (Just x:xs) = x : catMaybes xs

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe [] = Just []
flipMaybe (Nothing:_) = Nothing
flipMaybe (Just x:xs) =
  case flipMaybe xs of
    Just ys -> Just (x:ys)
    Nothing -> Nothing
