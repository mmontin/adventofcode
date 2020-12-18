{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Float.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Float
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.Word.Properties
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Construct.On
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core

name6 = "Data.Float.Properties.≈⇒≡"
d6 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d6 = erased
name10 = "Data.Float.Properties.≈-reflexive"
d10 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d10 = erased
name14 = "Data.Float.Properties.≈-refl"
d14 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d14 = erased
name16 = "Data.Float.Properties.≈-sym"
d16 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d16 = erased
name18 = "Data.Float.Properties.≈-trans"
d18 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d18 = erased
name22 = "Data.Float.Properties.≈-subst"
d22 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  (MAlonzo.Code.Agda.Builtin.Float.T6 -> ()) ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny -> AgdaAny
d22 v0 v1 v2 v3 v4 v5 = du22 v5
du22 :: AgdaAny -> AgdaAny
du22 v0 = coe v0
name30 = "Data.Float.Properties._≈?_"
d30 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Relation.Nullary.T32
d30
  = coe
      MAlonzo.Code.Relation.Binary.Construct.On.du102
      (coe MAlonzo.Code.Agda.Builtin.Float.d8)
      (coe MAlonzo.Code.Data.Word.Properties.d26)
name32 = "Data.Float.Properties.≈-isEquivalence"
d32 :: MAlonzo.Code.Relation.Binary.Structures.T26
d32
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C483 erased erased erased
name46 = "Data.Float.Properties.≈-setoid"
d46 :: MAlonzo.Code.Relation.Binary.Bundles.T44
d46 = coe MAlonzo.Code.Relation.Binary.Bundles.C501 d32
name48 = "Data.Float.Properties.≈-isDecEquivalence"
d48 :: MAlonzo.Code.Relation.Binary.Structures.T44
d48
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C1529 (coe d32) (coe d30)
name50 = "Data.Float.Properties.≈-decSetoid"
d50 :: MAlonzo.Code.Relation.Binary.Bundles.T84
d50 = coe MAlonzo.Code.Relation.Binary.Bundles.C939 d48
name52 = "Data.Float.Properties._≟_"
d52 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Relation.Nullary.T32
d52 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
      (coe d30 v0 v1)
name58 = "Data.Float.Properties.≡-setoid"
d58 :: MAlonzo.Code.Relation.Binary.Bundles.T44
d58
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du250
name60 = "Data.Float.Properties.≡-decSetoid"
d60 :: MAlonzo.Code.Relation.Binary.Bundles.T84
d60
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du254
      (coe d52)
name62 = "Data.Float.Properties._==_"
d62 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 -> Bool
d62 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.d22 () erased
      (d52 (coe v0) (coe v1))
name68 = "Data.Float.Properties._<?_"
d68 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Relation.Nullary.T32
d68
  = coe
      MAlonzo.Code.Relation.Binary.Construct.On.du102
      (coe MAlonzo.Code.Agda.Builtin.Float.d8)
      (coe MAlonzo.Code.Data.Word.Properties.d68)
name70 = "Data.Float.Properties.<-strictTotalOrder-≈"
d70 :: MAlonzo.Code.Relation.Binary.Bundles.T780
d70
  = coe
      MAlonzo.Code.Relation.Binary.Construct.On.du614
      (coe MAlonzo.Code.Data.Word.Properties.d70)
      (coe MAlonzo.Code.Agda.Builtin.Float.d8)
