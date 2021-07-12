module StackMachine.CoreTypes where

import Clash.Prelude hiding (Const (..))

type Stack  = Vec 8 Int

data Op     = Add | Mul | Sub
            deriving (Show, Lift)

data Instr  = Push Int
            | PushAddr Int
            | Store Int
            | Calc Op
            | EndProg
            deriving (Show, Lift)

type Variable = Int

data Expr = Const Int                   -- for constants
          | BinExpr Op Expr Expr        -- for ``binary expressions''
          | Reference Variable


data Statement = Assign Variable Expr

