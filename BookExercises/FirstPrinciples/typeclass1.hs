module TypeClass1 where
--Type constructor no '
--Data constructor has '
data Trivial = Trivial'

instance Eq Trivial where
    Trivial' == Trivial' = True

data DayOfWeek =
    Mon | Tue | Wed | Thu | Fri | Sat | Sun
    deriving (Show, Ord)
data Date =
    Date DayOfWeek Int
    deriving (Show, Ord)

instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _ _ = False

instance Eq Date where
    (==) (Date weekday dayOfMonth)
         (Date weekday' dayOfMonth') =
        weekday == weekday' && dayOfMonth == dayOfMonth'

data Identity a = Identity a

instance Eq a => Eq (Identity a) where
    (==) (Identity v) (Identity v') = v == v'

data TisAnInteger = TisAn Integer

data TwoIntegers = Two Integer Integer

data StringOrInt = TisAnInt Int | TisAnString String
