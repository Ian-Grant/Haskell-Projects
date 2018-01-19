module Person where

import System.IO

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty | AgeTooLow | PersonInvalidUnkown String
  deriving (Eq,Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 =
        Right $ Person name age
  | name == "" = Left NameEmpty
  | age < 0 = Left AgeTooLow
  | otherwise =
      Left $ PersonInvalidUnkown $
        "Name was: " ++ show name ++
        " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  hSetBuffering stdout NoBuffering
  putStr "Name: "
  name <- getLine
  putStr "Age: "
  age <- getLine
  case (mkPerson name (read age)) of
      Right x -> putStrLn $ "YAY! Successfully got a person: " ++ name
      Left y -> putStrLn "NOPE! ERROR!"
