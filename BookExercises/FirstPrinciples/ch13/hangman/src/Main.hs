module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)

--type WordList = [String]
newtype WordList = WordList [String] deriving (Eq,Show)
--            Word Letters Filled Letters Guessed
data Puzzle = Puzzle String [Maybe Char] [Char]

instance Show Puzzle where
  show (Puzzle _ discovered gussed) =
      intersperse ' ' (fmap renderPuzzleChar discovered)
        ++ " \nGuessed so far: " ++ gussed

renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar Nothing = '_'
renderPuzzleChar (Just x) = x

minWordLength :: Int
minWordLength = 5

maxWordLength :: Int
maxWordLength = 9

allWords :: IO WordList
allWords = do
    dict <- readFile "data/dict.txt"
    return $ WordList (lines dict)

gameWords :: IO WordList
gameWords = do
    (WordList aw) <- allWords
    return $ WordList (filter gameLength aw)
      where gameLength w =
              let l = length (w :: String)
              in l >= minWordLength
                && l < maxWordLength

randomWord :: WordList -> IO String
randomWord (WordList wl) = do
  randomIndex <- randomRIO (0,length wl -1)
  return $ wl !! randomIndex

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

hideWord :: String -> [Maybe Char]
hideWord = map (const Nothing)

freshPuzzle :: String -> Puzzle
freshPuzzle xs = Puzzle xs (hideWord xs) []

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle word _ _) letter = letter `elem` word

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ gussed) new = new `elem` gussed

fillInChar :: Puzzle -> Char -> Puzzle
fillInChar (Puzzle word filledInSoFar s) c =
    Puzzle word newFilledIn (c:s)
      where zipper guessed wordChar filledChar =
              if wordChar == guessed
              then Just wordChar
              else filledChar
            newFilledIn =
              zipWith (zipper c) word filledInSoFar

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
    (_,True) -> do
      putStrLn "You already guessed that\
              \ character, pick \
              \ something else!"
      return puzzle
    (True,_) -> do
      putStrLn "This character was in the\
              \ word, filling in the word\
              \ accordingly"
      return (fillInChar puzzle guess)
    (False,_) -> do
      putStrLn "This character wasn't in\
              \ the word, try again."
      return (fillInChar puzzle guess)

gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess _ guessed) =
  if length guessed > 7
       then do
         putStrLn "You lose!"
         putStrLn $ "The word was: " ++ wordToGuess
         exitSuccess
       else return ()

gameWin :: Puzzle -> IO ()
gameWin (Puzzle _ filledInSoFar _) =
  if all isJust filledInSoFar
  then do
    putStrLn "You win!"
    exitSuccess
  else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do
  gameWin puzzle
  gameOver puzzle
  putStrLn $ "Current puzzle is: " ++ show puzzle
  putStr "Guess a letter: "
  guess <- getLine
  case guess of
    [c] -> handleGuess puzzle c >>= runGame
    _ ->
      putStrLn "Your guess must\
        \ be a single character"


main :: IO ()
main = do
  word <- randomWord'
  let puzzle = freshPuzzle (fmap toLower word)
  runGame puzzle

