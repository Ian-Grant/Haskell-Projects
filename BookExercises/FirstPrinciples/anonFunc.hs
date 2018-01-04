-------Anonoymous Functions-------------
--
-- The Following are equivalent --
--
mth x y z = x * y * z
mTh x y = \z -> x * y * z
mtH x = \y -> \z -> x * y * z
mTH = \x -> \y -> \z -> x * y * z

addOne x = x + 1
addOne' = \x -> x + 1

addOneIfOdd = \n -> case odd n of
    True -> f n
    False -> f n
    where f n = n + 1

addFive = \x -> \y -> (if x > y then y else x) + 5

mflip f = \x -> \y -> f y x

mflip' f x y = f y x
