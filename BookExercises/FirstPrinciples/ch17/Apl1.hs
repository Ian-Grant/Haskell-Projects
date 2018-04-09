module Apl1 where

import Control.Applicative
import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

instance Monoid a => Monoid (ZipList a) where
    mempty = pure mempty
    mappend = liftA2 mappend

instance Arbitrary a => Arbitrary (ZipList a) where
    arbitrary = ZipList <$> arbitrary

instance Eq a => EqProp (ZipList a) where (=-=) = eq
