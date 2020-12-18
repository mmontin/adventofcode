{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Data.Maybe.Base
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing

name14 = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff"
d14 a0 a1 = ()
data T14 = C43 MAlonzo.Code.Algebra.Bundles.T1998 (AgdaAny -> Bool)
name24
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff.rawRing"
d24 :: T14 -> MAlonzo.Code.Algebra.Bundles.T1998
d24 v0
  = case coe v0 of
      C43 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name26
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff.isZero"
d26 :: T14 -> AgdaAny -> Bool
d26 v0
  = case coe v0 of
      C43 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name30
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._._*_"
d30 :: T14 -> AgdaAny -> AgdaAny -> AgdaAny
d30 v0 = coe MAlonzo.Code.Algebra.Bundles.d2024 (coe d24 (coe v0))
name32
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._._+_"
d32 :: T14 -> AgdaAny -> AgdaAny -> AgdaAny
d32 v0 = coe MAlonzo.Code.Algebra.Bundles.d2022 (coe d24 (coe v0))
name34
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._._≈_"
d34 :: T14 -> AgdaAny -> AgdaAny -> ()
d34 = erased
name36
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._.*-rawMonoid"
d36 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 -> MAlonzo.Code.Algebra.Bundles.T394
d36 v0 v1 v2 = du36 v2
du36 :: T14 -> MAlonzo.Code.Algebra.Bundles.T394
du36 v0
  = coe MAlonzo.Code.Algebra.Bundles.du2034 (coe d24 (coe v0))
name38
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._.+-rawGroup"
d38 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 -> MAlonzo.Code.Algebra.Bundles.T742
d38 v0 v1 v2 = du38 v2
du38 :: T14 -> MAlonzo.Code.Algebra.Bundles.T742
du38 v0
  = coe MAlonzo.Code.Algebra.Bundles.du2032 (coe d24 (coe v0))
name40
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._.-_"
d40 :: T14 -> AgdaAny -> AgdaAny
d40 v0 = coe MAlonzo.Code.Algebra.Bundles.d2026 (coe d24 (coe v0))
name42
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._.0#"
d42 :: T14 -> AgdaAny
d42 v0 = coe MAlonzo.Code.Algebra.Bundles.d2028 (coe d24 (coe v0))
name44
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._.1#"
d44 :: T14 -> AgdaAny
d44 v0 = coe MAlonzo.Code.Algebra.Bundles.d2030 (coe d24 (coe v0))
name46
  = "Tactic.RingSolver.Core.Polynomial.Parameters.RawCoeff._.Carrier"
d46 :: T14 -> ()
d46 = erased
name56
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism"
d56 a0 a1 a2 a3 = ()
data T56
  = C1151 T14
          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172
          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T352
          (AgdaAny -> AgdaAny -> AgdaAny)
name72 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw._*_"
d72 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> AgdaAny
d72 v0 v1 v2 v3 v4 v5 = du72 v4
du72 :: T14 -> AgdaAny -> AgdaAny -> AgdaAny
du72 v0 = coe MAlonzo.Code.Algebra.Bundles.d2024 (coe d24 (coe v0))
name74 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw._+_"
d74 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> AgdaAny
d74 v0 v1 v2 v3 v4 v5 = du74 v4
du74 :: T14 -> AgdaAny -> AgdaAny -> AgdaAny
du74 v0 = coe MAlonzo.Code.Algebra.Bundles.d2022 (coe d24 (coe v0))
name76 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw._≈_"
d76 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> ()
d76 = erased
name78
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw.*-rawMonoid"
d78 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  MAlonzo.Code.Algebra.Bundles.T394
d78 v0 v1 v2 v3 v4 v5 = du78 v4
du78 :: T14 -> MAlonzo.Code.Algebra.Bundles.T394
du78 v0
  = coe MAlonzo.Code.Algebra.Bundles.du2034 (coe d24 (coe v0))
name80
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw.+-rawGroup"
d80 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  MAlonzo.Code.Algebra.Bundles.T742
d80 v0 v1 v2 v3 v4 v5 = du80 v4
du80 :: T14 -> MAlonzo.Code.Algebra.Bundles.T742
du80 v0
  = coe MAlonzo.Code.Algebra.Bundles.du2032 (coe d24 (coe v0))
name82 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw.-_"
d82 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny
d82 v0 v1 v2 v3 v4 v5 = du82 v4
du82 :: T14 -> AgdaAny -> AgdaAny
du82 v0 = coe MAlonzo.Code.Algebra.Bundles.d2026 (coe d24 (coe v0))
name84 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw.0#"
d84 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny
d84 v0 v1 v2 v3 v4 v5 = du84 v4
du84 :: T14 -> AgdaAny
du84 v0 = coe MAlonzo.Code.Algebra.Bundles.d2028 (coe d24 (coe v0))
name86 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw.1#"
d86 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny
d86 v0 v1 v2 v3 v4 v5 = du86 v4
du86 :: T14 -> AgdaAny
du86 v0 = coe MAlonzo.Code.Algebra.Bundles.d2030 (coe d24 (coe v0))
name88 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw.Carrier"
d88 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  ()
d88 = erased
name90 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw.isZero"
d90 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> Bool
d90 v0 v1 v2 v3 v4 v5 = du90 v4
du90 :: T14 -> AgdaAny -> Bool
du90 v0 = coe d26 (coe v0)
name92 = "Tactic.RingSolver.Core.Polynomial.Parameters.Raw.rawRing"
d92 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  MAlonzo.Code.Algebra.Bundles.T1998
d92 v0 v1 v2 v3 v4 v5 = du92 v4
du92 :: T14 -> MAlonzo.Code.Algebra.Bundles.T1998
du92 v0 = coe d24 (coe v0)
name250
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.from"
d250 :: T56 -> T14
d250 v0
  = case coe v0 of
      C1151 v1 v2 v3 v4 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name252
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.to"
d252 ::
  T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172
d252 v0
  = case coe v0 of
      C1151 v1 v2 v3 v4 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name256
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw._*_"
d256 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d256 v0
  = coe
      MAlonzo.Code.Algebra.Bundles.d2024 (coe d24 (coe d250 (coe v0)))
name258
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw._+_"
d258 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d258 v0
  = coe
      MAlonzo.Code.Algebra.Bundles.d2022 (coe d24 (coe d250 (coe v0)))
name260
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw._≈_"
d260 :: T56 -> AgdaAny -> AgdaAny -> ()
d260 = erased
name262
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw.*-rawMonoid"
d262 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T394
d262 v0 v1 v2 v3 v4 = du262 v4
du262 :: T56 -> MAlonzo.Code.Algebra.Bundles.T394
du262 v0
  = let v1 = d250 (coe v0) in
    coe MAlonzo.Code.Algebra.Bundles.du2034 (coe d24 (coe v1))
name264
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw.+-rawGroup"
d264 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T742
d264 v0 v1 v2 v3 v4 = du264 v4
du264 :: T56 -> MAlonzo.Code.Algebra.Bundles.T742
du264 v0
  = let v1 = d250 (coe v0) in
    coe MAlonzo.Code.Algebra.Bundles.du2032 (coe d24 (coe v1))
name266
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw.-_"
d266 :: T56 -> AgdaAny -> AgdaAny
d266 v0
  = coe
      MAlonzo.Code.Algebra.Bundles.d2026 (coe d24 (coe d250 (coe v0)))
name268
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw.0#"
d268 :: T56 -> AgdaAny
d268 v0
  = coe
      MAlonzo.Code.Algebra.Bundles.d2028 (coe d24 (coe d250 (coe v0)))
name270
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw.1#"
d270 :: T56 -> AgdaAny
d270 v0
  = coe
      MAlonzo.Code.Algebra.Bundles.d2030 (coe d24 (coe d250 (coe v0)))
name272
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw.Carrier"
d272 :: T56 -> ()
d272 = erased
name274
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw.isZero"
d274 :: T56 -> AgdaAny -> Bool
d274 v0 = coe d26 (coe d250 (coe v0))
name276
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Raw.rawRing"
d276 :: T56 -> MAlonzo.Code.Algebra.Bundles.T1998
d276 v0 = coe d24 (coe d250 (coe v0))
name280
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._._*_"
d280 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d280 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
      (coe d252 (coe v0))
name282
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._._+_"
d282 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d282 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d202
      (coe d252 (coe v0))
name284
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._._^_"
d284 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> AgdaAny -> Integer -> AgdaAny
d284 v0 v1 v2 v3 v4 = du284 v4
du284 :: T56 -> AgdaAny -> Integer -> AgdaAny
du284 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du334
      (coe d252 (coe v0))
name286
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._._≈_"
d286 :: T56 -> AgdaAny -> AgdaAny -> ()
d286 = erased
name288
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.assoc"
d288 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d288 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                        (coe d252 (coe v0))))))))
name290
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.*-comm"
d290 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d290 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1292
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
            (coe d252 (coe v0))))
