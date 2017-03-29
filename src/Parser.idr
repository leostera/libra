module Libra

import Data.Vect

import public Lightyear
import public Lightyear.Char
import public Lightyear.Strings

{-
  Constants
-}
Alphabet : Vect 52 Char
Alphabet = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
  ]

Numbers : Vect 10 Nat
Numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

{-
  Types
-}

data Empty : Type where
  MkEmpty : Empty

data Letter : Char -> Type where
  MkLetter : (c : Char) -> { auto prf : Elem c Alphabet } -> Letter c

data Number : Nat -> Type where
  MkNumber : (n : Nat) -> { auto prf : Elem n Numbers } -> Number n
