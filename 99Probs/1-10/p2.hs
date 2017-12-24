--type def
myButLast :: [a] -> a
--checks for empty list
myButLast [] = error "EMPTY LIST"
--if list is only 2 long return first item
myButLast [x,_] = x
--if longer than 2 call function on rest of list
myButLast (_:xs) = myButLast xs
