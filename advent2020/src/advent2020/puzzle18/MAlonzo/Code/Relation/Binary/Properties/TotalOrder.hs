{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Relation.Binary.Properties.TotalOrder where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.Sum.Base
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Consequences
import qualified MAlonzo.Code.Relation.Binary.Construct.Converse
import qualified MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict
import qualified MAlonzo.Code.Relation.Binary.Properties.Poset
import qualified MAlonzo.Code.Relation.Binary.Properties.Preorder
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary

name140
  = "Relation.Binary.Properties.TotalOrder.PosetProperties._<_"
d140 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> ()
d140 = erased
name142
  = "Relation.Binary.Properties.TotalOrder.PosetProperties._≥_"
d142 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> ()
d142 = erased
name144
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.asym"
d144 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d144 = erased
name146
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.irrefl"
d146 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d146 = erased
name148
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.<-isStrictPartialOrder"
d148 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Structures.T222
d148 v0 v1 v2 v3 = du148 v3
du148 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Structures.T222
du148 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.Poset.du168
      (coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0))
name150
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.<-resp-≈"
d150 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d150 v0 v1 v2 v3 = du150 v3
du150 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du150 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.d240
      (coe MAlonzo.Code.Relation.Binary.Properties.Poset.du168 (coe v1))
name152
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.<-respʳ-≈"
d152 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d152 v0 v1 v2 v3 = du152 v3
du152 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du152 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Relation.Binary.Properties.Poset.du170 (coe v1) in
    let v3 = MAlonzo.Code.Relation.Binary.Bundles.d416 (coe v2) in
    coe
      (\ v4 v5 v6 ->
         coe
           MAlonzo.Code.Agda.Builtin.Sigma.d28
           (MAlonzo.Code.Relation.Binary.Structures.d240 (coe v3)) v4 v5 v6)
name154
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.<-respˡ-≈"
d154 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d154 v0 v1 v2 v3 = du154 v3
du154 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du154 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Relation.Binary.Properties.Poset.du170 (coe v1) in
    let v3 = MAlonzo.Code.Relation.Binary.Bundles.d416 (coe v2) in
    coe
      (\ v4 v5 v6 ->
         coe
           MAlonzo.Code.Agda.Builtin.Sigma.d30
           (MAlonzo.Code.Relation.Binary.Structures.d240 (coe v3)) v4 v5 v6)
name156
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.<-strictPartialOrder"
d156 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Bundles.T394
d156 v0 v1 v2 v3 = du156 v3
du156 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Bundles.T394
du156 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.Poset.du170
      (coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0))
name158
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.trans"
d158 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d158 v0 v1 v2 v3 = du158 v3
du158 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du158 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.d238
      (coe MAlonzo.Code.Relation.Binary.Properties.Poset.du168 (coe v1))
name160
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.<⇒≉"
d160 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  AgdaAny -> MAlonzo.Code.Data.Empty.T4
d160 = erased
name162
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.<⇒≱"
d162 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  AgdaAny -> MAlonzo.Code.Data.Empty.T4
d162 = erased
name170
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.≤⇒≯"
d170 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d170 = erased
name172
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.≤∧≉⇒<"
d172 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d172 v0 v1 v2 v3 v4 v5 = du172
du172 ::
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du172 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32
name174
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.antisym"
d174 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d174 v0 v1 v2 v3 = du174 v3
du174 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du174 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    coe
      (\ v2 v3 v4 v5 ->
         coe
           MAlonzo.Code.Relation.Binary.Structures.d128
           (MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v1)) v2 v3 v5 v4)
name176
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.≥-isPartialOrder"
d176 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
d176 v0 v1 v2 v3 = du176 v3
du176 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
du176 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.Poset.du152
      (coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0))
name178
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.invIsPreorder"
d178 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Structures.T70
d178 v0 v1 v2 v3 = du178 v3
du178 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Structures.T70
du178 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Properties.Preorder.du64
      (coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v1))
name180
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.≥-poset"
d180 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204
d180 v0 v1 v2 v3 = du180 v3
du180 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204
du180 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.Poset.du154
      (coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0))
name182
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.invPreorder"
d182 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Bundles.T132
d182 v0 v1 v2 v3 = du182 v3
du182 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Bundles.T132
du182 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Properties.Preorder.du66
      (coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v1))
