module Main where

import Data.List (sort)
import Test.Hspec
import Test.QuickCheck

half :: Fractional a => a -> a
half x = x / 2
halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

propHalfIdent :: (Eq a, Fractional a) => a -> Bool
propHalfIdent x = halfIdentity x == x

qcHalf :: IO ()
qcHalf = do
      putStrLn "Float"
      quickCheck (propHalfIdent :: Float -> Bool)
      putStrLn "Double"
      quickCheck (propHalfIdent :: Double -> Bool)

listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs = snd $ foldr go (Nothing, True) xs
  where go _ status@(_, False) = status
        go y (Nothing, t) = (Just y, t)
        go y (Just x, t) = (Just y, x>=y)

propListOrdered :: (Ord a) => [a] -> Bool
propListOrdered = listOrdered . sort

qcList :: IO ()
qcList = do
      putStrLn"Int List"
      quickCheck (propListOrdered :: [Int] -> Bool)
      putStrLn"Char List"
      quickCheck (propListOrdered :: [Char] -> Bool)
      putStrLn"String List"
      quickCheck (propListOrdered :: [String] -> Bool)

plusAssociative :: (Eq a,Num a) => a -> a -> a -> Bool
plusAssociative x y z = x + (y + z) == (x + y) + z
plusCommutative :: (Eq a,Num a) => a -> a -> Bool
plusCommutative x y = x + y == y + x

qcAdd :: IO ()
qcAdd = do
      putStrLn "plusAssociative"
      quickCheck (plusAssociative :: Int -> Int -> Int -> Bool)
      putStrLn "plusCommutative"
      quickCheck (plusCommutative :: Int -> Int -> Bool)
      {-
      putStrLn "Float"
      quickCheck (plusCommutative :: Float -> Float -> Bool)
      quickCheck (plusAssociative :: Float -> Float -> Float -> Bool)
      putStrLn "Double"
      quickCheck (plusCommutative :: Double -> Double -> Bool)
      quickCheck (plusAssociative :: Double -> Double -> Double -> Bool)
      -}


mulAssociative :: (Eq a,Num a) => a -> a -> a -> Bool
mulAssociative x y z = x * (y * z) == (x * y) * z
mulCommutative :: (Eq a,Num a) => a -> a -> Bool
mulCommutative x y = x * y == y * x

qcMul :: IO ()
qcMul = do
      putStrLn "mulAssociative"
      quickCheck (mulAssociative :: Int -> Int -> Int -> Bool)
      putStrLn "mulCommutative"
      quickCheck (mulCommutative :: Int -> Int -> Bool)

propQuotRem :: Integral a => a -> a -> Bool
propQuotRem x y = y == 0 || (quot x y)*y + (rem x y) == x
propDivMod :: Integral a => a -> a -> Bool
propDivMod x y = y == 0 || (div x y)*y + (mod x y) == x

qcQuotRem :: IO ()
qcQuotRem = do
        quickCheck (propQuotRem :: Int -> Int -> Bool)
        quickCheck (propQuotRem :: Integer -> Integer -> Bool)
qcDivMod :: IO ()
qcDivMod = do
        quickCheck (propDivMod :: Int -> Int -> Bool)
        quickCheck (propDivMod :: Integer -> Integer -> Bool)

propCarrot :: Integral a => a -> a-> a -> Bool
propCarrot x y z = x == 0 || x < 0 || y < 0 || z < 0 || y ==0 || z ==0
                  || x ^ (y ^ z) == (x ^ y) ^ z

qcCarrot :: IO ()
qcCarrot = do
        quickCheck (propCarrot :: Int -> Int -> Int -> Bool)
        quickCheck (propCarrot :: Int -> Int -> Int -> Bool)

qcReverse :: IO ()
qcReverse = do
          quickCheck (\x -> (reverse . reverse) x == (x::String))
          quickCheck (\x -> (reverse . reverse) x == (x::[Int]))



main :: IO ()
main = do
  putStrLn "QuickCheck Half"
  qcHalf
  putStrLn "QuickCheck Sort"
  qcList
  putStrLn "QuickCheck Add"
  qcAdd
  putStrLn "QuickCheck Mul"
  qcMul
  putStrLn "QuickCheck QuotRem"
  qcQuotRem
  putStrLn "QuickCheck DivMod"
  qcDivMod
  putStrLn "QuickCheck Carrot"
  qcCarrot
  qcReverse
