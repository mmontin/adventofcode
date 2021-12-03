{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.Argument where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.Product
import qualified MAlonzo.Code.Reflection.Argument.Information
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core
import qualified MAlonzo.Code.Relation.Nullary.Product

name28 = "Reflection.Argument.Args"
d28 :: MAlonzo.Code.Agda.Primitive.T4 -> () -> ()
d28 = erased
name44 = "Reflection.Argument.map"
d44 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74
d44 v0 v1 v2 v3 v4 v5 = du44 v4 v5
du44 ::
  (AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74
du44 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Reflection.C84 v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.Reflection.C84 (coe v2) (coe v0 v3)
      _ -> MAlonzo.RTE.mazUnreachableError
name52 = "Reflection.Argument.map-Args"
d52 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74]
d52 v0 v1 v2 v3 v4 v5 = du52 v4 v5
du52 ::
  (AgdaAny -> AgdaAny) ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74]
du52 v0 v1
  = coe MAlonzo.Code.Data.List.Base.du20 (coe du44 (coe v0)) (coe v1)
name66 = "Reflection.Argument.arg-injective₁"
d66 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d66 = erased
name76 = "Reflection.Argument.arg-injective₂"
d76 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d76 = erased
name86 = "Reflection.Argument.arg-injective"
d86 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d86 v0 v1 v2 v3 v4 v5 = du86
du86 ::
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du86 = coe MAlonzo.Code.Data.Product.du132 erased erased
name88 = "Reflection.Argument.unArg"
d88 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Agda.Builtin.Reflection.T74 -> AgdaAny
d88 v0 v1 v2 = du88 v2
du88 :: MAlonzo.Code.Agda.Builtin.Reflection.T74 -> AgdaAny
du88 v0
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C84 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name98 = "Reflection.Argument.unArg-dec"
d98 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Relation.Nullary.T32 ->
  MAlonzo.Code.Relation.Nullary.T32
d98 v0 v1 v2 v3 v4 = du98 v2 v3 v4
du98 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Relation.Nullary.T32 ->
  MAlonzo.Code.Relation.Nullary.T32
du98 v0 v1 v2
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C84 v3 v4
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C84 v5 v6
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
                    (coe MAlonzo.Code.Data.Product.du264 erased)
                    (coe
                       MAlonzo.Code.Relation.Nullary.Product.du30
                       (coe
                          MAlonzo.Code.Reflection.Argument.Information.d44 (coe v3) (coe v5))
                       (coe v2))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name110 = "Reflection.Argument.≡-dec"
d110 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Relation.Nullary.T32
d110 v0 v1 v2 v3 v4 = du110 v2 v3 v4
du110 ::
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  MAlonzo.Code.Relation.Nullary.T32
du110 v0 v1 v2
  = coe
      du98 (coe v1) (coe v2)
      (coe v0 (coe du88 (coe v1)) (coe du88 (coe v2)))
