module Main

import Libra.CLI

import Effects
-- Remember to import all the kinds of Effect's you're using:
import Effect.StdIO
import Effect.System
import Effect.File

main : IO ()
main = run cli
