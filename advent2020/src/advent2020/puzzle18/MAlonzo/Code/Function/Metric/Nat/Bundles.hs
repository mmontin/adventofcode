{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Function.Metric.Nat.Bundles where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Function.Metric.Structures
import qualified MAlonzo.Code.Relation.Binary.Structures

name12 = "Function.Metric.Nat.Bundles.ProtoMetric"
d12 a0 a1 = ()
data T12
  = C119 (AgdaAny -> AgdaAny -> Integer)
         MAlonzo.Code.Function.Metric.Structures.T30
name26 = "Function.Metric.Nat.Bundles.ProtoMetric.Carrier"
d26 :: T12 -> ()
d26 = erased
name28 = "Function.Metric.Nat.Bundles.ProtoMetric._≈_"
d28 :: T12 -> AgdaAny -> AgdaAny -> ()
d28 = erased
name30 = "Function.Metric.Nat.Bundles.ProtoMetric.d"
d30 :: T12 -> AgdaAny -> AgdaAny -> Integer
d30 v0
  = case coe v0 of
      C119 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name32 = "Function.Metric.Nat.Bundles.ProtoMetric.isProtoMetric"
d32 :: T12 -> MAlonzo.Code.Function.Metric.Structures.T30
d32 v0
  = case coe v0 of
      C119 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name36 = "Function.Metric.Nat.Bundles.ProtoMetric._.antisym"
d36 ::
  T12 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d36 = erased
name38 = "Function.Metric.Nat.Bundles.ProtoMetric._.cong"
d38 ::
  T12 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d38 = erased
name40 = "Function.Metric.Nat.Bundles.ProtoMetric._.isEquivalence"
d40 :: T12 -> MAlonzo.Code.Relation.Binary.Structures.T26
d40 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42 (coe d32 (coe v0))))
name42 = "Function.Metric.Nat.Bundles.ProtoMetric._.isPartialOrder"
d42 :: T12 -> MAlonzo.Code.Relation.Binary.Structures.T118
d42 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42 (coe d32 (coe v0))
name44 = "Function.Metric.Nat.Bundles.ProtoMetric._.isPreorder"
d44 :: T12 -> MAlonzo.Code.Relation.Binary.Structures.T70
d44 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42 (coe d32 (coe v0)))
name46 = "Function.Metric.Nat.Bundles.ProtoMetric._.nonNegative"
d46 :: T12 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d46 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48 (coe d32 (coe v0))
name48 = "Function.Metric.Nat.Bundles.ProtoMetric._.refl"
d48 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T12 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d48 v0 v1 v2 = du48 v2
du48 :: T12 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du48 v0
  = let v1 = d32 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name50 = "Function.Metric.Nat.Bundles.ProtoMetric._.reflexive"
d50 ::
  T12 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d50 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42 (coe d32 (coe v0))))
name52 = "Function.Metric.Nat.Bundles.ProtoMetric._.trans"
d52 ::
  T12 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d52 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42 (coe d32 (coe v0))))
name54
  = "Function.Metric.Nat.Bundles.ProtoMetric._.≈-isEquivalence"
d54 :: T12 -> MAlonzo.Code.Relation.Binary.Structures.T26
d54 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44 (coe d32 (coe v0))
name56 = "Function.Metric.Nat.Bundles.ProtoMetric._.∼-resp-≈"
d56 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T12 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d56 v0 v1 v2 = du56 v2
du56 :: T12 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du56 v0
  = let v1 = d32 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name58 = "Function.Metric.Nat.Bundles.ProtoMetric._.∼-respʳ-≈"
d58 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T12 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d58 v0 v1 v2 = du58 v2
du58 ::
  T12 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du58 v0
  = let v1 = d32 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name60 = "Function.Metric.Nat.Bundles.ProtoMetric._.∼-respˡ-≈"
d60 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T12 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d60 v0 v1 v2 = du60 v2
du60 ::
  T12 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du60 v0
  = let v1 = d32 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name64
  = "Function.Metric.Nat.Bundles.ProtoMetric._.EqC.isPartialEquivalence"
d64 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T12 -> MAlonzo.Code.Relation.Binary.Structures.T16
d64 v0 v1 v2 = du64 v2
du64 :: T12 -> MAlonzo.Code.Relation.Binary.Structures.T16
du64 v0
  = let v1 = d32 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v1))
name66 = "Function.Metric.Nat.Bundles.ProtoMetric._.EqC.refl"
d66 :: T12 -> AgdaAny -> AgdaAny
d66 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44 (coe d32 (coe v0)))
name68 = "Function.Metric.Nat.Bundles.ProtoMetric._.EqC.reflexive"
d68 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T12 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d68 v0 v1 v2 = du68 v2
du68 ::
  T12 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du68 v0
  = let v1 = d32 (coe v0) in
    \ v2 v3 v4 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v1)) v2
name70 = "Function.Metric.Nat.Bundles.ProtoMetric._.EqC.sym"
d70 :: T12 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d70 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44 (coe d32 (coe v0)))
name72 = "Function.Metric.Nat.Bundles.ProtoMetric._.EqC.trans"
d72 ::
  T12 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d72 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44 (coe d32 (coe v0)))
name76
  = "Function.Metric.Nat.Bundles.ProtoMetric._.Eq.isPartialEquivalence"
