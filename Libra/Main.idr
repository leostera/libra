module Main

import Libra.Parser

main : Eff () [STDIO, SYSTEM]
main = do [prog, arg] <- getArgs
          putStrLn $ "Arguments are" ++ arg
