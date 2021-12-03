{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.Induction where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Induction
import qualified MAlonzo.Code.Induction.WellFounded
import qualified MAlonzo.Code.Level

name8 = "Data.Nat.Induction.Rec"
d8 ::
  MAlonzo.Code.Agda.Primitive.T4 -> (Integer -> ()) -> Integer -> ()
d8 = erased
name22 = "Data.Nat.Induction.recBuilder"
d22 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d22 v0 v1 v2 v3 = du22 v2 v3
du22 :: (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
du22 v0 v1
  = case coe v1 of
      0 -> coe
             MAlonzo.Code.Level.C20 (coe MAlonzo.Code.Agda.Builtin.Unit.C8)
      _ -> let v2 = subInt (coe v1) (coe (1 :: Integer)) in
           coe v0 v2 (coe du22 (coe v0) (coe v2))
name36 = "Data.Nat.Induction.rec"
d36 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d36 v0 = du36
du36 ::
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
du36
  = coe MAlonzo.Code.Induction.du54 (\ v0 v1 v2 -> coe du22 v1 v2)
name40 = "Data.Nat.Induction.CRec"
d40 ::
  MAlonzo.Code.Agda.Primitive.T4 -> (Integer -> ()) -> Integer -> ()
d40 = erased
name54 = "Data.Nat.Induction.cRecBuilder"
d54 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d54 v0 v1 v2 v3 = du54 v0 v2 v3
du54 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
du54 v0 v1 v2
  = case coe v2 of
      0 -> coe
             MAlonzo.Code.Level.C20 (coe MAlonzo.Code.Agda.Builtin.Unit.C8)
      _ -> let v3 = subInt (coe v2) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Agda.Builtin.Sigma.C32
             (coe v1 v3 (coe du70 (coe v0) (coe v1) (coe v3)))
             (coe du70 (coe v0) (coe v1) (coe v3))
name70 = "Data.Nat.Induction._.ih"
d70 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d70 v0 v1 v2 v3 = du70 v0 v2 v3
du70 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
du70 v0 v1 v2 = coe du54 (coe v0) (coe v1) (coe v2)
name74 = "Data.Nat.Induction.cRec"
d74 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d74 v0
  = coe
      MAlonzo.Code.Induction.du54 (\ v1 v2 v3 -> coe du54 (coe v0) v2 v3)
name78 = "Data.Nat.Induction.<′-Rec"
d78 ::
  MAlonzo.Code.Agda.Primitive.T4 -> (Integer -> ()) -> Integer -> ()
d78 = erased
name80 = "Data.Nat.Induction.<′-wellFounded"
d80 :: Integer -> MAlonzo.Code.Induction.WellFounded.T42
d80 = erased
name84 = "Data.Nat.Induction.<′-wellFounded′"
d84 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Induction.WellFounded.T42
d84 = erased
name104 = "Data.Nat.Induction._._.wfRec"
d104 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> AgdaAny
d104 v0 = du104
du104 ::
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> AgdaAny
du104 = coe MAlonzo.Code.Induction.WellFounded.du164
name106 = "Data.Nat.Induction._._.wfRecBuilder"
d106 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny
d106 v0 = du106
du106 ::
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny
du106 v0 v1 v2 = coe MAlonzo.Code.Induction.WellFounded.du156 v1
name110 = "Data.Nat.Induction.<-Rec"
d110 ::
  MAlonzo.Code.Agda.Primitive.T4 -> (Integer -> ()) -> Integer -> ()
d110 = erased
name112 = "Data.Nat.Induction.<-wellFounded"
d112 :: Integer -> MAlonzo.Code.Induction.WellFounded.T42
d112 = erased
name122 = "Data.Nat.Induction._._.wfRec"
d122 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> AgdaAny
d122 v0 = du122
du122 ::
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> AgdaAny
du122 = coe MAlonzo.Code.Induction.WellFounded.du164
name124 = "Data.Nat.Induction._._.wfRecBuilder"
d124 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny
d124 v0 = du124
du124 ::
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny
du124 v0 v1 v2 = coe MAlonzo.Code.Induction.WellFounded.du156 v1
name126 = "Data.Nat.Induction.rec-builder"
d126 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d126 v0 v1 v2 v3 = coe du22 v2 v3
name128 = "Data.Nat.Induction.cRec-builder"
d128 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d128 v0 v1 v2 v3 = coe du54 v0 v2 v3
name130 = "Data.Nat.Induction.<′-rec-builder"
d130 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny
d130 v0 = du130
du130 ::
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T142 -> AgdaAny
du130 v0 v1 v2 = coe MAlonzo.Code.Induction.WellFounded.du156 v1
name132 = "Data.Nat.Induction.<-rec-builder"
d132 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny
d132 v0 = du132
du132 ::
  (Integer -> ()) ->
  (Integer ->
   (Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny) ->
   AgdaAny) ->
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny
du132 v0 v1 v2 = coe MAlonzo.Code.Induction.WellFounded.du156 v1
name134 = "Data.Nat.Induction.<′-well-founded"
d134 :: Integer -> MAlonzo.Code.Induction.WellFounded.T42
d134 = erased
name136 = "Data.Nat.Induction.<′-well-founded′"
d136 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Induction.WellFounded.T42
d136 = erased
name138 = "Data.Nat.Induction.<-well-founded"
d138 :: Integer -> MAlonzo.Code.Induction.WellFounded.T42
d138 = erased
