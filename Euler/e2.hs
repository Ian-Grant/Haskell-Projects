module Euler2 where

fib = fib' 1 1
    where fib' fst snd count = if count==1 then fst else fib' (fst+snd) fst (count-1)

e2 = sum [y | y <- takeWhile (< 4*10^6 + 1) $ map fib [1..42], even y]
