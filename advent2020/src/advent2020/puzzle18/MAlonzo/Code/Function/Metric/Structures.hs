{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Function.Metric.Structures where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Relation.Binary.Structures

name30 = "Function.Metric.Structures.IsProtoMetric"
d30 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 = ()
data T30
  = C1309 MAlonzo.Code.Relation.Binary.Structures.T118
          MAlonzo.Code.Relation.Binary.Structures.T26
          (AgdaAny ->
           AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny)
          (AgdaAny -> AgdaAny -> AgdaAny)
name42 = "Function.Metric.Structures.IsProtoMetric.isPartialOrder"
d42 :: T30 -> MAlonzo.Code.Relation.Binary.Structures.T118
d42 v0
  = case coe v0 of
      C1309 v1 v2 v3 v4 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name44 = "Function.Metric.Structures.IsProtoMetric.≈-isEquivalence"
d44 :: T30 -> MAlonzo.Code.Relation.Binary.Structures.T26
d44 v0
  = case coe v0 of
      C1309 v1 v2 v3 v4 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name46 = "Function.Metric.Structures.IsProtoMetric.cong"
d46 ::
  T30 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d46 v0
  = case coe v0 of
      C1309 v1 v2 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name48 = "Function.Metric.Structures.IsProtoMetric.nonNegative"
d48 :: T30 -> AgdaAny -> AgdaAny -> AgdaAny
d48 v0
  = case coe v0 of
      C1309 v1 v2 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name52 = "Function.Metric.Structures.IsProtoMetric._.antisym"
d52 :: T30 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d52 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128 (coe d42 (coe v0))
name54 = "Function.Metric.Structures.IsProtoMetric._.isEquivalence"
d54 :: T30 -> MAlonzo.Code.Relation.Binary.Structures.T26
d54 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126 (coe d42 (coe v0)))
name56 = "Function.Metric.Structures.IsProtoMetric._.isPreorder"
d56 :: T30 -> MAlonzo.Code.Relation.Binary.Structures.T70
d56 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126 (coe d42 (coe v0))
name58 = "Function.Metric.Structures.IsProtoMetric._.refl"
d58 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> T30 -> AgdaAny -> AgdaAny
d58 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du58 v12
du58 :: T30 -> AgdaAny -> AgdaAny
du58 v0
  = let v1 = d42 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))
name60 = "Function.Metric.Structures.IsProtoMetric._.reflexive"
d60 :: T30 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d60 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126 (coe d42 (coe v0)))
name62 = "Function.Metric.Structures.IsProtoMetric._.trans"
d62 ::
  T30 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d62 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126 (coe d42 (coe v0)))
name64 = "Function.Metric.Structures.IsProtoMetric._.∼-resp-≈"
d64 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T30 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d64 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du64 v12
du64 :: T30 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du64 v0
  = let v1 = d42 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))
name66 = "Function.Metric.Structures.IsProtoMetric._.∼-respʳ-≈"
d66 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T30 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d66 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du66 v12
du66 ::
  T30 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du66 v0
  = let v1 = d42 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))
name68 = "Function.Metric.Structures.IsProtoMetric._.∼-respˡ-≈"
d68 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T30 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d68 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du68 v12
du68 ::
  T30 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du68 v0
  = let v1 = d42 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))
name72
  = "Function.Metric.Structures.IsProtoMetric._.Eq.isPartialEquivalence"
d72 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T30 -> MAlonzo.Code.Relation.Binary.Structures.T16
d72 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du72 v12
du72 :: T30 -> MAlonzo.Code.Relation.Binary.Structures.T16
du72 v0
  = let v1 = d42 (coe v0) in
    let v2 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v2))
name74 = "Function.Metric.Structures.IsProtoMetric._.Eq.refl"
d74 :: T30 -> AgdaAny -> AgdaAny
d74 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126 (coe d42 (coe v0))))
name76 = "Function.Metric.Structures.IsProtoMetric._.Eq.reflexive"
d76 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T30 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d76 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du76 v12
du76 ::
  T30 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du76 v0
  = let v1 = d42 (coe v0) in
    let v2 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1) in
    \ v3 v4 v5 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v2)) v3
name78 = "Function.Metric.Structures.IsProtoMetric._.Eq.sym"
d78 :: T30 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d78 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126 (coe d42 (coe v0))))
name80 = "Function.Metric.Structures.IsProtoMetric._.Eq.trans"
d80 ::
  T30 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d80 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126 (coe d42 (coe v0))))
name84
  = "Function.Metric.Structures.IsProtoMetric.EqC.isPartialEquivalence"
d84 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T30 -> MAlonzo.Code.Relation.Binary.Structures.T16
d84 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du84 v12
du84 :: T30 -> MAlonzo.Code.Relation.Binary.Structures.T16
du84 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.du42 (coe d44 (coe v0))
name86 = "Function.Metric.Structures.IsProtoMetric.EqC.refl"
d86 :: T30 -> AgdaAny -> AgdaAny
d86 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34 (coe d44 (coe v0))
name88 = "Function.Metric.Structures.IsProtoMetric.EqC.reflexive"
d88 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T30 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d88 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du88 v12
du88 ::
  T30 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du88 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Relation.Binary.Structures.du40 (coe d44 (coe v0)) v1
name90 = "Function.Metric.Structures.IsProtoMetric.EqC.sym"
d90 :: T30 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d90 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36 (coe d44 (coe v0))
name92 = "Function.Metric.Structures.IsProtoMetric.EqC.trans"
d92 ::
  T30 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d92 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38 (coe d44 (coe v0))
name96 = "Function.Metric.Structures.IsPreMetric"
d96 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 = ()
data T96 = C3595 T30 (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny)
name104 = "Function.Metric.Structures.IsPreMetric.isProtoMetric"
d104 :: T96 -> T30
d104 v0
  = case coe v0 of
      C3595 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name106 = "Function.Metric.Structures.IsPreMetric.≈⇒0"
d106 :: T96 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d106 v0
  = case coe v0 of
      C3595 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name110 = "Function.Metric.Structures.IsPreMetric._.antisym"
d110 :: T96 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d110 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe d42 (coe d104 (coe v0)))
name112 = "Function.Metric.Structures.IsPreMetric._.cong"
d112 ::
  T96 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d112 v0 = coe d46 (coe d104 (coe v0))
name114 = "Function.Metric.Structures.IsPreMetric._.isEquivalence"
d114 :: T96 -> MAlonzo.Code.Relation.Binary.Structures.T26
d114 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe v0))))
name116 = "Function.Metric.Structures.IsPreMetric._.isPartialOrder"
d116 :: T96 -> MAlonzo.Code.Relation.Binary.Structures.T118
d116 v0 = coe d42 (coe d104 (coe v0))
name118 = "Function.Metric.Structures.IsPreMetric._.isPreorder"
d118 :: T96 -> MAlonzo.Code.Relation.Binary.Structures.T70
d118 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe d42 (coe d104 (coe v0)))
name120 = "Function.Metric.Structures.IsPreMetric._.nonNegative"
d120 :: T96 -> AgdaAny -> AgdaAny -> AgdaAny
d120 v0 = coe d48 (coe d104 (coe v0))
name122 = "Function.Metric.Structures.IsPreMetric._.refl"
d122 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> T96 -> AgdaAny -> AgdaAny
d122 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du122 v12
du122 :: T96 -> AgdaAny -> AgdaAny
du122 v0
  = let v1 = d104 (coe v0) in
    let v2 = d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name124 = "Function.Metric.Structures.IsPreMetric._.reflexive"
d124 :: T96 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d124 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe v0))))
name126 = "Function.Metric.Structures.IsPreMetric._.trans"
d126 ::
  T96 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d126 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe v0))))
name128
  = "Function.Metric.Structures.IsPreMetric._.≈-isEquivalence"
d128 :: T96 -> MAlonzo.Code.Relation.Binary.Structures.T26
d128 v0 = coe d44 (coe d104 (coe v0))
name130 = "Function.Metric.Structures.IsPreMetric._.∼-resp-≈"
d130 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T96 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d130 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du130 v12
du130 :: T96 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du130 v0
  = let v1 = d104 (coe v0) in
    let v2 = d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name132 = "Function.Metric.Structures.IsPreMetric._.∼-respʳ-≈"
d132 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T96 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d132 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du132 v12
du132 ::
  T96 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du132 v0
  = let v1 = d104 (coe v0) in
    let v2 = d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name134 = "Function.Metric.Structures.IsPreMetric._.∼-respˡ-≈"
d134 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T96 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d134 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du134 v12
du134 ::
  T96 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du134 v0
  = let v1 = d104 (coe v0) in
    let v2 = d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name138
  = "Function.Metric.Structures.IsPreMetric._.EqC.isPartialEquivalence"
d138 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T96 -> MAlonzo.Code.Relation.Binary.Structures.T16
d138 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du138 v12
du138 :: T96 -> MAlonzo.Code.Relation.Binary.Structures.T16
du138 v0
  = let v1 = d104 (coe v0) in
    coe MAlonzo.Code.Relation.Binary.Structures.du42 (coe d44 (coe v1))
name140 = "Function.Metric.Structures.IsPreMetric._.EqC.refl"
d140 :: T96 -> AgdaAny -> AgdaAny
d140 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe d44 (coe d104 (coe v0)))
name142 = "Function.Metric.Structures.IsPreMetric._.EqC.reflexive"
d142 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T96 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d142 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du142 v12
du142 ::
  T96 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du142 v0
  = let v1 = d104 (coe v0) in
    \ v2 v3 v4 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40 (coe d44 (coe v1)) v2
name144 = "Function.Metric.Structures.IsPreMetric._.EqC.sym"
d144 :: T96 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d144 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe d44 (coe d104 (coe v0)))
name146 = "Function.Metric.Structures.IsPreMetric._.EqC.trans"
d146 ::
  T96 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d146 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe d44 (coe d104 (coe v0)))
name150
  = "Function.Metric.Structures.IsPreMetric._.Eq.isPartialEquivalence"
d150 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T96 -> MAlonzo.Code.Relation.Binary.Structures.T16
d150 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du150 v12
du150 :: T96 -> MAlonzo.Code.Relation.Binary.Structures.T16
du150 v0
  = let v1 = d104 (coe v0) in
    let v2 = d42 (coe v1) in
    let v3 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v3))
name152 = "Function.Metric.Structures.IsPreMetric._.Eq.refl"
d152 :: T96 -> AgdaAny -> AgdaAny
d152 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe v0)))))
name154 = "Function.Metric.Structures.IsPreMetric._.Eq.reflexive"
d154 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T96 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d154 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du154 v12
du154 ::
  T96 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du154 v0
  = let v1 = d104 (coe v0) in
    let v2 = d42 (coe v1) in
    let v3 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2) in
    \ v4 v5 v6 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v3)) v4
name156 = "Function.Metric.Structures.IsPreMetric._.Eq.sym"
d156 :: T96 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d156 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe v0)))))
name158 = "Function.Metric.Structures.IsPreMetric._.Eq.trans"
d158 ::
  T96 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d158 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe v0)))))
name162 = "Function.Metric.Structures.IsQuasiSemiMetric"
d162 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 = ()
data T162 = C5519 T96 (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny)
name170
  = "Function.Metric.Structures.IsQuasiSemiMetric.isPreMetric"
d170 :: T162 -> T96
d170 v0
  = case coe v0 of
      C5519 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name172 = "Function.Metric.Structures.IsQuasiSemiMetric.0⇒≈"
d172 :: T162 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d172 v0
  = case coe v0 of
      C5519 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name176 = "Function.Metric.Structures.IsQuasiSemiMetric._.antisym"
d176 :: T162 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d176 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe d42 (coe d104 (coe d170 (coe v0))))
name178 = "Function.Metric.Structures.IsQuasiSemiMetric._.cong"
d178 ::
  T162 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d178 v0 = coe d46 (coe d104 (coe d170 (coe v0)))
name180
  = "Function.Metric.Structures.IsQuasiSemiMetric._.isEquivalence"
d180 :: T162 -> MAlonzo.Code.Relation.Binary.Structures.T26
d180 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe v0)))))
name182
  = "Function.Metric.Structures.IsQuasiSemiMetric._.isPartialOrder"
d182 :: T162 -> MAlonzo.Code.Relation.Binary.Structures.T118
d182 v0 = coe d42 (coe d104 (coe d170 (coe v0)))
name184
  = "Function.Metric.Structures.IsQuasiSemiMetric._.isPreorder"
d184 :: T162 -> MAlonzo.Code.Relation.Binary.Structures.T70
d184 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe d42 (coe d104 (coe d170 (coe v0))))
name186
  = "Function.Metric.Structures.IsQuasiSemiMetric._.isProtoMetric"
d186 :: T162 -> T30
d186 v0 = coe d104 (coe d170 (coe v0))
name188
  = "Function.Metric.Structures.IsQuasiSemiMetric._.nonNegative"
d188 :: T162 -> AgdaAny -> AgdaAny -> AgdaAny
d188 v0 = coe d48 (coe d104 (coe d170 (coe v0)))
name190 = "Function.Metric.Structures.IsQuasiSemiMetric._.refl"
d190 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> T162 -> AgdaAny -> AgdaAny
d190 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du190 v12
du190 :: T162 -> AgdaAny -> AgdaAny
du190 v0
  = let v1 = d170 (coe v0) in
    let v2 = d104 (coe v1) in
    let v3 = d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name192
  = "Function.Metric.Structures.IsQuasiSemiMetric._.reflexive"
d192 :: T162 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d192 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe v0)))))
name194 = "Function.Metric.Structures.IsQuasiSemiMetric._.trans"
d194 ::
  T162 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d194 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe v0)))))
name196
  = "Function.Metric.Structures.IsQuasiSemiMetric._.≈-isEquivalence"
d196 :: T162 -> MAlonzo.Code.Relation.Binary.Structures.T26
d196 v0 = coe d44 (coe d104 (coe d170 (coe v0)))
name198 = "Function.Metric.Structures.IsQuasiSemiMetric._.≈⇒0"
d198 :: T162 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d198 v0 = coe d106 (coe d170 (coe v0))
name200 = "Function.Metric.Structures.IsQuasiSemiMetric._.∼-resp-≈"
d200 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T162 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d200 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du200 v12
du200 :: T162 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du200 v0
  = let v1 = d170 (coe v0) in
    let v2 = d104 (coe v1) in
    let v3 = d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name202
  = "Function.Metric.Structures.IsQuasiSemiMetric._.∼-respʳ-≈"
d202 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T162 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d202 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du202 v12
du202 ::
  T162 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du202 v0
  = let v1 = d170 (coe v0) in
    let v2 = d104 (coe v1) in
    let v3 = d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name204
  = "Function.Metric.Structures.IsQuasiSemiMetric._.∼-respˡ-≈"
d204 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T162 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d204 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du204 v12
du204 ::
  T162 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du204 v0
  = let v1 = d170 (coe v0) in
    let v2 = d104 (coe v1) in
    let v3 = d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name208
  = "Function.Metric.Structures.IsQuasiSemiMetric._.EqC.isPartialEquivalence"
d208 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T162 -> MAlonzo.Code.Relation.Binary.Structures.T16
d208 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du208 v12
du208 :: T162 -> MAlonzo.Code.Relation.Binary.Structures.T16
du208 v0
  = let v1 = d170 (coe v0) in
    let v2 = d104 (coe v1) in
    coe MAlonzo.Code.Relation.Binary.Structures.du42 (coe d44 (coe v2))
name210 = "Function.Metric.Structures.IsQuasiSemiMetric._.EqC.refl"
d210 :: T162 -> AgdaAny -> AgdaAny
d210 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe d44 (coe d104 (coe d170 (coe v0))))
name212
  = "Function.Metric.Structures.IsQuasiSemiMetric._.EqC.reflexive"
d212 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T162 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d212 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du212 v12
du212 ::
  T162 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du212 v0
  = let v1 = d170 (coe v0) in
    let v2 = d104 (coe v1) in
    \ v3 v4 v5 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40 (coe d44 (coe v2)) v3
name214 = "Function.Metric.Structures.IsQuasiSemiMetric._.EqC.sym"
d214 :: T162 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d214 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe d44 (coe d104 (coe d170 (coe v0))))
name216
  = "Function.Metric.Structures.IsQuasiSemiMetric._.EqC.trans"
