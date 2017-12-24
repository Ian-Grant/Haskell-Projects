import Data.List
import System.Random
import Control.Monad
--takes in int and list
--filters the subsequences of list with length of input
combinations k ns = filter ((k==).length) (subsequences ns)