name292
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.*-commutativeMonoid"
d292 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T496
d292 v0 v1 v2 v3 v4 = du292 v4
du292 :: T56 -> MAlonzo.Code.Algebra.Bundles.T496
du292 v0
  = let v1 = d252 (coe v0) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1990
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du314
         (coe v1))
name294
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.∙-cong"
d294 ::
  T56 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d294 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                           (coe d252 (coe v0)))))))))
name296
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.∙-congʳ"
d296 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d296 v0 v1 v2 v3 v4 = du296 v4
du296 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du296 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1096 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name298
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.∙-congˡ"
d298 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d298 v0 v1 v2 v3 v4 = du298 v4
du298 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du298 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1096 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name300
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.identity"
d300 :: T56 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d300 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                     (coe d252 (coe v0)))))))
name302
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.identityʳ"
d302 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T56 -> AgdaAny -> AgdaAny
d302 v0 v1 v2 v3 v4 = du302 v4
du302 :: T56 -> AgdaAny -> AgdaAny
du302 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1096 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name304
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.identityˡ"
d304 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T56 -> AgdaAny -> AgdaAny
d304 v0 v1 v2 v3 v4 = du304 v4
du304 :: T56 -> AgdaAny -> AgdaAny
du304 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1096 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name306
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.*-isCommutativeMonoid"
d306 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Structures.T362
d306 v0 v1 v2 v3 v4 = du306 v4
du306 :: T56 -> MAlonzo.Code.Algebra.Structures.T362
du306 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du1378
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
         (coe v2))
