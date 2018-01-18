module Caeser where

import System.IO

caeser :: Int -> String -> String
caeser num str
    | num > 0  = caeser (num - 1) (map shiftF str)
    | num < 0  = caeser (num + 1) (map shiftB str)
    | num == 0 = str
    | otherwise = "How'd you get here?"

shiftF :: Char -> Char
shiftF 'z' = 'a'
shiftF 'Z' = 'A'
shiftF c   = succ c

shiftB :: Char -> Char
shiftB 'a' = 'z'
shiftB 'A' = 'Z'
shiftB c   = pred c

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  putStr "Enter Message: "
  mess <- getLine
  putStrLn $ "Encrypted Message: " ++ (caeser 12 mess)

