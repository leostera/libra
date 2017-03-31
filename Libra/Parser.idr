module Libra.Parser

import Libra.Constants
import Libra.Data

import public Control.Monad.Identity

import public Lightyear
import Lightyear.Char
import Lightyear.Strings

%access export
%default partial

{-
  Parse Combinators
-}

parseName : Parser SExpr
parseName = lexeme (letter >>= \x => commitTo $ do {
                xs <- many alphaNum
                let name = pack (x :: xs)
                pure (MkName name)
            })

parseExpr : Parser SExpr
parseExpr = parseName <|>| ( MkSExpr <$> parens (many parseExpr) )

out : Identity (Result str SExpr) -> Either (List (str, String)) SExpr
out (Id (Failure xs)) = Left xs
out (Id (Success x y)) = Right y
