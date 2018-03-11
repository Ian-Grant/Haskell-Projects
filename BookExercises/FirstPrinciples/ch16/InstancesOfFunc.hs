module InstancesOfFunc where

import FunctorLaws
import Test.QuickCheck
import Test.QuickCheck.Function
import Data.List

--
-- 1
--

newtype Identity a = Identity a deriving (Eq, Show)

instance Functor Identity where
  fmap f (Identity x) = Identity $ f x

instance (Arbitrary a) => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

type IdentityId = Identity Int -> Bool
type IdentityCompose = Fun Int String -> Fun String Double -> Identity Int -> Bool

--
-- 2
--

data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
    fmap f (Pair x y) = Pair (f x) (f y)

instance (Arbitrary a) => Arbitrary (Pair a) where
  arbitrary = do
    x <- arbitrary
    return $ Pair x x

type PairId = Pair Int -> Bool
type PairCompose = Fun Int String -> Fun String Double -> Pair Int -> Bool

---
--- 3
---

data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return $ Two x y

type TwoId = Two Int Int -> Bool
type TwoCompose = Fun Int String -> Fun String Double -> Two Int Int -> Bool

--
--- 3
--

data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)
instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return $ Three x y z
type ThreeId = Three Int Int Int -> Bool
type ThreeCompose = Fun Int String -> Fun String Double -> Three Int Int Int -> Bool

--
--- 4
--

data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
    fmap f (Three' a b c) = Three' a (f b) (f c)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return $ Three' x y z

type Three'Id = Three' Int Int -> Bool
type Three'Compose = Fun Int String -> Fun String Double -> Three' Int Int -> Bool

main = do
  check "Identity" (functorIdentity :: IdentityId) (functorCompose :: IdentityCompose)
  check "Pair" (functorIdentity :: PairId) (functorCompose :: PairCompose)
  check "Two" (functorIdentity :: TwoId) (functorCompose :: TwoCompose)
  check "Three" (functorIdentity :: ThreeId) (functorCompose :: ThreeCompose)
  check "Three'" (functorIdentity :: Three'Id) (functorCompose :: Three'Compose)

check functor id compose = do
  printChecking functor
  quickCheck id
  quickCheck compose

printChecking :: String -> IO ()
printChecking functor = do
  putStrLn ""
  putStrLn $ concat ["Checking ", functor, " Functor"]
