module Phone where
import Data.Char (isUpper, toUpper, isLower, toLower)
import Data.List (elem, find)

type Digit = Char
type Presses = Int

data Button = Button Digit String
newtype DaPhone = DaPhone [Button]

phone :: DaPhone
phone = DaPhone
  [ Button '1' "",     Button '2' "abc", Button '3' "def"
  , Button '4' "ghi",  Button '5' "jkl", Button '6' "mno"
  , Button '7' "pqrs", Button '8' "tuv", Button '9' "wxyz"
  , Button '*' "",     Button '0' " ",   Button '#' "."]

convo :: [String]
convo =
  [ "Wanna play 20 questions"
  , "Ya"
  , "U 1st haha"
  , "Lol ok. Have u ever tasted alcohol lol"
  , "Lol ya"
  , "Wow ur cool haha. Ur turn"
  , "Ok. Do u think I am pretty Lol"
  , "Lol ya"
  , "Haha thanks just making sure rofl ur turn"]

validDigits :: String
validDigits = ['0'..'9'] ++ "*#"

validLetters :: String
validLetters = ['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'] ++ " ."

isValidDigit :: Char -> Bool
isValidDigit x = elem x validDigits

isValidLetter :: Char -> Bool
isValidLetter x = elem x validLetters

reverseTaps :: DaPhone -> Char -> [(Digit,Presses)]
reverseTaps = undefined

cellPhonesDead :: DaPhone -> String -> [(Digit,Presses)]
cellPhonesDead = undefined

fingerTaps :: [(Digit,Presses)] -> Presses
fingerTaps = undefined

mostPopularLetter :: String -> Char
mostPopularLetter = undefined

coolestLetter :: [String] -> Char
coolestLetter = undefined

coolestWord :: [String] -> String
coolestWord = undefined