d76 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T12 -> MAlonzo.Code.Relation.Binary.Structures.T16
d76 v0 v1 v2 = du76 v2
du76 :: T12 -> MAlonzo.Code.Relation.Binary.Structures.T16
du76 v0
  = let v1 = d32 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v1) in
    let v3 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v3))
name78 = "Function.Metric.Nat.Bundles.ProtoMetric._.Eq.refl"
d78 :: T12 -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d78 = erased
name80 = "Function.Metric.Nat.Bundles.ProtoMetric._.Eq.reflexive"
d80 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T12 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d80 = erased
name82 = "Function.Metric.Nat.Bundles.ProtoMetric._.Eq.sym"
d82 ::
  T12 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d82 = erased
name84 = "Function.Metric.Nat.Bundles.ProtoMetric._.Eq.trans"
d84 ::
  T12 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d84 = erased
name90 = "Function.Metric.Nat.Bundles.PreMetric"
d90 a0 a1 = ()
data T90
  = C967 (AgdaAny -> AgdaAny -> Integer)
         MAlonzo.Code.Function.Metric.Structures.T96
name104 = "Function.Metric.Nat.Bundles.PreMetric.Carrier"
d104 :: T90 -> ()
d104 = erased
name106 = "Function.Metric.Nat.Bundles.PreMetric._≈_"
d106 :: T90 -> AgdaAny -> AgdaAny -> ()
d106 = erased
name108 = "Function.Metric.Nat.Bundles.PreMetric.d"
d108 :: T90 -> AgdaAny -> AgdaAny -> Integer
d108 v0
  = case coe v0 of
      C967 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name110 = "Function.Metric.Nat.Bundles.PreMetric.isPreMetric"
d110 :: T90 -> MAlonzo.Code.Function.Metric.Structures.T96
d110 v0
  = case coe v0 of
      C967 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name114 = "Function.Metric.Nat.Bundles.PreMetric._.antisym"
d114 ::
  T90 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d114 = erased
name116 = "Function.Metric.Nat.Bundles.PreMetric._.cong"
d116 ::
  T90 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d116 = erased
name118 = "Function.Metric.Nat.Bundles.PreMetric._.isEquivalence"
d118 :: T90 -> MAlonzo.Code.Relation.Binary.Structures.T26
d118 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d80
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0)))))
name120 = "Function.Metric.Nat.Bundles.PreMetric._.isPartialOrder"
d120 :: T90 -> MAlonzo.Code.Relation.Binary.Structures.T118
d120 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0)))
name122 = "Function.Metric.Nat.Bundles.PreMetric._.isPreorder"
d122 :: T90 -> MAlonzo.Code.Relation.Binary.Structures.T70
d122 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0))))
name124 = "Function.Metric.Nat.Bundles.PreMetric._.isProtoMetric"
d124 :: T90 -> MAlonzo.Code.Function.Metric.Structures.T30
d124 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0))
name126 = "Function.Metric.Nat.Bundles.PreMetric._.nonNegative"
d126 :: T90 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d126 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0)))
name128 = "Function.Metric.Nat.Bundles.PreMetric._.refl"
d128 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T90 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d128 v0 v1 v2 = du128 v2
du128 :: T90 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du128 v0
  = let v1 = d110 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name130 = "Function.Metric.Nat.Bundles.PreMetric._.reflexive"
d130 ::
  T90 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d130 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0)))))
name132 = "Function.Metric.Nat.Bundles.PreMetric._.trans"
d132 ::
  T90 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d132 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe
            MAlonzo.Code.Function.Metric.Structures.d42
            (coe
               MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0)))))
name134 = "Function.Metric.Nat.Bundles.PreMetric._.≈-isEquivalence"
d134 :: T90 -> MAlonzo.Code.Relation.Binary.Structures.T26
d134 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0)))
name136 = "Function.Metric.Nat.Bundles.PreMetric._.≈⇒0"
d136 ::
  T90 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d136 = erased
name138 = "Function.Metric.Nat.Bundles.PreMetric._.∼-resp-≈"
d138 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T90 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d138 v0 v1 v2 = du138 v2
du138 :: T90 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du138 v0
  = let v1 = d110 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name140 = "Function.Metric.Nat.Bundles.PreMetric._.∼-respʳ-≈"
d140 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T90 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d140 v0 v1 v2 = du140 v2
du140 ::
  T90 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du140 v0
  = let v1 = d110 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name142 = "Function.Metric.Nat.Bundles.PreMetric._.∼-respˡ-≈"
d142 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T90 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d142 v0 v1 v2 = du142 v2
du142 ::
  T90 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du142 v0
  = let v1 = d110 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name146
  = "Function.Metric.Nat.Bundles.PreMetric._.EqC.isPartialEquivalence"
d146 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T90 -> MAlonzo.Code.Relation.Binary.Structures.T16
d146 v0 v1 v2 = du146 v2
du146 :: T90 -> MAlonzo.Code.Relation.Binary.Structures.T16
du146 v0
  = let v1 = d110 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v2))
name148 = "Function.Metric.Nat.Bundles.PreMetric._.EqC.refl"
d148 :: T90 -> AgdaAny -> AgdaAny
d148 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0))))
name150 = "Function.Metric.Nat.Bundles.PreMetric._.EqC.reflexive"
d150 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T90 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d150 v0 v1 v2 = du150 v2
du150 ::
  T90 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du150 v0
  = let v1 = d110 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    \ v3 v4 v5 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v2)) v3