name184
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.refl"
d184 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 -> AgdaAny -> AgdaAny
d184 v0 v1 v2 v3 = du184 v3
du184 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 -> AgdaAny -> AgdaAny
du184 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Relation.Binary.Properties.Poset.du154 (coe v1) in
    let v3 = MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v2) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v3))
name186
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.reflexive"
d186 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d186 v0 v1 v2 v3 = du186 v3
du186 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du186 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    coe
      (\ v2 v3 v4 ->
         coe
           MAlonzo.Code.Relation.Binary.Structures.d82
           (MAlonzo.Code.Relation.Binary.Structures.d126
              (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v1)))
           v3 v2
           (coe
              MAlonzo.Code.Relation.Binary.Structures.d36
              (MAlonzo.Code.Relation.Binary.Structures.d80
                 (coe
                    MAlonzo.Code.Relation.Binary.Structures.d126
                    (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v1))))
              v2 v3 v4))
name188
  = "Relation.Binary.Properties.TotalOrder.PosetProperties.trans"
d188 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d188 v0 v1 v2 v3 = du188 v3
du188 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du188 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
    coe
      (\ v2 v3 v4 v5 v6 ->
         coe
           MAlonzo.Code.Relation.Binary.Structures.d84
           (MAlonzo.Code.Relation.Binary.Structures.d126
              (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v1)))
           v4 v3 v2 v6 v5)
name190 = "Relation.Binary.Properties.TotalOrder.decTotalOrder"
d190 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  MAlonzo.Code.Relation.Binary.Bundles.T658
d190 v0 v1 v2 v3 v4 = du190 v3 v4
du190 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  MAlonzo.Code.Relation.Binary.Bundles.T658
du190 v0 v1
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C7777
      (coe
         MAlonzo.Code.Relation.Binary.Structures.C12739
         (coe MAlonzo.Code.Relation.Binary.Bundles.d596 (coe v0)) (coe v1)
         (coe
            MAlonzo.Code.Relation.Binary.Consequences.du152
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d82
               (coe
                  MAlonzo.Code.Relation.Binary.Structures.d126
                  (coe
                     MAlonzo.Code.Relation.Binary.Structures.d348
                     (coe MAlonzo.Code.Relation.Binary.Bundles.d596 (coe v0)))))
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d350
               (coe MAlonzo.Code.Relation.Binary.Bundles.d596 (coe v0)))
            (coe v1)))
name194 = "Relation.Binary.Properties.TotalOrder.≥-isTotalOrder"
d194 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Structures.T340
d194 v0 v1 v2 v3 = du194 v3
du194 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Structures.T340
du194 v0
  = coe
      MAlonzo.Code.Relation.Binary.Construct.Converse.du342
      (coe MAlonzo.Code.Relation.Binary.Bundles.d596 (coe v0))
name196 = "Relation.Binary.Properties.TotalOrder.≥-totalOrder"
d196 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574
d196 v0 v1 v2 v3 = du196 v3
du196 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574
du196 v0
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C6779 (coe du194 (coe v0))
name200 = "Relation.Binary.Properties.TotalOrder._.total"
d200 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Sum.Base.T30
d200 v0 v1 v2 v3 = du200 v3
du200 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Sum.Base.T30
du200 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d350 (coe du194 (coe v0))
name206 = "Relation.Binary.Properties.TotalOrder.≰⇒>"
d206 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d206 v0 v1 v2 v3 v4 v5 = du206 v3 v4 v5
du206 ::
  MAlonzo.Code.Relation.Binary.Bundles.T574 ->
  AgdaAny ->
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du206 v0 v1 v2
  = coe
      MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du76
      (let v3
             = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v0) in
       let v4 = coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v3) in
       coe
         MAlonzo.Code.Relation.Binary.Structures.d36
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d80
            (coe MAlonzo.Code.Relation.Binary.Bundles.d154 (coe v4))))
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d82
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d348
               (coe MAlonzo.Code.Relation.Binary.Bundles.d596 (coe v0)))))
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d350
         (coe MAlonzo.Code.Relation.Binary.Bundles.d596 (coe v0)))
      (coe v1) (coe v2)
