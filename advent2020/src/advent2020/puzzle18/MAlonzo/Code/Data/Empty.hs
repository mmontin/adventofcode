{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Empty where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive

name4 = "Data.Empty.⊥"
d4 = ()
data T4
name10 = "Data.Empty.⊥-elim"
d10 :: MAlonzo.Code.Agda.Primitive.T4 -> () -> T4 -> AgdaAny
d10 = MAlonzo.RTE.mazUnreachableError
