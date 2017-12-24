import Data.List
import System.Random
import Control.Monad (replicateM)
---same as p23
rndSelect :: [a] -> Int -> IO [a]
rndSelect list n = do
    gen <- getStdGen
    return $ take n [ list !! x | x <- randomRs (0, (length list) - 1) gen]
--take 2 int returns io list of ints
diffSelect :: Int -> Int -> IO [Int]
diffSelect n m = do
    gen <- getStdGen
    --rand from 1 to m infinite list
    --takes nth elements of it and return it
    return . take n $ randomRs (1,m) gen
