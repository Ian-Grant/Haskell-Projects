module School (School, add, empty, grade, sorted) where

import Data.List

data School = School [(Int, [String])] deriving (Eq,Show)

add :: Int -> String -> School -> School
add gradeNum student school = undefined

empty :: School
empty = (School [(0,[])])

grade :: Int -> School -> [String]
grade gradeNum school = map snd grades
                            where grades = school !! gradeNum

sorted :: School -> [(Int, [String])]
sorted school = error "You need to implement this function."
