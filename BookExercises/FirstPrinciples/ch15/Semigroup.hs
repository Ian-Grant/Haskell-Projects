module Semigroup where

import Test.QuickCheck
import Test.QuickCheck.Gen
import Control.Monad
import Data.Semigroup (Semigroup, (<>), Sum(Sum, getSum))
import MonoidProperties

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c))  == ((a <> b) <> c)

-- #1
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = Trivial

instance Arbitrary Trivial where
    arbitrary = return Trivial

type TrivialAssoc = Trivial -> Trivial -> Trivial -> Bool

-- #2
newtype Identity a = Identity a deriving (Eq, Show)

instance (Semigroup a) => Semigroup (Identity a) where
    (Identity x) <> (Identity y) = Identity(x <> y)

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = do
        x <- arbitrary
        return (Identity x)

type IdentityAssoc = Identity String -> Identity String -> Identity String -> Bool

-- #3
data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a,Semigroup b) => Semigroup (Two a b) where
    (Two x y) <> (Two z a) = (Two (x <> z) (y <> a))
instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return (Two x y)

type TwoAssoc = Two String String -> Two String String -> Two String String -> Bool

-- #4

data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup (Three a b c) where
    (Three x y z) <> (Three g h i) = (Three (x <> g) (y <> h) (z <> i))

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        return (Three a b c)

type ThreeAssoc = Three String String String -> Three String String String
                -> Three String String String -> Bool
-- #5
data Four a b c d = Four a b c d deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d) => Semigroup (Four a b c d) where
    (Four w x y z) <> (Four f g h i) = (Four (w <> f) (x <> g) (y <> h) (z <> i))
instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return (Four a b c d)

type FourAssoc = Four String String String String -> Four String String String String
               -> Four String String String String -> Bool
-- #6
newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
    (BoolConj x) <> (BoolConj y) = BoolConj $ x && y
instance Arbitrary BoolConj where
    arbitrary = do
        x <- arbitrary
        return (BoolConj x)

type BoolConjAssoc = BoolConj -> BoolConj -> BoolConj -> Bool
-- #7
newtype BoolDisj = BoolDisj Bool deriving (Eq, Show)

instance Semigroup BoolDisj where
    (BoolDisj x) <> (BoolDisj y) = BoolDisj $ x || y

instance Arbitrary BoolDisj where
    arbitrary = do
        x <- arbitrary
        return (BoolDisj x)
type BoolDisjAssoc = BoolDisj -> BoolDisj -> BoolDisj -> Bool

-- #8
data Or a b = Fst a | Snd b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Or a b) where
    Fst _ <> Snd y = Snd y
    Fst _ <> Fst y = Fst y
    Snd x <> Fst _ = Snd x
    Snd x <> Snd _ = Snd x
instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        elements [Fst x, Snd y]
type OrAssoc = Or String String -> Or String String -> Or String String -> Bool
-- #9
newtype Combine a b = Combine {  unCombine :: (a -> b) }

instance (Semigroup b) => Semigroup (Combine a b) where
    (Combine x) <> (Combine y) = Combine (x <> y)

