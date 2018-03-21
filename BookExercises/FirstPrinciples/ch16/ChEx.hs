module ChEx where

{-
 -
import GHC.Arr

---
---- Determine if a valid Functor can be written for the datatype provided.
---

-- #1
-- data Bool = False | True deriving (Eq, Show)
-- No a valid Functor can't be written for this bcause there is
-- no structure to lift or map through only the data itself.

-- #2
    data BoolAndSomethingElse a = False' a | True' a deriving (Eq, Show)
    instance Functor BoolAndSOmethingElse where
            fmap f (False' x) = False' $ f x
            fmap f (True' x) = True' $ f x

-- #3
    data BoolAndMaybeSoemthingElse a = Falsish | Truish a deriving (Eq, Show)
    instance Functor BoolAndMaybeSoemthingElse where
        fmap f (Truish x) = Truish $ f x

-- #4
    newtype Mu f = InF { outF :: f (Mu f) }
--  No because Mu f has kind of (* -> *) -> *

-- #5
    data D = D (Array Word Word) Int Int deriving (Eq, Show)
--  No has kind * instead of * -> *

-- Rearrange the arguments to the type constructor of the datatype so
--  the functor works.
--}
-- #1
-- data Sum a b = First a | Second b
   data Sum b a = First a | Second b deriving (Eq, Show)

   instance Functor (Sum e) where
        fmap f (First a) = First $ f a
        fmap f (Second b) = Second b
-- #2
-- data Company a b c = DeepBlue a c | Something b
   data Company a c b = DeepBlue a c | Something b deriving (Eq, Show)

   instance Functor (Company x y) where
        fmap f (Something b) = Something (f b)
        fmap _ (DeepBlue a c) = DeepBlue a c

-- #3
-- data More a b = L a b a | R b a b deriving (Eq,Show)
   data More b a = L a b a | R b a b deriving (Eq,Show)
   instance Functor (More x) where
        fmap f (L a b a') = L (f a) b (f a')
        fmap f (R b a b') = R b (f a) b'
