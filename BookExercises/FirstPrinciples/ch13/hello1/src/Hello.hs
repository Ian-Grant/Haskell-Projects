module Hello (sayHello) where

sayHello :: String -> IO ()
sayHello x = do
  putStrLn ("Hello " ++ x ++ "!")

