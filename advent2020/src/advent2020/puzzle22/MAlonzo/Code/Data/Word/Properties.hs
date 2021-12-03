{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Word.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Construct.On
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core

name6 = "Data.Word.Properties.≈⇒≡"
d6 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d6 = erased
name8 = "Data.Word.Properties.≈-reflexive"
d8 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d8 = erased
name10 = "Data.Word.Properties.≈-refl"
d10 :: MAlonzo.RTE.Word64 -> MAlonzo.Code.Agda.Builtin.Equality.T12
d10 = erased
name12 = "Data.Word.Properties.≈-sym"
d12 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d12 = erased
name14 = "Data.Word.Properties.≈-trans"
d14 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d14 = erased
name18 = "Data.Word.Properties.≈-subst"
d18 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (MAlonzo.RTE.Word64 -> ()) ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny -> AgdaAny
d18 v0 v1 v2 v3 v4 v5 = du18 v5
du18 :: AgdaAny -> AgdaAny
du18 v0 = coe v0
name26 = "Data.Word.Properties._≈?_"
d26 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 -> MAlonzo.Code.Relation.Nullary.T32
d26 v0 v1
  = coe
      MAlonzo.Code.Data.Nat.Properties.d1360 (coe word64ToNat (coe v0))
      (coe word64ToNat (coe v1))
name32 = "Data.Word.Properties.≈-isEquivalence"
d32 :: MAlonzo.Code.Relation.Binary.Structures.T26
d32
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C483 erased erased erased
name46 = "Data.Word.Properties.≈-setoid"
d46 :: MAlonzo.Code.Relation.Binary.Bundles.T44
d46 = coe MAlonzo.Code.Relation.Binary.Bundles.C501 d32
name48 = "Data.Word.Properties.≈-isDecEquivalence"
d48 :: MAlonzo.Code.Relation.Binary.Structures.T44
d48
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C1529 (coe d32) (coe d26)
name50 = "Data.Word.Properties.≈-decSetoid"
d50 :: MAlonzo.Code.Relation.Binary.Bundles.T84
d50 = coe MAlonzo.Code.Relation.Binary.Bundles.C939 d48
name52 = "Data.Word.Properties._≟_"
d52 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 -> MAlonzo.Code.Relation.Nullary.T32
d52 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
      (coe d26 (coe v0) (coe v1))
name58 = "Data.Word.Properties.≡-setoid"
d58 :: MAlonzo.Code.Relation.Binary.Bundles.T44
d58
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du250
name60 = "Data.Word.Properties.≡-decSetoid"
d60 :: MAlonzo.Code.Relation.Binary.Bundles.T84
d60
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du254
      (coe d52)
name62 = "Data.Word.Properties._==_"
d62 :: MAlonzo.RTE.Word64 -> MAlonzo.RTE.Word64 -> Bool
d62 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.d22 () erased
      (d52 (coe v0) (coe v1))
name68 = "Data.Word.Properties._<?_"
d68 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 -> MAlonzo.Code.Relation.Nullary.T32
d68
  = coe
      MAlonzo.Code.Relation.Binary.Construct.On.du102 (coe word64ToNat)
      (coe MAlonzo.Code.Data.Nat.Properties.d1684)
name70 = "Data.Word.Properties.<-strictTotalOrder-≈"
d70 :: MAlonzo.Code.Relation.Binary.Bundles.T780
d70
  = coe
      MAlonzo.Code.Relation.Binary.Construct.On.du614
      (coe MAlonzo.Code.Data.Nat.Properties.d1706) (coe word64ToNat)
