{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Function.Metric.Bundles where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Function.Metric.Structures
import qualified MAlonzo.Code.Relation.Binary.Structures

name16 = "Function.Metric.Bundles.ProtoMetric"
d16 a0 a1 a2 a3 a4 = ()
data T16
  = C607 AgdaAny (AgdaAny -> AgdaAny -> AgdaAny)
         MAlonzo.Code.Function.Metric.Structures.T30
name44 = "Function.Metric.Bundles.ProtoMetric.Carrier"
d44 :: T16 -> ()
d44 = erased
name46 = "Function.Metric.Bundles.ProtoMetric.Image"
d46 :: T16 -> ()
d46 = erased
name48 = "Function.Metric.Bundles.ProtoMetric._≈_"
d48 :: T16 -> AgdaAny -> AgdaAny -> ()
d48 = erased
name50 = "Function.Metric.Bundles.ProtoMetric._≈ᵢ_"
d50 :: T16 -> AgdaAny -> AgdaAny -> ()
d50 = erased
name52 = "Function.Metric.Bundles.ProtoMetric._≤_"
d52 :: T16 -> AgdaAny -> AgdaAny -> ()
d52 = erased
name54 = "Function.Metric.Bundles.ProtoMetric.0#"
d54 :: T16 -> AgdaAny
d54 v0
  = case coe v0 of
      C607 v6 v7 v8 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name56 = "Function.Metric.Bundles.ProtoMetric.d"
d56 :: T16 -> AgdaAny -> AgdaAny -> AgdaAny
d56 v0
  = case coe v0 of
      C607 v6 v7 v8 -> coe v7
      _ -> MAlonzo.RTE.mazUnreachableError
name58 = "Function.Metric.Bundles.ProtoMetric.isProtoMetric"
d58 :: T16 -> MAlonzo.Code.Function.Metric.Structures.T30
d58 v0
  = case coe v0 of
      C607 v6 v7 v8 -> coe v8
      _ -> MAlonzo.RTE.mazUnreachableError
name62 = "Function.Metric.Bundles.ProtoMetric._.antisym"
d62 :: T16 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d62 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0)))
name64 = "Function.Metric.Bundles.ProtoMetric._.cong"
d64 ::
  T16 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d64 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d46 (coe d58 (coe v0))
name66 = "Function.Metric.Bundles.ProtoMetric._.isEquivalence"
d66 :: T16 -> MAlonzo.Code.Relation.Binary.Structures.T26
d66 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0))))
name68 = "Function.Metric.Bundles.ProtoMetric._.isPartialOrder"
d68 :: T16 -> MAlonzo.Code.Relation.Binary.Structures.T118
d68 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0))
name70 = "Function.Metric.Bundles.ProtoMetric._.isPreorder"
d70 :: T16 -> MAlonzo.Code.Relation.Binary.Structures.T70
d70 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0)))
name72 = "Function.Metric.Bundles.ProtoMetric._.nonNegative"
d72 :: T16 -> AgdaAny -> AgdaAny -> AgdaAny
d72 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48 (coe d58 (coe v0))
name74 = "Function.Metric.Bundles.ProtoMetric._.refl"
d74 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T16 -> AgdaAny -> AgdaAny
d74 v0 v1 v2 v3 v4 v5 = du74 v5
du74 :: T16 -> AgdaAny -> AgdaAny
du74 v0
  = let v1 = d58 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name76 = "Function.Metric.Bundles.ProtoMetric._.reflexive"
d76 :: T16 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d76 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0))))
name78 = "Function.Metric.Bundles.ProtoMetric._.trans"
d78 ::
  T16 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d78 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0))))
name80 = "Function.Metric.Bundles.ProtoMetric._.≈-isEquivalence"
d80 :: T16 -> MAlonzo.Code.Relation.Binary.Structures.T26
d80 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44 (coe d58 (coe v0))
name82 = "Function.Metric.Bundles.ProtoMetric._.∼-resp-≈"
d82 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T16 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d82 v0 v1 v2 v3 v4 v5 = du82 v5
du82 :: T16 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du82 v0
  = let v1 = d58 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name84 = "Function.Metric.Bundles.ProtoMetric._.∼-respʳ-≈"
d84 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T16 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d84 v0 v1 v2 v3 v4 v5 = du84 v5
du84 ::
  T16 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du84 v0
  = let v1 = d58 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name86 = "Function.Metric.Bundles.ProtoMetric._.∼-respˡ-≈"
d86 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T16 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d86 v0 v1 v2 v3 v4 v5 = du86 v5
du86 ::
  T16 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du86 v0
  = let v1 = d58 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name90
  = "Function.Metric.Bundles.ProtoMetric._.EqC.isPartialEquivalence"
d90 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T16 -> MAlonzo.Code.Relation.Binary.Structures.T16
d90 v0 v1 v2 v3 v4 v5 = du90 v5
du90 :: T16 -> MAlonzo.Code.Relation.Binary.Structures.T16
du90 v0
  = let v1 = d58 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v1))
name92 = "Function.Metric.Bundles.ProtoMetric._.EqC.refl"
d92 :: T16 -> AgdaAny -> AgdaAny
d92 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44 (coe d58 (coe v0)))
name94 = "Function.Metric.Bundles.ProtoMetric._.EqC.reflexive"
d94 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T16 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d94 v0 v1 v2 v3 v4 v5 = du94 v5
du94 ::
  T16 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du94 v0
  = let v1 = d58 (coe v0) in
    \ v2 v3 v4 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v1)) v2
