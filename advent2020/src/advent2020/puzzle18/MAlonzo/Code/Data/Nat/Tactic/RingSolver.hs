{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.Tactic.RingSolver where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Data.Maybe.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Tactic.RingSolver
import qualified MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing

name8 = "Data.Nat.Tactic.RingSolver.ring"
d8 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172
d8
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du1660
      (coe MAlonzo.Code.Data.Nat.Properties.d2404)
      (coe
         (\ v0 ->
            let v1 = coe MAlonzo.Code.Data.Maybe.Base.C26 in
            case coe v0 of
              0 -> coe MAlonzo.Code.Data.Maybe.Base.C30 erased
              _ -> coe v1))
name12 = "Data.Nat.Tactic.RingSolver.solve-∀"
d12 :: MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d12
  = coe
      MAlonzo.Code.Tactic.RingSolver.d224
      (coe
         (MAlonzo.RTE.QName
            (8 :: Integer) (16219765639759126300 :: Integer)
            "Data.Nat.Tactic.RingSolver.ring"
            (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
name14 = "Data.Nat.Tactic.RingSolver.solve"
d14 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d14 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.d280 (coe v0)
      (coe
         (MAlonzo.RTE.QName
            (8 :: Integer) (16219765639759126300 :: Integer)
            "Data.Nat.Tactic.RingSolver.ring"
            (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
