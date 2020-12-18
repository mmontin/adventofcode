{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.Divisibility.Core where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality

name12 = "Data.Nat.Divisibility.Core._∣_"
d12 a0 a1 = ()
newtype T12 = C26 Integer
name22 = "Data.Nat.Divisibility.Core._∣_.quotient"
d22 :: T12 -> Integer
d22 v0
  = case coe v0 of
      C26 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name24 = "Data.Nat.Divisibility.Core._∣_.equality"
d24 :: T12 -> MAlonzo.Code.Agda.Builtin.Equality.T12
d24 = erased
name28 = "Data.Nat.Divisibility.Core._∤_"
d28 :: Integer -> Integer -> ()
d28 = erased