name152 = "Function.Metric.Nat.Bundles.PreMetric._.EqC.sym"
d152 :: T90 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d152 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0))))
name154 = "Function.Metric.Nat.Bundles.PreMetric._.EqC.trans"
d154 ::
  T90 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d154 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0))))
name158
  = "Function.Metric.Nat.Bundles.PreMetric._.Eq.isPartialEquivalence"
d158 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T90 -> MAlonzo.Code.Relation.Binary.Structures.T16
d158 v0 v1 v2 = du158 v2
du158 :: T90 -> MAlonzo.Code.Relation.Binary.Structures.T16
du158 v0
  = let v1 = d110 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v2) in
    let v4 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v4))
name160 = "Function.Metric.Nat.Bundles.PreMetric._.Eq.refl"
d160 :: T90 -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d160 = erased
name162 = "Function.Metric.Nat.Bundles.PreMetric._.Eq.reflexive"
d162 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T90 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d162 = erased
name164 = "Function.Metric.Nat.Bundles.PreMetric._.Eq.sym"
d164 ::
  T90 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d164 = erased
name166 = "Function.Metric.Nat.Bundles.PreMetric._.Eq.trans"
d166 ::
  T90 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d166 = erased
name168 = "Function.Metric.Nat.Bundles.PreMetric.protoMetric"
d168 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T90 -> T12
d168 v0 v1 v2 = du168 v2
du168 :: T90 -> T12
du168 v0
  = coe
      C119 (d108 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d104 (coe d110 (coe v0)))
name174 = "Function.Metric.Nat.Bundles.QuasiSemiMetric"
d174 a0 a1 = ()
data T174
  = C1953 (AgdaAny -> AgdaAny -> Integer)
          MAlonzo.Code.Function.Metric.Structures.T162
name188 = "Function.Metric.Nat.Bundles.QuasiSemiMetric.Carrier"
d188 :: T174 -> ()
d188 = erased
name190 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._≈_"
d190 :: T174 -> AgdaAny -> AgdaAny -> ()
d190 = erased
name192 = "Function.Metric.Nat.Bundles.QuasiSemiMetric.d"
d192 :: T174 -> AgdaAny -> AgdaAny -> Integer
d192 v0
  = case coe v0 of
      C1953 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name194
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric.isQuasiSemiMetric"
d194 :: T174 -> MAlonzo.Code.Function.Metric.Structures.T162
d194 v0
  = case coe v0 of
      C1953 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name198 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.0⇒≈"
d198 ::
  T174 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d198 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172 (coe d194 (coe v0))
name200 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.antisym"
d200 ::
  T174 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d200 = erased
name202 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.cong"
d202 ::
  T174 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d202 = erased
name204
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.isEquivalence"
d204 :: T174 -> MAlonzo.Code.Relation.Binary.Structures.T26
d204 v0
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
                  (coe d194 (coe v0))))))
name206
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.isPartialOrder"
d206 :: T174 -> MAlonzo.Code.Relation.Binary.Structures.T118
d206 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0))))
name208
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.isPreMetric"
d208 :: T174 -> MAlonzo.Code.Function.Metric.Structures.T96
d208 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0))
name210
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.isPreorder"
d210 :: T174 -> MAlonzo.Code.Relation.Binary.Structures.T70
d210 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d126
      (coe
         MAlonzo.Code.Function.Metric.Structures.d42
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0)))))
name212
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.isProtoMetric"
d212 :: T174 -> MAlonzo.Code.Function.Metric.Structures.T30
d212 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0)))
name214
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.nonNegative"
d214 :: T174 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d214 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0))))
name216 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.refl"
d216 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T174 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d216 v0 v1 v2 = du216 v2
du216 :: T174 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du216 v0
  = let v1 = d194 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name218 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.reflexive"
d218 ::
  T174 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d218 v0
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
                  (coe d194 (coe v0))))))
name220 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.trans"
d220 ::
  T174 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d220 v0
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
                  (coe d194 (coe v0))))))
name222
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.≈-isEquivalence"
d222 :: T174 -> MAlonzo.Code.Relation.Binary.Structures.T26
d222 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0))))
name224 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.≈⇒0"
d224 ::
  T174 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d224 = erased
name226 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.∼-resp-≈"
d226 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T174 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d226 v0 v1 v2 = du226 v2
du226 :: T174 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du226 v0
  = let v1 = d194 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name228 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.∼-respʳ-≈"
d228 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T174 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d228 v0 v1 v2 = du228 v2
du228 ::
  T174 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du228 v0
  = let v1 = d194 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name230 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.∼-respˡ-≈"
d230 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T174 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d230 v0 v1 v2 = du230 v2
du230 ::
  T174 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du230 v0
  = let v1 = d194 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name234
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.EqC.isPartialEquivalence"
d234 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T174 -> MAlonzo.Code.Relation.Binary.Structures.T16
d234 v0 v1 v2 = du234 v2
du234 :: T174 -> MAlonzo.Code.Relation.Binary.Structures.T16
du234 v0
  = let v1 = d194 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v3))
name236 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.EqC.refl"
d236 :: T174 -> AgdaAny -> AgdaAny
d236 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0)))))
name238
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.EqC.reflexive"
d238 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T174 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d238 v0 v1 v2 = du238 v2
du238 ::
  T174 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du238 v0
  = let v1 = d194 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    \ v4 v5 v6 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v3)) v4
