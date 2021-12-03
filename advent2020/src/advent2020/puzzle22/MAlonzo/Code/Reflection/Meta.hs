{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.Meta where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Relation.Binary.Construct.On
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core

name4 = "Reflection.Meta._≈_"
d4 :: AgdaAny -> AgdaAny -> ()
d4 = erased
name6 = "Reflection.Meta._≈?_"
d6 :: AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32
d6
  = coe
      MAlonzo.Code.Relation.Binary.Construct.On.du102
      (coe MAlonzo.Code.Agda.Builtin.Reflection.d46)
      (coe MAlonzo.Code.Data.Nat.Properties.d1360)
name8 = "Reflection.Meta._≟_"
d8 :: AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32
d8 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
      (coe d6 v0 v1)
