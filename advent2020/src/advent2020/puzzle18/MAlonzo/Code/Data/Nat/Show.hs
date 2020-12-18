{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.Show where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Data.Digit
import qualified MAlonzo.Code.Data.List.Base

name8 = "Data.Nat.Show.toDigitChar"
d8 :: Integer -> MAlonzo.Code.Agda.Builtin.Char.T6
d8 v0
  = coe
      MAlonzo.Code.Agda.Builtin.Char.d30
      (addInt (coe MAlonzo.Code.Agda.Builtin.Char.d28 '0') (coe v0))
name12 = "Data.Nat.Show.toDecimalChars"
d12 :: Integer -> [MAlonzo.Code.Agda.Builtin.Char.T6]
d12 v0
  = coe
      MAlonzo.Code.Data.List.Base.du20 (coe d8)
      (coe MAlonzo.Code.Data.Digit.du20 (coe (10 :: Integer)) (coe v0))
name14 = "Data.Nat.Show.show"
d14 :: Integer -> MAlonzo.Code.Agda.Builtin.String.T6
d14 v0 = coe MAlonzo.Code.Agda.Builtin.String.d10 (d12 (coe v0))
name22 = "Data.Nat.Show.charsInBase"
d22 ::
  Integer ->
  AgdaAny ->
  AgdaAny -> Integer -> [MAlonzo.Code.Agda.Builtin.Char.T6]
d22 v0 v1 v2 v3 = du22 v0 v3
du22 :: Integer -> Integer -> [MAlonzo.Code.Agda.Builtin.Char.T6]
du22 v0 v1
  = coe
      MAlonzo.Code.Data.List.Base.du20
      (coe MAlonzo.Code.Data.Digit.du178)
      (coe
         MAlonzo.Code.Data.List.Base.du774
         (MAlonzo.Code.Agda.Builtin.Sigma.d28
            (coe MAlonzo.Code.Data.Digit.du98 (coe v0) (coe v1))))
name36 = "Data.Nat.Show.showInBase"
d36 ::
  Integer ->
  AgdaAny ->
  AgdaAny -> Integer -> MAlonzo.Code.Agda.Builtin.String.T6
d36 v0 v1 v2 v3 = du36 v0 v3
du36 :: Integer -> Integer -> MAlonzo.Code.Agda.Builtin.String.T6
du36 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.String.d10 (coe du22 (coe v0) (coe v1))