d216 ::
  T162 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d216 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe d44 (coe d104 (coe d170 (coe v0))))
name220
  = "Function.Metric.Structures.IsQuasiSemiMetric._.Eq.isPartialEquivalence"
d220 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T162 -> MAlonzo.Code.Relation.Binary.Structures.T16
d220 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du220 v12
du220 :: T162 -> MAlonzo.Code.Relation.Binary.Structures.T16
du220 v0
  = let v1 = d170 (coe v0) in
    let v2 = d104 (coe v1) in
    let v3 = d42 (coe v2) in
    let v4 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v4))
name222 = "Function.Metric.Structures.IsQuasiSemiMetric._.Eq.refl"
d222 :: T162 -> AgdaAny -> AgdaAny
d222 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe v0))))))
name224
  = "Function.Metric.Structures.IsQuasiSemiMetric._.Eq.reflexive"
d224 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T162 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d224 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du224 v12
du224 ::
  T162 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du224 v0
  = let v1 = d170 (coe v0) in
    let v2 = d104 (coe v1) in
    let v3 = d42 (coe v2) in
    let v4 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3) in
    \ v5 v6 v7 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v4)) v5
name226 = "Function.Metric.Structures.IsQuasiSemiMetric._.Eq.sym"
d226 :: T162 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d226 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe v0))))))
name228 = "Function.Metric.Structures.IsQuasiSemiMetric._.Eq.trans"
d228 ::
  T162 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d228 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe v0))))))
name232 = "Function.Metric.Structures.IsSemiMetric"
d232 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 = ()
data T232 = C7485 T162 (AgdaAny -> AgdaAny -> AgdaAny)
name240
  = "Function.Metric.Structures.IsSemiMetric.isQuasiSemiMetric"
d240 :: T232 -> T162
d240 v0
  = case coe v0 of
      C7485 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name242 = "Function.Metric.Structures.IsSemiMetric.sym"
d242 :: T232 -> AgdaAny -> AgdaAny -> AgdaAny
d242 v0
  = case coe v0 of
      C7485 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name246 = "Function.Metric.Structures.IsSemiMetric._.0⇒≈"
d246 :: T232 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d246 v0 = coe d172 (coe d240 (coe v0))
name248 = "Function.Metric.Structures.IsSemiMetric._.antisym"
d248 :: T232 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d248 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe d42 (coe d104 (coe d170 (coe d240 (coe v0)))))
name250 = "Function.Metric.Structures.IsSemiMetric._.cong"
d250 ::
  T232 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d250 v0 = coe d46 (coe d104 (coe d170 (coe d240 (coe v0))))
name252 = "Function.Metric.Structures.IsSemiMetric._.isEquivalence"
d252 :: T232 -> MAlonzo.Code.Relation.Binary.Structures.T26
d252 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe d240 (coe v0))))))
name254
  = "Function.Metric.Structures.IsSemiMetric._.isPartialOrder"
d254 :: T232 -> MAlonzo.Code.Relation.Binary.Structures.T118
d254 v0 = coe d42 (coe d104 (coe d170 (coe d240 (coe v0))))
name256 = "Function.Metric.Structures.IsSemiMetric._.isPreMetric"
d256 :: T232 -> T96
d256 v0 = coe d170 (coe d240 (coe v0))
name258 = "Function.Metric.Structures.IsSemiMetric._.isPreorder"
d258 :: T232 -> MAlonzo.Code.Relation.Binary.Structures.T70
d258 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe d42 (coe d104 (coe d170 (coe d240 (coe v0)))))
name260 = "Function.Metric.Structures.IsSemiMetric._.isProtoMetric"
d260 :: T232 -> T30
d260 v0 = coe d104 (coe d170 (coe d240 (coe v0)))
name262 = "Function.Metric.Structures.IsSemiMetric._.nonNegative"
d262 :: T232 -> AgdaAny -> AgdaAny -> AgdaAny
d262 v0 = coe d48 (coe d104 (coe d170 (coe d240 (coe v0))))
name264 = "Function.Metric.Structures.IsSemiMetric._.refl"
d264 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> T232 -> AgdaAny -> AgdaAny
d264 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du264 v12
du264 :: T232 -> AgdaAny -> AgdaAny
du264 v0
  = let v1 = d240 (coe v0) in
    let v2 = d170 (coe v1) in
    let v3 = d104 (coe v2) in
    let v4 = d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name266 = "Function.Metric.Structures.IsSemiMetric._.reflexive"
