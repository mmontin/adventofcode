{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Function.Metric.Nat.Structures where

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

name14 = "Function.Metric.Nat.Structures.IsProtoMetric"
d14 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d14 = erased
name18 = "Function.Metric.Nat.Structures.IsPreMetric"
d18 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d18 = erased
name22 = "Function.Metric.Nat.Structures.IsQuasiSemiMetric"
d22 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d22 = erased
name26 = "Function.Metric.Nat.Structures.IsSemiMetric"
d26 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d26 = erased
name30 = "Function.Metric.Nat.Structures.IsMetric"
d30 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d30 = erased
name48 = "Function.Metric.Nat.Structures.IsMetric._.0⇒≈"
d48 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d48 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))
name50 = "Function.Metric.Nat.Structures.IsMetric._.antisym"
d50 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d50 = erased
name52 = "Function.Metric.Nat.Structures.IsMetric._.cong"
d52 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d52 = erased
name54 = "Function.Metric.Nat.Structures.IsMetric._.isEquivalence"
d54 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T26
d54 v0
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
                     (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))))
name56 = "Function.Metric.Nat.Structures.IsMetric._.isPartialOrder"
d56 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
d56 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))
name58 = "Function.Metric.Nat.Structures.IsMetric._.isPreMetric"
d58 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Function.Metric.Structures.T96
d58 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))
name60 = "Function.Metric.Nat.Structures.IsMetric._.isPreorder"
d60 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T70
d60 v0
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
                  (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))))
name62 = "Function.Metric.Nat.Structures.IsMetric._.isProtoMetric"
d62 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Function.Metric.Structures.T30
d62 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240
            (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))
name64
  = "Function.Metric.Nat.Structures.IsMetric._.isQuasiSemiMetric"
d64 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Function.Metric.Structures.T162
d64 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d240
      (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))
name66 = "Function.Metric.Nat.Structures.IsMetric._.isSemiMetric"
d66 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Function.Metric.Structures.T232
d66 v0 = coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)
name68 = "Function.Metric.Nat.Structures.IsMetric._.nonNegative"
d68 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d68 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))
name70 = "Function.Metric.Nat.Structures.IsMetric._.refl"
d70 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer -> MAlonzo.Code.Data.Nat.Base.T6
d70 v0 v1 v2 v3 v4 v5 = du70 v5
du70 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer -> MAlonzo.Code.Data.Nat.Base.T6
du70 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name72 = "Function.Metric.Nat.Structures.IsMetric._.reflexive"
d72 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d72 v0
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
                     (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))))
name74 = "Function.Metric.Nat.Structures.IsMetric._.sym"
d74 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d74 = erased
name76 = "Function.Metric.Nat.Structures.IsMetric._.trans"
d76 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d76 v0
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
                     (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))))
name78 = "Function.Metric.Nat.Structures.IsMetric._.triangle"
d78 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d78 v0 = coe MAlonzo.Code.Function.Metric.Structures.d320 (coe v0)
name80
  = "Function.Metric.Nat.Structures.IsMetric._.≈-isEquivalence"
d80 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T26
d80 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))
name82 = "Function.Metric.Nat.Structures.IsMetric._.≈⇒0"
d82 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d82 = erased
name84 = "Function.Metric.Nat.Structures.IsMetric._.∼-resp-≈"
d84 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d84 v0 v1 v2 v3 v4 v5 = du84 v5
du84 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du84 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name86 = "Function.Metric.Nat.Structures.IsMetric._.∼-respʳ-≈"
d86 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d86 v0 v1 v2 v3 v4 v5 = du86 v5
du86 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du86 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name88 = "Function.Metric.Nat.Structures.IsMetric._.∼-respˡ-≈"
d88 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d88 v0 v1 v2 v3 v4 v5 = du88 v5
du88 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du88 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name92
  = "Function.Metric.Nat.Structures.IsMetric._.EqC.isPartialEquivalence"
d92 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T16
d92 v0 v1 v2 v3 v4 v5 = du92 v5
du92 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T16
du92 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v4))
name94 = "Function.Metric.Nat.Structures.IsMetric._.EqC.refl"
d94 ::
  MAlonzo.Code.Function.Metric.Structures.T308 -> AgdaAny -> AgdaAny
