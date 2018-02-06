module Monoids where

{-
Algebra - Some operation and the set they operate over
        - Haskell implements Algebra with typeclasses
-}

-- A monoid is a binary associative operation with an identity.
--
-- This means:
-- Binary: It takes two of someting as input
-- Associative: Order doesn't matter
-- Operation: Function
-- Identity: There's a input that will always return the other input
--      aka in addition it is 0 in multiplication it is 1
--
