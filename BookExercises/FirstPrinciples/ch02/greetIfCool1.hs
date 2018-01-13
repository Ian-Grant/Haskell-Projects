module GreetIfCool1 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
    if cool
        then putStrLn "eyyy. What'zzzzzzz up!?"
    else
        putStrLn "pshh"
    where cool = coolness == "hello gov"