d94 v0
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
                  (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))))
name96 = "Function.Metric.Nat.Structures.IsMetric._.EqC.reflexive"
d96 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d96 v0 v1 v2 v3 v4 v5 = du96 v5
du96 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du96 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    \ v5 v6 v7 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v4)) v5
name98 = "Function.Metric.Nat.Structures.IsMetric._.EqC.sym"
d98 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d98 v0
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
                  (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))))
name100 = "Function.Metric.Nat.Structures.IsMetric._.EqC.trans"
d100 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d100 v0
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
                  (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))))
name104
  = "Function.Metric.Nat.Structures.IsMetric._.Eq.isPartialEquivalence"
d104 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T16
d104 v0 v1 v2 v3 v4 v5 = du104 v5
du104 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T16
du104 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    let v6 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v6))
name106 = "Function.Metric.Nat.Structures.IsMetric._.Eq.refl"
d106 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d106 = erased
name108 = "Function.Metric.Nat.Structures.IsMetric._.Eq.reflexive"
d108 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d108 = erased
name110 = "Function.Metric.Nat.Structures.IsMetric._.Eq.sym"
d110 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d110 = erased
name112 = "Function.Metric.Nat.Structures.IsMetric._.Eq.trans"
d112 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d112 = erased
name114 = "Function.Metric.Nat.Structures.IsUltraMetric"
d114 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) -> (AgdaAny -> AgdaAny -> Integer) -> ()
d114 = erased
name132 = "Function.Metric.Nat.Structures.IsUltraMetric._.0⇒≈"
d132 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d132 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d172
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))
name134 = "Function.Metric.Nat.Structures.IsUltraMetric._.antisym"
d134 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d134 = erased
name136 = "Function.Metric.Nat.Structures.IsUltraMetric._.cong"
d136 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d136 = erased
name138
  = "Function.Metric.Nat.Structures.IsUltraMetric._.isEquivalence"
d138 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T26
d138 v0
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
                     (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))))
name140
  = "Function.Metric.Nat.Structures.IsUltraMetric._.isPartialOrder"
d140 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
d140 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d42
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))
name142
  = "Function.Metric.Nat.Structures.IsUltraMetric._.isPreMetric"
d142 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Function.Metric.Structures.T96
d142 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d170
      (coe
         MAlonzo.Code.Function.Metric.Structures.d240
         (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))
name144
  = "Function.Metric.Nat.Structures.IsUltraMetric._.isPreorder"
d144 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T70
d144 v0
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
                  (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))))
name146
  = "Function.Metric.Nat.Structures.IsUltraMetric._.isProtoMetric"
d146 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Function.Metric.Structures.T30
d146 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d104
      (coe
         MAlonzo.Code.Function.Metric.Structures.d170
         (coe
            MAlonzo.Code.Function.Metric.Structures.d240
            (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))
name148
  = "Function.Metric.Nat.Structures.IsUltraMetric._.isQuasiSemiMetric"
d148 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Function.Metric.Structures.T162
d148 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d240
      (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))
name150
  = "Function.Metric.Nat.Structures.IsUltraMetric._.isSemiMetric"
d150 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Function.Metric.Structures.T232
d150 v0 = coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)
name152
  = "Function.Metric.Nat.Structures.IsUltraMetric._.nonNegative"
d152 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d152 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d48
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))
name154 = "Function.Metric.Nat.Structures.IsUltraMetric._.refl"
d154 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer -> MAlonzo.Code.Data.Nat.Base.T6
d154 v0 v1 v2 v3 v4 v5 = du154 v5
du154 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer -> MAlonzo.Code.Data.Nat.Base.T6
du154 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name156
  = "Function.Metric.Nat.Structures.IsUltraMetric._.reflexive"
d156 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d156 v0
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
                     (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))))
name158 = "Function.Metric.Nat.Structures.IsUltraMetric._.sym"
d158 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d158 = erased
name160 = "Function.Metric.Nat.Structures.IsUltraMetric._.trans"
d160 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d160 v0
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
                     (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))))
