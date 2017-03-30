module Libra.Constants

import Data.Vect

%access export
%default total

{-
  Constants
-}

||| Lowercase and uppercase alphabetic characters
Alphabet : Vect 52 Char
Alphabet = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
             'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
             'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
             'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

||| Numerical characters from 0 through 9
Digits : Vect 10 Char
Digits = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]

||| Alphanumerical characters corresponding to: [a-zA-Z0-9]
Alphanumeric : Vect 62 Char
Alphanumeric = Alphabet ++ Digits