instance (CoArbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
    arbitrary = do
        x <- arbitrary
        return $ Combine x

type CombineAssoc = Combine Int String -> Combine Int String -> Combine Int String -> Bool

-- #10
newtype Comp a = Comp { unComp :: (a -> a) }

instance (Semigroup a) => Semigroup (Comp a) where
    (Comp x) <> (Comp y) = Comp $ x . y
instance (CoArbitrary a, Arbitrary a) => Arbitrary (Comp a) where
    arbitrary = do
        x <- arbitrary
        return $ Comp x
-- # 11
data Validation a b = Failuree a | Successs b deriving (Eq, Show)
instance Semigroup a => Semigroup (Validation a b) where
    (Successs x) <> _ = Successs x
    (Failuree _) <> (Successs x) = Successs x
    (Failuree x) <> (Failuree y) = Failuree (x <> y)
-------------------------------------------------
--MONOIDS
-------------------------------------------------

-- #1
instance Monoid Trivial where
    mempty = Trivial
    mappend = (<>)
-- #2
instance (Monoid a, Semigroup a) => Monoid (Identity a) where
    mempty = Identity mempty
    mappend = (<>)
-- #3
instance (Monoid a, Semigroup a, Monoid b, Semigroup b) => Monoid (Two a b) where
    mempty = Two mempty mempty
    mappend = (<>)
instance (Monoid a, Semigroup a, Monoid b, Semigroup b, Monoid c, Semigroup c) => Monoid (Three a b c) where
    mempty = Three mempty mempty mempty
    mappend = (<>)
instance (Monoid a, Semigroup a, Monoid b, Semigroup b, Monoid c, Semigroup c, Monoid d, Semigroup d) => Monoid (Four a b c d) where
    mempty = Four mempty mempty mempty mempty
    mappend = (<>)
-- #4
instance Monoid BoolConj where
    mempty = BoolConj True
    mappend = (<>)
-- #5
instance Monoid BoolDisj where
    mempty = BoolDisj False
    mappend = (<>)
-- #6
instance (Monoid b, Semigroup b) => Monoid (Combine a b) where
    mempty = Combine $ const mempty
    mappend = (<>)
-- #7
instance (Semigroup a) => Monoid (Comp a) where
    mempty = Comp id
    mappend = (<>)
-- #8
newtype Mem s a = Mem {runMem :: s -> (a,s)}

instance Semigroup a => Semigroup (Mem s a) where
    (Mem f) <> (Mem g) = Mem $ \s -> let (a, s') = f s
                                         (a', s'') = g s'
                                         in (a <> a', s'')

instance (Semigroup a, Monoid a) => Monoid (Mem s a) where
    mempty = Mem (\x -> (mempty, x))
    mappend = (<>)

f2 :: Mem Integer String
f2 = Mem $ \s -> ("hi", s + 1)

mainMem :: IO ()
mainMem = do
  print $ runMem (f2 <> mempty) 0
  print $ runMem (mempty <> f2) 0
  print (runMem mempty 0 :: (String, Int))
  print $ runMem (f2 <> mempty) 0 == runMem f2 0
  print $ runMem (mempty <> f2) 0 == runMem f2 0
-- Testing
main :: IO ()
main = do
    --SEMIGROUPS
    putStrLn "Testing Semigroups"
    putStrLn "------------------"
    putStrLn "Testing TrivialAssoc"
    quickCheck (semigroupAssoc :: TrivialAssoc)
    putStrLn "Testing Identity"
    quickCheck (semigroupAssoc :: IdentityAssoc)
    putStrLn "Testing Two"
    quickCheck (semigroupAssoc :: TwoAssoc)
    putStrLn "Testing Three"
    quickCheck (semigroupAssoc :: ThreeAssoc)
    putStrLn "Testing Four"
    quickCheck (semigroupAssoc :: FourAssoc)
    putStrLn "Testing BoolConj"
    quickCheck (semigroupAssoc :: BoolConjAssoc)
    putStrLn "Testing BoolDisj"
    quickCheck (semigroupAssoc :: BoolDisjAssoc)
    putStrLn "Testing Or"
    quickCheck (semigroupAssoc :: OrAssoc)
    --putStrLn "Testing Combine"
    --quickCheck (semigroupAssoc :: CombineAssoc)
    let failure :: String -> Validation String Int
        failure = Failuree
        success :: Int -> Validation String Int
        success = Successs
    print $ success 1 <> failure "Blah"
    print $ failure "Whot" <> failure "blah"
    print $ success 1 <> success 2
    print $ failure "whoot" <> success 1
    putStrLn "\n"
    --MONOIDS
    putStrLn "Testing Monoids"
    putStrLn "---------------"
    putStrLn "Testing Trivial"
    quickCheck (semigroupAssoc :: TrivialAssoc)
    quickCheck (monoidRightIdentity :: Trivial -> Bool)
    quickCheck (monoidLeftIdentity :: Trivial -> Bool)
    putStrLn "Testing Identity"
    quickCheck (semigroupAssoc :: IdentityAssoc)
    quickCheck (monoidRightIdentity :: Identity String -> Bool)
    quickCheck (monoidLeftIdentity :: Identity String -> Bool)
    putStrLn "Testing Two"
    quickCheck (semigroupAssoc :: TwoAssoc)
    quickCheck (monoidRightIdentity :: Two String String -> Bool)
    quickCheck (monoidLeftIdentity :: Two String String -> Bool)
    putStrLn "Testing Three"
    quickCheck (semigroupAssoc :: ThreeAssoc)
    quickCheck (monoidRightIdentity :: Three String String String -> Bool)
    quickCheck (monoidLeftIdentity :: Three String String String -> Bool)
    putStrLn "Testing BoolConj"
    quickCheck (semigroupAssoc :: BoolConjAssoc)
    quickCheck (monoidRightIdentity :: BoolConj -> Bool)
    quickCheck (monoidLeftIdentity :: BoolConj -> Bool)
    putStrLn "Testing BoolDisj"
    quickCheck (semigroupAssoc :: BoolDisjAssoc)
    quickCheck (monoidRightIdentity :: BoolDisj -> Bool)
    quickCheck (monoidLeftIdentity :: BoolDisj -> Bool)
    mainMem