name162 = "Function.Metric.Nat.Structures.IsUltraMetric._.triangle"
d162 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d162 v0 = coe MAlonzo.Code.Function.Metric.Structures.d320 (coe v0)
name164
  = "Function.Metric.Nat.Structures.IsUltraMetric._.≈-isEquivalence"
d164 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T26
d164 v0
  = coe
      MAlonzo.Code.Function.Metric.Structures.d44
      (coe
         MAlonzo.Code.Function.Metric.Structures.d104
         (coe
            MAlonzo.Code.Function.Metric.Structures.d170
            (coe
               MAlonzo.Code.Function.Metric.Structures.d240
               (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0)))))
name166 = "Function.Metric.Nat.Structures.IsUltraMetric._.≈⇒0"
d166 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d166 = erased
name168 = "Function.Metric.Nat.Structures.IsUltraMetric._.∼-resp-≈"
d168 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d168 v0 v1 v2 v3 v4 v5 = du168 v5
du168 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du168 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du112
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name170
  = "Function.Metric.Nat.Structures.IsUltraMetric._.∼-respʳ-≈"
d170 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d170 v0 v1 v2 v3 v4 v5 = du170 v5
du170 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du170 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du106
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name172
  = "Function.Metric.Nat.Structures.IsUltraMetric._.∼-respˡ-≈"
d172 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d172 v0 v1 v2 v3 v4 v5 = du172 v5
du172 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du172 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du100
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5))
name176
  = "Function.Metric.Nat.Structures.IsUltraMetric._.EqC.isPartialEquivalence"
d176 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T16
d176 v0 v1 v2 v3 v4 v5 = du176 v5
du176 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T16
du176 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v4))
name178 = "Function.Metric.Nat.Structures.IsUltraMetric._.EqC.refl"
d178 ::
  MAlonzo.Code.Function.Metric.Structures.T308 -> AgdaAny -> AgdaAny
d178 v0
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
                  (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))))
name180
  = "Function.Metric.Nat.Structures.IsUltraMetric._.EqC.reflexive"
d180 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d180 v0 v1 v2 v3 v4 v5 = du180 v5
du180 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du180 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    \ v5 v6 v7 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Function.Metric.Structures.d44 (coe v4)) v5
name182 = "Function.Metric.Nat.Structures.IsUltraMetric._.EqC.sym"
d182 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d182 v0
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
                  (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))))
name184
  = "Function.Metric.Nat.Structures.IsUltraMetric._.EqC.trans"
d184 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d184 v0
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
                  (coe MAlonzo.Code.Function.Metric.Structures.d318 (coe v0))))))
name188
  = "Function.Metric.Nat.Structures.IsUltraMetric._.Eq.isPartialEquivalence"
d188 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T16
d188 v0 v1 v2 v3 v4 v5 = du188 v5
du188 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  MAlonzo.Code.Relation.Binary.Structures.T16
du188 v0
  = let v1 = MAlonzo.Code.Function.Metric.Structures.d318 (coe v0) in
    let v2 = MAlonzo.Code.Function.Metric.Structures.d240 (coe v1) in
    let v3 = MAlonzo.Code.Function.Metric.Structures.d170 (coe v2) in
    let v4 = MAlonzo.Code.Function.Metric.Structures.d104 (coe v3) in
    let v5 = MAlonzo.Code.Function.Metric.Structures.d42 (coe v4) in
    let v6 = MAlonzo.Code.Relation.Binary.Structures.d126 (coe v5) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Relation.Binary.Structures.d80 (coe v6))
name190 = "Function.Metric.Nat.Structures.IsUltraMetric._.Eq.refl"
d190 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d190 = erased
name192
  = "Function.Metric.Nat.Structures.IsUltraMetric._.Eq.reflexive"
d192 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> Integer) ->
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d192 = erased
name194 = "Function.Metric.Nat.Structures.IsUltraMetric._.Eq.sym"
d194 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d194 = erased
name196 = "Function.Metric.Nat.Structures.IsUltraMetric._.Eq.trans"
d196 ::
  MAlonzo.Code.Function.Metric.Structures.T308 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d196 = erased
