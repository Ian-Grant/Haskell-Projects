import Data.List
--data type dec
data NestedList a = Elem a | List [NestedList a]
--fun type def
flat :: NestedList a -> [a]
--if not nested list return itself
flat (Elem a    ) = [a]
--list containing a list
--returns flat of head of list cat with flat of rest of list
flat (List (x:xs)) = flat x ++ flat (List xs)
--list containing empty list
--returns empty list
flat (List []) = []
