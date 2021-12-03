{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.Argument.Information where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Data.Product
import qualified MAlonzo.Code.Reflection.Argument.Relevance
import qualified MAlonzo.Code.Reflection.Argument.Visibility
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core
import qualified MAlonzo.Code.Relation.Nullary.Product

name6 = "Reflection.Argument.Information.visibility"
d6 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T48
d6 v0
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C68 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name10 = "Reflection.Argument.Information.relevance"
d10 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T56
d10 v0
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C68 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name22 = "Reflection.Argument.Information.arg-info-injective₁"
d22 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T48 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T56 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T48 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T56 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d22 = erased
name32 = "Reflection.Argument.Information.arg-info-injective₂"
d32 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T48 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T56 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T48 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T56 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d32 = erased
name42 = "Reflection.Argument.Information.arg-info-injective"
d42 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T48 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T56 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T48 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T56 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d42 v0 v1 v2 v3 = du42
du42 ::
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du42 = coe MAlonzo.Code.Data.Product.du132 erased erased
name44 = "Reflection.Argument.Information._≟_"
d44 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T62 ->
  MAlonzo.Code.Relation.Nullary.T32
d44 v0 v1
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C68 v2 v3
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C68 v4 v5
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
                    (coe MAlonzo.Code.Data.Product.du264 erased)
                    (coe
                       MAlonzo.Code.Relation.Nullary.Product.du30
                       (coe
                          MAlonzo.Code.Reflection.Argument.Visibility.d6 (coe v2) (coe v4))
                       (coe
                          MAlonzo.Code.Reflection.Argument.Relevance.d6 (coe v3) (coe v5)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
