module MonadsComputerphile where


data Expr = Val Int | Div Expr Expr


--1
--Val 1
--6 div 2
--Div Val 6 Val 2
--6 div (3 div 1)
--Div Val 6 (Div Val 3 Val 1)

eval :: Expr -> Int
eval (Val n) = n
eval (Div x y) = eval x `div` eval y

safeDiv :: Int -> Int -> Maybe Int
safeDiv n m = if m == 0 then Nothing else Just (div n m)

eval2 :: Expr -> Maybe Int
eval2 (Val n) = Just n
eval2 (Div x y) = case eval2 x of
                  Nothing -> Nothing
                  Just n ->
                    case eval2 y of
                      Nothing -> Nothing
                      Just m -> safeDiv n m

-- m >>= f = case m of
--            Nothing -> Nothing
--            Just x -> f x

--Bind form
eval3 :: Expr -> Maybe Int
eval3 (Val n) = return n
eval3 (Div x y) = eval3 x >>= (\n ->
                  eval3 y >>= (\m ->
                  safeDiv n m))


--Do Notation
eval4 :: Expr -> Maybe Int
eval4 (Val n) = return n
eval4 (Div x y) = do
      n <- eval4 x
      m <- eval4 y
      safeDiv n m


--Maybe Monad
--
-- return :: a -> Maybe a
-- >>=    :: Maybe -> (a -> Maybe b) -> Maybe b
