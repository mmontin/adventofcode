{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Float.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Float

name6 = "Data.Float.Base._≈_"
d6 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 -> ()
d6 = erased
name8 = "Data.Float.Base._<_"
d8 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 -> ()
d8 = erased
