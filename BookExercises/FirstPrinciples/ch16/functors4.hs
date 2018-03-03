module Functor4 where

data WhoCares a = ItDoesnt | Matter a | WhatThisIsCalled deriving (Eq, Show)

instance Functor WhoCares where
    fmap _ ItDoesnt = ItDoesnt
    fmap _ WhatThisIsCalled = WhatThisIsCalled
    fmap f (Matter a) = Matter (f a)
