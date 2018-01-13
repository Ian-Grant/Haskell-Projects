module RegisteredUser where

newtype Username =
    Username String

newtype AccountNumber =
    AccountNumber Integer

data User =
    UnregisteredUser | RegisteredUser Username AccountNumber

printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "UNREGISTERED USER"
printUser (RegisteredUser (Username name) (AccountNumber acctNum)) =
    putStrLn $ name ++ " " ++ show acctNum

