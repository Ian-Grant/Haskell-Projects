{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}
module Goats where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany String where
  tooMany n = n > "42"

instance TooMany (Int,Int) where
  tooMany (x,y) = x+y > 42

instance (Num a, TooMany a) => TooMany (a,a) where
  tooMany (x,y) = tooMany $ x+y

newtype Goats = Goats Int deriving (Eq,Show,TooMany)
