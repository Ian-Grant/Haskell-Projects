module Palindrome where

import Control.Monad
import Data.Char

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case (clean line1 == (reverse . clean) line1) of
    True -> putStrLn "It's a palindrome!"
    False -> putStrLn "Nope!"
  where
    clean :: String -> String
    clean x = map toLower $ filter isLetter x
