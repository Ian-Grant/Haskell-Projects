module Unfold where

myInterate :: (a -> a) -> a -> [a]
myInterate f a = f a : myInterate f (f a)

myUnfoldr :: (b -> Maybe (a,b)) -> b -> [a]
myUnfoldr f b =
  case f b of
    Nothing      -> []
    Just (a, b') -> a : myUnfoldr f b'


-- 3
-- >>> take 10 $ betterIterate (+1) 0
-- [0,1,2,3,4,5,6,7,8,9]
betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\a -> Just (a, f a))
