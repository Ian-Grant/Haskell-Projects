module SquareCube where
import Data.List
import Data.Bool

mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]

sct = [ (x,y) | x <- mySqr, y <- myCube]
sct50 = [ (x,y) | x <- mySqr, y <- myCube, x < 50, y < 50]

mystery :: [Char] -> [Bool]
mystery xs = map (\x -> elem x "aeiou") xs

fb = map (\x -> bool (-x) x (3 == x)) [1..10]
