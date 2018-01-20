module Addition where

import Test.Hspec
import Test.QuickCheck

dividedBy :: Integral a => a -> a -> (a,a)
dividedBy num denom = go num denom 0
  where go n d count
          | n < d = (count, n)
          | otherwise = go (n-d) d (count +1)

myMult :: Integral a => a -> a -> a
myMult x y = mul x y 0
  where
    mul x 0 t = t
    mul x y t = mul x (y - 1) (x + t)

propAdditionalGreater :: Int -> Bool
propAdditionalGreater x = x +1 > x

runQc :: IO ()
runQc = quickCheck propAdditionalGreater

genBool :: Gen Bool
genBool = choose (False, True)

genBool' :: Gen Bool
genBool' = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT,EQ,GT]

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a,b)
genTuple = do
  a <- arbitrary
  b <- arbitrary
  return (a,b)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a,b,c)
genThreeple = do
  a <- arbitrary
  b <- arbitrary
  c <- arbitrary
  return (a,b,c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
  a <- arbitrary
  b <- arbitrary
  elements [Left a, Right b]

genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
  a <- arbitrary
  elements [Nothing, Just a]

genMaybe' :: Arbitrary a => Gen (Maybe a)
genMaybe' = do
  a <- arbitrary
  frequency [ (1, return Nothing), (3, return (Just a))]

genChar :: Gen Char
genChar = elements ['a'..'z']

main :: IO ()
main = hspec $ do
  describe "Addition" $ do
    it "1+1 is greater than 1" $ do
      (1+1) >1 `shouldBe` True
    it "2+2 is equal to 4" $ do
      (2+2) `shouldBe` 4
  describe "DividedBy" $ do
    it "15 divided by 3 is 5" $ do
      dividedBy 15 3 `shouldBe` (5,0)
    it "22 divided by 5 is 4 remainder 2" $ do
      dividedBy 22 5 `shouldBe` (4,2)
  describe "MyMult" $ do
    it "4 Times 5 is 20" $ do
      myMult 4 5 `shouldBe` 20
    it "5 Time 4 is 20" $ do
      myMult 5 4 `shouldBe` 20
  describe "Addition QuickCheck" $ do
    it "x + 1 is always greater than x" $ do
      property $ \x -> x+1 > (x::Int)
    it "x+x is equal to 2x" $ do
      property $ \x -> x+x == (2*x ::Int)
