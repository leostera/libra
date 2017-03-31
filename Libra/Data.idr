module Libra.Data

import Data.Vect

import Libra.Constants

%access public export -- data constructors :)
%default total

{-
  Proofs
-}

||| Proof builder ensuring all characters in a list are Alphanumeric
|||
||| @cs A list of possibly alphanumeric characters
allAlphanumeric : (cs : List Char) -> Type
allAlphanumeric [] = Elem True [True]
allAlphanumeric (c :: cs) = case c `isElem` Alphanumeric of
                                Yes prf => allAlphanumeric cs
                                No contra => Elem c Alphanumeric

{-
  Types
-}

||| The empty atom
data Empty : Type where
  MkEmpty : Empty

||| The letter atom-part
data Letter : Char -> Type where
  MkLetter : (c : Char) -> { auto prf : Elem c Alphabet } -> Letter c

||| The number atom-part
data Number : Char -> Type where
  MkNumber : (n : Char) -> { auto prf : Elem n Digits } -> Number n

||| It's the smallest entity with resolvable meaning in Libra.
|||
||| Always starts with a letter and may contain an arbitrary number of
||| alphanumeric characters afterwards.
data Symbol : Type where
  MkSymbol : ( s : String ) ->
             { auto nonEmpty : NonEmpty (unpack s) } ->
             { auto headPrf : Elem (head (unpack s)) Alphabet } ->
             { auto tailPrf : allAlphanumeric (tail (unpack s)) } ->
             -- Considered using Data.Vect.Quantifiers.All but it was fairly
             -- slower.
             -- https://github.com/idris-lang/Idris-dev/blob/master/libs/base/Data/Vect/Quantifiers.idr#L70
             -- { auto tailPrf : All ?isAlphanumeric (fromList (tail (unpack s))) } ->
             Symbol

data SExpr : Type where
  -- temporary, figure out how to make parseSymbol _guarantee_ a call to
  -- MkName (MkSymbol name) -- with a non-empty name
  MkName  : String -> SExpr
  MkSExpr : List SExpr -> SExpr

Eq SExpr where
    (==) (MkName x) (MkName y) = (x == y)
    (==) (MkSExpr (x :: xs)) (MkSExpr (y :: ys)) = (x == y) && (xs == ys)
    (==) _ _ = False

partial toString : SExpr -> String
toString (MkName x) = x
toString (MkSExpr []) = "()"
toString (MkSExpr xs) = let
    body = (foldr (++) "" (intersperse " " (map toString xs)))
  in
    "(" ++ body ++ ")"
