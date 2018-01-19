module Main where

import Caeser
import Vigenere
import System.IO


main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Message to encrypt: "
  message <- getLine
  putStr "# of Shifts for Caeser: "
  shift <- getLine
  putStr "Key for Vigenere Cipher: "
  key <- getLine
  putStrLn $ "Caeser Encryption: " ++ caeser (read shift) message
  putStrLn $ "Vigenere Encryption: " ++ vigenere message key
