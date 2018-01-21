
import Control.Monad
import Test.QuickCheck

data Trivial = Trivial deriving (Eq,Show)
instance Arbitrary Trivial where
  arbitrary = trivialGen

data Identity a = Identity a deriving (Eq, Show)
instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = identityGen

data Pair a b = Pair a b deriving (Eq, Show)
instance (Arbitrary a, Arbitrary b) => Arbitrary (Pair a b) where
  arbitrary = pairGen

data Sum a b = First a | Second b deriving (Eq,Show)

trivialGen :: Gen Trivial
trivialGen = return Trivial

identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
  a <- arbitrary
  return (Identity a)

identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen

pairGen :: (Arbitrary a, Arbitrary b) => Gen (Pair a b)
pairGen = do
  a <- arbitrary
  b <- arbitrary
  return (Pair a b)

pairGenIntString :: Gen (Pair Int String)
pairGenIntString = pairGen

sumGenEqual :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenEqual = do
  a <- arbitrary
  b <- arbitrary
  oneof [return $ First a,
         return $ Second b]

sumGenCharInt :: Gen (Sum Char Int)
sumGenCharInt = sumGenEqual

sumGenFirstPls :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenFirstPls = do
  a <- arbitrary
  b <- arbitrary
  frequency [(10, return $ First a),
             (1, return $ Second b)]

sumGenCharIntFirst :: Gen (Sum Char Int)
sumGenCharIntFirst = sumGenFirstPls
