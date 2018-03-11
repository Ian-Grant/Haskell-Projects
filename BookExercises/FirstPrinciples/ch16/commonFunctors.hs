module CommonFunctors where

import Data.Maybe

<<<<<<< HEAD
data Maybe a = Nothing | Just a

replaceWithP = const 'p'
=======
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

>>>>>>> 841ab6b478cbcbc2b411dfe9b826afcd4d65c0d2
