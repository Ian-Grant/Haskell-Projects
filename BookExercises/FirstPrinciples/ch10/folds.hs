module Folds where

import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq,Ord,Show)

theDataBase :: [DatabaseItem]
theDataBase = [DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
              ,DbNumber 9901, DbString "Hello, World!"
              , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate [] = []
filterDbDate x = [t | (DbDate t) <- x]

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber x = [t | (DbNumber t) <-x]

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb x = sum $ filterDbNumber x

avgDb :: [DatabaseItem] -> Double
avgDb x = fromIntegral (sumDb x) / fromIntegral (length x)

listFoldr :: (a -> b -> b) -> b -> [a] -> b
listFoldr _ z [] = z
listFoldr f z (x:xs) = f x (listFoldr f z xs)

fibs = 1 : scanl (+) 1 fibs
fib20 = take 20 fibs
fibL100 = takeWhile (<100) fibs

--Horrible unsafe version for educational purposes
facU n = last $ take (n+1) $ scanl (*) 1 [1..]
--safe version
fac n = last $ scanl (*) 1 [1..n]