d266 :: T232 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d266 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe d240 (coe v0))))))
name268 = "Function.Metric.Structures.IsSemiMetric._.trans"
d268 ::
  T232 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d268 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe d240 (coe v0))))))
name270
  = "Function.Metric.Structures.IsSemiMetric._.≈-isEquivalence"
d270 :: T232 -> MAlonzo.Code.Relation.Binary.Structures.T26
d270 v0 = coe d44 (coe d104 (coe d170 (coe d240 (coe v0))))
name272 = "Function.Metric.Structures.IsSemiMetric._.≈⇒0"
d272 :: T232 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d272 v0 = coe d106 (coe d170 (coe d240 (coe v0)))
name274 = "Function.Metric.Structures.IsSemiMetric._.∼-resp-≈"
d274 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T232 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d274 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du274 v12
du274 :: T232 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du274 v0
  = let v1 = d240 (coe v0) in
    let v2 = d170 (coe v1) in
    let v3 = d104 (coe v2) in
    let v4 = d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name276 = "Function.Metric.Structures.IsSemiMetric._.∼-respʳ-≈"
d276 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T232 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d276 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du276 v12
du276 ::
  T232 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du276 v0
  = let v1 = d240 (coe v0) in
    let v2 = d170 (coe v1) in
    let v3 = d104 (coe v2) in
    let v4 = d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name278 = "Function.Metric.Structures.IsSemiMetric._.∼-respˡ-≈"
d278 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T232 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d278 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du278 v12
du278 ::
  T232 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du278 v0
  = let v1 = d240 (coe v0) in
    let v2 = d170 (coe v1) in
    let v3 = d104 (coe v2) in
    let v4 = d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name282
  = "Function.Metric.Structures.IsSemiMetric._.EqC.isPartialEquivalence"
d282 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T232 -> MAlonzo.Code.Relation.Binary.Structures.T16
d282 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du282 v12
du282 :: T232 -> MAlonzo.Code.Relation.Binary.Structures.T16
du282 v0
  = let v1 = d240 (coe v0) in
    let v2 = d170 (coe v1) in
    let v3 = d104 (coe v2) in
    coe MAlonzo.Code.Relation.Binary.Structures.du42 (coe d44 (coe v3))
name284 = "Function.Metric.Structures.IsSemiMetric._.EqC.refl"
d284 :: T232 -> AgdaAny -> AgdaAny
d284 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe d44 (coe d104 (coe d170 (coe d240 (coe v0)))))
name286 = "Function.Metric.Structures.IsSemiMetric._.EqC.reflexive"
d286 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T232 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d286 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du286 v12
du286 ::
  T232 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du286 v0
  = let v1 = d240 (coe v0) in
    let v2 = d170 (coe v1) in
    let v3 = d104 (coe v2) in
    \ v4 v5 v6 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40 (coe d44 (coe v3)) v4
name288 = "Function.Metric.Structures.IsSemiMetric._.EqC.sym"
d288 :: T232 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d288 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe d44 (coe d104 (coe d170 (coe d240 (coe v0)))))
name290 = "Function.Metric.Structures.IsSemiMetric._.EqC.trans"
d290 ::
  T232 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d290 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe d44 (coe d104 (coe d170 (coe d240 (coe v0)))))
name294
  = "Function.Metric.Structures.IsSemiMetric._.Eq.isPartialEquivalence"
d294 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T232 -> MAlonzo.Code.Relation.Binary.Structures.T16
d294 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du294 v12
du294 :: T232 -> MAlonzo.Code.Relation.Binary.Structures.T16
du294 v0
  = let v1 = d240 (coe v0) in
    let v2 = d170 (coe v1) in
    let v3 = d104 (coe v2) in
    let v4 = d42 (coe v3) in
    let v5 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v5))
