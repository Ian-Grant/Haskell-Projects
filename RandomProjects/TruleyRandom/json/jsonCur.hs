{-# LANGUAGE DeriveGeneric #-}

import Data.Aeson
import GHC.Generics
import Network.HTTP.Conduit (simpleHttp)
import Data.Text (Text)

-- | Type of conversion, analogous to the JSON data obtainable
--   from the URL.
data Conversion =
  Conversion { to :: !Text
             , rate :: Double
             , from :: !Text
             , v :: Double
               } deriving (Show, Generic)

-- Automatically generated instances

instance FromJSON Conversion
instance ToJSON Conversion

-- | Read the JSON data from the URL of a conversion, decoding it
--   based in the 'Conversion' type.
getConversion :: String -> String -> Double -> IO (Maybe Conversion)
getConversion from to q =
  fmap decode $ simpleHttp $
      "http://rate-exchange.appspot.com/currency?from="
    ++ from ++ "&to=" ++ to ++ "&q=" ++ show q

-- | Convert a monetary value from one currency to another.
convert :: Double -- ^ Initial quantity.
        -> String -- ^ Initial currency.
        -> String -- ^ Target currency.
        -> IO (Maybe Double) -- ^ Result.
convert q from to = fmap (fmap v) $ getConversion from to q

-- | As an example, we show the conversion from euros to dollars.
--   However, feel free to change the initial quantity q and the
--   origin/target currencies.
main :: IO ()
main = do
  let q = 1
  mr <- convert q "EUR" "USD"
  case mr of
   -- In case of error parsing the JSON data, we report it.
   Nothing -> putStrLn "There was an error reading the JSON data."
   -- Otherwise, we show the results in a human-readable way.
   Just r  -> putStrLn $ show q ++ " euro(s) is equivalent to " ++ show r ++ " dollar(s)."