name240 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.EqC.sym"
d240 :: T174 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d240 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0)))))
name242 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.EqC.trans"
d242 ::
  T174 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d242 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Function.Metric.Structures.d44
         (coe
            MAlonzo.Code.Function.Metric.Structures.d104
            (coe
               MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0)))))
name246
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.Eq.isPartialEquivalence"
d246 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T174 -> MAlonzo.Code.Relation.Binary.Structures.T16
d246 v0 v1 v2 = du246 v2
du246 :: T174 -> MAlonzo.Code.Relation.Binary.Structures.T16
du246 v0
  = let v1 = d194 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v3) in
    let v5 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v5))
name248 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.Eq.refl"
d248 :: T174 -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d248 = erased
name250
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.Eq.reflexive"
d250 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T174 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d250 = erased
name252 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.Eq.sym"
d252 ::
  T174 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d252 = erased
name254 = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.Eq.trans"
d254 ::
  T174 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d254 = erased
name256 = "Function.Metric.Nat.Bundles.QuasiSemiMetric.preMetric"
d256 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T174 -> T90
d256 v0 v1 v2 = du256 v2
du256 :: T174 -> T90
du256 v0
  = coe
      C967 (d192 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d170 (coe d194 (coe v0)))
name260
  = "Function.Metric.Nat.Bundles.QuasiSemiMetric._.protoMetric"
d260 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T174 -> T12
d260 v0 v1 v2 = du260 v2
du260 :: T174 -> T12
du260 v0 = coe du168 (coe du256 (coe v0))
name266 = "Function.Metric.Nat.Bundles.SemiMetric"
d266 a0 a1 = ()
data T266
  = C3001 (AgdaAny -> AgdaAny -> Integer)
          MAlonzo.Code.Function.Metric.Structures.T232
name280 = "Function.Metric.Nat.Bundles.SemiMetric.Carrier"
d280 :: T266 -> ()
d280 = erased
name282 = "Function.Metric.Nat.Bundles.SemiMetric._≈_"
d282 :: T266 -> AgdaAny -> AgdaAny -> ()
d282 = erased
name284 = "Function.Metric.Nat.Bundles.SemiMetric.d"
d284 :: T266 -> AgdaAny -> AgdaAny -> Integer
d284 v0
  = case coe v0 of
      C3001 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name286 = "Function.Metric.Nat.Bundles.SemiMetric.isSemiMetric"
d286 :: T266 -> MAlonzo.Code.Function.Metric.Structures.T232
d286 v0
  = case coe v0 of
      C3001 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name290 = "Function.Metric.Nat.Bundles.SemiMetric._.0⇒≈"
d290 ::
  T266 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d290 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240 (coe d286 (coe v0)))
name292 = "Function.Metric.Nat.Bundles.SemiMetric._.antisym"
d292 ::
  T266 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d292 = erased
name294 = "Function.Metric.Nat.Bundles.SemiMetric._.cong"
d294 ::
  T266 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d294 = erased
name296 = "Function.Metric.Nat.Bundles.SemiMetric._.isEquivalence"
d296 :: T266 -> MAlonzo.Code.Relation.Binary.Structures.T26
d296 v0
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
                     (coe d286 (coe v0)))))))
name298 = "Function.Metric.Nat.Bundles.SemiMetric._.isPartialOrder"
d298 :: T266 -> MAlonzo.Code.Relation.Binary.Structures.T118
d298 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240 (coe d286 (coe v0)))))
name300 = "Function.Metric.Nat.Bundles.SemiMetric._.isPreMetric"
d300 :: T266 -> MAlonzo.Code.Function.Metric.Structures.T96
d300 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240 (coe d286 (coe v0)))
name302 = "Function.Metric.Nat.Bundles.SemiMetric._.isPreorder"
d302 :: T266 -> MAlonzo.Code.Relation.Binary.Structures.T70
d302 v0
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
                  (coe d286 (coe v0))))))
name304 = "Function.Metric.Nat.Bundles.SemiMetric._.isProtoMetric"
d304 :: T266 -> MAlonzo.Code.Function.Metric.Structures.T30
d304 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240 (coe d286 (coe v0))))
name306
  = "Function.Metric.Nat.Bundles.SemiMetric._.isQuasiSemiMetric"
d306 :: T266 -> MAlonzo.Code.Function.Metric.Structures.T162
d306 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d240 (coe d286 (coe v0))
name308 = "Function.Metric.Nat.Bundles.SemiMetric._.nonNegative"
d308 :: T266 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d308 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240 (coe d286 (coe v0)))))
name310 = "Function.Metric.Nat.Bundles.SemiMetric._.refl"
d310 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T266 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d310 v0 v1 v2 = du310 v2
du310 :: T266 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du310 v0
  = let v1 = d286 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name312 = "Function.Metric.Nat.Bundles.SemiMetric._.reflexive"
d312 ::
  T266 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d312 v0
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
                     (coe d286 (coe v0)))))))
name314 = "Function.Metric.Nat.Bundles.SemiMetric._.sym"
d314 ::
  T266 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d314 = erased
name316 = "Function.Metric.Nat.Bundles.SemiMetric._.trans"
d316 ::
  T266 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d316 v0
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
                     (coe d286 (coe v0)))))))
name318
  = "Function.Metric.Nat.Bundles.SemiMetric._.≈-isEquivalence"
d318 :: T266 -> MAlonzo.Code.Relation.Binary.Structures.T26
d318 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240 (coe d286 (coe v0)))))
name320 = "Function.Metric.Nat.Bundles.SemiMetric._.≈⇒0"
d320 ::
  T266 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d320 = erased
name322 = "Function.Metric.Nat.Bundles.SemiMetric._.∼-resp-≈"
d322 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T266 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d322 v0 v1 v2 = du322 v2
du322 :: T266 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du322 v0
  = let v1 = d286 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name324 = "Function.Metric.Nat.Bundles.SemiMetric._.∼-respʳ-≈"
d324 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T266 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d324 v0 v1 v2 = du324 v2
du324 ::
  T266 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du324 v0
  = let v1 = d286 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name326 = "Function.Metric.Nat.Bundles.SemiMetric._.∼-respˡ-≈"
d326 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T266 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d326 v0 v1 v2 = du326 v2
du326 ::
  T266 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du326 v0
  = let v1 = d286 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name330
  = "Function.Metric.Nat.Bundles.SemiMetric._.EqC.isPartialEquivalence"
d330 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T266 -> MAlonzo.Code.Relation.Binary.Structures.T16
d330 v0 v1 v2 = du330 v2
du330 :: T266 -> MAlonzo.Code.Relation.Binary.Structures.T16
du330 v0
  = let v1 = d286 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v4))
name332 = "Function.Metric.Nat.Bundles.SemiMetric._.EqC.refl"
d332 :: T266 -> AgdaAny -> AgdaAny
d332 v0
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
                  (coe d286 (coe v0))))))
name334 = "Function.Metric.Nat.Bundles.SemiMetric._.EqC.reflexive"
d334 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T266 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d334 v0 v1 v2 = du334 v2
du334 ::
  T266 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du334 v0
  = let v1 = d286 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    \ v5 v6 v7 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v4)) v5
name336 = "Function.Metric.Nat.Bundles.SemiMetric._.EqC.sym"
d336 :: T266 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d336 v0
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
                  (coe d286 (coe v0))))))
name338 = "Function.Metric.Nat.Bundles.SemiMetric._.EqC.trans"
d338 ::
  T266 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d338 v0
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
                  (coe d286 (coe v0))))))
name342
  = "Function.Metric.Nat.Bundles.SemiMetric._.Eq.isPartialEquivalence"
d342 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T266 -> MAlonzo.Code.Relation.Binary.Structures.T16
d342 v0 v1 v2 = du342 v2
du342 :: T266 -> MAlonzo.Code.Relation.Binary.Structures.T16
du342 v0
  = let v1 = d286 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    let v6 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v6))
name344 = "Function.Metric.Nat.Bundles.SemiMetric._.Eq.refl"
d344 :: T266 -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d344 = erased
name346 = "Function.Metric.Nat.Bundles.SemiMetric._.Eq.reflexive"
d346 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T266 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d346 = erased
name348 = "Function.Metric.Nat.Bundles.SemiMetric._.Eq.sym"
d348 ::
  T266 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d348 = erased
name350 = "Function.Metric.Nat.Bundles.SemiMetric._.Eq.trans"
d350 ::
  T266 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d350 = erased
name352 = "Function.Metric.Nat.Bundles.SemiMetric.quasiSemiMetric"
d352 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T266 -> T174
d352 v0 v1 v2 = du352 v2
du352 :: T266 -> T174
du352 v0
  = coe
      C1953 (d284 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d240 (coe d286 (coe v0)))
name356 = "Function.Metric.Nat.Bundles.SemiMetric._.preMetric"
d356 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T266 -> T90
d356 v0 v1 v2 = du356 v2
du356 :: T266 -> T90
du356 v0 = coe du256 (coe du352 (coe v0))
name358 = "Function.Metric.Nat.Bundles.SemiMetric._.protoMetric"
d358 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T266 -> T12
d358 v0 v1 v2 = du358 v2
du358 :: T266 -> T12
du358 v0
  = let v1 = coe du352 (coe v0) in coe du168 (coe du256 (coe v1))
name364 = "Function.Metric.Nat.Bundles.Metric"
d364 a0 a1 = ()
data T364
  = C4083 (AgdaAny -> AgdaAny -> Integer)
          MAlonzo.Code.Function.Metric.Structures.T308
name378 = "Function.Metric.Nat.Bundles.Metric.Carrier"
d378 :: T364 -> ()
d378 = erased
name380 = "Function.Metric.Nat.Bundles.Metric._≈_"
d380 :: T364 -> AgdaAny -> AgdaAny -> ()
d380 = erased
name382 = "Function.Metric.Nat.Bundles.Metric.d"
d382 :: T364 -> AgdaAny -> AgdaAny -> Integer
d382 v0
  = case coe v0 of
      C4083 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name384 = "Function.Metric.Nat.Bundles.Metric.isMetric"
d384 :: T364 -> MAlonzo.Code.Function.Metric.Structures.T308
d384 v0
  = case coe v0 of
      C4083 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name388 = "Function.Metric.Nat.Bundles.Metric._.0⇒≈"
d388 ::
  T364 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d388 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe
            MAlonzo.Code.Function.Metric.Structures.d318 (coe d384 (coe v0))))
name390 = "Function.Metric.Nat.Bundles.Metric._.antisym"
d390 ::
  T364 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d390 = erased
name392 = "Function.Metric.Nat.Bundles.Metric._.cong"
d392 ::
  T364 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d392 = erased
name394 = "Function.Metric.Nat.Bundles.Metric._.isEquivalence"
d394 :: T364 -> MAlonzo.Code.Relation.Binary.Structures.T26
d394 v0
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
                        (coe d384 (coe v0))))))))
name396 = "Function.Metric.Nat.Bundles.Metric._.isPartialOrder"
d396 :: T364 -> MAlonzo.Code.Relation.Binary.Structures.T118
d396 v0
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
                  (coe d384 (coe v0))))))
name398 = "Function.Metric.Nat.Bundles.Metric._.isPreMetric"
d398 :: T364 -> MAlonzo.Code.Function.Metric.Structures.T96
d398 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe
            MAlonzo.Code.Function.Metric.Structures.d318 (coe d384 (coe v0))))
name400 = "Function.Metric.Nat.Bundles.Metric._.isPreorder"
d400 :: T364 -> MAlonzo.Code.Relation.Binary.Structures.T70
d400 v0
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
                     (coe d384 (coe v0)))))))
name402 = "Function.Metric.Nat.Bundles.Metric._.isProtoMetric"
d402 :: T364 -> MAlonzo.Code.Function.Metric.Structures.T30
d402 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240
            (coe
               MAlonzo.Code.Function.Metric.Structures.d318 (coe d384 (coe v0)))))
name404 = "Function.Metric.Nat.Bundles.Metric._.isQuasiSemiMetric"
d404 :: T364 -> MAlonzo.Code.Function.Metric.Structures.T162
d404 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d240
      (coe
         MAlonzo.Code.Function.Metric.Structures.d318 (coe d384 (coe v0)))
name406 = "Function.Metric.Nat.Bundles.Metric._.isSemiMetric"
d406 :: T364 -> MAlonzo.Code.Function.Metric.Structures.T232
d406 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d318 (coe d384 (coe v0))
name408 = "Function.Metric.Nat.Bundles.Metric._.nonNegative"
d408 :: T364 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d408 v0
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
                  (coe d384 (coe v0))))))
name410 = "Function.Metric.Nat.Bundles.Metric._.refl"
d410 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T364 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d410 v0 v1 v2 = du410 v2
du410 :: T364 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du410 v0
  = let v1 = d384 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name412 = "Function.Metric.Nat.Bundles.Metric._.reflexive"
d412 ::
  T364 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d412 v0
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
                        (coe d384 (coe v0))))))))
name414 = "Function.Metric.Nat.Bundles.Metric._.sym"
d414 ::
  T364 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d414 = erased
name416 = "Function.Metric.Nat.Bundles.Metric._.trans"
d416 ::
  T364 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d416 v0
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
                        (coe d384 (coe v0))))))))
name418 = "Function.Metric.Nat.Bundles.Metric._.triangle"
d418 ::
  T364 ->
  AgdaAny -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d418 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d320 (coe d384 (coe v0))
name420 = "Function.Metric.Nat.Bundles.Metric._.≈-isEquivalence"
d420 :: T364 -> MAlonzo.Code.Relation.Binary.Structures.T26
d420 v0
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
                  (coe d384 (coe v0))))))
name422 = "Function.Metric.Nat.Bundles.Metric._.≈⇒0"
d422 ::
  T364 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d422 = erased
name424 = "Function.Metric.Nat.Bundles.Metric._.∼-resp-≈"
d424 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T364 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d424 v0 v1 v2 = du424 v2
du424 :: T364 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du424 v0
  = let v1 = d384 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name426 = "Function.Metric.Nat.Bundles.Metric._.∼-respʳ-≈"
d426 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T364 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d426 v0 v1 v2 = du426 v2
du426 ::
  T364 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du426 v0
  = let v1 = d384 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name428 = "Function.Metric.Nat.Bundles.Metric._.∼-respˡ-≈"
d428 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T364 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d428 v0 v1 v2 = du428 v2
du428 ::
  T364 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du428 v0
  = let v1 = d384 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name432
  = "Function.Metric.Nat.Bundles.Metric._.EqC.isPartialEquivalence"
d432 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T364 -> MAlonzo.Code.Relation.Binary.Structures.T16
d432 v0 v1 v2 = du432 v2
du432 :: T364 -> MAlonzo.Code.Relation.Binary.Structures.T16
du432 v0
  = let v1 = d384 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v5))
name434 = "Function.Metric.Nat.Bundles.Metric._.EqC.refl"
d434 :: T364 -> AgdaAny -> AgdaAny
d434 v0
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
                     (coe d384 (coe v0)))))))
name436 = "Function.Metric.Nat.Bundles.Metric._.EqC.reflexive"
d436 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T364 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d436 v0 v1 v2 = du436 v2
du436 ::
  T364 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du436 v0
  = let v1 = d384 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    \ v6 v7 v8 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v5)) v6
name438 = "Function.Metric.Nat.Bundles.Metric._.EqC.sym"
d438 :: T364 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d438 v0
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
                     (coe d384 (coe v0)))))))
name440 = "Function.Metric.Nat.Bundles.Metric._.EqC.trans"
d440 ::
  T364 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d440 v0
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
                     (coe d384 (coe v0)))))))
name444
  = "Function.Metric.Nat.Bundles.Metric._.Eq.isPartialEquivalence"
d444 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T364 -> MAlonzo.Code.Relation.Binary.Structures.T16
d444 v0 v1 v2 = du444 v2
du444 :: T364 -> MAlonzo.Code.Relation.Binary.Structures.T16
du444 v0
  = let v1 = d384 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    let v7 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v7))
name446 = "Function.Metric.Nat.Bundles.Metric._.Eq.refl"
d446 :: T364 -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d446 = erased
name448 = "Function.Metric.Nat.Bundles.Metric._.Eq.reflexive"
d448 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T364 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d448 = erased
name450 = "Function.Metric.Nat.Bundles.Metric._.Eq.sym"
d450 ::
  T364 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d450 = erased
name452 = "Function.Metric.Nat.Bundles.Metric._.Eq.trans"
d452 ::
  T364 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d452 = erased
name454 = "Function.Metric.Nat.Bundles.Metric.semiMetric"
d454 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T364 -> T266
d454 v0 v1 v2 = du454 v2
du454 :: T364 -> T266
du454 v0
  = coe
      C3001 (d382 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d318 (coe d384 (coe v0)))
name458 = "Function.Metric.Nat.Bundles.Metric._.preMetric"
d458 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T364 -> T90
d458 v0 v1 v2 = du458 v2
du458 :: T364 -> T90
du458 v0
  = let v1 = coe du454 (coe v0) in coe du256 (coe du352 (coe v1))
name460 = "Function.Metric.Nat.Bundles.Metric._.protoMetric"
d460 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T364 -> T12
d460 v0 v1 v2 = du460 v2
du460 :: T364 -> T12
du460 v0
  = let v1 = coe du454 (coe v0) in
    let v2 = coe du352 (coe v1) in coe du168 (coe du256 (coe v2))
name462 = "Function.Metric.Nat.Bundles.Metric._.quasiSemiMetric"
d462 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T364 -> T174
d462 v0 v1 v2 = du462 v2
du462 :: T364 -> T174
du462 v0 = coe du352 (coe du454 (coe v0))
name468 = "Function.Metric.Nat.Bundles.UltraMetric"
d468 a0 a1 = ()
data T468
  = C5071 (AgdaAny -> AgdaAny -> Integer)
          MAlonzo.Code.Function.Metric.Structures.T308
name482 = "Function.Metric.Nat.Bundles.UltraMetric.Carrier"
d482 :: T468 -> ()
d482 = erased
name484 = "Function.Metric.Nat.Bundles.UltraMetric._≈_"
d484 :: T468 -> AgdaAny -> AgdaAny -> ()
d484 = erased
name486 = "Function.Metric.Nat.Bundles.UltraMetric.d"
d486 :: T468 -> AgdaAny -> AgdaAny -> Integer
d486 v0
  = case coe v0 of
      C5071 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name488 = "Function.Metric.Nat.Bundles.UltraMetric.isUltraMetric"
d488 :: T468 -> MAlonzo.Code.Function.Metric.Structures.T308
d488 v0
  = case coe v0 of
      C5071 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name492 = "Function.Metric.Nat.Bundles.UltraMetric._.0⇒≈"
d492 ::
  T468 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d492 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe
            MAlonzo.Code.Function.Metric.Structures.d318 (coe d488 (coe v0))))
name494 = "Function.Metric.Nat.Bundles.UltraMetric._.antisym"
d494 ::
  T468 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d494 = erased
name496 = "Function.Metric.Nat.Bundles.UltraMetric._.cong"
d496 ::
  T468 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d496 = erased
name498 = "Function.Metric.Nat.Bundles.UltraMetric._.isEquivalence"
d498 :: T468 -> MAlonzo.Code.Relation.Binary.Structures.T26
d498 v0
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
                        (coe d488 (coe v0))))))))
name500
  = "Function.Metric.Nat.Bundles.UltraMetric._.isPartialOrder"
d500 :: T468 -> MAlonzo.Code.Relation.Binary.Structures.T118
d500 v0
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
                  (coe d488 (coe v0))))))
name502 = "Function.Metric.Nat.Bundles.UltraMetric._.isPreMetric"
d502 :: T468 -> MAlonzo.Code.Function.Metric.Structures.T96
d502 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe
            MAlonzo.Code.Function.Metric.Structures.d318 (coe d488 (coe v0))))
name504 = "Function.Metric.Nat.Bundles.UltraMetric._.isPreorder"
d504 :: T468 -> MAlonzo.Code.Relation.Binary.Structures.T70
d504 v0
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
                     (coe d488 (coe v0)))))))
name506 = "Function.Metric.Nat.Bundles.UltraMetric._.isProtoMetric"
d506 :: T468 -> MAlonzo.Code.Function.Metric.Structures.T30
d506 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240
            (coe
               MAlonzo.Code.Function.Metric.Structures.d318 (coe d488 (coe v0)))))
name508
  = "Function.Metric.Nat.Bundles.UltraMetric._.isQuasiSemiMetric"
d508 :: T468 -> MAlonzo.Code.Function.Metric.Structures.T162
d508 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d240
      (coe
         MAlonzo.Code.Function.Metric.Structures.d318 (coe d488 (coe v0)))
name510 = "Function.Metric.Nat.Bundles.UltraMetric._.isSemiMetric"
d510 :: T468 -> MAlonzo.Code.Function.Metric.Structures.T232
d510 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d318 (coe d488 (coe v0))
name512 = "Function.Metric.Nat.Bundles.UltraMetric._.nonNegative"
d512 :: T468 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d512 v0
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
                  (coe d488 (coe v0))))))
name514 = "Function.Metric.Nat.Bundles.UltraMetric._.refl"
d514 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T468 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d514 v0 v1 v2 = du514 v2
du514 :: T468 -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du514 v0
  = let v1 = d488 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name516 = "Function.Metric.Nat.Bundles.UltraMetric._.reflexive"
d516 ::
  T468 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d516 v0
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
                        (coe d488 (coe v0))))))))
name518 = "Function.Metric.Nat.Bundles.UltraMetric._.sym"
d518 ::
  T468 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d518 = erased
name520 = "Function.Metric.Nat.Bundles.UltraMetric._.trans"
d520 ::
  T468 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d520 v0
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
                        (coe d488 (coe v0))))))))
name522 = "Function.Metric.Nat.Bundles.UltraMetric._.triangle"
d522 ::
  T468 ->
  AgdaAny -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d522 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d320 (coe d488 (coe v0))
name524
  = "Function.Metric.Nat.Bundles.UltraMetric._.≈-isEquivalence"
d524 :: T468 -> MAlonzo.Code.Relation.Binary.Structures.T26
d524 v0
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
                  (coe d488 (coe v0))))))
name526 = "Function.Metric.Nat.Bundles.UltraMetric._.≈⇒0"
d526 ::
  T468 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d526 = erased
name528 = "Function.Metric.Nat.Bundles.UltraMetric._.∼-resp-≈"
d528 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T468 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d528 v0 v1 v2 = du528 v2
du528 :: T468 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du528 v0
  = let v1 = d488 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name530 = "Function.Metric.Nat.Bundles.UltraMetric._.∼-respʳ-≈"
d530 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T468 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d530 v0 v1 v2 = du530 v2
du530 ::
  T468 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du530 v0
  = let v1 = d488 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name532 = "Function.Metric.Nat.Bundles.UltraMetric._.∼-respˡ-≈"
d532 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T468 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d532 v0 v1 v2 = du532 v2
du532 ::
  T468 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du532 v0
  = let v1 = d488 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6))
name536
  = "Function.Metric.Nat.Bundles.UltraMetric._.EqC.isPartialEquivalence"
d536 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T468 -> MAlonzo.Code.Relation.Binary.Structures.T16
d536 v0 v1 v2 = du536 v2
du536 :: T468 -> MAlonzo.Code.Relation.Binary.Structures.T16
du536 v0
  = let v1 = d488 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v5))
name538 = "Function.Metric.Nat.Bundles.UltraMetric._.EqC.refl"
d538 :: T468 -> AgdaAny -> AgdaAny
d538 v0
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
                     (coe d488 (coe v0)))))))
name540 = "Function.Metric.Nat.Bundles.UltraMetric._.EqC.reflexive"
d540 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T468 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d540 v0 v1 v2 = du540 v2
du540 ::
  T468 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du540 v0
  = let v1 = d488 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    \ v6 v7 v8 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v5)) v6
name542 = "Function.Metric.Nat.Bundles.UltraMetric._.EqC.sym"
d542 :: T468 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d542 v0
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
                     (coe d488 (coe v0)))))))
name544 = "Function.Metric.Nat.Bundles.UltraMetric._.EqC.trans"
d544 ::
  T468 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d544 v0
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
                     (coe d488 (coe v0)))))))
name548
  = "Function.Metric.Nat.Bundles.UltraMetric._.Eq.isPartialEquivalence"
d548 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T468 -> MAlonzo.Code.Relation.Binary.Structures.T16
d548 v0 v1 v2 = du548 v2
du548 :: T468 -> MAlonzo.Code.Relation.Binary.Structures.T16
du548 v0
  = let v1 = d488 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v4) in
    let v6 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v5) in
    let v7 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v6) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v7))
name550 = "Function.Metric.Nat.Bundles.UltraMetric._.Eq.refl"
d550 :: T468 -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d550 = erased
name552 = "Function.Metric.Nat.Bundles.UltraMetric._.Eq.reflexive"
d552 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T468 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d552 = erased
name554 = "Function.Metric.Nat.Bundles.UltraMetric._.Eq.sym"
d554 ::
  T468 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d554 = erased
name556 = "Function.Metric.Nat.Bundles.UltraMetric._.Eq.trans"
d556 ::
  T468 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d556 = erased
name558 = "Function.Metric.Nat.Bundles.UltraMetric.semiMetric"
d558 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T468 -> T266
d558 v0 v1 v2 = du558 v2
du558 :: T468 -> T266
du558 v0
  = coe
      C3001 (d486 (coe v0))
      (MAlonzo.Code.Function.Metric.Structures.d318 (coe d488 (coe v0)))
name562 = "Function.Metric.Nat.Bundles.UltraMetric._.preMetric"
d562 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T468 -> T90
d562 v0 v1 v2 = du562 v2
du562 :: T468 -> T90
du562 v0
  = let v1 = coe du558 (coe v0) in coe du256 (coe du352 (coe v1))
name564 = "Function.Metric.Nat.Bundles.UltraMetric._.protoMetric"
d564 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T468 -> T12
d564 v0 v1 v2 = du564 v2
du564 :: T468 -> T12
du564 v0
  = let v1 = coe du558 (coe v0) in
    let v2 = coe du352 (coe v1) in coe du168 (coe du256 (coe v2))
name566
  = "Function.Metric.Nat.Bundles.UltraMetric._.quasiSemiMetric"
d566 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T468 -> T174
d566 v0 v1 v2 = du566 v2
du566 :: T468 -> T174
du566 v0 = coe du352 (coe du558 (coe v0))
