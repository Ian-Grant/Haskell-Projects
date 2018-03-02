module Functors2 where

data FixMePls a = FixMe | Pls a deriving (Eq, Show)

instance Functor FixMePls where
    fmap = error "This actually compiles cool!"
