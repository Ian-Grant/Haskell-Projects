module Monoids where

{-
Algebra - Some operation and the set they operate over
        - Haskell implements Algebra with typeclasses
        - and the
-}

-- A monoid is a binary associative operation with an identity.
--
-- This means:
-- Binary: It takes two of someting as input
-- Associative: Order doesn't matter
-- Operation: Function
-- Identity: There's a input that will always return the other input
--      aka in addition it is 0 in multiplication it is 1
--      or for lists binary operator (++) [] is the identity
-- Also known as a Monoid is a function that takes in two arguments and follows two laws
--          Laws: Associativity and Identity
--          Associativity: Arguments can be regrouped and get same result
--          Identity: There exists some value such that when passed as an argument it
--                          returns the other argument no matter what
-- How Monoids are defined in Haskell
--     Typeclasses are a way to recognize, organize, and use common functionality
--                                                   and patterns across types.
--     Instances are the operators that operate over the Typeclasses which are
--     the sets
--
-- Mappend is how two values in the type are joined together
--      Like sum
-- Mconcat is how two values in the type are joined together
--      Like mul
-- Mempty is the identity for mappend
--
-- Why Integer lacks a monoidic instance
--      REPL can't figureout if it is supossed to have a sum or product to join
--           items together
--      Sum and Product newtypes are used to tell which should be ussed as
--              mappend operation
--      Integrals for a monoid under summations and multiplication
--
-- NewType
--      Newtype constrains the datatype to having a single unary data
--          constructor aka single data constructor with 1 input
--      Newtype guarantees no additional runtime overhead in wrapping the
--          original type. No additional boxing is needed for products and sums
--
-- Laws
-- Proofs are programs and programs are proofs.
left Identity
mappend mempty x = x
right Identity
mappend x mempty = x
Associativity
mappend x (mappend y z) = mappend (mappend x y) z

mconcat = foldr mappend mempty
--Using Lists
mempty is []
mappend is (++)

--Different instances same representations
-- Many datatypes have more than one valid monoid
-- Newtype is used to tell monoids apart that have diffretnt implementation
--      For example Sum and Product for ints
--      Or All and Any for Bool
