{-# OPTIONS_GHC -Wall #-}

module AST.Expression where

import AST.V0_15
import qualified AST.Literal as Literal
import qualified AST.Pattern as Pattern
import qualified AST.Type as Type
import qualified AST.Variable as Var
import qualified Reporting.Annotation as A


---- GENERAL AST ----

data UnaryOperator =
    Negative
    deriving (Eq, Show)

type Def =
    A.Located Def'


data Def'
    = Definition Pattern.Pattern [Pattern.Pattern] Expr Bool
    | TypeAnnotation (Commented Var.Ref) Type.Type
    deriving (Eq, Show)


type Expr =
    A.Located Expr'


data Expr'
    = Literal (Commented Literal.Literal)
    | Var (Commented Var.Ref)
    | Range Expr Expr Bool
    | ExplicitList [Expr] Bool
    | Binops Expr [(Commented Var.Ref,Expr)] Bool
    | Unary UnaryOperator Expr
    | Lambda [Pattern.Pattern] Expr Bool
    | App Expr [Expr] Bool
    | If [(Expr, Bool, Expr)] Expr
    | Let [Def] Expr
    | Case (Expr,Bool) [(Pattern.Pattern, Expr)]
    | Tuple [Expr] Bool
    | TupleFunction Int
    | Access Expr String
    | AccessFunction String
    | RecordUpdate Expr [(String, Expr, Bool)] Bool
    | Record [(String, Expr, Bool)] Bool
    | Parens Expr Bool
    -- for type checking and code gen only
    | GLShader String String Literal.GLShaderTipe
    deriving (Eq, Show)
