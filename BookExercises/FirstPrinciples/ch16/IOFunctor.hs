module IOFunctor where

getInt :: IO Int
getInt = fmap read getLine


