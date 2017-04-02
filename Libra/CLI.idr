module Libra.CLI

import Effects
import Effect.File
import Effect.StdIO
import Effect.System

%access export

help : String
help = """
  libra-cli v0.1 - A Lisp Parser

  Usage:

      libra-cli path/to/file.lisp
"""

cli : Eff () [SYSTEM, STDIO, FILE_IO]
cli = do [program, fileName] <- getArgs | _ => putStrLn help
         source <- readFile fileName
         putStrLn $ source
