{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Unit.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Data.Sum.Base
import qualified MAlonzo.Code.Data.Unit.Base
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary

name6 = "Data.Unit.Properties.⊤-irrelevant"
d6 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d6 = erased
name8 = "Data.Unit.Properties._≟_"
d8 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Relation.Nullary.T32
d8 v0 v1 = du8
du8 :: MAlonzo.Code.Relation.Nullary.T32
du8
  = coe
      MAlonzo.Code.Relation.Nullary.C46
      (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
      (coe MAlonzo.Code.Relation.Nullary.C22 erased)
name10 = "Data.Unit.Properties.≡-setoid"
d10 :: MAlonzo.Code.Relation.Binary.Bundles.T44
d10
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du250
name12 = "Data.Unit.Properties.≡-decSetoid"
d12 :: MAlonzo.Code.Relation.Binary.Bundles.T84
d12
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du254
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Relation.Nullary.C46
              (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
              (coe MAlonzo.Code.Relation.Nullary.C22 erased)))
name14 = "Data.Unit.Properties.≡-total"
d14 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 -> MAlonzo.Code.Data.Sum.Base.T30
d14 v0 v1 = du14
du14 :: MAlonzo.Code.Data.Sum.Base.T30
du14 = coe MAlonzo.Code.Data.Sum.Base.C38 erased
name16 = "Data.Unit.Properties.≡-antisym"
d16 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d16 = erased
name20 = "Data.Unit.Properties.≡-isPreorder"
d20 :: MAlonzo.Code.Relation.Binary.Structures.T70
d20
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C2113
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      (coe (\ v0 v1 v2 -> v2)) erased
name24 = "Data.Unit.Properties.≡-isPartialOrder"
d24 :: MAlonzo.Code.Relation.Binary.Structures.T118
d24
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C4865 (coe d20)
      (coe (\ v0 v1 v2 v3 -> v2))
name26 = "Data.Unit.Properties.≡-isTotalOrder"
d26 :: MAlonzo.Code.Relation.Binary.Structures.T340
d26
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C11665 (coe d24)
      (coe (\ v0 v1 -> coe MAlonzo.Code.Data.Sum.Base.C38 erased))
name28 = "Data.Unit.Properties.≡-isDecTotalOrder"
d28 :: MAlonzo.Code.Relation.Binary.Structures.T388
d28
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C12739 (coe d26)
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Relation.Nullary.C46
              (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
              (coe MAlonzo.Code.Relation.Nullary.C22 erased)))
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Relation.Nullary.C46
              (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
              (coe MAlonzo.Code.Relation.Nullary.C22 erased)))
name30 = "Data.Unit.Properties.≡-poset"
d30 :: MAlonzo.Code.Relation.Binary.Bundles.T204
d30 = coe MAlonzo.Code.Relation.Binary.Bundles.C2365 d24
name32 = "Data.Unit.Properties.≡-decTotalOrder"
d32 :: MAlonzo.Code.Relation.Binary.Bundles.T658
d32 = coe MAlonzo.Code.Relation.Binary.Bundles.C7777 d28
name34 = "Data.Unit.Properties.≤-reflexive"
d34 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Unit.Base.T10
d34 = erased
name36 = "Data.Unit.Properties.≤-trans"
d36 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Data.Unit.Base.T10 ->
  MAlonzo.Code.Data.Unit.Base.T10 -> MAlonzo.Code.Data.Unit.Base.T10
d36 = erased
name38 = "Data.Unit.Properties.≤-antisym"
d38 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Data.Unit.Base.T10 ->
  MAlonzo.Code.Data.Unit.Base.T10 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d38 = erased
name40 = "Data.Unit.Properties.≤-total"
d40 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 -> MAlonzo.Code.Data.Sum.Base.T30
d40 v0 v1 = du40
du40 :: MAlonzo.Code.Data.Sum.Base.T30
du40 = coe MAlonzo.Code.Data.Sum.Base.C38 erased
name42 = "Data.Unit.Properties._≤?_"
d42 ::
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Relation.Nullary.T32
d42 v0 v1 = du42
du42 :: MAlonzo.Code.Relation.Nullary.T32
du42
  = coe
      MAlonzo.Code.Relation.Nullary.C46
      (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
      (coe MAlonzo.Code.Relation.Nullary.C22 erased)
name44 = "Data.Unit.Properties.≤-isPreorder"
d44 :: MAlonzo.Code.Relation.Binary.Structures.T70
d44
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C2113
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      erased erased
name46 = "Data.Unit.Properties.≤-isPartialOrder"
d46 :: MAlonzo.Code.Relation.Binary.Structures.T118
d46
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C4865 (coe d44) erased
name48 = "Data.Unit.Properties.≤-isTotalOrder"
d48 :: MAlonzo.Code.Relation.Binary.Structures.T340
d48
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C11665 (coe d46)
      (coe (\ v0 v1 -> coe MAlonzo.Code.Data.Sum.Base.C38 erased))
name50 = "Data.Unit.Properties.≤-isDecTotalOrder"
d50 :: MAlonzo.Code.Relation.Binary.Structures.T388
d50
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C12739 (coe d48)
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Relation.Nullary.C46
              (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
              (coe MAlonzo.Code.Relation.Nullary.C22 erased)))
      (coe
         (\ v0 v1 ->
            coe
              MAlonzo.Code.Relation.Nullary.C46
              (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
              (coe MAlonzo.Code.Relation.Nullary.C22 erased)))
name52 = "Data.Unit.Properties.≤-poset"
d52 :: MAlonzo.Code.Relation.Binary.Bundles.T204
d52 = coe MAlonzo.Code.Relation.Binary.Bundles.C2365 d46
name54 = "Data.Unit.Properties.≤-decTotalOrder"
d54 :: MAlonzo.Code.Relation.Binary.Bundles.T658
d54 = coe MAlonzo.Code.Relation.Binary.Bundles.C7777 d50
