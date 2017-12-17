import Data.List
data NestedList a = Elem a | List [NestedList a]

flat :: NestedList a -> [a]
flat (Elem x) = [x]
flat (List (x) = concatMap flat x
