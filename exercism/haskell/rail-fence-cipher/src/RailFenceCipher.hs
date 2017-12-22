module RailFenceCipher (encode, decode) where

encode :: Int -> String -> String
encode rails mess
        | rails > ((length mess) -1) = error "You can't have more Rails than the length of the message -1"
        |



decode :: Int -> String -> String
decode = error "You need to implement this function!"
