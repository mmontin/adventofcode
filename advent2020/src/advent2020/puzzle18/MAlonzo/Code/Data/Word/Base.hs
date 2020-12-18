{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Word.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

name6 = "Data.Word.Base._≈_"
d6 :: MAlonzo.RTE.Word64 -> MAlonzo.RTE.Word64 -> ()
d6 = erased
name8 = "Data.Word.Base._<_"
d8 :: MAlonzo.RTE.Word64 -> MAlonzo.RTE.Word64 -> ()
d8 = erased
