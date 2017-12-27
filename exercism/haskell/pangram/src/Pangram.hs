module Pangram (isPangram) where
import Data.Char (toLower)
import Data.List

isPangram :: String -> Bool
isPangram text = all (`elem` map toLower text) ['a'..'z']
