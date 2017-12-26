module TopOrLocal where

topLevelFunction :: Integer -> Integer-- Not nessary
topLevelFunction x =
    x + woot + topLevelValue
    where woot :: Integer -- Not nessary
        woot = 10
topLevelValue :: Integer -- Not nessary
topLevelValue = 5
