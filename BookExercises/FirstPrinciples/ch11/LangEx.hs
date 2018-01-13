module LangEx where

import Data.Char (toUpper,isUpper)

capitalWord :: String -> String
capitalWord f@(x:xs) = if isUpper x then f else toUpper x : xs
capitalWord x = x
