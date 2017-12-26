module RailFenceCipher (encode, decode) where
import Data.Char
import Data.List
import Data.Ord

--Rail Fence Cipher program written in haskell
--Author: Ian Grant
--
--Rail Fence takes a message and a number of rails
--then maps the message along a imaginary fence with that # of rails
--then reading across it gets they crpto text
--
--in code it'll need to divide the message up into diffrent lists
--then cat all the lists together for the output
--it'll need to keep track of it's location in the message to know
--wether or not to go up or down the fence
----------------2nd Iteration--------------------------

cleanify :: String -> String
cleanify = map toUpper . filter isLetter

--makes rail fence pattern
fence r = cycle ([0..r-2] ++ [r-1,r-2..1])

helper x = map fst $ sortBy (comparing snd) x

encode :: Int -> String -> String
encode rails mess = helper $ zip (cleanify mess) (fence rails)

decodeHelper cryptoLength rails = helper $ zip [0..cryptoLength-1] $ fence rails

decode :: Int -> String -> String
decode rails mess = helper $ zip mess (decodeHelper (length mess) rails)
-----------------1st Iteration--------------------------

cleanifyV1 :: String -> String
cleanifyV1 = map toUpper . filter isLetter

--makes rail fence pattern
fenceV1 r = cycle ([0..r-2] ++ [r-1,r-2..1])


encodeV1 :: Int -> String -> String
encodeV1 rails mess = map fst $ sortBy (comparing snd) $ zip (cleanify mess) (fence rails)

decodeMapV1 cryptoLength rails = map fst $ sortBy (comparing snd) $ zip [0..cryptoLength-1] $ fence rails

decodeV1 :: Int -> String -> String
decodeV1 rails mess = map fst $ sortBy (comparing snd) $ zip mess (decodeMapV1 (length mess) rails)
