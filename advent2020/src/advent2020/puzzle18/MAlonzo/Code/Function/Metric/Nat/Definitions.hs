{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Function.Metric.Nat.Definitions where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

name14 = "Function.Metric.Nat.Definitions.Congruent"
d14 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d14 = erased
name20 = "Function.Metric.Nat.Definitions.Indiscernable"
d20 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d20 = erased
name26 = "Function.Metric.Nat.Definitions.Definite"
d26 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d26 = erased
name32 = "Function.Metric.Nat.Definitions.Symmetric"
d32 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny -> Integer) -> ()
d32 = erased
name34 = "Function.Metric.Nat.Definitions.Bounded"
d34 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny -> Integer) -> ()
d34 = erased
name36 = "Function.Metric.Nat.Definitions.TranslationInvariant"
d36 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> Integer) -> ()
d36 = erased
name38 = "Function.Metric.Nat.Definitions.TriangleInequality"
d38 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny -> Integer) -> ()
d38 = erased
name40 = "Function.Metric.Nat.Definitions.MaxTriangleInequality"
d40 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny -> Integer) -> ()
d40 = erased
name42 = "Function.Metric.Nat.Definitions.Contracting"
d42 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d42 = erased
name44 = "Function.Metric.Nat.Definitions.ContractingOnOrbits"
d44 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d44 = erased
name46 = "Function.Metric.Nat.Definitions.StrictlyContracting"
d46 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d46 = erased
name50
  = "Function.Metric.Nat.Definitions.StrictlyContractingOnOrbits"
d50 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d50 = erased