name96 = "Function.Metric.Bundles.ProtoMetric._.EqC.sym"
d96 :: T16 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d96 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44 (coe d58 (coe v0)))
name98 = "Function.Metric.Bundles.ProtoMetric._.EqC.trans"
d98 ::
  T16 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d98 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44 (coe d58 (coe v0)))
name102
  = "Function.Metric.Bundles.ProtoMetric._.Eq.isPartialEquivalence"
d102 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T16 -> MAlonzo.Code.Relation.Binary.Structures.T16
d102 v0 v1 v2 v3 v4 v5 = du102 v5
du102 :: T16 -> MAlonzo.Code.Relation.Binary.Structures.T16
du102 v0
  = let v1 = d58 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    let v3 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v3))
name104 = "Function.Metric.Bundles.ProtoMetric._.Eq.refl"
d104 :: T16 -> AgdaAny -> AgdaAny
d104 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0)))))
name106 = "Function.Metric.Bundles.ProtoMetric._.Eq.reflexive"
d106 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T16 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d106 v0 v1 v2 v3 v4 v5 = du106 v5
du106 ::
  T16 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du106 v0
  = let v1 = d58 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    let v3 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2) in
    \ v4 v5 v6 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v3)) v4
name108 = "Function.Metric.Bundles.ProtoMetric._.Eq.sym"
d108 :: T16 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d108 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0)))))
name110 = "Function.Metric.Bundles.ProtoMetric._.Eq.trans"
d110 ::
  T16 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d110 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42 (coe d58 (coe v0)))))
name122 = "Function.Metric.Bundles.PreMetric"
d122 a0 a1 a2 a3 a4 = ()
data T122
  = C2519 AgdaAny (AgdaAny -> AgdaAny -> AgdaAny)
          MAlonzo.Code.Function.Metric.Structures.T96
name150 = "Function.Metric.Bundles.PreMetric.Carrier"
d150 :: T122 -> ()
d150 = erased
name152 = "Function.Metric.Bundles.PreMetric.Image"
d152 :: T122 -> ()
d152 = erased
name154 = "Function.Metric.Bundles.PreMetric._≈_"
d154 :: T122 -> AgdaAny -> AgdaAny -> ()
d154 = erased
name156 = "Function.Metric.Bundles.PreMetric._≈ᵢ_"
d156 :: T122 -> AgdaAny -> AgdaAny -> ()
d156 = erased
name158 = "Function.Metric.Bundles.PreMetric._≤_"
d158 :: T122 -> AgdaAny -> AgdaAny -> ()
d158 = erased
name160 = "Function.Metric.Bundles.PreMetric.0#"
d160 :: T122 -> AgdaAny
d160 v0
  = case coe v0 of
      C2519 v6 v7 v8 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name162 = "Function.Metric.Bundles.PreMetric.d"
d162 :: T122 -> AgdaAny -> AgdaAny -> AgdaAny
d162 v0
  = case coe v0 of
      C2519 v6 v7 v8 -> coe v7
      _ -> MAlonzo.RTE.mazUnreachableError
name164 = "Function.Metric.Bundles.PreMetric.isPreMetric"
d164 :: T122 -> MAlonzo.Code.Function.Metric.Structures.T96
d164 v0
  = case coe v0 of
      C2519 v6 v7 v8 -> coe v8
      _ -> MAlonzo.RTE.mazUnreachableError
name168 = "Function.Metric.Bundles.PreMetric._.antisym"
d168 :: T122 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d168 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0))))
name170 = "Function.Metric.Bundles.PreMetric._.cong"
d170 ::
  T122 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d170 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d46
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0)))
name172 = "Function.Metric.Bundles.PreMetric._.isEquivalence"
d172 :: T122 -> MAlonzo.Code.Relation.Binary.Structures.T26
d172 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0)))))
name174 = "Function.Metric.Bundles.PreMetric._.isPartialOrder"
d174 :: T122 -> MAlonzo.Code.Relation.Binary.Structures.T118
d174 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0)))
name176 = "Function.Metric.Bundles.PreMetric._.isPreorder"
d176 :: T122 -> MAlonzo.Code.Relation.Binary.Structures.T70
d176 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0))))
name178 = "Function.Metric.Bundles.PreMetric._.isProtoMetric"
d178 :: T122 -> MAlonzo.Code.Function.Metric.Structures.T30
d178 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0))
name180 = "Function.Metric.Bundles.PreMetric._.nonNegative"
d180 :: T122 -> AgdaAny -> AgdaAny -> AgdaAny
d180 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0)))
name182 = "Function.Metric.Bundles.PreMetric._.refl"
d182 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T122 -> AgdaAny -> AgdaAny
d182 v0 v1 v2 v3 v4 v5 = du182 v5
du182 :: T122 -> AgdaAny -> AgdaAny
du182 v0
  = let v1 = d164 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name184 = "Function.Metric.Bundles.PreMetric._.reflexive"
d184 :: T122 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d184 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0)))))
name186 = "Function.Metric.Bundles.PreMetric._.trans"
d186 ::
  T122 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d186 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0)))))
