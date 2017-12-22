-- This function should print a single digit number as English text, or "unknown" if it's out of the range 0-9
englishDigit :: Int -> String
englishDigit x = if x > 0 && x < 9 then show x else "unknown"

-- given a tuple, divide fst by snd, using pattern matching.
-- it should return undefined for division by zero
divTuple :: (Eq a, Fractional a) => (a, a) -> a
divTuple (x, y)
    | y ==0 = undefined
    | y /=0 = x / y

-- if the first three numbers in a list are all zero, return True
threeZeroList :: [Int] -> Bool
threeZeroList (0:0:0:_) = True
threeZeroList _ = False
