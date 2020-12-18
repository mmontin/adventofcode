{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Relation.Binary.Properties.DecTotalOrder where

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
import qualified MAlonzo.Code.Relation.Binary.Construct.Converse
import qualified MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict
import qualified MAlonzo.Code.Relation.Binary.Definitions
import qualified MAlonzo.Code.Relation.Binary.Properties.Poset
import qualified MAlonzo.Code.Relation.Binary.Properties.Preorder
import qualified MAlonzo.Code.Relation.Binary.Properties.TotalOrder
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary

name156
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties._<_"
d156 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> ()
d156 = erased
name158
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties._≥_"
d158 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> ()
d158 = erased
name160
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.asym"
d160 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d160 = erased
name162
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.irrefl"
d162 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d162 = erased
name164
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.<-isStrictPartialOrder"
d164 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T222
d164 v0 v1 v2 v3 = du164 v3
du164 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T222
du164 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Properties.Poset.du168
      (coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1))
name166
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.<-resp-≈"
d166 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d166 v0 v1 v2 v3 = du166 v3
du166 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du166 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.d240
      (coe MAlonzo.Code.Relation.Binary.Properties.Poset.du168 (coe v2))
name168
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.<-respʳ-≈"
d168 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d168 v0 v1 v2 v3 = du168 v3
du168 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du168 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    let v3
          = coe
              MAlonzo.Code.Relation.Binary.Properties.Poset.du170 (coe v2) in
    let v4 = MAlonzo.Code.Relation.Binary.Bundles.d416 (coe v3) in
    coe
      (\ v5 v6 v7 ->
         coe
           MAlonzo.Code.Agda.Builtin.Sigma.d28
           (MAlonzo.Code.Relation.Binary.Structures.d240 (coe v4)) v5 v6 v7)
name170
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.<-respˡ-≈"
d170 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d170 v0 v1 v2 v3 = du170 v3
du170 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du170 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    let v3
          = coe
              MAlonzo.Code.Relation.Binary.Properties.Poset.du170 (coe v2) in
    let v4 = MAlonzo.Code.Relation.Binary.Bundles.d416 (coe v3) in
    coe
      (\ v5 v6 v7 ->
         coe
           MAlonzo.Code.Agda.Builtin.Sigma.d30
           (MAlonzo.Code.Relation.Binary.Structures.d240 (coe v4)) v5 v6 v7)
name172
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.<-strictPartialOrder"
d172 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T394
d172 v0 v1 v2 v3 = du172 v3
du172 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T394
du172 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Properties.Poset.du170
      (coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1))
name174
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.trans"
d174 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d174 v0 v1 v2 v3 = du174 v3
du174 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du174 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.d238
      (coe MAlonzo.Code.Relation.Binary.Properties.Poset.du168 (coe v2))
name176
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.<⇒≉"
d176 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  AgdaAny -> MAlonzo.Code.Data.Empty.T4
d176 = erased
name178
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.<⇒≱"
d178 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  AgdaAny -> MAlonzo.Code.Data.Empty.T4
d178 = erased
name182
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.≤⇒≯"
d182 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> MAlonzo.Code.Data.Empty.T4
d182 = erased
name184
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.≤∧≉⇒<"
d184 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d184 v0 v1 v2 v3 v4 v5 = du184
du184 ::
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du184 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32
name186
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.antisym"
d186 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d186 v0 v1 v2 v3 = du186 v3
du186 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du186 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    coe
      (\ v3 v4 v5 v6 ->
         coe
           MAlonzo.Code.Relation.Binary.Structures.d128
           (MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v2)) v3 v4 v6 v5)
name188
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.≥-isPartialOrder"
d188 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
d188 v0 v1 v2 v3 = du188 v3
du188 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T118
du188 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Properties.Poset.du152
      (coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1))
name190
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.invIsPreorder"
d190 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T70
d190 v0 v1 v2 v3 = du190 v3
du190 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T70
du190 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Properties.Preorder.du64
      (coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v2))
name192
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.≥-isTotalOrder"
d192 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T340
d192 v0 v1 v2 v3 = du192 v3
du192 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T340
du192 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.TotalOrder.du194
      (coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0))
name194
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.≥-poset"
d194 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204
d194 v0 v1 v2 v3 = du194 v3
du194 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T204
du194 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Properties.Poset.du154
      (coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1))
name196
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.invPreorder"
d196 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T132
d196 v0 v1 v2 v3 = du196 v3
du196 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T132
du196 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    coe
      MAlonzo.Code.Relation.Binary.Properties.Preorder.du66
      (coe MAlonzo.Code.Relation.Binary.Bundles.du248 (coe v2))
name198
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.refl"
d198 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 -> AgdaAny -> AgdaAny
d198 v0 v1 v2 v3 = du198 v3
du198 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 -> AgdaAny -> AgdaAny
du198 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    let v3
          = coe
              MAlonzo.Code.Relation.Binary.Properties.Poset.du154 (coe v2) in
    let v4 = MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v3) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du98
      (coe MAlonzo.Code.Relation.Binary.Structures.d126 (coe v4))
