module TupleFunctions where

addEmUp2 :: Num a => (a,a) -> a
addEmUp2 (x,y) = x + y

addEmUp2' :: Num a => (a,a) -> a
addEmUp2' tup = fst tup + snd tup

fst3 :: (a,b,c) -> a
fst3 (x,_,_) = x

thrd3 :: (a,b,c) -> c
thrd3 (_,_,z) = z

f :: (a,b,c) -> (d,e,f) -> ((a,d),(c,f))
f (a,_,c) (d,_,f) = ((a,d),(c,f))
