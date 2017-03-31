module Libra.Test.Parser

import Libra.Parser
import Libra.Data

import Data.Vect

import TAP

%access export  -- to make the test functions visible

testName : IO Bool
testName = do
  let fixture = "hello"
  let expected = MkName "hello"
  let result = out (execParserT parseExpr fixture)
  case result of
       Right actual => pure (actual == expected)
       Left err => pure False

testBadName : IO Bool
testBadName = do
  let fixture = "1hello"
  let expected = MkName "hello"
  let result = out (execParserT parseExpr fixture)
  case result of
       Right actual => pure False
       Left err => pure True

testExpression : IO Bool
testExpression = do
  let fixture = "(hello (world))"
  let expected = (MkSExpr [MkName "hello", (MkSExpr [MkName "world"])])
  let result = out (execParserT parseExpr fixture)
  case result of
       Right actual => pure (actual == expected)
       Left err => pure False

parserTests : IO ()
parserTests = plan "Parser Tests" [
  testName,
  testBadName,
  testExpression
]
