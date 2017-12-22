import Data.List
data NestedList a = Elem a | List [NestedList a]

flat :: NestedList a -> [a]
flat (Elem a    ) = [a]
flat (List (x:xs)) = flat x ++ flat (List xs)
flat (List []) = []
