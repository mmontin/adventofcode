{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Algebra.Operations.Ring where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles

name32 = "Algebra.Operations.Ring._^_+1"
d32 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny -> Integer -> AgdaAny
d32 v0 v1 v2 v3 v4 = du32 v2 v3 v4
du32 ::
  MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny -> Integer -> AgdaAny
du32 v0 v1 v2
  = case coe v2 of
      0 -> coe v1
      _ -> let v3 = subInt (coe v2) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Algebra.Bundles.d2024 v0
             (coe du32 (coe v0) (coe v1) (coe v3)) v1
name40 = "Algebra.Operations.Ring._^_"
d40 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny -> Integer -> AgdaAny
d40 v0 v1 v2 v3 v4 = du40 v2 v3 v4
du40 ::
  MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny -> Integer -> AgdaAny
du40 v0 v1 v2
  = case coe v2 of
      0 -> coe MAlonzo.Code.Algebra.Bundles.d2030 (coe v0)
      _ -> let v3 = subInt (coe v2) (coe (1 :: Integer)) in
           coe du32 (coe v0) (coe v1) (coe v3)
