module Acronym (abbreviate) where

import Data.Char (toUpper,isUpper,isAlpha)

abbreviate :: String -> String
abbreviate = concatMap treiLetter . words . map repNonAlpha

repNonAlpha :: Char -> Char
repNonAlpha x = if isAlpha x then x else ' '

treiLetter :: String -> String
treiLetter [] = []
treiLetter (x:xs) = toUpper x : rest
  where rest = if all isUpper xs then [] else filter isUpper xs
