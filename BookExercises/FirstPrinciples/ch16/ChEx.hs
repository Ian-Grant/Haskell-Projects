{-# LANGUAGE FlexibleInstances #-}

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

--------------------------------------------------------
--
--Write Functor Instances for Following
--
-- #1
data Quant a b = Finance | Desk a | Bloor b deriving (Eq, Show)
instance Functor (Quant a) where
    fmap _ (Desk a) = Desk a
    fmap f (Bloor b) = Bloor $ f b
    fmap _ Finance = Finance
-- #2
--data K a b = K a deriving (Eq, Show)
instance Functor (K a) where
    fmap _ (K a) = K a
-- #3
newtype Flip f a b = Flip (f b a) deriving (Eq, Show)
newtype K a b = K a deriving (Eq, Show)
instance Functor (Flip K a) where
    fmap f (Flip (K a)) = Flip $ K $ f a

-- #4
data EvilGoateeConst a b = GoatyConst b deriving Show
instance Functor (EvilGoateeConst a) where
    fmap f (GoatyConst b) = GoatyConst $ f b
-- #5
data LiftItOut f a = LiftItOut (f a) deriving Show
instance Functor f => Functor (LiftItOut f) where
    fmap f (LiftItOut g) = LiftItOut $ fmap f g
-- #6
data Parappa f g a = DaWrappa (f a) (g a) deriving Show
instance (Functor f, Functor g) => Functor (Parappa f g) where
    fmap f (DaWrappa g h) = DaWrappa (fmap f g) (fmap f h)
-- #7
data IgnoreOne f g a b = IgnoreSomething (f a) (g b) deriving Show
instance (Functor f,Functor g) => Functor (IgnoreOne f g a) where
    fmap f (IgnoreSomething a b) = IgnoreSomething a (fmap f b)
-- #8
data Notorious g o a t = Notorious (g o) (g a) (g t) deriving Show
instance Functor g => Functor (Notorious g o a) where
    fmap f (Notorious o a t) = (Notorious o a (fmap f t))
-- #9
data List a = Nil | Cons a (List a) deriving Show
instance Functor List where
    fmap f (Cons a b) = Cons (f a) (fmap f b)
    fmap _ Nil = Nil
-- #10
data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a)
                                                 (GoatLord a)
                                                 (GoatLord a) deriving Show
instance Functor GoatLord where
    fmap f (MoreGoats a b c) = MoreGoats (fmap f a) (fmap f b) (fmap f c)
    fmap f (OneGoat a) = OneGoat $ f a
    fmap _ NoGoat = NoGoat
-- #11
data TalkToMe a = Halt | Print String a | Read (String -> a)
instance Functor TalkToMe where
    fmap f (Print a b) = Print a $ f b
    fmap f (Read g) = Read (f . g)
    fmap _ Halt = Halt
