module TowersOfHanoi where

type Peg = String
type Move = (Peg,Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi n a b c
    | n <= 0 = []
    | otherwise = hanoi (n-1) a c b ++ [(a,b)] ++ hanoi (n-1) c b a

--Notes For Later Refrence
{-
   n = number of discs
   a is src b is dest and c is temp location used
   moves n-1 disc from a to c using b as temp storage
   move top disk of a to b
   move n-1 disc from c to b using a as temp location

   do all above till no discs left
  -}