name296 = "Function.Metric.Structures.IsSemiMetric._.Eq.refl"
d296 :: T232 -> AgdaAny -> AgdaAny
d296 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe d240 (coe v0)))))))
name298 = "Function.Metric.Structures.IsSemiMetric._.Eq.reflexive"
d298 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T232 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d298 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 = du298 v12
du298 ::
  T232 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du298 v0
  = let v1 = d240 (coe v0) in
    let v2 = d170 (coe v1) in
    let v3 = d104 (coe v2) in
    let v4 = d42 (coe v3) in
    let v5 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4) in
    \ v6 v7 v8 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v5)) v6
name300 = "Function.Metric.Structures.IsSemiMetric._.Eq.sym"
d300 :: T232 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d300 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe d240 (coe v0)))))))
name302 = "Function.Metric.Structures.IsSemiMetric._.Eq.trans"
d302 ::
  T232 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d302 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe d240 (coe v0)))))))
name308 = "Function.Metric.Structures.IsGeneralMetric"
d308 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 = ()
data T308 = C9643 T232 (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny)
name318 = "Function.Metric.Structures.IsGeneralMetric.isSemiMetric"
d318 :: T308 -> T232
d318 v0
  = case coe v0 of
      C9643 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name320 = "Function.Metric.Structures.IsGeneralMetric.triangle"
d320 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d320 v0
  = case coe v0 of
      C9643 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name324 = "Function.Metric.Structures.IsGeneralMetric._.0⇒≈"
d324 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d324 v0 = coe d172 (coe d240 (coe d318 (coe v0)))
name326 = "Function.Metric.Structures.IsGeneralMetric._.antisym"
d326 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d326 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))))
name328 = "Function.Metric.Structures.IsGeneralMetric._.cong"
d328 ::
  T308 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d328 v0
  = coe d46 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0)))))
name330
  = "Function.Metric.Structures.IsGeneralMetric._.isEquivalence"
d330 :: T308 -> MAlonzo.Code.Relation.Binary.Structures.T26
d330 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0)))))))
name332
  = "Function.Metric.Structures.IsGeneralMetric._.isPartialOrder"
d332 :: T308 -> MAlonzo.Code.Relation.Binary.Structures.T118
d332 v0
  = coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0)))))
name334
  = "Function.Metric.Structures.IsGeneralMetric._.isPreMetric"
d334 :: T308 -> T96
d334 v0 = coe d170 (coe d240 (coe d318 (coe v0)))
name336 = "Function.Metric.Structures.IsGeneralMetric._.isPreorder"
d336 :: T308 -> MAlonzo.Code.Relation.Binary.Structures.T70
d336 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))))
name338
  = "Function.Metric.Structures.IsGeneralMetric._.isProtoMetric"
d338 :: T308 -> T30
d338 v0 = coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))
name340
  = "Function.Metric.Structures.IsGeneralMetric._.isQuasiSemiMetric"
d340 :: T308 -> T162
d340 v0 = coe d240 (coe d318 (coe v0))
name342
  = "Function.Metric.Structures.IsGeneralMetric._.nonNegative"
d342 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny
d342 v0
  = coe d48 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0)))))
name344 = "Function.Metric.Structures.IsGeneralMetric._.refl"
d344 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> T308 -> AgdaAny -> AgdaAny
d344 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du344 v13
du344 :: T308 -> AgdaAny -> AgdaAny
du344 v0
  = let v1 = d318 (coe v0) in
    let v2 = d240 (coe v1) in
    let v3 = d170 (coe v2) in
    let v4 = d104 (coe v3) in
    let v5 = d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name346 = "Function.Metric.Structures.IsGeneralMetric._.reflexive"
d346 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d346 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0)))))))
name348 = "Function.Metric.Structures.IsGeneralMetric._.sym"
d348 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny
d348 v0 = coe d242 (coe d318 (coe v0))
name350 = "Function.Metric.Structures.IsGeneralMetric._.trans"
d350 ::
  T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d350 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0)))))))
name352
  = "Function.Metric.Structures.IsGeneralMetric._.≈-isEquivalence"
d352 :: T308 -> MAlonzo.Code.Relation.Binary.Structures.T26
d352 v0
  = coe d44 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0)))))
