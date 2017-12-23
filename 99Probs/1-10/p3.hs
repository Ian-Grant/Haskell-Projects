elementAt :: [a] -> Int -> a
elementAt [] y = error "EMPTY LIST"
elementAt x y = x !! (y-1)