name188 = "Function.Metric.Bundles.PreMetric._.≈-isEquivalence"
d188 :: T122 -> MAlonzo.Code.Relation.Binary.Structures.T26
d188 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0)))
name190 = "Function.Metric.Bundles.PreMetric._.≈⇒0"
d190 :: T122 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d190 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d106 (coe d164 (coe v0))
name192 = "Function.Metric.Bundles.PreMetric._.∼-resp-≈"
d192 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T122 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d192 v0 v1 v2 v3 v4 v5 = du192 v5
du192 :: T122 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du192 v0
  = let v1 = d164 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name194 = "Function.Metric.Bundles.PreMetric._.∼-respʳ-≈"
d194 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T122 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d194 v0 v1 v2 v3 v4 v5 = du194 v5
du194 ::
  T122 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du194 v0
  = let v1 = d164 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name196 = "Function.Metric.Bundles.PreMetric._.∼-respˡ-≈"
d196 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T122 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d196 v0 v1 v2 v3 v4 v5 = du196 v5
du196 ::
  T122 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du196 v0
  = let v1 = d164 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name200
  = "Function.Metric.Bundles.PreMetric._.EqC.isPartialEquivalence"
d200 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T122 -> MAlonzo.Code.Relation.Binary.Structures.T16
d200 v0 v1 v2 v3 v4 v5 = du200 v5
du200 :: T122 -> MAlonzo.Code.Relation.Binary.Structures.T16
du200 v0
  = let v1 = d164 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v2))
name202 = "Function.Metric.Bundles.PreMetric._.EqC.refl"
d202 :: T122 -> AgdaAny -> AgdaAny
d202 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0))))
name204 = "Function.Metric.Bundles.PreMetric._.EqC.reflexive"
d204 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T122 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d204 v0 v1 v2 v3 v4 v5 = du204 v5
du204 ::
  T122 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du204 v0
  = let v1 = d164 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    \ v3 v4 v5 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v2)) v3
name206 = "Function.Metric.Bundles.PreMetric._.EqC.sym"
d206 :: T122 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d206 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0))))
name208 = "Function.Metric.Bundles.PreMetric._.EqC.trans"
d208 ::
  T122 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d208 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0))))
name212
  = "Function.Metric.Bundles.PreMetric._.Eq.isPartialEquivalence"
d212 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T122 -> MAlonzo.Code.Relation.Binary.Structures.T16
d212 v0 v1 v2 v3 v4 v5 = du212 v5
du212 :: T122 -> MAlonzo.Code.Relation.Binary.Structures.T16
du212 v0
  = let v1 = d164 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    let v4 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v4))
name214 = "Function.Metric.Bundles.PreMetric._.Eq.refl"
d214 :: T122 -> AgdaAny -> AgdaAny
d214 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe d164 (coe v0))))))
name216 = "Function.Metric.Bundles.PreMetric._.Eq.reflexive"
d216 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T122 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d216 v0 v1 v2 v3 v4 v5 = du216 v5
du216 ::
  T122 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du216 v0
  = let v1 = d164 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    let v4 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3) in
    \ v5 v6 v7 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v4)) v5
name218 = "Function.Metric.Bundles.PreMetric._.Eq.sym"
d218 :: T122 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d218 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe d164 (coe v0))))))
name220 = "Function.Metric.Bundles.PreMetric._.Eq.trans"
d220 ::
  T122 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d220 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe d164 (coe v0))))))
name222 = "Function.Metric.Bundles.PreMetric.protoMetric"
d222 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T122 -> T16
d222 v0 v1 v2 v3 v4 v5 = du222 v5
du222 :: T122 -> T16
du222 v0
  = coe
      C607 (d160 (coe v0)) (d162 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d104 (coe d164 (coe v0)))
name234 = "Function.Metric.Bundles.QuasiSemiMetric"
d234 a0 a1 a2 a3 a4 = ()
data T234
  = C4869 AgdaAny (AgdaAny -> AgdaAny -> AgdaAny)
          MAlonzo.Code.Function.Metric.Structures.T162
name262 = "Function.Metric.Bundles.QuasiSemiMetric.Carrier"
d262 :: T234 -> ()
d262 = erased
name264 = "Function.Metric.Bundles.QuasiSemiMetric.Image"
d264 :: T234 -> ()
d264 = erased
name266 = "Function.Metric.Bundles.QuasiSemiMetric._≈_"
d266 :: T234 -> AgdaAny -> AgdaAny -> ()
d266 = erased
name268 = "Function.Metric.Bundles.QuasiSemiMetric._≈ᵢ_"
d268 :: T234 -> AgdaAny -> AgdaAny -> ()
d268 = erased
name270 = "Function.Metric.Bundles.QuasiSemiMetric._≤_"
d270 :: T234 -> AgdaAny -> AgdaAny -> ()
d270 = erased
name272 = "Function.Metric.Bundles.QuasiSemiMetric.0#"
d272 :: T234 -> AgdaAny
d272 v0
  = case coe v0 of
      C4869 v6 v7 v8 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name274 = "Function.Metric.Bundles.QuasiSemiMetric.d"
d274 :: T234 -> AgdaAny -> AgdaAny -> AgdaAny
d274 v0
  = case coe v0 of
      C4869 v6 v7 v8 -> coe v7
      _ -> MAlonzo.RTE.mazUnreachableError
name276
  = "Function.Metric.Bundles.QuasiSemiMetric.isQuasiSemiMetric"