name354 = "Function.Metric.Structures.IsGeneralMetric._.≈⇒0"
d354 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d354 v0 = coe d106 (coe d170 (coe d240 (coe d318 (coe v0))))
name356 = "Function.Metric.Structures.IsGeneralMetric._.∼-resp-≈"
d356 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T308 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d356 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du356 v13
du356 :: T308 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du356 v0
  = let v1 = d318 (coe v0) in
    let v2 = d240 (coe v1) in
    let v3 = d170 (coe v2) in
    let v4 = d104 (coe v3) in
    let v5 = d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name358 = "Function.Metric.Structures.IsGeneralMetric._.∼-respʳ-≈"
d358 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d358 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du358 v13
du358 ::
  T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du358 v0
  = let v1 = d318 (coe v0) in
    let v2 = d240 (coe v1) in
    let v3 = d170 (coe v2) in
    let v4 = d104 (coe v3) in
    let v5 = d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name360 = "Function.Metric.Structures.IsGeneralMetric._.∼-respˡ-≈"
d360 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d360 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du360 v13
du360 ::
  T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du360 v0
  = let v1 = d318 (coe v0) in
    let v2 = d240 (coe v1) in
    let v3 = d170 (coe v2) in
    let v4 = d104 (coe v3) in
    let v5 = d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name364
  = "Function.Metric.Structures.IsGeneralMetric._.EqC.isPartialEquivalence"
d364 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T308 -> MAlonzo.Code.Relation.Binary.Structures.T16
d364 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du364 v13
du364 :: T308 -> MAlonzo.Code.Relation.Binary.Structures.T16
du364 v0
  = let v1 = d318 (coe v0) in
    let v2 = d240 (coe v1) in
    let v3 = d170 (coe v2) in
    let v4 = d104 (coe v3) in
    coe MAlonzo.Code.Relation.Binary.Structures.du42 (coe d44 (coe v4))
name366 = "Function.Metric.Structures.IsGeneralMetric._.EqC.refl"
d366 :: T308 -> AgdaAny -> AgdaAny
d366 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe d44 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))))
name368
  = "Function.Metric.Structures.IsGeneralMetric._.EqC.reflexive"
d368 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d368 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du368 v13
du368 ::
  T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du368 v0
  = let v1 = d318 (coe v0) in
    let v2 = d240 (coe v1) in
    let v3 = d170 (coe v2) in
    let v4 = d104 (coe v3) in
    \ v5 v6 v7 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40 (coe d44 (coe v4)) v5
name370 = "Function.Metric.Structures.IsGeneralMetric._.EqC.sym"
d370 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d370 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe d44 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))))
name372 = "Function.Metric.Structures.IsGeneralMetric._.EqC.trans"
d372 ::
  T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d372 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe d44 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))))
name376
  = "Function.Metric.Structures.IsGeneralMetric._.Eq.isPartialEquivalence"
d376 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T308 -> MAlonzo.Code.Relation.Binary.Structures.T16
d376 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du376 v13
du376 :: T308 -> MAlonzo.Code.Relation.Binary.Structures.T16
du376 v0
  = let v1 = d318 (coe v0) in
    let v2 = d240 (coe v1) in
    let v3 = d170 (coe v2) in
    let v4 = d104 (coe v3) in
    let v5 = d42 (coe v4) in
    let v6 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v6))
name378 = "Function.Metric.Structures.IsGeneralMetric._.Eq.refl"
d378 :: T308 -> AgdaAny -> AgdaAny
d378 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))))))
name380
  = "Function.Metric.Structures.IsGeneralMetric._.Eq.reflexive"
d380 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> ()) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d380 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du380 v13
du380 ::
  T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du380 v0
  = let v1 = d318 (coe v0) in
    let v2 = d240 (coe v1) in
    let v3 = d170 (coe v2) in
    let v4 = d104 (coe v3) in
    let v5 = d42 (coe v4) in
    let v6 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5) in
    \ v7 v8 v9 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v6)) v7
name382 = "Function.Metric.Structures.IsGeneralMetric._.Eq.sym"
d382 :: T308 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d382 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))))))
name384 = "Function.Metric.Structures.IsGeneralMetric._.Eq.trans"
d384 ::
  T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d384 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe d42 (coe d104 (coe d170 (coe d240 (coe d318 (coe v0))))))))
