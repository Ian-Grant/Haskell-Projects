-- TOTAL marks:    /66

module Exercises where

import Prelude hiding (sum, length, map, filter, maximum, reverse, succ, pred)

-- BEGIN Helper functions and data types

-- The custom list type
data List t = Nil | Cons t (List t) deriving Eq

instance (Show t) => Show (List t) where
  show = show . toList
    where
    toList Nil = []
    toList (Cons h t) = h : toList t

-- the custom numeric type
data Natural = Zero | Succ Natural deriving Eq
one = Succ Zero
two = Succ one
three = Succ two

instance Show Natural where
  show = show . toInt
    where
    toInt Zero = 0
    toInt (Succ x) = 1 + toInt x

-- functions over Natural that you may consider using
succ :: Natural -> Natural
succ = Succ

pred :: Natural -> Natural
pred Zero = error "bzzt. Zero has no predecessor in naturals"
pred (Succ x) = x

-- functions over List that you may consider using
foldRight :: (a -> b -> b) -> b -> List a -> b
foldRight _ b Nil = b
foldRight f b (Cons h t) = f h (foldRight f b t)

foldLeft :: (b -> a -> b) -> b -> List a -> b
foldLeft _ b Nil = b
foldLeft f b (Cons h t) = let b' = f b h in b' `seq` foldLeft f b' t

reduceRight :: (a -> a -> a) -> List a -> a
reduceRight _ Nil = error "bzzt. reduceRight on empty list"
reduceRight f (Cons h t) = foldRight f h t

reduceLeft :: (a -> a -> a) -> List a -> a
reduceLeft _ Nil = error "bzzt. reduceLeft on empty list"
reduceLeft f (Cons h t) = foldLeft f h t

-- END Helper functions and data types

-- BEGIN Exercises

-- Exercise 1
-- Relative Difficulty: 1
-- Correctness: 2.0 marks
-- Performance: 0.5 mark
-- Elegance: 0.5 marks
-- Total: 3
add :: Natural -> Natural -> Natural
add a b = Succ b

-- Exercise 2
-- Relative Difficulty: 2
-- Correctness: 2.5 marks
-- Performance: 1 mark
-- Elegance: 0.5 marks
-- Total: 4
sum :: List Int -> Int
sum Nil = 0
sum (Cons x (Nil)) = x
sum (Cons x (xs)) = x + sum xs

-- Exercise 3
-- Relative Difficulty: 2
-- Correctness: 2.5 marks
-- Performance: 1 mark
-- Elegance: 0.5 marks
-- Total: 4
length :: List a -> Int
length Nil = 0
length (Cons x xs) = 1 + length xs

-- Exercise 4
-- Relative Difficulty: 5
-- Correctness: 4.5 marks
-- Performance: 1.0 mark
-- Elegance: 1.5 marks
-- Total: 7
map :: (a -> b) -> List a -> List b
map = error "TODO"
--map _ _ Nil = Nil
--map _ Nil _ = Nil
--map f (Cons x xs) (Cons y ys) = (Cons(f x y) map f xs ys)


-- Exercise 5
-- Relative Difficulty: 5
-- Correctness: 4.5 marks
-- Performance: 1.5 marks
-- Elegance: 1 mark
-- Total: 7
filter :: (a -> Bool) -> List a -> List a
filter = error "todo"

-- Exercise 6
-- Relative Difficulty: 5
-- Correctness: 4.5 marks
-- Performance: 1.5 marks
-- Elegance: 1 mark
-- Total: 7
append :: List a -> List a -> List a
append = error "todo"

-- Exercise 7
-- Relative Difficulty: 5
-- Correctness: 4.5 marks
-- Performance: 1.5 marks
-- Elegance: 1 mark
-- Total: 7
flatten :: List (List a) -> List a
flatten = error "todo"

-- Exercise 8
-- Relative Difficulty: 7
-- Correctness: 5.0 marks
-- Performance: 1.5 marks
-- Elegance: 1.5 mark
-- Total: 8
flatMap :: List a -> (a -> List b) -> List b
flatMap = error "todo"

-- Exercise 9
-- Relative Difficulty: 8
-- Correctness: 3.5 marks
-- Performance: 3.0 marks
-- Elegance: 2.5 marks
-- Total: 9
maximum :: List Int -> Int
maximum = error "todo"

-- Exercise 10
-- Relative Difficulty: 10
-- Correctness: 5.0 marks
-- Performance: 2.5 marks
-- Elegance: 2.5 marks
-- Total: 10
reverse :: List a -> List a
reverse = error "todo"

-- END Exercises

-- BEGIN Tests for Exercises

main :: IO ()
main =
  let showNil = show (Nil :: List Int)
      results =
        [
        -- add
        ("add",
         show (add one two)
       , show three),

        ("add",
         show (add Zero two)
       , show two),

        -- sum
        ("sum",
         show (sum (Cons 1 (Cons 2 (Cons 3 Nil))))
       , show 6),

        ("sum",
         show (sum Nil)
       , show 0),

        -- length
        ("length",
         show (length (Cons 'a' (Cons 'b' (Cons 'c' Nil))))
       , show 3),

        ("length",
         show (length Nil)
       , show 0),

        -- map
        ("map",
         show (map (+1) (Cons 1 (Cons 2 (Cons 3 Nil))))
       , show (Cons 2 (Cons 3 (Cons 4 Nil)))),

        ("map",
         show (map (+1) Nil)
       , showNil),

        -- filter
        ("filter",
         show (filter even (Cons 1 (Cons 2 (Cons 3 Nil))))
       , show (Cons 2 Nil)),

        ("filter",
         show (filter even Nil)
       , showNil),

        -- append
        ("append",
         show (append (Cons 1 (Cons 2 (Cons 3 Nil))) (Cons 4 Nil))
       , show (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))),

        ("append",
         show (append (Cons 1 (Cons 2 (Cons 3 Nil))) Nil)
       , show (Cons 1 (Cons 2 (Cons 3 Nil)))),

        -- flatten
        ("flatten",
         show (flatten (Cons (Cons 1 (Cons 2 Nil)) (Cons (Cons 3 (Cons 4 Nil)) Nil)))
       , show (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))),

        -- flatMap
        ("flatMap",
         show (flatMap (Cons 1 (Cons 2 (Cons 3 Nil))) (\n -> Cons (n+1) (Cons (n+2) Nil)))
       , show (Cons 2 (Cons 3 (Cons 3 (Cons 4 (Cons 4 (Cons 5 Nil))))))),

        -- maximum
        ("maximum",
         show (maximum (Cons 3 (Cons 1 (Cons 2 Nil))))
       , show 3),

        -- reverse
        ("reverse",
         show (reverse (Cons 1 (Cons 2 (Cons 3 Nil))))
       , show (Cons 3 (Cons 2 (Cons 1 Nil))))
        ]
      check (n, a, b) = do print ("=== " ++ n ++ " ===")
                           print (if a == b then "PASS" else "FAIL Expected: " ++ b ++ " Actual: " ++ a)

  in mapM_ check results

-- END Tests for Exercises