name308
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.*-isCommutativeSemigroup"
d308 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Structures.T192
d308 v0 v1 v2 v3 v4 = du308 v4
du308 :: T56 -> MAlonzo.Code.Algebra.Structures.T192
du308 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du1376
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
         (coe v2))
name310
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isMagma"
d310 :: T56 -> MAlonzo.Code.Algebra.Structures.T80
d310 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                        (coe d252 (coe v0))))))))
name312
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.*-isMonoid"
d312 :: T56 -> MAlonzo.Code.Algebra.Structures.T314
d312 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1096
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                  (coe d252 (coe v0))))))
name314
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isSemigroup"
d314 :: T56 -> MAlonzo.Code.Algebra.Structures.T116
d314 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                     (coe d252 (coe v0)))))))
name316
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.*-monoid"
d316 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T422
d316 v0 v1 v2 v3 v4 = du316 v4
du316 :: T56 -> MAlonzo.Code.Algebra.Bundles.T422
du316 v0
  = let v1 = d252 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du314
              (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1658
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v3))
name318
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.semigroup"
d318 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T80
d318 v0 v1 v2 v3 v4 = du318 v4
du318 :: T56 -> MAlonzo.Code.Algebra.Bundles.T80
du318 v0
  = let v1 = d252 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du314
              (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du1658 (coe v4))