d276 :: T234 -> MAlonzo.Code.Function.Metric.Structures.T162
d276 v0
  = case coe v0 of
      C4869 v6 v7 v8 -> coe v8
      _ -> MAlonzo.RTE.mazUnreachableError
name280 = "Function.Metric.Bundles.QuasiSemiMetric._.0⇒≈"
d280 :: T234 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d280 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172 (coe d276 (coe v0))
name282 = "Function.Metric.Bundles.QuasiSemiMetric._.antisym"
d282 :: T234 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d282 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0)))))
name284 = "Function.Metric.Bundles.QuasiSemiMetric._.cong"
d284 ::
  T234 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d284 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d46
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0))))
name286 = "Function.Metric.Bundles.QuasiSemiMetric._.isEquivalence"
d286 :: T234 -> MAlonzo.Code.Relation.Binary.Structures.T26
d286 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe d276 (coe v0))))))
name288
  = "Function.Metric.Bundles.QuasiSemiMetric._.isPartialOrder"
d288 :: T234 -> MAlonzo.Code.Relation.Binary.Structures.T118
d288 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0))))
name290 = "Function.Metric.Bundles.QuasiSemiMetric._.isPreMetric"
d290 :: T234 -> MAlonzo.Code.Function.Metric.Structures.T96
d290 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0))
name292 = "Function.Metric.Bundles.QuasiSemiMetric._.isPreorder"
d292 :: T234 -> MAlonzo.Code.Relation.Binary.Structures.T70
d292 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0)))))
name294 = "Function.Metric.Bundles.QuasiSemiMetric._.isProtoMetric"
d294 :: T234 -> MAlonzo.Code.Function.Metric.Structures.T30
d294 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0)))
name296 = "Function.Metric.Bundles.QuasiSemiMetric._.nonNegative"
d296 :: T234 -> AgdaAny -> AgdaAny -> AgdaAny
d296 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0))))
name298 = "Function.Metric.Bundles.QuasiSemiMetric._.refl"
d298 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T234 -> AgdaAny -> AgdaAny
d298 v0 v1 v2 v3 v4 v5 = du298 v5
du298 :: T234 -> AgdaAny -> AgdaAny
du298 v0
  = let v1 = d276 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name300 = "Function.Metric.Bundles.QuasiSemiMetric._.reflexive"
d300 :: T234 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d300 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe d276 (coe v0))))))
name302 = "Function.Metric.Bundles.QuasiSemiMetric._.trans"
d302 ::
  T234 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d302 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe d276 (coe v0))))))
name304
  = "Function.Metric.Bundles.QuasiSemiMetric._.≈-isEquivalence"
d304 :: T234 -> MAlonzo.Code.Relation.Binary.Structures.T26
d304 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0))))
name306 = "Function.Metric.Bundles.QuasiSemiMetric._.≈⇒0"
d306 :: T234 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d306 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d106
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0)))
name308 = "Function.Metric.Bundles.QuasiSemiMetric._.∼-resp-≈"
d308 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T234 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d308 v0 v1 v2 v3 v4 v5 = du308 v5
du308 :: T234 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du308 v0
  = let v1 = d276 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name310 = "Function.Metric.Bundles.QuasiSemiMetric._.∼-respʳ-≈"
d310 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T234 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d310 v0 v1 v2 v3 v4 v5 = du310 v5
du310 ::
  T234 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du310 v0
  = let v1 = d276 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name312 = "Function.Metric.Bundles.QuasiSemiMetric._.∼-respˡ-≈"
d312 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T234 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d312 v0 v1 v2 v3 v4 v5 = du312 v5
du312 ::
  T234 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du312 v0
  = let v1 = d276 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name316
  = "Function.Metric.Bundles.QuasiSemiMetric._.EqC.isPartialEquivalence"
d316 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T234 -> MAlonzo.Code.Relation.Binary.Structures.T16
d316 v0 v1 v2 v3 v4 v5 = du316 v5
du316 :: T234 -> MAlonzo.Code.Relation.Binary.Structures.T16
du316 v0
  = let v1 = d276 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v3))
name318 = "Function.Metric.Bundles.QuasiSemiMetric._.EqC.refl"
d318 :: T234 -> AgdaAny -> AgdaAny
d318 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0)))))
name320 = "Function.Metric.Bundles.QuasiSemiMetric._.EqC.reflexive"
d320 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T234 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d320 v0 v1 v2 v3 v4 v5 = du320 v5
du320 ::
  T234 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du320 v0
  = let v1 = d276 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    \ v4 v5 v6 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v3)) v4
name322 = "Function.Metric.Bundles.QuasiSemiMetric._.EqC.sym"
d322 :: T234 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d322 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0)))))
name324 = "Function.Metric.Bundles.QuasiSemiMetric._.EqC.trans"
d324 ::
  T234 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d324 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0)))))
name328
  = "Function.Metric.Bundles.QuasiSemiMetric._.Eq.isPartialEquivalence"
d328 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T234 -> MAlonzo.Code.Relation.Binary.Structures.T16
d328 v0 v1 v2 v3 v4 v5 = du328 v5
du328 :: T234 -> MAlonzo.Code.Relation.Binary.Structures.T16
du328 v0
  = let v1 = d276 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    let v5 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v5))
