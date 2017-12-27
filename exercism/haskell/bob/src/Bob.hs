module Bob (responseFor) where
import Data.Char

responseFor :: String -> String
responseFor xs
    | all isSpace xs = "Fine. Be that way!"
    | last xs == '?' && yell xs = "Calm down, I know what I'm doing!"
    | yell xs = "Whoa, chill out!"
    | last (filter (not . isSpace) xs) == '?' = "Sure."
    | otherwise = "Whatever."

yell :: String -> Bool
yell xs = any isAlpha xs && all isUpper (filter isLetter xs)
