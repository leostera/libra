module Libra.Test.Parser

import Libra.Parser
import Libra.Data

import Data.Vect

import TAP

%access export  -- to make the test functions visible

testName : Lazy (IO Bool)
testName = do
  let fixture = "hello"
  let expected = MkName "hello"
  let result = out (execParserT parseExpr fixture)
  case result of
       Right actual => pure True
       Left err => pure False

testBadName : Lazy (IO Bool)
testBadName = do
  let fixture = "1hello"
  let expected = MkName "hello"
  let result = out (execParserT parseExpr fixture)
  case result of
       Right actual => pure False
       Left err => pure True

data What = Run | Name

testExpression : Lazy (IO Bool)
testExpression = do
  let fixture = "(LABEL EQUAL (LAMBDA (X Y) (COND ((ATOM X) (COND ((ATOM Y) (EQ X Y)) ((QUOTE T) (QUOTE F)))) ((EQUAL (CAR X) (CAR Y)) (EQUAL (CDR X) (CDR Y))) ((QUOTE T) (QUOTE F)))) (LAMBDA (X Y) (COND ((ATOM X) (COND ((ATOM Y) (EQ X Y)) ((QUOTE T) (QUOTE F)))) ((EQUAL (CAR X) (CAR Y)) (EQUAL (CDR X) (CDR Y))) ((QUOTE T) (QUOTE F))))(LAMBDA (X Y) (COND ((ATOM X) (COND ((ATOM Y) (EQ X Y)) ((QUOTE T) (QUOTE F)))) ((EQUAL (CAR X) (CAR Y)) (EQUAL (CDR X) (CDR Y))) ((QUOTE T) (QUOTE F)))))"
  let expected = (MkSExpr [MkName "hello", (MkSExpr [MkName "world"])])
  let result = out (execParserT parseExpr fixture)
  case result of
       Right actual => pure True
       Left err => pure False

parserTests : IO ()
parserTests = plan "Parser Tests" [
  Delay (testName),
  Delay (testBadName),
  Delay (testExpression)
]
