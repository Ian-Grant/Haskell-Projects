module CommonFunctors where

import Data.Maybe

replaceWithP = const 'p'

--data Maybe a = Nothing | Just a

tossEmOne = fmap (+1) negate
tossEmOne' = (+1) . negate

n = Nothing
w = Just "woohoo"
ave = Just "Ave"
lms = [ave,n,w]
p = replaceWithP
tripmap x = (fmap . fmap . fmap) x

