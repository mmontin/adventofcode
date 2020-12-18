{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.Name where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Data.Product.Properties
import qualified MAlonzo.Code.Data.Word.Properties
import qualified MAlonzo.Code.Relation.Binary.Construct.On
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core

name4 = "Reflection.Name.Names"
d4 :: ()
d4 = erased
name6 = "Reflection.Name._≈_"
d6 :: AgdaAny -> AgdaAny -> ()
d6 = erased
name8 = "Reflection.Name._≈?_"
d8 :: AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32
d8
  = coe
      MAlonzo.Code.Relation.Binary.Construct.On.du102
      (coe MAlonzo.Code.Agda.Builtin.Reflection.d36)
      (coe
         MAlonzo.Code.Data.Product.Properties.du70
         (coe MAlonzo.Code.Data.Word.Properties.d52)
         (coe (\ v0 -> MAlonzo.Code.Data.Word.Properties.d52)))
name10 = "Reflection.Name._≟_"
d10 :: AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32
d10 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
      (coe d8 v0 v1)
