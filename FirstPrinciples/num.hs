module Num1 where

subThenAdd :: Num a => a -> a -> a
subThenAdd x y = (x - y) + 1

divThenAdd :: Fractional a => a -> a -> a
divThenAdd x y = (x/y) + 1
