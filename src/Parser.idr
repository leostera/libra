module Libra

import Data.Vect

import public Lightyear
import public Lightyear.Char
import public Lightyear.Strings

{-
  Constants
-}
Alphabet : Vect 52 Char
Alphabet = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
             'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
             'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
             'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

Digits : Vect 10 Char
Digits = [ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]

Alphanumeric : Vect 62 Char
Alphanumeric = Alphabet ++ Digits

{-
  Proofs
-}

total allAlphanumeric : (cs : List Char) -> Type
allAlphanumeric [] = Elem True [True]
allAlphanumeric (c :: cs) = case isElem c Alphanumeric of
                                Yes prf => allAlphanumeric cs
                                No contra => Elem False [True]

{-
  Types
-}

data Empty : Type where
  MkEmpty : Empty

data Letter : Char -> Type where
  MkLetter : (c : Char) -> { auto prf : Elem c Alphabet } -> Letter c

data Number : Char -> Type where
  MkNumber : (n : Char) -> { auto prf : Elem n Digits } -> Number n

data Symbol : String -> Type where
  MkSymbol : ( s : String ) ->
             { auto nonEmpty : NonEmpty (unpack s) } ->
             { auto headPrf : Elem (head (unpack s)) Alphabet } ->
             { auto tailPrf : allAlphanumeric (tail (unpack s)) } ->
             -- { auto tailPrf : All ?isAlphanumeric (fromList (tail (unpack s))) } ->
             Symbol s
