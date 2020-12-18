{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.Abstraction where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Data.Product
import qualified MAlonzo.Code.Data.String.Properties
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core
import qualified MAlonzo.Code.Relation.Nullary.Product

name8 = "Reflection.Abstraction.map"
d8 ::
  () ->
  () ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90
d8 v0 v1 v2 v3 = du8 v2 v3
du8 ::
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90
du8 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Reflection.C100 v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.Reflection.C100 (coe v2) (coe v0 v3)
      _ -> MAlonzo.RTE.mazUnreachableError
name24 = "Reflection.Abstraction.abs-injective₁"
d24 ::
  () ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d24 = erased
name34 = "Reflection.Abstraction.abs-injective₂"
d34 ::
  () ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d34 = erased
name44 = "Reflection.Abstraction.abs-injective"
d44 ::
  () ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d44 v0 v1 v2 v3 v4 = du44
du44 ::
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du44 = coe MAlonzo.Code.Data.Product.du132 erased erased
name46 = "Reflection.Abstraction.unAbs"
d46 :: () -> MAlonzo.Code.Agda.Builtin.Reflection.T90 -> AgdaAny
d46 v0 v1 = du46 v1
du46 :: MAlonzo.Code.Agda.Builtin.Reflection.T90 -> AgdaAny
du46 v0
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C100 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name56 = "Reflection.Abstraction.unAbs-dec"
d56 ::
  () ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Relation.Nullary.T32 ->
  MAlonzo.Code.Relation.Nullary.T32
d56 v0 v1 v2 v3 = du56 v1 v2 v3
du56 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Relation.Nullary.T32 ->
  MAlonzo.Code.Relation.Nullary.T32
du56 v0 v1 v2
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C100 v3 v4
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C100 v5 v6
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
                    (coe MAlonzo.Code.Data.Product.du264 erased)
                    (coe
                       MAlonzo.Code.Relation.Nullary.Product.du30
                       (coe MAlonzo.Code.Data.String.Properties.d64 (coe v3) (coe v5))
                       (coe v2))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name68 = "Reflection.Abstraction.≡-dec"
d68 ::
  () ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Relation.Nullary.T32
d68 v0 v1 v2 v3 = du68 v1 v2 v3
du68 ::
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T90 ->
  MAlonzo.Code.Relation.Nullary.T32
du68 v0 v1 v2
  = coe
      du56 (coe v1) (coe v2)
      (coe v0 (coe du46 (coe v1)) (coe du46 (coe v2)))
