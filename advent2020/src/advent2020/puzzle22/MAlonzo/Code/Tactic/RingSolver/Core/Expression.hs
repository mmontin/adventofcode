{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Expression where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Operations.Ring
import qualified MAlonzo.Code.Data.Fin.Base
import qualified MAlonzo.Code.Data.Vec.Base

name14 = "Tactic.RingSolver.Core.Expression.Expr"
d14 a0 a1 a2 = ()
data T14
  = C22 AgdaAny | C24 MAlonzo.Code.Data.Fin.Base.T6 | C26 T14 T14 |
    C28 T14 T14 | C30 T14 Integer | C32 T14
name80 = "Tactic.RingSolver.Core.Expression._.Eval.⟦_⟧"
d80 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  Integer -> T14 -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d80 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du80 v2 v5 v7 v8
du80 ::
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  (AgdaAny -> AgdaAny) ->
  T14 -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du80 v0 v1 v2 v3
  = case coe v2 of
      C22 v4 -> coe v1 v4
      C24 v4 -> coe MAlonzo.Code.Data.Vec.Base.du94 (coe v3) (coe v4)
      C26 v4 v5
        -> coe
             MAlonzo.Code.Algebra.Bundles.d2022 v0
             (coe du80 (coe v0) (coe v1) (coe v4) (coe v3))
             (coe du80 (coe v0) (coe v1) (coe v5) (coe v3))
      C28 v4 v5
        -> coe
             MAlonzo.Code.Algebra.Bundles.d2024 v0
             (coe du80 (coe v0) (coe v1) (coe v4) (coe v3))
             (coe du80 (coe v0) (coe v1) (coe v5) (coe v3))
      C30 v4 v5
        -> let v6 = coe du80 (coe v0) (coe v1) (coe v4) (coe v3) in
           case coe v5 of
             0 -> coe MAlonzo.Code.Algebra.Bundles.d2030 (coe v0)
             _ -> let v7 = subInt (coe v5) (coe (1 :: Integer)) in
                  coe
                    MAlonzo.Code.Algebra.Operations.Ring.du32 (coe v0) (coe v6)
                    (coe v7)
      C32 v4
        -> coe
             MAlonzo.Code.Algebra.Bundles.d2026 v0
             (coe du80 (coe v0) (coe v1) (coe v4) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
