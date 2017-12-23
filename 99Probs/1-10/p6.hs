isPala :: (Eq a) => [a] -> Bool
isPala xs = xs == (reverse xs)
