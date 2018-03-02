module Functors1 where

data FixMePls = FixMe | Pls deriving (Eq, Show)

instance Functor FixMePls where
    fmap = error "Won't compile cuz it's got no input into constructor."
