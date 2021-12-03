{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Agda.Builtin.Word where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

name6 = "Agda.Builtin.Word.Word64"
type T6 = MAlonzo.RTE.Word64
d6
  = error
      "MAlonzo Runtime Error: postulate evaluated: Agda.Builtin.Word.Word64"
name8 = "Agda.Builtin.Word.primWord64ToNat"
d8 = MAlonzo.RTE.word64ToNat
name10 = "Agda.Builtin.Word.primWord64FromNat"
d10 = MAlonzo.RTE.word64FromNat
