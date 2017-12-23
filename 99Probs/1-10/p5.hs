myReverse :: [Char] -> [Char]
myReverse [] = error "EMPTY LIST"
--Calls helper function with list and empty list
myReverse x = myReverse' x []
    where
        --If list pased in is empty return 2nd param
        myReverse' [] reversed = reversed
        --else cat x onto empty list and call again
        myReverse' (x:xs) reversed = myReverse' xs (x:reversed)