name330 = "Function.Metric.Bundles.QuasiSemiMetric._.Eq.refl"
d330 :: T234 -> AgdaAny -> AgdaAny
d330 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe d276 (coe v0)))))))
name332 = "Function.Metric.Bundles.QuasiSemiMetric._.Eq.reflexive"
d332 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T234 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d332 v0 v1 v2 v3 v4 v5 = du332 v5
du332 ::
  T234 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du332 v0
  = let v1 = d276 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    let v5 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4) in
    \ v6 v7 v8 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v5)) v6
name334 = "Function.Metric.Bundles.QuasiSemiMetric._.Eq.sym"
d334 :: T234 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d334 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe d276 (coe v0)))))))
name336 = "Function.Metric.Bundles.QuasiSemiMetric._.Eq.trans"
d336 ::
  T234 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d336 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe d276 (coe v0)))))))
name338 = "Function.Metric.Bundles.QuasiSemiMetric.preMetric"
d338 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T234 -> T122
d338 v0 v1 v2 v3 v4 v5 = du338 v5
du338 :: T234 -> T122
du338 v0
  = coe
      C2519 (d272 (coe v0)) (d274 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d170 (coe d276 (coe v0)))
name342 = "Function.Metric.Bundles.QuasiSemiMetric._.protoMetric"
d342 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T234 -> T16
d342 v0 v1 v2 v3 v4 v5 = du342 v5
du342 :: T234 -> T16
du342 v0 = coe du222 (coe du338 (coe v0))
name354 = "Function.Metric.Bundles.SemiMetric"
d354 a0 a1 a2 a3 a4 = ()
data T354
  = C7407 AgdaAny (AgdaAny -> AgdaAny -> AgdaAny)
          MAlonzo.Code.Function.Metric.Structures.T232
name382 = "Function.Metric.Bundles.SemiMetric.Carrier"
d382 :: T354 -> ()
d382 = erased
name384 = "Function.Metric.Bundles.SemiMetric.Image"
d384 :: T354 -> ()
d384 = erased
name386 = "Function.Metric.Bundles.SemiMetric._≈_"
d386 :: T354 -> AgdaAny -> AgdaAny -> ()
d386 = erased
name388 = "Function.Metric.Bundles.SemiMetric._≈ᵢ_"
d388 :: T354 -> AgdaAny -> AgdaAny -> ()
d388 = erased
name390 = "Function.Metric.Bundles.SemiMetric._≤_"
d390 :: T354 -> AgdaAny -> AgdaAny -> ()
d390 = erased
name392 = "Function.Metric.Bundles.SemiMetric.0#"
d392 :: T354 -> AgdaAny
d392 v0
  = case coe v0 of
      C7407 v6 v7 v8 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name394 = "Function.Metric.Bundles.SemiMetric.d"
d394 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny
d394 v0
  = case coe v0 of
      C7407 v6 v7 v8 -> coe v7
      _ -> MAlonzo.RTE.mazUnreachableError
name396 = "Function.Metric.Bundles.SemiMetric.isSemiMetric"
d396 :: T354 -> MAlonzo.Code.Function.Metric.Structures.T232
d396 v0
  = case coe v0 of
      C7407 v6 v7 v8 -> coe v8
      _ -> MAlonzo.RTE.mazUnreachableError
name400 = "Function.Metric.Bundles.SemiMetric._.0⇒≈"
d400 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d400 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0)))
name402 = "Function.Metric.Bundles.SemiMetric._.antisym"
d402 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d402 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe d396 (coe v0))))))
name404 = "Function.Metric.Bundles.SemiMetric._.cong"
d404 ::
  T354 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d404 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d46
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0)))))
name406 = "Function.Metric.Bundles.SemiMetric._.isEquivalence"
d406 :: T354 -> MAlonzo.Code.Relation.Binary.Structures.T26
d406 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d240
                     (coe d396 (coe v0)))))))
name408 = "Function.Metric.Bundles.SemiMetric._.isPartialOrder"
d408 :: T354 -> MAlonzo.Code.Relation.Binary.Structures.T118
d408 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0)))))
name410 = "Function.Metric.Bundles.SemiMetric._.isPreMetric"
d410 :: T354 -> MAlonzo.Code.Function.Metric.Structures.T96
d410 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0)))
name412 = "Function.Metric.Bundles.SemiMetric._.isPreorder"
d412 :: T354 -> MAlonzo.Code.Relation.Binary.Structures.T70
d412 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe d396 (coe v0))))))
name414 = "Function.Metric.Bundles.SemiMetric._.isProtoMetric"
d414 :: T354 -> MAlonzo.Code.Function.Metric.Structures.T30
d414 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0))))
name416 = "Function.Metric.Bundles.SemiMetric._.isQuasiSemiMetric"
d416 :: T354 -> MAlonzo.Code.Function.Metric.Structures.T162
d416 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0))
name418 = "Function.Metric.Bundles.SemiMetric._.nonNegative"
d418 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny
d418 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0)))))
name420 = "Function.Metric.Bundles.SemiMetric._.refl"
d420 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T354 -> AgdaAny -> AgdaAny
d420 v0 v1 v2 v3 v4 v5 = du420 v5
du420 :: T354 -> AgdaAny -> AgdaAny
du420 v0
  = let v1 = d396 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name422 = "Function.Metric.Bundles.SemiMetric._.reflexive"
d422 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d422 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d240
                     (coe d396 (coe v0)))))))