name320
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.assoc"
d320 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d320 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d372
            (coe
               MAlonzo.Code.Algebra.Structures.d1094
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                           (coe d252 (coe v0)))))))))
name322
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.comm"
d322 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d322 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d374
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                     (coe d252 (coe v0)))))))
name324
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.+-commutativeMonoid"
d324 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T496
d324 v0 v1 v2 v3 v4 = du324 v4
du324 :: T56 -> MAlonzo.Code.Algebra.Bundles.T496
du324 v0
  = let v1 = d252 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du314
              (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1642
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v3))
name326
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.∙-cong"
d326 ::
  T56 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d326 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d372
               (coe
                  MAlonzo.Code.Algebra.Structures.d1094
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1186
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1290
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                              (coe d252 (coe v0))))))))))
name328
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.∙-congʳ"
d328 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d328 v0 v1 v2 v3 v4 = du328 v4
du328 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du328 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1094 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d372 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d324 (coe v7) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v8))
name330
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.∙-congˡ"
d330 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d330 v0 v1 v2 v3 v4 = du330 v4
du330 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du330 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1094 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d372 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d324 (coe v7) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v8))
name332
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.identity"
d332 :: T56 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d332 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                        (coe d252 (coe v0))))))))
name334
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.identityʳ"
d334 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T56 -> AgdaAny -> AgdaAny
d334 v0 v1 v2 v3 v4 = du334 v4
du334 :: T56 -> AgdaAny -> AgdaAny
du334 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1094 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d372 (coe v6) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v7))
name336
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.identityˡ"
d336 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T56 -> AgdaAny -> AgdaAny
d336 v0 v1 v2 v3 v4 = du336 v4
du336 :: T56 -> AgdaAny -> AgdaAny
du336 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1094 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d372 (coe v6) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v7))
name338
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.+-isCommutativeMonoid"
d338 :: T56 -> MAlonzo.Code.Algebra.Structures.T362
d338 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1094
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                  (coe d252 (coe v0))))))
name340
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isCommutativeSemigroup"
d340 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Structures.T192
d340 v0 v1 v2 v3 v4 = du340 v4
du340 :: T56 -> MAlonzo.Code.Algebra.Structures.T192
du340 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    coe
      MAlonzo.Code.Algebra.Structures.du410
      (coe MAlonzo.Code.Algebra.Structures.d1094 (coe v5))
name342
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isMagma"
d342 :: T56 -> MAlonzo.Code.Algebra.Structures.T80
d342 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d372
            (coe
               MAlonzo.Code.Algebra.Structures.d1094
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                           (coe d252 (coe v0)))))))))
name344
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isMonoid"
d344 :: T56 -> MAlonzo.Code.Algebra.Structures.T314
d344 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d372
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                     (coe d252 (coe v0)))))))
name346
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isSemigroup"
d346 :: T56 -> MAlonzo.Code.Algebra.Structures.T116
d346 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                        (coe d252 (coe v0))))))))
name348
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.monoid"
d348 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T422
d348 v0 v1 v2 v3 v4 = du348 v4
du348 :: T56 -> MAlonzo.Code.Algebra.Bundles.T422
du348 v0
  = let v1 = d252 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du314
              (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Bundles.du562
      (coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v4))
name350
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.semigroup"
d350 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T80
d350 v0 v1 v2 v3 v4 = du350 v4
du350 :: T56 -> MAlonzo.Code.Algebra.Bundles.T80
du350 v0
  = let v1 = d252 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du314
              (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v3) in
    let v5 = coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v4) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du562 (coe v5))
name352
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.-_"
d352 :: T56 -> AgdaAny -> AgdaAny
d352 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
      (coe d252 (coe v0))
name354
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.-‿*-distribˡ"
d354 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d354 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d70
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
         (coe d252 (coe v0)))
name356
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.-‿+-comm"
d356 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d356 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d76
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
         (coe d252 (coe v0)))
name358
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.-‿cong"
d358 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d358 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d64
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
         (coe d252 (coe v0)))
name360
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.0#"
d360 :: T56 -> AgdaAny
d360 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
      (coe d252 (coe v0))
name362
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.0≟_"
d362 :: T56 -> AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22
d362 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d212
      (coe d252 (coe v0))
name364
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.1#"
d364 :: T56 -> AgdaAny
d364 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d214
      (coe d252 (coe v0))
