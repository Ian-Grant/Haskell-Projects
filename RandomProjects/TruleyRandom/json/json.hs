module JsonTut where

import Data.Aeson
import qualified Data.ByteString.Lazy as B
import Network.HTTP.Conduit (simpleHttp)

data Person =
      Person { firstName :: !Text
             , lastName :: !Text
             , age :: Int
             , likesPizza :: Bool
      } deriving Show

jsonURL :: String
jsonURL = "http://daniel-diaz.github.io/misc/pizza.json"

getJson :: IO B.ByteString
getJson = simpleHttp jsonURL