name424 = "Function.Metric.Bundles.SemiMetric._.sym"
d424 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny
d424 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d242 (coe d396 (coe v0))
name426 = "Function.Metric.Bundles.SemiMetric._.trans"
d426 ::
  T354 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d426 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d240
                     (coe d396 (coe v0)))))))
name428 = "Function.Metric.Bundles.SemiMetric._.≈-isEquivalence"
d428 :: T354 -> MAlonzo.Code.Relation.Binary.Structures.T26
d428 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0)))))
name430 = "Function.Metric.Bundles.SemiMetric._.≈⇒0"
d430 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d430 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d106
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0))))
name432 = "Function.Metric.Bundles.SemiMetric._.∼-resp-≈"
d432 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T354 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d432 v0 v1 v2 v3 v4 v5 = du432 v5
du432 :: T354 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du432 v0
  = let v1 = d396 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name434 = "Function.Metric.Bundles.SemiMetric._.∼-respʳ-≈"
d434 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T354 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d434 v0 v1 v2 v3 v4 v5 = du434 v5
du434 ::
  T354 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du434 v0
  = let v1 = d396 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name436 = "Function.Metric.Bundles.SemiMetric._.∼-respˡ-≈"
d436 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T354 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d436 v0 v1 v2 v3 v4 v5 = du436 v5
du436 ::
  T354 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du436 v0
  = let v1 = d396 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name440
  = "Function.Metric.Bundles.SemiMetric._.EqC.isPartialEquivalence"
d440 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T354 -> MAlonzo.Code.Relation.Binary.Structures.T16
d440 v0 v1 v2 v3 v4 v5 = du440 v5
du440 :: T354 -> MAlonzo.Code.Relation.Binary.Structures.T16
du440 v0
  = let v1 = d396 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v4))
name442 = "Function.Metric.Bundles.SemiMetric._.EqC.refl"
d442 :: T354 -> AgdaAny -> AgdaAny
d442 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe d396 (coe v0))))))
name444 = "Function.Metric.Bundles.SemiMetric._.EqC.reflexive"
d444 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T354 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d444 v0 v1 v2 v3 v4 v5 = du444 v5
du444 ::
  T354 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du444 v0
  = let v1 = d396 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    \ v5 v6 v7 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v4)) v5
name446 = "Function.Metric.Bundles.SemiMetric._.EqC.sym"
d446 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d446 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe d396 (coe v0))))))
name448 = "Function.Metric.Bundles.SemiMetric._.EqC.trans"
d448 ::
  T354 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d448 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe d396 (coe v0))))))
name452
  = "Function.Metric.Bundles.SemiMetric._.Eq.isPartialEquivalence"
d452 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T354 -> MAlonzo.Code.Relation.Binary.Structures.T16
d452 v0 v1 v2 v3 v4 v5 = du452 v5
du452 :: T354 -> MAlonzo.Code.Relation.Binary.Structures.T16
du452 v0
  = let v1 = d396 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    let v6 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v6))
name454 = "Function.Metric.Bundles.SemiMetric._.Eq.refl"
d454 :: T354 -> AgdaAny -> AgdaAny
d454 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d240
                        (coe d396 (coe v0))))))))
name456 = "Function.Metric.Bundles.SemiMetric._.Eq.reflexive"
d456 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T354 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d456 v0 v1 v2 v3 v4 v5 = du456 v5
du456 ::
  T354 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du456 v0
  = let v1 = d396 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    let v6 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5) in
    \ v7 v8 v9 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v6)) v7
name458 = "Function.Metric.Bundles.SemiMetric._.Eq.sym"
d458 :: T354 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d458 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d240
                        (coe d396 (coe v0))))))))
name460 = "Function.Metric.Bundles.SemiMetric._.Eq.trans"
d460 ::
  T354 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d460 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d240
                        (coe d396 (coe v0))))))))
name462 = "Function.Metric.Bundles.SemiMetric.quasiSemiMetric"
d462 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T354 -> T234
d462 v0 v1 v2 v3 v4 v5 = du462 v5
du462 :: T354 -> T234
du462 v0
  = coe
      C4869 (d392 (coe v0)) (d394 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d240 (coe d396 (coe v0)))
name466 = "Function.Metric.Bundles.SemiMetric._.preMetric"
d466 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T354 -> T122
d466 v0 v1 v2 v3 v4 v5 = du466 v5
du466 :: T354 -> T122
du466 v0 = coe du338 (coe du462 (coe v0))
name468 = "Function.Metric.Bundles.SemiMetric._.protoMetric"
d468 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T354 -> T16
d468 v0 v1 v2 v3 v4 v5 = du468 v5
du468 :: T354 -> T16
du468 v0
  = let v1 = coe du462 (coe v0) in coe du222 (coe du338 (coe v1))
name480 = "Function.Metric.Bundles.GeneralMetric"
d480 a0 a1 a2 a3 a4 = ()
data T480
  = C10105 AgdaAny (AgdaAny -> AgdaAny -> AgdaAny)
           (AgdaAny -> AgdaAny -> AgdaAny)
           MAlonzo.Code.Function.Metric.Structures.T308
