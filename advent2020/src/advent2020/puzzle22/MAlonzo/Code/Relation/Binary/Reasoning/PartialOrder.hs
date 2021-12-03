{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Relation.Binary.Reasoning.PartialOrder where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary

name134 = "Relation.Binary.Reasoning.PartialOrder._._IsRelatedTo_"
d134 a0 a1 a2 a3 a4 a5 = ()
name136 = "Relation.Binary.Reasoning.PartialOrder._._∎"
d136 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d136 v0 v1 v2 v3 = du136 v3
du136 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du136 v0
  = let v1
          = MAlonzo.Code.Relation.Binary.Structures.d126
              (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)) in
    coe
      (\ v2 ->
         coe
           MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
           (coe
              MAlonzo.Code.Relation.Binary.Structures.d34
              (MAlonzo.Code.Relation.Binary.Structures.d80 (coe v1)) v2))
name138 = "Relation.Binary.Reasoning.PartialOrder._._≡⟨⟩_"
d138 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d138 v0 = coe v0
name140 = "Relation.Binary.Reasoning.PartialOrder._.IsEquality"
d140 a0 a1 a2 a3 a4 a5 a6 = ()
name142 = "Relation.Binary.Reasoning.PartialOrder._.IsEquality?"
d142 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Nullary.T32
d142 v0 v1 v2 v3 = du142
du142 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Nullary.T32
du142 v0 v1 v2
  = coe MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du142 v2
name144 = "Relation.Binary.Reasoning.PartialOrder._.IsStrict"
d144 a0 a1 a2 a3 a4 a5 a6 = ()
name146 = "Relation.Binary.Reasoning.PartialOrder._.IsStrict?"
d146 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Nullary.T32
d146 v0 v1 v2 v3 = du146
du146 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Nullary.T32
du146 v0 v1 v2
  = coe MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du108 v2
name148 = "Relation.Binary.Reasoning.PartialOrder._.begin_"
d148 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 -> AgdaAny
d148 v0 v1 v2 v3 = du148 v3
du148 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 -> AgdaAny
du148 v0
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
      (coe (\ v1 v2 -> MAlonzo.Code.Agda.Builtin.Sigma.d28))
name150
  = "Relation.Binary.Reasoning.PartialOrder._.begin-equality_"
d150 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> AgdaAny
d150 v0 v1 v2 v3 = du150
du150 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> AgdaAny
du150 v0 v1 v2 v3
  = coe MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du190 v2
name152 = "Relation.Binary.Reasoning.PartialOrder._.begin-strict_"
d152 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d152 v0 v1 v2 v3 = du152
du152 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du152 v0 v1 v2 v3
  = coe MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du176 v2
name156
  = "Relation.Binary.Reasoning.PartialOrder._.extractEquality"
d156 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T126 -> AgdaAny
d156 v0 v1 v2 v3 = du156
du156 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T126 -> AgdaAny
du156 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du152 v2 v3
name158 = "Relation.Binary.Reasoning.PartialOrder._.extractStrict"
d158 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T92 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d158 v0 v1 v2 v3 = du158
du158 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T92 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du158 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du118 v2 v3
name166 = "Relation.Binary.Reasoning.PartialOrder._.step-<"
d166 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d166 v0 v1 v2 v3 = du166 v3
du166 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du166 v0
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du202
      (coe
         MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du636
         (MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
      (coe
         MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du322
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d80
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d126
               (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0))))
         (let v1 = MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0) in
          coe
            MAlonzo.Code.Relation.Binary.Structures.du112
            (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))))
      (coe
         MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du250
         (let v1
                = coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v0) in
          coe
            MAlonzo.Code.Relation.Binary.Structures.d36
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d80
               (coe MAlonzo.Code.Relation.Binary.Bundles.d154 (coe v1))))
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d84
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d126
               (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0))))
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d128
            (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
         (let v1 = MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0) in
          coe
            MAlonzo.Code.Relation.Binary.Structures.du106
            (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))))
name168 = "Relation.Binary.Reasoning.PartialOrder._.step-≈"
d168 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d168 v0 v1 v2 v3 = du168 v3
du168 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du168 v0
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du254
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
      (coe
         MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du322
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d80
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d126
               (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0))))
         (let v1 = MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0) in
          coe
            MAlonzo.Code.Relation.Binary.Structures.du112
            (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))))
name170 = "Relation.Binary.Reasoning.PartialOrder._.step-≈˘"
d170 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d170 v0 v1 v2 v3 = du170 v3
du170 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du170 v0
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du280
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
      (coe
         MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du322
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d80
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d126
               (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0))))
         (let v1 = MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0) in
          coe
            MAlonzo.Code.Relation.Binary.Structures.du112
            (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))))
name172 = "Relation.Binary.Reasoning.PartialOrder._.step-≡"
d172 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d172 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du172 v7
du172 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du172 v0 = coe v0
name174 = "Relation.Binary.Reasoning.PartialOrder._.step-≡˘"
d174 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d174 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du174 v7
du174 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du174 v0 = coe v0
name176 = "Relation.Binary.Reasoning.PartialOrder._.step-≤"
d176 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d176 v0 v1 v2 v3 = du176 v3
du176 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du176 v0
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d126
         (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
      (coe
         MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du268
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d84
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d126
               (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0))))
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d128
            (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
         (let v1 = MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0) in
          coe
            MAlonzo.Code.Relation.Binary.Structures.du100
            (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v1))))
name196 = "Relation.Binary.Reasoning.PartialOrder._≈⟨⟩_"
d196 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d196 v0 v1 v2 v3 = du196 v3
du196 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du196 v0 = coe v0
