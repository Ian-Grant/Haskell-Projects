module StringProcessing where

notThe :: String -> Maybe String
notThe "The" = Just "A"
notThe "the" = Just "a"
notThe x = Just x

--replaceThe :: String -> String
--replaceThe x = concat $ map notThe
--        wordList = words x
