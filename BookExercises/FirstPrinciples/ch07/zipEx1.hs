module Zip1 where

mul3 = filter (\x -> mod x 3 == 0) [1..30]

myzip :: [a] -> [b] -> [(a,b)]
myzip [] _ = []
myzip _ [] = []
myzip (x:xs) (y:ys) = (x,y) : zip xs ys

myzipwith :: (a -> b -> c) -> [a] -> [b] -> [c]
myzipwith _ [] _ = []
myzipwith _ _ [] = []
myzipwith f (x:xs) (y:ys) = f x y : myzipwith f xs ys
