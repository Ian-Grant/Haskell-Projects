module StdFunc1 where

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr [] = True
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem z (x:xs) = z == x || myElem z xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse x = last x : myReverse (init x)

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs

