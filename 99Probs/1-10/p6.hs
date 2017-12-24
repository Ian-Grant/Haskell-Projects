--type def
isPala :: (Eq a) => [a] -> Bool
--if input equals reverse of itself return true
isPala xs = xs == (reverse xs)
