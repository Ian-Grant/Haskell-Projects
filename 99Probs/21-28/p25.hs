import Data.List
import System.Random
import Control.Monad
--p23
rndSelect :: [a] -> Int -> IO [a]
rndSelect list n = do
    gen <- getStdGen
    return $ take n [ list !! x | x <- randomRs (0, (length list) - 1) gen]
--takes generic list
--io generic list returned
rndPermu :: [a] -> IO [a]
--uses rndSelect ot select from list # of length
rndPermu xs = rndSelect xs (length xs)