name510 = "Function.Metric.Bundles.GeneralMetric.Carrier"
d510 :: T480 -> ()
d510 = erased
name512 = "Function.Metric.Bundles.GeneralMetric.Image"
d512 :: T480 -> ()
d512 = erased
name514 = "Function.Metric.Bundles.GeneralMetric._≈_"
d514 :: T480 -> AgdaAny -> AgdaAny -> ()
d514 = erased
name516 = "Function.Metric.Bundles.GeneralMetric._≈ᵢ_"
d516 :: T480 -> AgdaAny -> AgdaAny -> ()
d516 = erased
name518 = "Function.Metric.Bundles.GeneralMetric._≤_"
d518 :: T480 -> AgdaAny -> AgdaAny -> ()
d518 = erased
name520 = "Function.Metric.Bundles.GeneralMetric.0#"
d520 :: T480 -> AgdaAny
d520 v0
  = case coe v0 of
      C10105 v6 v7 v8 v9 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name522 = "Function.Metric.Bundles.GeneralMetric._∙_"
d522 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny
d522 v0
  = case coe v0 of
      C10105 v6 v7 v8 v9 -> coe v7
      _ -> MAlonzo.RTE.mazUnreachableError
name524 = "Function.Metric.Bundles.GeneralMetric.d"
d524 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny
d524 v0
  = case coe v0 of
      C10105 v6 v7 v8 v9 -> coe v8
      _ -> MAlonzo.RTE.mazUnreachableError
name526 = "Function.Metric.Bundles.GeneralMetric.isGeneralMetric"
d526 :: T480 -> MAlonzo.Code.Function.Metric.Structures.T308
d526 v0
  = case coe v0 of
      C10105 v6 v7 v8 v9 -> coe v9
      _ -> MAlonzo.RTE.mazUnreachableError
name530 = "Function.Metric.Bundles.GeneralMetric._.0⇒≈"
d530 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d530 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe
            MAlonzo.Code.Function.Metric.Structures.d318 (coe d526 (coe v0))))
name532 = "Function.Metric.Bundles.GeneralMetric._.antisym"
d532 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d532 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d318
                     (coe d526 (coe v0)))))))
name534 = "Function.Metric.Bundles.GeneralMetric._.cong"
d534 ::
  T480 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d534 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d46
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d318
                  (coe d526 (coe v0))))))
name536 = "Function.Metric.Bundles.GeneralMetric._.isEquivalence"
d536 :: T480 -> MAlonzo.Code.Relation.Binary.Structures.T26
d536 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d240
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d318
                        (coe d526 (coe v0))))))))
name538 = "Function.Metric.Bundles.GeneralMetric._.isPartialOrder"
d538 :: T480 -> MAlonzo.Code.Relation.Binary.Structures.T118
d538 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d318
                  (coe d526 (coe v0))))))
name540 = "Function.Metric.Bundles.GeneralMetric._.isPreMetric"
d540 :: T480 -> MAlonzo.Code.Function.Metric.Structures.T96
d540 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe
            MAlonzo.Code.Function.Metric.Structures.d318 (coe d526 (coe v0))))
name542 = "Function.Metric.Bundles.GeneralMetric._.isPreorder"
d542 :: T480 -> MAlonzo.Code.Relation.Binary.Structures.T70
d542 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d318
                     (coe d526 (coe v0)))))))
name544 = "Function.Metric.Bundles.GeneralMetric._.isProtoMetric"
d544 :: T480 -> MAlonzo.Code.Function.Metric.Structures.T30
d544 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240
            (coe
               MAlonzo.Code.Function.Metric.Structures.d318 (coe d526 (coe v0)))))
name546
  = "Function.Metric.Bundles.GeneralMetric._.isQuasiSemiMetric"
d546 :: T480 -> MAlonzo.Code.Function.Metric.Structures.T162
d546 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d240
      (coe
         MAlonzo.Code.Function.Metric.Structures.d318 (coe d526 (coe v0)))
name548 = "Function.Metric.Bundles.GeneralMetric._.isSemiMetric"
d548 :: T480 -> MAlonzo.Code.Function.Metric.Structures.T232
d548 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d318 (coe d526 (coe v0))
name550 = "Function.Metric.Bundles.GeneralMetric._.nonNegative"
d550 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny
d550 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d318
                  (coe d526 (coe v0))))))
name552 = "Function.Metric.Bundles.GeneralMetric._.refl"
d552 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T480 -> AgdaAny -> AgdaAny
d552 v0 v1 v2 v3 v4 v5 = du552 v5
du552 :: T480 -> AgdaAny -> AgdaAny
du552 v0
  = let v1 = d526 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name554 = "Function.Metric.Bundles.GeneralMetric._.reflexive"
d554 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d554 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d240
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d318
                        (coe d526 (coe v0))))))))
name556 = "Function.Metric.Bundles.GeneralMetric._.sym"
d556 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny
d556 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d242
      (coe
         MAlonzo.Code.Function.Metric.Structures.d318 (coe d526 (coe v0)))
name558 = "Function.Metric.Bundles.GeneralMetric._.trans"
d558 ::
  T480 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d558 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d170
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d240
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d318
                        (coe d526 (coe v0))))))))
name560 = "Function.Metric.Bundles.GeneralMetric._.triangle"
d560 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d560 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d320 (coe d526 (coe v0))
name562 = "Function.Metric.Bundles.GeneralMetric._.≈-isEquivalence"
d562 :: T480 -> MAlonzo.Code.Relation.Binary.Structures.T26
d562 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d318
                  (coe d526 (coe v0))))))
