{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.GeneralisedArithmetic where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Primitive

name14 = "Data.Nat.GeneralisedArithmetic._.fold"
d14 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> (AgdaAny -> AgdaAny) -> Integer -> AgdaAny
d14 v0 v1 v2 v3 v4 = du14 v2 v3 v4
du14 :: AgdaAny -> (AgdaAny -> AgdaAny) -> Integer -> AgdaAny
du14 v0 v1 v2
  = case coe v2 of
      0 -> coe v0
      _ -> let v3 = subInt (coe v2) (coe (1 :: Integer)) in
           coe v1 (coe du14 (coe v0) (coe v1) (coe v3))
name30 = "Data.Nat.GeneralisedArithmetic._.add"
d30 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> Integer -> AgdaAny -> AgdaAny
d30 v0 v1 v2 v3 v4 v5 = du30 v3 v4 v5
du30 :: (AgdaAny -> AgdaAny) -> Integer -> AgdaAny -> AgdaAny
du30 v0 v1 v2 = coe du14 (coe v2) (coe v0) (coe v1)
name46 = "Data.Nat.GeneralisedArithmetic._.mul"
d46 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny -> AgdaAny
d46 v0 v1 v2 v3 v4 v5 v6 = du46 v2 v4 v5 v6
du46 ::
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> Integer -> AgdaAny -> AgdaAny
du46 v0 v1 v2 v3 = coe du14 (coe v0) (coe v1 v3) (coe v2)
name76 = "Data.Nat.GeneralisedArithmetic._.fold-+"
d76 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d76 = erased
name92 = "Data.Nat.GeneralisedArithmetic._.fold-k"
d92 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny) ->
  Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d92 = erased
name108 = "Data.Nat.GeneralisedArithmetic._.fold-*"
d108 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d108 = erased
name140 = "Data.Nat.GeneralisedArithmetic._.fold-pull"
d140 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  (AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d140 = erased
name160 = "Data.Nat.GeneralisedArithmetic.id-is-fold"
d160 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d160 = erased
name168 = "Data.Nat.GeneralisedArithmetic.+-is-fold"
d168 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d168 = erased
name178 = "Data.Nat.GeneralisedArithmetic.*-is-fold"
d178 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d178 = erased
name192 = "Data.Nat.GeneralisedArithmetic.^-is-fold"
d192 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d192 = erased
name208 = "Data.Nat.GeneralisedArithmetic.*+-is-fold"
d208 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d208 = erased
name232 = "Data.Nat.GeneralisedArithmetic.^*-is-fold"
d232 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d232 = erased
