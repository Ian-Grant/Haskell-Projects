module Print3Flipped where

myGreeting = (++) "Hello" ", World!"

hello = "Hello"

world = "World"

main :: IO ()
main = do
    putStrLn myGreeting
    putStrLn secondGreeting
    where secondGreeting =
            (++) hello ((++) ", " world) ++ "!"