name564 = "Function.Metric.Bundles.GeneralMetric._.≈⇒0"
d564 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d564 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d106
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240
            (coe
               MAlonzo.Code.Function.Metric.Structures.d318 (coe d526 (coe v0)))))
name566 = "Function.Metric.Bundles.GeneralMetric._.∼-resp-≈"
d566 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T480 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d566 v0 v1 v2 v3 v4 v5 = du566 v5
du566 :: T480 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du566 v0
  = let v1 = d526 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name568 = "Function.Metric.Bundles.GeneralMetric._.∼-respʳ-≈"
d568 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T480 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d568 v0 v1 v2 v3 v4 v5 = du568 v5
du568 ::
  T480 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du568 v0
  = let v1 = d526 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name570 = "Function.Metric.Bundles.GeneralMetric._.∼-respˡ-≈"
d570 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T480 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d570 v0 v1 v2 v3 v4 v5 = du570 v5
du570 ::
  T480 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du570 v0
  = let v1 = d526 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name574
  = "Function.Metric.Bundles.GeneralMetric._.EqC.isPartialEquivalence"
d574 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T480 -> MAlonzo.Code.Relation.Binary.Structures.T16
d574 v0 v1 v2 v3 v4 v5 = du574 v5
du574 :: T480 -> MAlonzo.Code.Relation.Binary.Structures.T16
du574 v0
  = let v1 = d526 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v5))
name576 = "Function.Metric.Bundles.GeneralMetric._.EqC.refl"
d576 :: T480 -> AgdaAny -> AgdaAny
d576 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d318
                     (coe d526 (coe v0)))))))
name578 = "Function.Metric.Bundles.GeneralMetric._.EqC.reflexive"
d578 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T480 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d578 v0 v1 v2 v3 v4 v5 = du578 v5
du578 ::
  T480 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du578 v0
  = let v1 = d526 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    \ v6 v7 v8 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v5)) v6
name580 = "Function.Metric.Bundles.GeneralMetric._.EqC.sym"
d580 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d580 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d318
                     (coe d526 (coe v0)))))))
name582 = "Function.Metric.Bundles.GeneralMetric._.EqC.trans"
d582 ::
  T480 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d582 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d240
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d318
                     (coe d526 (coe v0)))))))
name586
  = "Function.Metric.Bundles.GeneralMetric._.Eq.isPartialEquivalence"
d586 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T480 -> MAlonzo.Code.Relation.Binary.Structures.T16
d586 v0 v1 v2 v3 v4 v5 = du586 v5
du586 :: T480 -> MAlonzo.Code.Relation.Binary.Structures.T16
du586 v0
  = let v1 = d526 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    let v7 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v7))
name588 = "Function.Metric.Bundles.GeneralMetric._.Eq.refl"
d588 :: T480 -> AgdaAny -> AgdaAny
d588 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d240
                        (coe
                           MAlonzo.Code.Function.Metric.Structures.d318
                           (coe d526 (coe v0)))))))))
name590 = "Function.Metric.Bundles.GeneralMetric._.Eq.reflexive"
d590 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T480 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d590 v0 v1 v2 v3 v4 v5 = du590 v5
du590 ::
  T480 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du590 v0
  = let v1 = d526 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    let v7 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6) in
    \ v8 v9 v10 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v7)) v8
name592 = "Function.Metric.Bundles.GeneralMetric._.Eq.sym"
d592 :: T480 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d592 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d240
                        (coe
                           MAlonzo.Code.Function.Metric.Structures.d318
                           (coe d526 (coe v0)))))))))
name594 = "Function.Metric.Bundles.GeneralMetric._.Eq.trans"
d594 ::
  T480 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d594 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d80
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Function.Metric.Structures.d42
               (coe
                  MAlonzo.Code.Function.Metric.Structures.d104
                  (coe
                     MAlonzo.Code.Function.Metric.Structures.d170
                     (coe
                        MAlonzo.Code.Function.Metric.Structures.d240
                        (coe
                           MAlonzo.Code.Function.Metric.Structures.d318
                           (coe d526 (coe v0)))))))))
name596 = "Function.Metric.Bundles.GeneralMetric.semiMetric"
d596 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T480 -> T354
d596 v0 v1 v2 v3 v4 v5 = du596 v5
du596 :: T480 -> T354
du596 v0
  = coe
      C7407 (d520 (coe v0)) (d524 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d318 (coe d526 (coe v0)))
name600 = "Function.Metric.Bundles.GeneralMetric._.preMetric"
d600 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T480 -> T122
d600 v0 v1 v2 v3 v4 v5 = du600 v5
du600 :: T480 -> T122
du600 v0
  = let v1 = coe du596 (coe v0) in coe du338 (coe du462 (coe v1))
name602 = "Function.Metric.Bundles.GeneralMetric._.protoMetric"
d602 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T480 -> T16
d602 v0 v1 v2 v3 v4 v5 = du602 v5
du602 :: T480 -> T16
du602 v0
  = let v1 = coe du596 (coe v0) in
    let v2 = coe du462 (coe v1) in coe du222 (coe du338 (coe v2))
name604 = "Function.Metric.Bundles.GeneralMetric._.quasiSemiMetric"
d604 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T480 -> T234
d604 v0 v1 v2 v3 v4 v5 = du604 v5
du604 :: T480 -> T234
du604 v0 = coe du462 (coe du596 (coe v0))
