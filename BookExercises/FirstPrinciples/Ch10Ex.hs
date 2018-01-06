module Ch10Ex where

stops = "pdtdkg"
vowels = "aeuou"

a = [(x,y,z) | x <- stops, y <- vowels, z <- stops]

b = [(x,y,z) | x <- stops, y <- vowels, z <- stops,x=='p']

noun = ["dog","cat","person","house"]
verb = ["ran","caught","helped","fought"]
sen = [(x,y,z) | x <- noun, y <- verb, z <- noun]

--avg word length
seekritFunc x = div (sum (map length (words x))) (length (words x))

seekritFuncv2 x = fromIntegral (sum (map length (words x))) / fromIntegral (length (words x))

myAnd :: [Bool] -> Bool
myAnd = foldr (&&) True

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False

myElem :: Eq a => a -> [a] -> Bool
myElem x = foldr ((||) . (==x)) False

myElemA :: Eq a => a -> [a] -> Bool
myElemA x = any (==x)

myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x y -> if f x then x:y else y) []

squish :: [[a]] -> [a]
squish = foldr (\x y -> x++y) []

squishMap :: (a -> [b]) -> [a] -> [b]
--squishMap f = foldr (\a b -> foldr (:) b (f a)) []
squishMap f = foldr ((++) . f) []

--Start Cond: (last xs) the starting value of the fold
--Input: xs
--Lambda function takes in a comparision function and checks which is bigger
myMaxBy :: (a -> a -> Ordering) -> [a] -> a
myMaxBy f xs = foldr (\a b -> if f a b == GT then a else b) (last xs) xs

myMinBy :: (a -> a -> Ordering) -> [a] -> a
myMinBy f xs = foldr (\a b -> if f a b == LT then a else b) (last xs) xs
