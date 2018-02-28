module ExBeKind where

-- #1 What's the kind of a?
-- in a -> a
-- * -> *
-- *
-- #2 What are the kinds of b and T
-- a -> b a -> T (b a)
-- * -> (* -> *) -> (* -> * -> * -> *)
