module Euler2 where

fibs = 1 : scanl (+) 1 fibs

e2 = sum $ filter even $ takeWhile (<4000000) fibs

fibv1 = fib' 1 1
    where fib' fst snd count = if count==1 then fst else fib' (fst+snd) fst (count-1)

e2v1 = sum [y | y <- takeWhile (< 4*10^6 + 1) $ map fibv1 [1..42], even y]