name200
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.reflexive"
d200 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d200 v0 v1 v2 v3 = du200 v3
du200 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du200 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    coe
      (\ v3 v4 v5 ->
         coe
           MAlonzo.Code.Relation.Binary.Structures.d82
           (MAlonzo.Code.Relation.Binary.Structures.d126
              (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v2)))
           v4 v3
           (coe
              MAlonzo.Code.Relation.Binary.Structures.d36
              (MAlonzo.Code.Relation.Binary.Structures.d80
                 (coe
                    MAlonzo.Code.Relation.Binary.Structures.d126
                    (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v2))))
              v3 v4 v5))
name202
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.total"
d202 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Sum.Base.T30
d202 v0 v1 v2 v3 = du202 v3
du202 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Sum.Base.T30
du202 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.d350
      (coe
         MAlonzo.Code.Relation.Binary.Properties.TotalOrder.du194 (coe v1))
name204
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.≥-totalOrder"
d204 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574
d204 v0 v1 v2 v3 = du204 v3
du204 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T574
du204 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.TotalOrder.du196
      (coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0))
name206
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.trans"
d206 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d206 v0 v1 v2 v3 = du206 v3
du206 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du206 v0
  = let v1
          = coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0) in
    let v2 = coe MAlonzo.Code.Relation.Binary.Bundles.du622 (coe v1) in
    coe
      (\ v3 v4 v5 v6 v7 ->
         coe
           MAlonzo.Code.Relation.Binary.Structures.d84
           (MAlonzo.Code.Relation.Binary.Structures.d126
              (coe MAlonzo.Code.Relation.Binary.Bundles.d226 (coe v2)))
           v5 v4 v3 v7 v6)
name208
  = "Relation.Binary.Properties.DecTotalOrder.TotalOrderProperties.≰⇒>"
d208 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d208 v0 v1 v2 v3 = du208 v3
du208 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du208 v0
  = coe
      MAlonzo.Code.Relation.Binary.Properties.TotalOrder.du206
      (coe MAlonzo.Code.Relation.Binary.Bundles.du732 (coe v0))
name210
  = "Relation.Binary.Properties.DecTotalOrder.≥-isDecTotalOrder"
d210 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T388
d210 v0 v1 v2 v3 = du210 v3
du210 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T388
du210 v0
  = coe
      MAlonzo.Code.Relation.Binary.Construct.Converse.du386
      (coe MAlonzo.Code.Relation.Binary.Bundles.d680 (coe v0))
name212
  = "Relation.Binary.Properties.DecTotalOrder.≥-decTotalOrder"
d212 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658
d212 v0 v1 v2 v3 = du212 v3
du212 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658
du212 v0
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C7777 (coe du210 (coe v0))
name216 = "Relation.Binary.Properties.DecTotalOrder._._≤?_"
d216 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32
d216 v0 v1 v2 v3 = du216 v3
du216 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32
du216 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d402 (coe du210 (coe v0))
name218
  = "Relation.Binary.Properties.DecTotalOrder.<-isStrictTotalOrder"
d218 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T454
d218 v0 v1 v2 v3 = du218 v3
du218 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Structures.T454
du218 v0
  = coe
      MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du576
      (coe MAlonzo.Code.Relation.Binary.Bundles.d680 (coe v0))
name220
  = "Relation.Binary.Properties.DecTotalOrder.<-strictTotalOrder"
d220 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T780
d220 v0 v1 v2 v3 = du220 v3
du220 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T780
du220 v0
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C9189 (coe du218 (coe v0))
name224 = "Relation.Binary.Properties.DecTotalOrder._.compare"
d224 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Binary.Definitions.T136
d224 v0 v1 v2 v3 = du224 v3
du224 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Binary.Definitions.T136
du224 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d468 (coe du218 (coe v0))
name230 = "Relation.Binary.Properties.DecTotalOrder.≮⇒≥"
d230 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  (MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
   MAlonzo.Code.Data.Empty.T4) ->
  AgdaAny
d230 v0 v1 v2 v3 v4 v5 = du230 v2 v3 v4 v5
du230 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  AgdaAny ->
  AgdaAny ->
  (MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
   MAlonzo.Code.Data.Empty.T4) ->
  AgdaAny
du230 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Relation.Binary.Construct.NonStrictToStrict.du126
      (coe v0)
      (let v5
             = coe MAlonzo.Code.Relation.Binary.Bundles.du740 (coe v1) in
       coe
         MAlonzo.Code.Relation.Binary.Structures.d36
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d80
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d126
               (coe
                  MAlonzo.Code.Relation.Binary.Structures.d172
                  (coe MAlonzo.Code.Relation.Binary.Bundles.d304 (coe v5))))))
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d400
         (coe MAlonzo.Code.Relation.Binary.Bundles.d680 (coe v1)))
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d82
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d126
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d348
               (coe
                  MAlonzo.Code.Relation.Binary.Structures.d398
                  (coe MAlonzo.Code.Relation.Binary.Bundles.d680 (coe v1))))))
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d350
         (coe
            MAlonzo.Code.Relation.Binary.Structures.d398
            (coe MAlonzo.Code.Relation.Binary.Bundles.d680 (coe v1))))
      (coe v2) (coe v3)
name232
  = "Relation.Binary.Properties.DecTotalOrder.strictTotalOrder"
d232 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T780
d232 v0 v1 v2 v3 = du232 v3
du232 ::
  MAlonzo.Code.Relation.Binary.Bundles.T658 ->
  MAlonzo.Code.Relation.Binary.Bundles.T780
du232 v0 = coe du220 (coe v0)
