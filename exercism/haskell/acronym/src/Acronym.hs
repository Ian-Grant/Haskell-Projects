module Acronym (abbreviate) where

import Data.Char (toUpper)

abbreviate :: String -> String
abbreviate xs = map (toUpper . head) $ words xs
