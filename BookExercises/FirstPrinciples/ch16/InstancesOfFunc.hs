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
--- 4
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
--- 5
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

--
--- 6
--

data Four a b c d = Four a b c d deriving (Eq, Show)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)
instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = do
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    a <- arbitrary
    return $ Four x y z a

type FourId = Four Int Int Int Int -> Bool
type FourCompose = Fun Int String -> Fun String Double -> Four Int Int Int Int -> Bool

--
--- 7
--

data Four' a b = Four' a a a b deriving (Eq, Show)

instance Functor (Four' a) where
    fmap f (Four' a b c d) = Four' a b c (f d)
instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
    arbitrary = do
    x <- arbitrary
    y <- arbitrary
    z <- arbitrary
    a <- arbitrary
    return $ Four' x y z a

type Four'Id = Four' Int Int -> Bool
type Four'Compose = Fun Int String -> Fun String Double -> Four' Int Int -> Bool

--
--- 8
--

--Can't implement cuz no data to modify only a structure.
-- It's kind is *
-- Functors need the kind to be * -> *

main = do
  check "Identity" (functorIdentity :: IdentityId) (functorCompose :: IdentityCompose)
  check "Pair" (functorIdentity :: PairId) (functorCompose :: PairCompose)
  check "Two" (functorIdentity :: TwoId) (functorCompose :: TwoCompose)
  check "Three" (functorIdentity :: ThreeId) (functorCompose :: ThreeCompose)
  check "Three'" (functorIdentity :: Three'Id) (functorCompose :: Three'Compose)
  check "Four" (functorIdentity :: FourId) (functorCompose :: FourCompose)
  check "Four'" (functorIdentity :: Four'Id) (functorCompose :: Four'Compose)

check functor id compose = do
  printChecking functor
  quickCheck id
  quickCheck compose

printChecking :: String -> IO ()
printChecking functor = do
  putStrLn ""
  putStrLn $ "Checking " ++ functor ++ " Functor"
