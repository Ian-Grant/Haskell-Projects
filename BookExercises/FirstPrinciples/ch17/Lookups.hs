module Lookups where
import Data.List (elemIndex)
import Control.Applicative

-- 1
added :: Maybe Integer
added = pure (+3) <*> (lookup 3 $ zip [1,2,3] [4,5,6])

-- 2
y :: Maybe Integer
y = lookup 3 $ zip [1,2,3] [4,5,6]
z :: Maybe Integer
z = lookup 2 $ zip [1,2,3] [4,5,6]

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y <*> z

-- 3
a :: Maybe Int
a = elemIndex 3 [1,2,3,4,5]

b :: Maybe Int
b = elemIndex 4 [1,2,3,4,5]

max' :: Int -> Int -> Int
max' = max

maxed :: Maybe Int
maxed = max' <$> a <*> b

-- 4
xs = [1,2,3]
ys = [4,5,6]

c :: Maybe Integer
c = lookup 3 $ zip xs ys

d :: Maybe Integer
d = lookup 2 $ zip xs ys

summed :: Maybe Integer
summed = fmap sum $ (,) <$> c <*> d
