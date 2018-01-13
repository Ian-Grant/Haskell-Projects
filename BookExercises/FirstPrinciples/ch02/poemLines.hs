module PoemLines where

fstSen = "Tyger Tyger, buring bright\n"
sndSen = "In the forests of the night\n"
thdSen = "What immortal hand or eye\n"
frhSen = "Could frame thy fearful\
        \ symmetry?"
sentences = fstSen ++ sndSen ++ thdSen ++ frhSen

mySplit :: Char -> String -> [String]
mySplit _ [] = []
mySplit ch s@(c:cs) = if c == ch then mySplit ch cs else w : mySplit ch t
  where
    w = takeWhile (/= ch) s
    t = dropWhile (/= ch) s

myWords :: String -> [String]
myWords = mySplit ' '

myLines :: String -> [String]
myLines = mySplit '\n'

shouldEqual = ["Tyger Tyger, burning bright",
                "In the forests of the night",
                "What immortal hand or eye",
                "Could frame thy fearful symmetry?"]

main :: IO ()
main = print $ "Are equal? " ++ show(myLines sentences == shouldEqual)
