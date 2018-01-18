module Lib (someFunc) where


import Network.HTTP.Conduit
import qualified Data.ByteString.Lazy.Char8 as L

someFunc :: IO ()
someFunc = do
    lbs <- simpleHttp "https://raw.githubusercontent.com/commercialhaskell/stack/master/README.md"
    L.putStrLn lbs