name366
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.Carrier"
d366 :: T56 -> ()
d366 = erased
name368
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.commutativeSemiring"
d368 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T1828
d368 v0 v1 v2 v3 v4 = du368 v4
du368 :: T56 -> MAlonzo.Code.Algebra.Bundles.T1828
du368 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du314
      (coe d252 (coe v0))
name370
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.distrib"
d370 :: T56 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d370 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1098
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                  (coe d252 (coe v0))))))
name372
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.distribʳ"
d372 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d372 v0 v1 v2 v3 v4 = du372 v4
du372 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du372 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v5))
name374
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.distribˡ"
d374 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d374 v0 v1 v2 v3 v4 = du374 v4
du374 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du374 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v5))
name376
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isAlmostCommutativeRing"
d376 ::
  T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T26
d376 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
      (coe d252 (coe v0))
name378
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isCommutativeSemiring"
d378 :: T56 -> MAlonzo.Code.Algebra.Structures.T1276
d378 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
         (coe d252 (coe v0)))
name380
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isCommutativeSemiringWithoutOne"
d380 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Structures.T988
d380 v0 v1 v2 v3 v4 = du380 v4
du380 :: T56 -> MAlonzo.Code.Algebra.Structures.T988
du380 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du1374
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
         (coe v2))
name382
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isEquivalence"
d382 :: T56 -> MAlonzo.Code.Relation.Binary.Structures.T26
d382 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d88
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d372
               (coe
                  MAlonzo.Code.Algebra.Structures.d1094
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1186
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1290
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                              (coe d252 (coe v0))))))))))
name384
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isNearSemiring"
d384 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Structures.T822
d384 v0 v1 v2 v3 v4 = du384 v4
du384 :: T56 -> MAlonzo.Code.Algebra.Structures.T822
du384 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Structures.du934
      (coe MAlonzo.Code.Algebra.Structures.du1258 (coe v4))
name386
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isPartialEquivalence"
d386 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Relation.Binary.Structures.T16
d386 v0 v1 v2 v3 v4 = du386 v4
du386 :: T56 -> MAlonzo.Code.Relation.Binary.Structures.T16
du386 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1094 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d372 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d324 (coe v7) in
    let v9 = MAlonzo.Code.Algebra.Structures.d124 (coe v8) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Algebra.Structures.d88 (coe v9))
name388
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isSemiring"
d388 :: T56 -> MAlonzo.Code.Algebra.Structures.T1172
d388 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1290
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
            (coe d252 (coe v0))))
name390
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isSemiringWithoutAnnihilatingZero"
d390 :: T56 -> MAlonzo.Code.Algebra.Structures.T1078
d390 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1186
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
               (coe d252 (coe v0)))))
name392
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.isSemiringWithoutOne"
d392 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Structures.T898
d392 v0 v1 v2 v3 v4 = du392 v4
du392 :: T56 -> MAlonzo.Code.Algebra.Structures.T898
du392 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    coe
      MAlonzo.Code.Algebra.Structures.du1258
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe v3))
name394
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.rawRing"
d394 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T1998
d394 v0 v1 v2 v3 v4 = du394 v4
du394 :: T56 -> MAlonzo.Code.Algebra.Bundles.T1998
du394 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
      (coe d252 (coe v0))
name396
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.refl"
d396 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T56 -> AgdaAny -> AgdaAny
d396 v0 v1 v2 v3 v4 = du396 v4
du396 :: T56 -> AgdaAny -> AgdaAny
du396 v0
  = let v1 = d252 (coe v0) in
    coe
      (\ v2 ->
         coe
           MAlonzo.Code.Relation.Binary.Structures.d34
           (MAlonzo.Code.Algebra.Structures.d88
              (coe
                 MAlonzo.Code.Algebra.Structures.d124
                 (coe
                    MAlonzo.Code.Algebra.Structures.d324
                    (coe
                       MAlonzo.Code.Algebra.Structures.d372
                       (coe
                          MAlonzo.Code.Algebra.Structures.d1094
                          (coe
                             MAlonzo.Code.Algebra.Structures.d1186
                             (coe
                                MAlonzo.Code.Algebra.Structures.d1290
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                      (coe v1))))))))))
           v2)
