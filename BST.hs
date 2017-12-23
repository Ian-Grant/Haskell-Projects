import qualified Data.List
------------Constructor----------------------
data Tree a = EmptyTree | Node a (Tree a) (Tree a)
        deriving (Show, Eq)
------------Insert---------------------------
insert :: (Ord a) => a -> Tree a -> Tree a
insert x EmptyTree = Node x EmptyTree EmptyTree
insert x (Node a left right)
        | x == a = Node x left right
        | x < a  = Node a (insert x left) right
        | x > a  = Node a left (insert x right)
------------Remove---------------------------
remove :: (Ord a) => a -> Tree a -> Tree a
remove _ EmptyTree = EmptyTree
remove delKey (Node dataI t1 t2)
        | delKey == dataI = removeHelper (Node dataI t1 t2)
        | delKey > dataI = Node dataI t1 (remove delKey t2)
        | delKey < dataI = Node dataI (remove delKey t1) t2
------------Remove Helper--------------------
removeHelper :: (Ord a) => Tree a -> Tree a
removeHelper (Node a EmptyTree t2) = t2 -- No left child
removeHelper (Node a t1 EmptyTree) = t1 -- No right child
removeHelper (Node a t1 t2) = (Node a2 t1 t2)
    where a2 = rightMost t1 --gets predessor
------------Left Most-----------------------
leftMost :: (Ord a) => Tree a -> a
leftMost (Node dada EmptyTree _) = dada
leftMost (Node _ t1 _) = leftMost t1
------------Right Most----------------------
rightMost :: (Ord a) => Tree a -> a
rightMost (Node dada _ EmptyTree) = dada
rightMost (Node _ _ t2) = rightMost t2
------------Retrieve-------------------------
retrieve :: (Ord a) => a -> Tree a -> Bool
retrieve x EmptyTree = False
retrieve x (Node a left right)
        | x == a = True
        | x < a  = retrieve x left
        | x > a  = retrieve x right
-----------List To Tree-------------------------
listToTree :: (Ord a) => [a] -> Tree a
listToTree [] = EmptyTree
listToTree (x:xs) = createTree (Node x EmptyTree EmptyTree) xs
    where
        createTree tree [] = tree
        createTree tree (x:xs) = createTree (insert x tree) xs
-----------isEmpty-----------------------------
empty :: (Ord a) => Tree a -> Bool
empty EmptyTree = True
empty _ = False
-----------PreOrder Print-----------------------
preorder :: (Ord a) => Tree a -> [a]
preorder EmptyTree = []
preorder (Node v t1 t2) = [v] ++ preorder t1 ++ preorder t2
-----------InOrder Print-----------------------
inorder :: (Ord a) => Tree a -> [a]
inorder EmptyTree = []
inorder (Node v t1 t2) = inorder t1 ++ [v] ++ inorder t2
-----------PostOrder Print-----------------------
postorder :: (Ord a) => Tree a -> [a]
postorder EmptyTree = []
postorder (Node v t1 t2) = postorder t1 ++ postorder t2 ++ [v]
-------------------------------------------------
-----------Show Structure------------------------
--showStructure :: Tree a -> IO ()
--showStructure (Node root t1 t2)= do
--        showHelper
