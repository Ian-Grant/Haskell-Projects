module Cow where

import Control.Applicative

data Cow = Cow { name :: String, age :: Int, weight :: Int } deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty "" = Nothing
noEmpty str = Just str

noNeg :: Int -> Maybe Int
noNeg n | n >= 0 = Just n
        | otherwise = Nothing

cowFromString :: String -> Int -> Int -> Maybe Cow
cowFromString name' age' weight' = case noEmpty name' of
                                    Nothing -> Nothing
                                    Just name ->
                                        case noNeg age' of
                                            Nothing -> Nothing
                                            Just age ->
                                                case noNeg weight' of
                                                    Nothing -> Nothing
                                                    Just weight ->
                                                        Just (Cow name age weight)
cowFromString' :: String -> Int -> Int -> Maybe Cow
cowFromString' name age weight = Cow <$> noEmpty name <*> noNeg age <*> noNeg weight

cowFromString'' :: String -> Int -> Int -> Maybe Cow
cowFromString'' name age weight = liftA3 Cow (noEmpty name) (noNeg age) (noNeg weight)