name398
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.reflexive"
d398 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d398 v0 v1 v2 v3 v4 = du398 v4
du398 ::
  T56 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du398 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1094 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d372 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d324 (coe v7) in
    let v9 = MAlonzo.Code.Algebra.Structures.d124 (coe v8) in
    \ v10 v11 v12 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Algebra.Structures.d88 (coe v9)) v10
name400
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.semiring"
d400 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Algebra.Bundles.T1674
d400 v0 v1 v2 v3 v4 = du400 v4
du400 :: T56 -> MAlonzo.Code.Algebra.Bundles.T1674
du400 v0
  = let v1 = d252 (coe v0) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1952
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du314
         (coe v1))
name402
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.setoid"
d402 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T56 -> MAlonzo.Code.Relation.Binary.Bundles.T44
d402 v0 v1 v2 v3 v4 = du402 v4
du402 :: T56 -> MAlonzo.Code.Relation.Binary.Bundles.T44
du402 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1186 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d1094 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d372 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d324 (coe v7) in
    coe
      MAlonzo.Code.Algebra.Structures.du104
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v8))
name404
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.sym"
d404 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d404 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Algebra.Structures.d88
         (coe
            MAlonzo.Code.Algebra.Structures.d124
            (coe
               MAlonzo.Code.Algebra.Structures.d324
               (coe
                  MAlonzo.Code.Algebra.Structures.d372
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1094
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1186
                        (coe
                           MAlonzo.Code.Algebra.Structures.d1290
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                 (coe d252 (coe v0)))))))))))
name406
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.trans"
d406 ::
  T56 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d406 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Algebra.Structures.d88
         (coe
            MAlonzo.Code.Algebra.Structures.d124
            (coe
               MAlonzo.Code.Algebra.Structures.d324
               (coe
                  MAlonzo.Code.Algebra.Structures.d372
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1094
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1186
                        (coe
                           MAlonzo.Code.Algebra.Structures.d1290
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                 (coe d252 (coe v0)))))))))))
name408
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.zero"
d408 :: T56 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d408 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1188
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
               (coe d252 (coe v0)))))
name410
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.zeroʳ"
d410 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T56 -> AgdaAny -> AgdaAny
d410 v0 v1 v2 v3 v4 = du410 v4
du410 :: T56 -> AgdaAny -> AgdaAny
du410 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v5))
name412
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.zeroˡ"
d412 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T56 -> AgdaAny -> AgdaAny
d412 v0 v1 v2 v3 v4 = du412 v4
du412 :: T56 -> AgdaAny -> AgdaAny
du412 v0
  = let v1 = d252 (coe v0) in
    let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
              (coe v1) in
    let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
              (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1290 (coe v3) in
    let v5 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v5))
name414
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.morphism"
d414 ::
  T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T352
d414 v0
  = case coe v0 of
      C1151 v1 v2 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name418
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.*-homo"
d418 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d418 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d714
      (coe d414 (coe v0))
name420
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.+-homo"
d420 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d420 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d712
      (coe d414 (coe v0))
name422
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.-‿homo"
d422 :: T56 -> AgdaAny -> AgdaAny
d422 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d716
      (coe d414 (coe v0))
name424
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.0-homo"
d424 :: T56 -> AgdaAny
d424 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d718
      (coe d414 (coe v0))
name426
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.1-homo"
d426 :: T56 -> AgdaAny
d426 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d720
      (coe d414 (coe v0))
name428
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism._.⟦_⟧"
d428 :: T56 -> AgdaAny -> AgdaAny
d428 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
      (coe d414 (coe v0))
name432
  = "Tactic.RingSolver.Core.Polynomial.Parameters.Homomorphism.Zero-C⟶Zero-R"
d432 :: T56 -> AgdaAny -> AgdaAny -> AgdaAny
d432 v0
  = case coe v0 of
      C1151 v1 v2 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
