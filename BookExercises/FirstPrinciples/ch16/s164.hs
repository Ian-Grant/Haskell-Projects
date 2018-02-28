module s164 where

class Sumthin a where
    s :: a -> a -- the arg and result are both a. ∴ a has kind *
class Else where
    e :: b -> f (g a b c)
         -- b like a in Sumthin is arg to (->) ∴ has kind *
         -- f is outermost type constructor for 2nd arg which resulitng kind is *
            -- It takes a single arg the type (g a b c) as input ∴ f has kind * -> *
         -- g is applied to the 3 args a b c has kind of * -> * -> * -> *
         --     cuz it takes in 3 inputs of kind * and has to return kind * to f
         --         so f can take that kind and return a kind of * so end result
         --         of whole is * -> *
class Biffy where
    slayer :: e a b
            -- takes in datatype e wrapped around a&b
            --  e has type * -> * -> * cuz it takes in 2 inputs and outs a *
            -> (a -> c)
            -- function that takes in a and returns c
            -- aka its kind is also * -> *
            -> (b -> d)
            -- function that takes in b and returns d
            -- aka its kind is also * -> *
            -> e c d
            -- e now contains c and d instead of a and b
            --
