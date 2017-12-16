import Data.List
import System.IO

addThree x y z = x + y + z

whatGrade :: Int -> String
whatGrade age
    | (age >= 5) && (age <= 6) = "Kindergarten"
    | (age > 6) && (age <= 10) = "Elementary School"
    | (age > 10) && (age <= 14) = "Middle School"
    | (age > 14) && (age <= 18) = "High School"
    | otherwise = "Go to college"
batAvgRating:: Double -> Double -> String
batAvgRating hits atBats
    | avg <= 0.200 = "FUCK OFF M8"
    | avg <= 0.250 ="HAVE A QUARTER FUCK OFF m8"
    | avg <= 0.34 = "A THIRD decent"
    | otherwise = "SUP BARRY?"
    where avg = hits / atBats
main = do
    putStrLn "What's your name: "
    name <- getLine
    putStrLn ("Hello " ++ name)
