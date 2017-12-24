import Data.List
import System.Random
import Control.Monad (replicateM)
--type def
--takes in generic list and int
--returns IO generic list
rndSelect :: [a] -> Int -> IO [a]
--do monad because multiline
rndSelect list n = do
    --stores standard generator in gen
    gen <- getStdGen
    --makes random from 0 to the length of list - 1
    --takes # of rand # requested
    --from randselection of list
    --rand is pushed into x
    --then x used to get from list
    return $ take n [ list !! x | x <- randomRs (0, (length list) - 1) gen]
