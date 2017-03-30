module Libra.Parser

import Libra.Constants
import Libra.Data

import Lightyear
import Lightyear.Char
import Lightyear.Strings

%access private
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
