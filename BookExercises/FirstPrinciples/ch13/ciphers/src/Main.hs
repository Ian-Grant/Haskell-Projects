module Main where

import Caeser
import Vigenere
import System.IO

{-
main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Message to encrypt: "
  message <- getLine
  c <- caeser message
  v <- vigenere message
  putStrLn $ "Caeser Encryption: " ++ c
  putStrLn $ "Vigenere Encryption: " ++ v
  -}
main :: IO ()
main = putStrLn "Hello, World!"
