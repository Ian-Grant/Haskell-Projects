module Main where

import qualified Data.ByteString.Lazy as BSL
import qualified Data.Foldable as F
import Data.Csv.Streaming
import Baseball

main :: IO ()
main = do
  summed <- getAtBatsSum "batting.csv"
  putStrLn $ "Total atBats was: " ++ show summed
