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
--
--
