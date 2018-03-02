module CommonFunctors where

import Data.Maybe

data Maybe a = Nothing | Just a

replaceWithP = const 'p'
