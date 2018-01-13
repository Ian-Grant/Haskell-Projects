module BST where

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)

insert :: Ord a => a -> BinaryTree a -> BinaryTree a
--basecase
insert a Leaf = Node Leaf a Leaf
insert a (Node left b right)
    | a==b = Node left b right
    | a < b = Node (insert a left) b right
    | a > b = Node left b (insert a right)

{-
remove :: Ord a => a -> BinaryTree a -> BinaryTree a
remove _ Leaf = Leaf
remove a (Node left b right)
    | a==b = removeHelper (Node left a right)
    | a < b = Node (remove a left) b right
    | a > b = Node left b (remove a left)
-}

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) = Node (mapTree f left) (f a) (mapTree f right)

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected :: BinaryTree Integer
mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

mapOkay =
    if mapTree (+1) testTree == mapExpected
        then print "yup okay!"
        else error "test failed"

preOrder :: BinaryTree a -> [a]
preOrder Leaf = []
preOrder (Node left a right) = [a] ++ preOrder left ++ preOrder right

inOrder :: BinaryTree a -> [a]
inOrder Leaf = []
inOrder (Node left a right) = inOrder left ++ [a] ++ inOrder right

postOrder :: BinaryTree a -> [a]
postOrder Leaf = []
postOrder (Node left a right) = postOrder left ++ postOrder right ++ [a]

testTree2 :: BinaryTree Integer
testTree2 = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
    if preOrder testTree2 == [2,1,3]
        then putStrLn "Preorder fine!"
        else putStrLn "Bad new boi."

testInorder :: IO ()
testInorder =
    if inOrder testTree2 == [1,2,3]
        then putStrLn "Inorder fine!"
        else putStrLn "Bad news boi."

testPostorder :: IO ()
testPostorder =
    if postOrder testTree2 == [1,3,2]
        then putStrLn "PostOrder fine!"
        else putStrLn "Bad news boi!"

main :: IO ()
main = do
    testPreorder
    testInorder
    testPostorder
