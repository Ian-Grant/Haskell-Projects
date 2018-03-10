module InstancesOfFunc where

import FunctorLaws
import Test.QuickCheck
import Test.QuickCheck.Function
import Data.List

newtype Identity a = Identity a

instance Functor Identity where
    fmap f (Identity x) = Identity (f x)

instance (Arbitrary a) => Arbitrary (Identity a) where
  arbitrary = do
    x <- arbitrary
    return $ Identity x

type IdentityId = Identity Int -> Bool
type IdentityCompose = Fun Int String -> Fun String Double -> Identity Int -> Bool

main = do
  check "Identity" (functorIdentity :: IdentityId) (functorCompose :: IdentityCompose)
