{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Relation.Binary.Properties.Poset where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict
import qualified MAlonzo.Code.Relation.Binary.Properties.Preorder
import qualified MAlonzo.Code.Relation.Binary.Structures

name136
  = "Relation.Binary.Properties.Poset.PreorderProperties.invIsPreorder"
d136 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Structures.T70
d136 v0 v1 v2 v3 = du136 v3
du136 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Structures.T70
du136 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.Preorder.du64
      (coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v0))
name138
  = "Relation.Binary.Properties.Poset.PreorderProperties.invPreorder"
d138 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T132
d138 v0 v1 v2 v3 = du138 v3
du138 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T132
du138 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.Preorder.du66
      (coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v0))
name140 = "Relation.Binary.Properties.Poset._≉_"
d140 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> ()
d140 = erased
name146 = "Relation.Binary.Properties.Poset._≥_"
d146 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> ()
d146 = erased
name152 = "Relation.Binary.Properties.Poset.≥-isPartialOrder"
d152 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
d152 v0 v1 v2 v3 = du152 v3
du152 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
du152 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C4865
      (coe
         MAlonzo.Code.Relation.Binary.Properties.Preorder.du64
         (coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v0)))
      (coe
         (\ v1 v2 v3 v4 ->
            coe
              MAlonzo.Code.Relation.Binary.Structures.d128
              (MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)) v1 v2 v4 v3))
name154 = "Relation.Binary.Properties.Poset.≥-poset"
d154 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204
d154 v0 v1 v2 v3 = du154 v3
du154 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204
du154 v0
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C2365 (coe du152 (coe v0))
name158 = "Relation.Binary.Properties.Poset._.antisym"
d158 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d158 v0 v1 v2 v3 v4 v5 v6 v7 = du158 v3 v4 v5 v6 v7
du158 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du158 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d128
      (MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)) v1 v2 v4 v3
name160 = "Relation.Binary.Properties.Poset._.refl"
d160 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 -> AgdaAny -> AgdaAny
d160 v0 v1 v2 v3 = du160 v3
du160 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 -> AgdaAny -> AgdaAny
du160 v0
  = let v1 = coe du154 (coe v0) in
    let v2 = MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v2))
name162 = "Relation.Binary.Properties.Poset._.reflexive"
d162 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d162 v0 v1 v2 v3 v4 v5 v6 = du162 v3 v4 v5 v6
du162 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du162 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d82
      (MAlonzo.Code.Relation.Binary.Structures.d126
         (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
      v2 v1
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d36
         (MAlonzo.Code.Relation.Binary.Structures.d80
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d126
               (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0))))
         v1 v2 v3)
name164 = "Relation.Binary.Properties.Poset._.trans"
d164 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d164 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du164 v3 v4 v5 v6 v7 v8
du164 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du164 v0 v1 v2 v3 v4 v5
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d84
      (MAlonzo.Code.Relation.Binary.Structures.d126
         (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0)))
      v3 v2 v1 v5 v4
name166 = "Relation.Binary.Properties.Poset._<_"
d166 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny -> AgdaAny -> ()
d166 = erased
name168 = "Relation.Binary.Properties.Poset.<-isStrictPartialOrder"
d168 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Structures.T222
d168 v0 v1 v2 v3 = du168 v3
du168 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Structures.T222
du168 v0
  = coe
      MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du438
      (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v0))
name170 = "Relation.Binary.Properties.Poset.<-strictPartialOrder"
d170 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T394
d170 v0 v1 v2 v3 = du170 v3
du170 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T394
du170 v0
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C4625 (coe du168 (coe v0))
name174 = "Relation.Binary.Properties.Poset._.asym"
d174 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d174 = erased
name176 = "Relation.Binary.Properties.Poset._.irrefl"
d176 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d176 = erased
name178 = "Relation.Binary.Properties.Poset._.<-resp-≈"
d178 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d178 v0 v1 v2 v3 = du178 v3
du178 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du178 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d240 (coe du168 (coe v0))
name180 = "Relation.Binary.Properties.Poset._.<-respʳ-≈"
d180 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d180 v0 v1 v2 v3 = du180 v3
du180 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du180 v0
  = let v1 = coe du170 (coe v0) in
    let v2 = MAlonzo.Code.Relation.Binary.Bundles.d416 (coe v1) in
    coe
      (\ v3 v4 v5 ->
         coe
           MAlonzo.Code.Agda.Builtin.Sigma.d28
           (MAlonzo.Code.Relation.Binary.Structures.d240 (coe v2)) v3 v4 v5)
name182 = "Relation.Binary.Properties.Poset._.<-respˡ-≈"
d182 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d182 v0 v1 v2 v3 = du182 v3
du182 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du182 v0
  = let v1 = coe du170 (coe v0) in
    let v2 = MAlonzo.Code.Relation.Binary.Bundles.d416 (coe v1) in
    coe
      (\ v3 v4 v5 ->
         coe
           MAlonzo.Code.Agda.Builtin.Sigma.d30
           (MAlonzo.Code.Relation.Binary.Structures.d240 (coe v2)) v3 v4 v5)
name184 = "Relation.Binary.Properties.Poset._.trans"
d184 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d184 v0 v1 v2 v3 = du184 v3
du184 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du184 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d238 (coe du168 (coe v0))
name190 = "Relation.Binary.Properties.Poset.<⇒≉"
d190 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  AgdaAny -> MAlonzo.Code.Data.Empty.T4
d190 = erased
name196 = "Relation.Binary.Properties.Poset.≤∧≉⇒<"
d196 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d196 v0 v1 v2 = du196
du196 ::
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du196 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32
name202 = "Relation.Binary.Properties.Poset.<⇒≱"
d202 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  AgdaAny -> MAlonzo.Code.Data.Empty.T4
d202 = erased
name208 = "Relation.Binary.Properties.Poset.≤⇒≯"
d208 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d208 = erased
name210 = "Relation.Binary.Properties.Poset.invIsPartialOrder"
d210 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
d210 v0 v1 v2 v3 = du210 v3
du210 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
du210 v0 = coe du152 (coe v0)
name212 = "Relation.Binary.Properties.Poset.invPoset"
d212 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204
d212 v0 v1 v2 v3 = du212 v3
du212 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204
du212 v0 = coe du154 (coe v0)
name214 = "Relation.Binary.Properties.Poset.strictPartialOrder"
d214 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T394
d214 v0 v1 v2 v3 = du214 v3
du214 ::
  MAlonzo.Code.Relation.Binary.Bundles.T204 ->
  MAlonzo.Code.Relation.Binary.Bundles.T394
du214 v0 = coe du170 (coe v0)
