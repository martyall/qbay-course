module Tests.StackMachine where

import           Prelude

import           StackMachine.CodeGen
import           StackMachine.Core
import           StackMachine.CoreTypes


import           Test.Hspec

stackMachineSpec :: IO ()
stackMachineSpec = hspec $ do
  describe "Can codegen Expressions" $ do
    it "Can codegen binary expression" $ do
      let binExpr = BinExpr Add (Const 1) (Const 2)
          code = [Push 1, Push 2, Calc Add, EndProg]
      codeGen binExpr `shouldBe` code
