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

--Identity
--An Identity is a value with a special relationship to operation
--It always returns the other value passed into the operation
--  Ex:     Operation   Identity
--          Addition    0
--          Multiplication  1
--          Division    1
--
--The Problem of Oprhan Instances
--  An Orphan Instance is when an instance is defined for a datatype and
--      a typeclass, but not in the same module as either declarartion.
--  Avoid writing orphan instances at all costs!
--  If you don't own instance newtype it! so this does not happen!
--
-- 3 Ways to fix orphan instances
--  1. Type is defined but no Typeclass then put instances in same module as type
--      so the type can't be impprted without the instances.
--  2. Typeclass is defined but no Type then put instances in same module as typeclass
--      so the TypeClass can't be impprted without the instances.
--  3. Neither are defined then define a newtype wrapping the original type
--      so it now belongs to you and can now define typeclass instances.
--
--  Definitions
--  1. Monoid - A set that is closed under an associative binary operation and has an identiy element
--  2. Semigroup is a set that is closed under an associative binary operation and nothing else
--  3. Laws are rules about how an algerabra should be have. These are needed
--      to make abstraction over the comonlalities of different instantiations of the same
--      sort of algerbra possible and practical
--  4. Algebra - notation of operations over a type and its laws such as
--          semigroups, monoids, groups, semirings, and rigns.
