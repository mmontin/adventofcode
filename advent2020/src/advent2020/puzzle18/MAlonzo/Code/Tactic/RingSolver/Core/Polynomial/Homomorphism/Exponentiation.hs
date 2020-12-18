{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Operations.Ring
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.List.Kleene.Base
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial
import qualified MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Multiplication
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics

name282
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._._⊡_"
d282 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  Integer -> MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
d282 v0 v1 v2 v3 v4 = du282 v0 v1 v4
du282 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  Integer -> MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
du282 v0 v1 v2
  = let v3
          = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
              (coe v2) in
    coe
      (\ v4 v5 v6 ->
         case coe v6 of
           0 -> coe
                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                  (coe (0 :: Integer))
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                     (coe
                        MAlonzo.Code.Algebra.Bundles.d2030
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                           (coe v3))))
                  (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v4))
           _ -> let v7 = subInt (coe v6) (coe (1 :: Integer)) in
                coe
                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756 (coe v0)
                  (coe v1) (coe v3) (coe v4) (coe v5) (coe v7))
name284
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._._⊡_+1"
d284 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  Integer -> MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
d284 v0 v1 v2 v3 v4 = du284 v0 v1 v4
du284 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  Integer -> MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
du284 v0 v1 v2
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756 (coe v0)
      (coe v1)
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
         (coe v2))
name302
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._.Poly"
d302 a0 a1 a2 a3 a4 a5 = ()
name306
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._.PowInd"
d306 a0 a1 a2 a3 a4 a5 a6 = ()
name382
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._.⊡-mult"
d382 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
d382 v0 v1 v2 v3 v4 = du382 v0 v1 v4
du382 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
du382 v0 v1 v2
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d746 (coe v0)
      (coe v1)
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
         (coe v2))
name480
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._._*⟨_⟩^_"
d480 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> AgdaAny -> Integer -> AgdaAny
d480 v0 v1 v2 v3 v4 v5 v6 v7 = du480 v4 v5 v6 v7
du480 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> AgdaAny -> Integer -> AgdaAny
du480 v0 v1 v2 v3
  = case coe v3 of
      0 -> coe v1
      _ -> let v4 = subInt (coe v3) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                (coe v0))
             (coe
                MAlonzo.Code.Algebra.Operations.Ring.du32
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                      (coe v0)))
                (coe v2) (coe v4))
             v1
name490
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._.⟦_⟧"
d490 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d490 v0 v1 v2 v3 v4 v5 v6 v7 = du490 v4 v6 v7
du490 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du490 v0 v1 v2
  = case coe v1 of
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v3 v4 v5
        -> case coe v4 of
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v6
               -> coe
                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                       (coe v0))
                    v6
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v7 v8
               -> let v9
                        = coe
                            MAlonzo.Code.Data.Vec.Base.du644
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                               (coe v5) (coe v2)) in
                  case coe v7 of
                    MAlonzo.Code.Data.List.Kleene.Base.C42 v10 v11
                      -> case coe v10 of
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v12 v13
                             -> case coe v12 of
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v14
                                    -> case coe v9 of
                                         MAlonzo.Code.Agda.Builtin.Sigma.C32 v16 v17
                                           -> let v18
                                                    = coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                        (coe v0)
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                           (coe v14) (coe v11))
                                                        (coe v9) in
                                              case coe v13 of
                                                0 -> coe v18
                                                _ -> let v19
                                                           = subInt
                                                               (coe v13) (coe (1 :: Integer)) in
                                                     coe
                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                          (coe v0))
                                                       (coe
                                                          MAlonzo.Code.Algebra.Operations.Ring.du32
                                                          (coe
                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                             (coe
                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                (coe v0)))
                                                          (coe v16) (coe v19))
                                                       v18
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name494
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.RawPow._^_"
d494 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> Integer -> AgdaAny
d494 v0 v1 v2 v3 v4 = du494 v4
du494 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> Integer -> AgdaAny
du494 v0
  = let v1
          = coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
              (coe
                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                 (coe v0)) in
    coe
      (\ v2 v3 ->
         case coe v3 of
           0 -> coe MAlonzo.Code.Algebra.Bundles.d2030 (coe v1)
           _ -> let v4 = subInt (coe v3) (coe (1 :: Integer)) in
                coe
                  MAlonzo.Code.Algebra.Operations.Ring.du32 (coe v1) (coe v2)
                  (coe v4))
name496
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.RawPow._^_+1"
d496 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> Integer -> AgdaAny
d496 v0 v1 v2 v3 v4 = du496 v4
du496 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> Integer -> AgdaAny
du496 v0
  = coe
      MAlonzo.Code.Algebra.Operations.Ring.du32
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
            (coe v0)))
name502
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.CoPow._^_+1"
d502 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> Integer -> AgdaAny
d502 v0 v1 v2 v3 v4 = du502 v4
du502 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> Integer -> AgdaAny
du502 v0
  = coe
      MAlonzo.Code.Algebra.Operations.Ring.du32
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
            (coe v0)))
name508
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.pow-eval-hom"
d508 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> Integer -> AgdaAny
d508 v0 v1 v2 v3 v4 v5 v6 = du508 v4 v5 v6
du508 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> Integer -> AgdaAny
du508 v0 v1 v2
  = case coe v2 of
      0 -> let v3
                 = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                     (coe v0) in
           let v4
                 = coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                        (coe v0))
                     (coe
                        MAlonzo.Code.Algebra.Operations.Ring.du32
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                              (coe v0)))
                        (coe v1) (coe (0 :: Integer))) in
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
                                        (coe v3))))))))))
             v4
      _ -> let v3 = subInt (coe v2) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Relation.Binary.Structures.d38
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
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                           (coe v0)))))))))))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                   (coe v0))
                (let v4
                       = let v4
                               = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                   (coe v0) in
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                           (coe v4) in
                 coe
                   MAlonzo.Code.Algebra.Bundles.d2024 v4
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                            (coe v0)))
                      (coe v1) (coe v3))
                   v1))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                   (coe v0))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                      (coe v0))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                            (coe v0)))
                      (coe v1) (coe v3)))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                      (coe v0))
                   v1))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                   (coe v0))
                (coe
                   MAlonzo.Code.Algebra.Operations.Ring.du32
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v0)))
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                         (coe v0))
                      v1)
                   (coe v3))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                      (coe v0))
                   v1))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d714
                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                   (coe v0))
                (coe
                   MAlonzo.Code.Algebra.Operations.Ring.du32
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                         (coe v0)))
                   (coe v1) (coe v3))
                v1)
             (coe
                MAlonzo.Code.Algebra.Structures.d90
                (MAlonzo.Code.Algebra.Structures.d124
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
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                        (coe v0)))))))))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                      (coe v0))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                            (coe v0)))
                      (coe v1) (coe v3)))
                (coe
                   MAlonzo.Code.Algebra.Operations.Ring.du32
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v0)))
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                         (coe v0))
                      v1)
                   (coe v3))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                      (coe v0))
                   v1)
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                      (coe v0))
                   v1)
                (coe du508 (coe v0) (coe v1) (coe v3))
                (coe
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
                                              (coe
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                 (coe v0)))))))))))
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                         (coe v0))
                      v1)))
name524
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.⊡-mult-hom"
d524 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d524 v0 v1 v2 v3 v4 v5 v6 v7 v8
  = case coe v6 of
      0 -> let v9
                 = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                     (coe v4) in
           let v10
                 = let v10
                         = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d746
                             (coe v0) (coe v1)
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                (coe v4))
                             (coe v5) (coe (0 :: Integer)) (coe v7) in
                   case coe v10 of
                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v11 v12 v13
                       -> case coe v12 of
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v14
                              -> coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                      (coe v4))
                                   v14
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v15 v16
                              -> let v17
                                       = coe
                                           MAlonzo.Code.Data.Vec.Base.du644
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                              (coe v13) (coe v8)) in
                                 case coe v15 of
                                   MAlonzo.Code.Data.List.Kleene.Base.C42 v18 v19
                                     -> case coe v18 of
                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v20 v21
                                            -> case coe v20 of
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v22
                                                   -> case coe v17 of
                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32 v24 v25
                                                          -> let v26
                                                                   = coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                       (coe v4)
                                                                       (coe
                                                                          MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                          (coe v22) (coe v19))
                                                                       (coe v17) in
                                                             case coe v21 of
                                                               0 -> coe v26
                                                               _ -> let v27
                                                                          = subInt
                                                                              (coe v21)
                                                                              (coe
                                                                                 (1 :: Integer)) in
                                                                    coe
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                         (coe v4))
                                                                      (coe
                                                                         MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                         (coe
                                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                            (coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                               (coe v4)))
                                                                         (coe v24) (coe v27))
                                                                      v26
                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                          _ -> MAlonzo.RTE.mazUnreachableError
                                   _ -> MAlonzo.RTE.mazUnreachableError
                            _ -> MAlonzo.RTE.mazUnreachableError
                     _ -> MAlonzo.RTE.mazUnreachableError in
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
                                        (coe v9))))))))))
             v10
      _ -> let v9 = subInt (coe v6) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Relation.Binary.Structures.d38
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
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                           (coe v4)))))))))))
             (let v10
                    = let v10
                            = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                (coe v4) in
                      coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du550 v0 v1 v10
                        v5
                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d746
                           (coe v0) (coe v1)
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                              (coe v4))
                           (coe v5) (coe v9) (coe v7))
                        v7 in
              case coe v10 of
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v11 v12 v13
                  -> case coe v12 of
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v14
                         -> coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                 (coe v4))
                              v14
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v15 v16
                         -> let v17
                                  = coe
                                      MAlonzo.Code.Data.Vec.Base.du644
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                         (coe v13) (coe v8)) in
                            case coe v15 of
                              MAlonzo.Code.Data.List.Kleene.Base.C42 v18 v19
                                -> case coe v18 of
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v20 v21
                                       -> case coe v20 of
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v22
                                              -> case coe v17 of
                                                   MAlonzo.Code.Agda.Builtin.Sigma.C32 v24 v25
                                                     -> let v26
                                                              = coe
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                  (coe v4)
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                     (coe v22) (coe v19))
                                                                  (coe v17) in
                                                        case coe v21 of
                                                          0 -> coe v26
                                                          _ -> let v27
                                                                     = subInt
                                                                         (coe v21)
                                                                         (coe (1 :: Integer)) in
                                                               coe
                                                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                    (coe v4))
                                                                 (coe
                                                                    MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                    (coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v4)))
                                                                    (coe v24) (coe v27))
                                                                 v26
                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                            _ -> MAlonzo.RTE.mazUnreachableError
                                     _ -> MAlonzo.RTE.mazUnreachableError
                              _ -> MAlonzo.RTE.mazUnreachableError
                       _ -> MAlonzo.RTE.mazUnreachableError
                _ -> MAlonzo.RTE.mazUnreachableError)
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                   (coe v4))
                (let v10
                       = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d746
                           (coe v0) (coe v1)
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                              (coe v4))
                           (coe v5) (coe v9) (coe v7) in
                 case coe v10 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v11 v12 v13
                     -> case coe v12 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v14
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v4))
                                 v14
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v15 v16
                            -> let v17
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v13) (coe v8)) in
                               case coe v15 of
                                 MAlonzo.Code.Data.List.Kleene.Base.C42 v18 v19
                                   -> case coe v18 of
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v20 v21
                                          -> case coe v20 of
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v22
                                                 -> case coe v17 of
                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32 v24 v25
                                                        -> let v26
                                                                 = coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                     (coe v4)
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                        (coe v22) (coe v19))
                                                                     (coe v17) in
                                                           case coe v21 of
                                                             0 -> coe v26
                                                             _ -> let v27
                                                                        = subInt
                                                                            (coe v21)
                                                                            (coe (1 :: Integer)) in
                                                                  coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                       (coe v4))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)))
                                                                       (coe v24) (coe v27))
                                                                    v26
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError)
                (case coe v7 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                     -> case coe v11 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v4))
                                 v13
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                            -> let v16
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v12) (coe v8)) in
                               case coe v14 of
                                 MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                   -> case coe v17 of
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                          -> case coe v19 of
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                 -> case coe v16 of
                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                        -> let v25
                                                                 = coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                     (coe v4)
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                        (coe v21) (coe v18))
                                                                     (coe v16) in
                                                           case coe v20 of
                                                             0 -> coe v25
                                                             _ -> let v26
                                                                        = subInt
                                                                            (coe v20)
                                                                            (coe (1 :: Integer)) in
                                                                  coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                       (coe v4))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)))
                                                                       (coe v23) (coe v26))
                                                                    v25
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                   (coe v4))
                (coe
                   MAlonzo.Code.Algebra.Operations.Ring.du32
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v4)))
                   (case coe v7 of
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                        -> case coe v11 of
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                               -> coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                       (coe v4))
                                    v13
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                               -> let v16
                                        = coe
                                            MAlonzo.Code.Data.Vec.Base.du644
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                               (coe v12) (coe v8)) in
                                  case coe v14 of
                                    MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                      -> case coe v17 of
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                             -> case coe v19 of
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                    -> case coe v16 of
                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                           -> let v25
                                                                    = coe
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                        (coe v4)
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                           (coe v21) (coe v18))
                                                                        (coe v16) in
                                                              case coe v20 of
                                                                0 -> coe v25
                                                                _ -> let v26
                                                                           = subInt
                                                                               (coe v20)
                                                                               (coe
                                                                                  (1 :: Integer)) in
                                                                     coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v4))
                                                                       (coe
                                                                          MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v4)))
                                                                          (coe v23) (coe v26))
                                                                       v25
                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                           _ -> MAlonzo.RTE.mazUnreachableError
                                    _ -> MAlonzo.RTE.mazUnreachableError
                             _ -> MAlonzo.RTE.mazUnreachableError
                      _ -> MAlonzo.RTE.mazUnreachableError)
                   (coe v9))
                (case coe v7 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                     -> case coe v11 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v4))
                                 v13
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                            -> let v16
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v12) (coe v8)) in
                               case coe v14 of
                                 MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                   -> case coe v17 of
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                          -> case coe v19 of
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                 -> case coe v16 of
                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                        -> let v25
                                                                 = coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                     (coe v4)
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                        (coe v21) (coe v18))
                                                                     (coe v16) in
                                                           case coe v20 of
                                                             0 -> coe v25
                                                             _ -> let v26
                                                                        = subInt
                                                                            (coe v20)
                                                                            (coe (1 :: Integer)) in
                                                                  coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                       (coe v4))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)))
                                                                       (coe v23) (coe v26))
                                                                    v25
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Multiplication.du878
                v0 v1 v2 v3 v4
                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d746
                   (coe v0) (coe v1)
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                      (coe v4))
                   (coe v5) (coe v9) (coe v7))
                v7 v8)
             (coe
                MAlonzo.Code.Algebra.Structures.d90
                (MAlonzo.Code.Algebra.Structures.d124
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
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                        (coe v4)))))))))
                (let v10
                       = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d746
                           (coe v0) (coe v1)
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                              (coe v4))
                           (coe v5) (coe v9) (coe v7) in
                 case coe v10 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v11 v12 v13
                     -> case coe v12 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v14
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v4))
                                 v14
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v15 v16
                            -> let v17
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v13) (coe v8)) in
                               case coe v15 of
                                 MAlonzo.Code.Data.List.Kleene.Base.C42 v18 v19
                                   -> case coe v18 of
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v20 v21
                                          -> case coe v20 of
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v22
                                                 -> case coe v17 of
                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32 v24 v25
                                                        -> let v26
                                                                 = coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                     (coe v4)
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                        (coe v22) (coe v19))
                                                                     (coe v17) in
                                                           case coe v21 of
                                                             0 -> coe v26
                                                             _ -> let v27
                                                                        = subInt
                                                                            (coe v21)
                                                                            (coe (1 :: Integer)) in
                                                                  coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                       (coe v4))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)))
                                                                       (coe v24) (coe v27))
                                                                    v26
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError)
                (coe
                   MAlonzo.Code.Algebra.Operations.Ring.du32
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v4)))
                   (case coe v7 of
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                        -> case coe v11 of
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                               -> coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                       (coe v4))
                                    v13
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                               -> let v16
                                        = coe
                                            MAlonzo.Code.Data.Vec.Base.du644
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                               (coe v12) (coe v8)) in
                                  case coe v14 of
                                    MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                      -> case coe v17 of
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                             -> case coe v19 of
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                    -> case coe v16 of
                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                           -> let v25
                                                                    = coe
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                        (coe v4)
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                           (coe v21) (coe v18))
                                                                        (coe v16) in
                                                              case coe v20 of
                                                                0 -> coe v25
                                                                _ -> let v26
                                                                           = subInt
                                                                               (coe v20)
                                                                               (coe
                                                                                  (1 :: Integer)) in
                                                                     coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v4))
                                                                       (coe
                                                                          MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v4)))
                                                                          (coe v23) (coe v26))
                                                                       v25
                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                           _ -> MAlonzo.RTE.mazUnreachableError
                                    _ -> MAlonzo.RTE.mazUnreachableError
                             _ -> MAlonzo.RTE.mazUnreachableError
                      _ -> MAlonzo.RTE.mazUnreachableError)
                   (coe v9))
                (case coe v7 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                     -> case coe v11 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v4))
                                 v13
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                            -> let v16
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v12) (coe v8)) in
                               case coe v14 of
                                 MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                   -> case coe v17 of
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                          -> case coe v19 of
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                 -> case coe v16 of
                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                        -> let v25
                                                                 = coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                     (coe v4)
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                        (coe v21) (coe v18))
                                                                     (coe v16) in
                                                           case coe v20 of
                                                             0 -> coe v25
                                                             _ -> let v26
                                                                        = subInt
                                                                            (coe v20)
                                                                            (coe (1 :: Integer)) in
                                                                  coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                       (coe v4))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)))
                                                                       (coe v23) (coe v26))
                                                                    v25
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError)
                (case coe v7 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                     -> case coe v11 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v4))
                                 v13
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                            -> let v16
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v12) (coe v8)) in
                               case coe v14 of
                                 MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                   -> case coe v17 of
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                          -> case coe v19 of
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                 -> case coe v16 of
                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                        -> let v25
                                                                 = coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                     (coe v4)
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                        (coe v21) (coe v18))
                                                                     (coe v16) in
                                                           case coe v20 of
                                                             0 -> coe v25
                                                             _ -> let v26
                                                                        = subInt
                                                                            (coe v20)
                                                                            (coe (1 :: Integer)) in
                                                                  coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                       (coe v4))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)))
                                                                       (coe v23) (coe v26))
                                                                    v25
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError)
                (d524
                   (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) (coe v5) (coe v9)
                   (coe v7) (coe v8))
                (coe
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
                                              (coe
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                 (coe v4)))))))))))
                   (case coe v7 of
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                        -> case coe v11 of
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                               -> coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                       (coe v4))
                                    v13
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                               -> let v16
                                        = coe
                                            MAlonzo.Code.Data.Vec.Base.du644
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                               (coe v12) (coe v8)) in
                                  case coe v14 of
                                    MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                      -> case coe v17 of
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                             -> case coe v19 of
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                    -> case coe v16 of
                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                           -> let v25
                                                                    = coe
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                        (coe v4)
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                           (coe v21) (coe v18))
                                                                        (coe v16) in
                                                              case coe v20 of
                                                                0 -> coe v25
                                                                _ -> let v26
                                                                           = subInt
                                                                               (coe v20)
                                                                               (coe
                                                                                  (1 :: Integer)) in
                                                                     coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v4))
                                                                       (coe
                                                                          MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v4)))
                                                                          (coe v23) (coe v26))
                                                                       v25
                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                           _ -> MAlonzo.RTE.mazUnreachableError
                                    _ -> MAlonzo.RTE.mazUnreachableError
                             _ -> MAlonzo.RTE.mazUnreachableError
                      _ -> MAlonzo.RTE.mazUnreachableError)))
name544
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.⊡-+1-hom"
d544 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  Integer -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d544 v0 v1 v2 v3 v4 v5 v6 v7 v8
  = case coe v6 of
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
        -> case coe v10 of
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
               -> coe du508 (coe v4) (coe v12) (coe v7)
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
               -> let v15 = subInt (coe v9) (coe (1 :: Integer)) in
                  case coe v13 of
                    MAlonzo.Code.Data.List.Kleene.Base.C42 v16 v17
                      -> case coe v17 of
                           MAlonzo.Code.Data.List.Kleene.Base.C46
                             -> case coe v16 of
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v18 v19
                                    -> case coe v18 of
                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v20
                                           -> coe
                                                MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.d38
                                                (let v22
                                                       = let v22
                                                               = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                                   (coe
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                      (coe v4)) in
                                                         let v23
                                                               = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                                   (coe v22) in
                                                         let v24
                                                               = MAlonzo.Code.Algebra.Structures.d1290
                                                                   (coe v23) in
                                                         let v25
                                                               = MAlonzo.Code.Algebra.Structures.d1186
                                                                   (coe v24) in
                                                         let v26
                                                               = MAlonzo.Code.Algebra.Structures.d1094
                                                                   (coe v25) in
                                                         let v27
                                                               = MAlonzo.Code.Algebra.Structures.d372
                                                                   (coe v26) in
                                                         let v28
                                                               = MAlonzo.Code.Algebra.Structures.d324
                                                                   (coe v27) in
                                                         coe
                                                           MAlonzo.Code.Algebra.Structures.du104
                                                           (coe
                                                              MAlonzo.Code.Algebra.Structures.d124
                                                              (coe v28)) in
                                                 coe
                                                   MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                                                   (coe
                                                      MAlonzo.Code.Relation.Binary.Bundles.du74
                                                      (coe v22))
                                                   (let v23
                                                          = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                              (coe v4) in
                                                    let v24
                                                          = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                              (coe v4) in
                                                    let v25
                                                          = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                                                              (coe v0) (coe v1)
                                                              (coe
                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                 (coe v4))
                                                              (coe v15) (coe v20) (coe v7) in
                                                    let v26
                                                          = addInt
                                                              (coe mulInt (coe v7) (coe v19))
                                                              (coe v19) in
                                                    case coe v25 of
                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v27 v28 v29
                                                        -> case coe v28 of
                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v30
                                                               -> let v31
                                                                        = let v31
                                                                                = coe
                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                                                    v24 v30 in
                                                                          seq
                                                                            (coe v31)
                                                                            (if coe v31
                                                                               then coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244
                                                                                      (coe v17)
                                                                                      (coe
                                                                                         addInt
                                                                                         (coe
                                                                                            (1 ::
                                                                                               Integer))
                                                                                         (coe v26))
                                                                               else coe
                                                                                      MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                                      (coe
                                                                                         MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                         (coe
                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                                                            (coe
                                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                                               v25)
                                                                                            (coe
                                                                                               v26))
                                                                                         (coe
                                                                                            v17))) in
                                                                  case coe v31 of
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                      -> let v32
                                                                               = MAlonzo.Code.Algebra.Bundles.d2028
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                                                                      (coe v23)) in
                                                                         coe
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                              (coe v4))
                                                                           v32
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C48 v32
                                                                      -> case coe v32 of
                                                                           MAlonzo.Code.Data.List.Kleene.Base.C42 v33 v34
                                                                             -> case coe v33 of
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v35 v36
                                                                                    -> case coe
                                                                                              v35 of
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v37
                                                                                           -> case coe
                                                                                                     v36 of
                                                                                                0 -> case coe
                                                                                                            v34 of
                                                                                                       MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                                                         -> case coe
                                                                                                                   v37 of
                                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v39 v40 v41
                                                                                                                -> let v42
                                                                                                                         = coe
                                                                                                                             MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                                                             (coe
                                                                                                                                MAlonzo.Code.Data.Nat.Base.C152
                                                                                                                                v41)
                                                                                                                             (coe
                                                                                                                                v11) in
                                                                                                                   case coe
                                                                                                                          v40 of
                                                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v43
                                                                                                                       -> coe
                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                                                               (coe
                                                                                                                                  v4))
                                                                                                                            v43
                                                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v44 v45
                                                                                                                       -> let v46
                                                                                                                                = coe
                                                                                                                                    MAlonzo.Code.Data.Vec.Base.du644
                                                                                                                                    (coe
                                                                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                                                                       (coe
                                                                                                                                          v42)
                                                                                                                                       (coe
                                                                                                                                          v8)) in
                                                                                                                          case coe
                                                                                                                                 v44 of
                                                                                                                            MAlonzo.Code.Data.List.Kleene.Base.C42 v47 v48
                                                                                                                              -> case coe
                                                                                                                                        v47 of
                                                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v49 v50
                                                                                                                                     -> case coe
                                                                                                                                               v49 of
                                                                                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v51
                                                                                                                                            -> case coe
                                                                                                                                                      v46 of
                                                                                                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32 v53 v54
                                                                                                                                                   -> let v55
                                                                                                                                                            = coe
                                                                                                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                                                                (coe
                                                                                                                                                                   v4)
                                                                                                                                                                (coe
                                                                                                                                                                   MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                                                                   (coe
                                                                                                                                                                      v51)
                                                                                                                                                                   (coe
                                                                                                                                                                      v48))
                                                                                                                                                                (coe
                                                                                                                                                                   v46) in
                                                                                                                                                      case coe
                                                                                                                                                             v50 of
                                                                                                                                                        0 -> coe
                                                                                                                                                               v55
                                                                                                                                                        _ -> let v56
                                                                                                                                                                   = subInt
                                                                                                                                                                       (coe
                                                                                                                                                                          v50)
                                                                                                                                                                       (coe
                                                                                                                                                                          (1 ::
                                                                                                                                                                             Integer)) in
                                                                                                                                                             coe
                                                                                                                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                                                  (coe
                                                                                                                                                                     v4))
                                                                                                                                                               (coe
                                                                                                                                                                  MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                                                                  (coe
                                                                                                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                                                                     (coe
                                                                                                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                                                        (coe
                                                                                                                                                                           v4)))
                                                                                                                                                                  (coe
                                                                                                                                                                     v53)
                                                                                                                                                                  (coe
                                                                                                                                                                     v56))
                                                                                                                                                               v55
                                                                                                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                       MAlonzo.Code.Data.List.Kleene.Base.C48 v39
                                                                                                         -> let v40
                                                                                                                  = coe
                                                                                                                      MAlonzo.Code.Data.Vec.Base.du644
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                                                         (coe
                                                                                                                            v11)
                                                                                                                         (coe
                                                                                                                            v8)) in
                                                                                                            let v41
                                                                                                                  = 0 ::
                                                                                                                      Integer in
                                                                                                            case coe
                                                                                                                   v40 of
                                                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32 v42 v43
                                                                                                                -> let v44
                                                                                                                         = coe
                                                                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                             (coe
                                                                                                                                v4)
                                                                                                                             (coe
                                                                                                                                MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                                (coe
                                                                                                                                   v37)
                                                                                                                                (coe
                                                                                                                                   v34))
                                                                                                                             (coe
                                                                                                                                v40) in
                                                                                                                   case coe
                                                                                                                          v41 of
                                                                                                                     0 -> coe
                                                                                                                            v44
                                                                                                                     _ -> let v45
                                                                                                                                = -1 ::
                                                                                                                                    Integer in
                                                                                                                          coe
                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                               (coe
                                                                                                                                  v4))
                                                                                                                            (coe
                                                                                                                               MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                               (coe
                                                                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                                  (coe
                                                                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                     (coe
                                                                                                                                        v4)))
                                                                                                                               (coe
                                                                                                                                  v42)
                                                                                                                               (coe
                                                                                                                                  v45))
                                                                                                                            v44
                                                                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                _ -> let v39
                                                                                                           = coe
                                                                                                               MAlonzo.Code.Data.Vec.Base.du644
                                                                                                               (coe
                                                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                                                  (coe
                                                                                                                     v11)
                                                                                                                  (coe
                                                                                                                     v8)) in
                                                                                                     case coe
                                                                                                            v39 of
                                                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32 v40 v41
                                                                                                         -> let v42
                                                                                                                  = coe
                                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                      (coe
                                                                                                                         v4)
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                         (coe
                                                                                                                            v37)
                                                                                                                         (coe
                                                                                                                            v34))
                                                                                                                      (coe
                                                                                                                         v39) in
                                                                                                            case coe
                                                                                                                   v36 of
                                                                                                              0 -> coe
                                                                                                                     v42
                                                                                                              _ -> let v43
                                                                                                                         = subInt
                                                                                                                             (coe
                                                                                                                                v36)
                                                                                                                             (coe
                                                                                                                                (1 ::
                                                                                                                                   Integer)) in
                                                                                                                   coe
                                                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                        (coe
                                                                                                                           v4))
                                                                                                                     (coe
                                                                                                                        MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                        (coe
                                                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                           (coe
                                                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                              (coe
                                                                                                                                 v4)))
                                                                                                                        (coe
                                                                                                                           v40)
                                                                                                                        (coe
                                                                                                                           v43))
                                                                                                                     v42
                                                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v31 v32
                                                               -> case coe v26 of
                                                                    0 -> case coe v25 of
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v33 v34 v35
                                                                             -> let v36
                                                                                      = coe
                                                                                          MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                          (coe
                                                                                             MAlonzo.Code.Data.Nat.Base.C152
                                                                                             v35)
                                                                                          (coe
                                                                                             v11) in
                                                                                case coe v34 of
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v37
                                                                                    -> coe
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                            (coe
                                                                                               v4))
                                                                                         v37
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v38 v39
                                                                                    -> let v40
                                                                                             = coe
                                                                                                 MAlonzo.Code.Data.Vec.Base.du644
                                                                                                 (coe
                                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                                    (coe
                                                                                                       v36)
                                                                                                    (coe
                                                                                                       v8)) in
                                                                                       case coe
                                                                                              v38 of
                                                                                         MAlonzo.Code.Data.List.Kleene.Base.C42 v41 v42
                                                                                           -> case coe
                                                                                                     v41 of
                                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v43 v44
                                                                                                  -> case coe
                                                                                                            v43 of
                                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v45
                                                                                                         -> case coe
                                                                                                                   v40 of
                                                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32 v47 v48
                                                                                                                -> let v49
                                                                                                                         = coe
                                                                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                             (coe
                                                                                                                                v4)
                                                                                                                             (coe
                                                                                                                                MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                                (coe
                                                                                                                                   v45)
                                                                                                                                (coe
                                                                                                                                   v42))
                                                                                                                             (coe
                                                                                                                                v40) in
                                                                                                                   case coe
                                                                                                                          v44 of
                                                                                                                     0 -> coe
                                                                                                                            v49
                                                                                                                     _ -> let v50
                                                                                                                                = subInt
                                                                                                                                    (coe
                                                                                                                                       v44)
                                                                                                                                    (coe
                                                                                                                                       (1 ::
                                                                                                                                          Integer)) in
                                                                                                                          coe
                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                               (coe
                                                                                                                                  v4))
                                                                                                                            (coe
                                                                                                                               MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                               (coe
                                                                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                                  (coe
                                                                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                     (coe
                                                                                                                                        v4)))
                                                                                                                               (coe
                                                                                                                                  v47)
                                                                                                                               (coe
                                                                                                                                  v50))
                                                                                                                            v49
                                                                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                                    _ -> let v33
                                                                               = coe
                                                                                   MAlonzo.Code.Data.Vec.Base.du644
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                      (coe v11)
                                                                                      (coe v8)) in
                                                                         case coe v33 of
                                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32 v34 v35
                                                                             -> let v36
                                                                                      = coe
                                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                          (coe v4)
                                                                                          (coe
                                                                                             MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                             (coe
                                                                                                v25)
                                                                                             (coe
                                                                                                v17))
                                                                                          (coe
                                                                                             v33) in
                                                                                case coe v26 of
                                                                                  0 -> coe v36
                                                                                  _ -> let v37
                                                                                             = subInt
                                                                                                 (coe
                                                                                                    v26)
                                                                                                 (coe
                                                                                                    (1 ::
                                                                                                       Integer)) in
                                                                                       coe
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                            (coe
                                                                                               v4))
                                                                                         (coe
                                                                                            MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                            (coe
                                                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                               (coe
                                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                  (coe
                                                                                                     v4)))
                                                                                            (coe
                                                                                               v34)
                                                                                            (coe
                                                                                               v37))
                                                                                         v36
                                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                             _ -> MAlonzo.RTE.mazUnreachableError
                                                      _ -> MAlonzo.RTE.mazUnreachableError)
                                                   (coe
                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du686
                                                      v4
                                                      (let v23
                                                             = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                 (coe v4) in
                                                       let v24
                                                             = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                                                                 (coe v0) (coe v1)
                                                                 (coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                    (coe v4))
                                                                 (coe v15) (coe v20) (coe v7) in
                                                       let v25
                                                             = addInt
                                                                 (coe mulInt (coe v7) (coe v19))
                                                                 (coe v19) in
                                                       case coe v24 of
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v26 v27 v28
                                                           -> case coe v27 of
                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v29
                                                                  -> let v30
                                                                           = coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                                               v23 v29 in
                                                                     coe
                                                                       seq (coe v30)
                                                                       (if coe v30
                                                                          then coe
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244
                                                                                 (coe v17)
                                                                                 (coe
                                                                                    addInt
                                                                                    (coe
                                                                                       (1 ::
                                                                                          Integer))
                                                                                    (coe v25))
                                                                          else coe
                                                                                 MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                                 (coe
                                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                    (coe
                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                                                       (coe
                                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                                          v24)
                                                                                       (coe v25))
                                                                                    (coe v17)))
                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v30 v31
                                                                  -> coe
                                                                       MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                       (coe
                                                                          MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                                v24)
                                                                             (coe v25))
                                                                          (coe v17))
                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                         _ -> MAlonzo.RTE.mazUnreachableError)
                                                      (coe
                                                         MAlonzo.Code.Data.Vec.Base.du644
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                            (coe v11) (coe v8))))
                                                   (coe
                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                      (coe
                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                            (coe v4)))
                                                      (let v23
                                                             = let v23
                                                                     = coe
                                                                         du580 (coe v11) (coe v8) in
                                                               case coe v20 of
                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v24 v25 v26
                                                                   -> case coe v25 of
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v27
                                                                          -> coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                  (coe v4))
                                                                               v27
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v28 v29
                                                                          -> let v30
                                                                                   = coe
                                                                                       MAlonzo.Code.Data.Vec.Base.du644
                                                                                       (coe
                                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                          (coe v26)
                                                                                          (coe
                                                                                             v23)) in
                                                                             case coe v28 of
                                                                               MAlonzo.Code.Data.List.Kleene.Base.C42 v31 v32
                                                                                 -> case coe v31 of
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v33 v34
                                                                                        -> case coe
                                                                                                  v33 of
                                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v35
                                                                                               -> case coe
                                                                                                         v30 of
                                                                                                    MAlonzo.Code.Agda.Builtin.Sigma.C32 v37 v38
                                                                                                      -> let v39
                                                                                                               = coe
                                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                   (coe
                                                                                                                      v4)
                                                                                                                   (coe
                                                                                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                      (coe
                                                                                                                         v35)
                                                                                                                      (coe
                                                                                                                         v32))
                                                                                                                   (coe
                                                                                                                      v30) in
                                                                                                         case coe
                                                                                                                v34 of
                                                                                                           0 -> coe
                                                                                                                  v39
                                                                                                           _ -> let v40
                                                                                                                      = subInt
                                                                                                                          (coe
                                                                                                                             v34)
                                                                                                                          (coe
                                                                                                                             (1 ::
                                                                                                                                Integer)) in
                                                                                                                coe
                                                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                  (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                     (coe
                                                                                                                        v4))
                                                                                                                  (coe
                                                                                                                     MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                     (coe
                                                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                        (coe
                                                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                           (coe
                                                                                                                              v4)))
                                                                                                                     (coe
                                                                                                                        v37)
                                                                                                                     (coe
                                                                                                                        v40))
                                                                                                                  v39
                                                                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                                                                             _ -> MAlonzo.RTE.mazUnreachableError
                                                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                                 _ -> MAlonzo.RTE.mazUnreachableError in
                                                       let v24 = coe du578 (coe v11) (coe v8) in
                                                       case coe v19 of
                                                         0 -> coe v23
                                                         _ -> let v25
                                                                    = subInt
                                                                        (coe v19)
                                                                        (coe (1 :: Integer)) in
                                                              coe
                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                   (coe v4))
                                                                (coe
                                                                   MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                   (coe
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                      (coe
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                         (coe v4)))
                                                                   (coe v24) (coe v25))
                                                                v23)
                                                      (coe v7))
                                                   (let v23
                                                          = let v23
                                                                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                                      (coe
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                         (coe v4)) in
                                                            let v24
                                                                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                                      (coe v23) in
                                                            let v25
                                                                  = MAlonzo.Code.Algebra.Structures.d1290
                                                                      (coe v24) in
                                                            let v26
                                                                  = MAlonzo.Code.Algebra.Structures.d1186
                                                                      (coe v25) in
                                                            let v27
                                                                  = MAlonzo.Code.Algebra.Structures.d1094
                                                                      (coe v26) in
                                                            let v28
                                                                  = MAlonzo.Code.Algebra.Structures.d372
                                                                      (coe v27) in
                                                            let v29
                                                                  = MAlonzo.Code.Algebra.Structures.d324
                                                                      (coe v28) in
                                                            coe
                                                              MAlonzo.Code.Algebra.Structures.du104
                                                              (coe
                                                                 MAlonzo.Code.Algebra.Structures.d124
                                                                 (coe v29)) in
                                                    coe
                                                      MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                                                      (coe
                                                         MAlonzo.Code.Relation.Binary.Bundles.du74
                                                         (coe v23))
                                                      (coe
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du686
                                                         v4
                                                         (let v24
                                                                = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                    (coe v4) in
                                                          let v25
                                                                = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                                                                    (coe v0) (coe v1)
                                                                    (coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                       (coe v4))
                                                                    (coe v15) (coe v20) (coe v7) in
                                                          let v26
                                                                = addInt
                                                                    (coe mulInt (coe v7) (coe v19))
                                                                    (coe v19) in
                                                          case coe v25 of
                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v27 v28 v29
                                                              -> case coe v28 of
                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v30
                                                                     -> let v31
                                                                              = coe
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                                                  v24 v30 in
                                                                        coe
                                                                          seq (coe v31)
                                                                          (if coe v31
                                                                             then coe
                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244
                                                                                    (coe v17)
                                                                                    (coe
                                                                                       addInt
                                                                                       (coe
                                                                                          (1 ::
                                                                                             Integer))
                                                                                       (coe v26))
                                                                             else coe
                                                                                    MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                                    (coe
                                                                                       MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                       (coe
                                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                                                          (coe
                                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                                             v25)
                                                                                          (coe v26))
                                                                                       (coe v17)))
                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v31 v32
                                                                     -> coe
                                                                          MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                          (coe
                                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                                   v25)
                                                                                (coe v26))
                                                                             (coe v17))
                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                            _ -> MAlonzo.RTE.mazUnreachableError)
                                                         (coe
                                                            MAlonzo.Code.Data.Vec.Base.du644
                                                            (coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                               (coe v11) (coe v8))))
                                                      (coe
                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                            (coe v4))
                                                         (let v24
                                                                = coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                    (coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                       (coe v4)) in
                                                          let v25 = coe du578 (coe v11) (coe v8) in
                                                          let v26
                                                                = addInt
                                                                    (coe mulInt (coe v7) (coe v19))
                                                                    (coe v19) in
                                                          case coe v26 of
                                                            0 -> coe
                                                                   MAlonzo.Code.Algebra.Bundles.d2030
                                                                   (coe v24)
                                                            _ -> let v27
                                                                       = subInt
                                                                           (coe v26)
                                                                           (coe (1 :: Integer)) in
                                                                 coe
                                                                   MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                   (coe v24) (coe v25) (coe v27))
                                                         (let v24
                                                                = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                                                                    (coe v0) (coe v1)
                                                                    (coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                       (coe v4))
                                                                    (coe v15) (coe v20) (coe v7) in
                                                          let v25 = coe du580 (coe v11) (coe v8) in
                                                          case coe v24 of
                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v26 v27 v28
                                                              -> case coe v27 of
                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v29
                                                                     -> coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                             (coe v4))
                                                                          v29
                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v30 v31
                                                                     -> let v32
                                                                              = coe
                                                                                  MAlonzo.Code.Data.Vec.Base.du644
                                                                                  (coe
                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                     (coe v28)
                                                                                     (coe v25)) in
                                                                        case coe v30 of
                                                                          MAlonzo.Code.Data.List.Kleene.Base.C42 v33 v34
                                                                            -> case coe v33 of
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v35 v36
                                                                                   -> case coe
                                                                                             v35 of
                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v37
                                                                                          -> case coe
                                                                                                    v32 of
                                                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32 v39 v40
                                                                                                 -> let v41
                                                                                                          = coe
                                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                              (coe
                                                                                                                 v4)
                                                                                                              (coe
                                                                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                 (coe
                                                                                                                    v37)
                                                                                                                 (coe
                                                                                                                    v34))
                                                                                                              (coe
                                                                                                                 v32) in
                                                                                                    case coe
                                                                                                           v36 of
                                                                                                      0 -> coe
                                                                                                             v41
                                                                                                      _ -> let v42
                                                                                                                 = subInt
                                                                                                                     (coe
                                                                                                                        v36)
                                                                                                                     (coe
                                                                                                                        (1 ::
                                                                                                                           Integer)) in
                                                                                                           coe
                                                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                (coe
                                                                                                                   v4))
                                                                                                             (coe
                                                                                                                MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                (coe
                                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                   (coe
                                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                      (coe
                                                                                                                         v4)))
                                                                                                                (coe
                                                                                                                   v39)
                                                                                                                (coe
                                                                                                                   v42))
                                                                                                             v41
                                                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                            _ -> MAlonzo.RTE.mazUnreachableError))
                                                      (coe
                                                         MAlonzo.Code.Algebra.Operations.Ring.du32
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                            (coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                               (coe v4)))
                                                         (let v24
                                                                = let v24
                                                                        = coe
                                                                            du580 (coe v11)
                                                                            (coe v8) in
                                                                  case coe v20 of
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v25 v26 v27
                                                                      -> case coe v26 of
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v28
                                                                             -> coe
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                  (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                     (coe v4))
                                                                                  v28
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v29 v30
                                                                             -> let v31
                                                                                      = coe
                                                                                          MAlonzo.Code.Data.Vec.Base.du644
                                                                                          (coe
                                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                             (coe
                                                                                                v27)
                                                                                             (coe
                                                                                                v24)) in
                                                                                case coe v29 of
                                                                                  MAlonzo.Code.Data.List.Kleene.Base.C42 v32 v33
                                                                                    -> case coe
                                                                                              v32 of
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v34 v35
                                                                                           -> case coe
                                                                                                     v34 of
                                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v36
                                                                                                  -> case coe
                                                                                                            v31 of
                                                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32 v38 v39
                                                                                                         -> let v40
                                                                                                                  = coe
                                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                      (coe
                                                                                                                         v4)
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                         (coe
                                                                                                                            v36)
                                                                                                                         (coe
                                                                                                                            v33))
                                                                                                                      (coe
                                                                                                                         v31) in
                                                                                                            case coe
                                                                                                                   v35 of
                                                                                                              0 -> coe
                                                                                                                     v40
                                                                                                              _ -> let v41
                                                                                                                         = subInt
                                                                                                                             (coe
                                                                                                                                v35)
                                                                                                                             (coe
                                                                                                                                (1 ::
                                                                                                                                   Integer)) in
                                                                                                                   coe
                                                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                        (coe
                                                                                                                           v4))
                                                                                                                     (coe
                                                                                                                        MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                        (coe
                                                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                           (coe
                                                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                              (coe
                                                                                                                                 v4)))
                                                                                                                        (coe
                                                                                                                           v38)
                                                                                                                        (coe
                                                                                                                           v41))
                                                                                                                     v40
                                                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                                    _ -> MAlonzo.RTE.mazUnreachableError in
                                                          let v25 = coe du578 (coe v11) (coe v8) in
                                                          case coe v19 of
                                                            0 -> coe v24
                                                            _ -> let v26
                                                                       = subInt
                                                                           (coe v19)
                                                                           (coe (1 :: Integer)) in
                                                                 coe
                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                      (coe v4))
                                                                   (coe
                                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                      (coe
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                         (coe
                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                            (coe v4)))
                                                                      (coe v25) (coe v26))
                                                                   v24)
                                                         (coe v7))
                                                      (let v24
                                                             = let v24
                                                                     = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                                         (coe
                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                            (coe v4)) in
                                                               let v25
                                                                     = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                                         (coe v24) in
                                                               let v26
                                                                     = MAlonzo.Code.Algebra.Structures.d1290
                                                                         (coe v25) in
                                                               let v27
                                                                     = MAlonzo.Code.Algebra.Structures.d1186
                                                                         (coe v26) in
                                                               let v28
                                                                     = MAlonzo.Code.Algebra.Structures.d1094
                                                                         (coe v27) in
                                                               let v29
                                                                     = MAlonzo.Code.Algebra.Structures.d372
                                                                         (coe v28) in
                                                               let v30
                                                                     = MAlonzo.Code.Algebra.Structures.d324
                                                                         (coe v29) in
                                                               coe
                                                                 MAlonzo.Code.Algebra.Structures.du104
                                                                 (coe
                                                                    MAlonzo.Code.Algebra.Structures.d124
                                                                    (coe v30)) in
                                                       coe
                                                         MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                                                         (coe
                                                            MAlonzo.Code.Relation.Binary.Bundles.du74
                                                            (coe v24))
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                               (coe v4))
                                                            (let v25
                                                                   = coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v4)) in
                                                             let v26
                                                                   = coe du578 (coe v11) (coe v8) in
                                                             let v27
                                                                   = addInt
                                                                       (coe
                                                                          mulInt (coe v7) (coe v19))
                                                                       (coe v19) in
                                                             case coe v27 of
                                                               0 -> coe
                                                                      MAlonzo.Code.Algebra.Bundles.d2030
                                                                      (coe v25)
                                                               _ -> let v28
                                                                          = subInt
                                                                              (coe v27)
                                                                              (coe
                                                                                 (1 :: Integer)) in
                                                                    coe
                                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                      (coe v25) (coe v26) (coe v28))
                                                            (let v25
                                                                   = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                                                                       (coe v0) (coe v1)
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                          (coe v4))
                                                                       (coe v15) (coe v20)
                                                                       (coe v7) in
                                                             let v26
                                                                   = coe du580 (coe v11) (coe v8) in
                                                             case coe v25 of
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v27 v28 v29
                                                                 -> case coe v28 of
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v30
                                                                        -> coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                (coe v4))
                                                                             v30
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v31 v32
                                                                        -> let v33
                                                                                 = coe
                                                                                     MAlonzo.Code.Data.Vec.Base.du644
                                                                                     (coe
                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                        (coe v29)
                                                                                        (coe
                                                                                           v26)) in
                                                                           case coe v31 of
                                                                             MAlonzo.Code.Data.List.Kleene.Base.C42 v34 v35
                                                                               -> case coe v34 of
                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v36 v37
                                                                                      -> case coe
                                                                                                v36 of
                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v38
                                                                                             -> case coe
                                                                                                       v33 of
                                                                                                  MAlonzo.Code.Agda.Builtin.Sigma.C32 v40 v41
                                                                                                    -> let v42
                                                                                                             = coe
                                                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                 (coe
                                                                                                                    v4)
                                                                                                                 (coe
                                                                                                                    MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                    (coe
                                                                                                                       v38)
                                                                                                                    (coe
                                                                                                                       v35))
                                                                                                                 (coe
                                                                                                                    v33) in
                                                                                                       case coe
                                                                                                              v37 of
                                                                                                         0 -> coe
                                                                                                                v42
                                                                                                         _ -> let v43
                                                                                                                    = subInt
                                                                                                                        (coe
                                                                                                                           v37)
                                                                                                                        (coe
                                                                                                                           (1 ::
                                                                                                                              Integer)) in
                                                                                                              coe
                                                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                   (coe
                                                                                                                      v4))
                                                                                                                (coe
                                                                                                                   MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                   (coe
                                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                         (coe
                                                                                                                            v4)))
                                                                                                                   (coe
                                                                                                                      v40)
                                                                                                                   (coe
                                                                                                                      v43))
                                                                                                                v42
                                                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                                                             _ -> MAlonzo.RTE.mazUnreachableError
                                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                                               _ -> MAlonzo.RTE.mazUnreachableError))
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                               (coe v4))
                                                            (let v25
                                                                   = coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v4)) in
                                                             let v26
                                                                   = coe du578 (coe v11) (coe v8) in
                                                             let v27
                                                                   = addInt
                                                                       (coe
                                                                          mulInt (coe v7) (coe v19))
                                                                       (coe v19) in
                                                             case coe v27 of
                                                               0 -> coe
                                                                      MAlonzo.Code.Algebra.Bundles.d2030
                                                                      (coe v25)
                                                               _ -> let v28
                                                                          = subInt
                                                                              (coe v27)
                                                                              (coe
                                                                                 (1 :: Integer)) in
                                                                    coe
                                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                      (coe v25) (coe v26) (coe v28))
                                                            (coe
                                                               MAlonzo.Code.Algebra.Operations.Ring.du32
                                                               (coe
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                  (coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                     (coe v4)))
                                                               (let v25
                                                                      = coe
                                                                          du580 (coe v11)
                                                                          (coe v8) in
                                                                case coe v20 of
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v26 v27 v28
                                                                    -> case coe v27 of
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v29
                                                                           -> coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                   (coe v4))
                                                                                v29
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v30 v31
                                                                           -> let v32
                                                                                    = coe
                                                                                        MAlonzo.Code.Data.Vec.Base.du644
                                                                                        (coe
                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                           (coe v28)
                                                                                           (coe
                                                                                              v25)) in
                                                                              case coe v30 of
                                                                                MAlonzo.Code.Data.List.Kleene.Base.C42 v33 v34
                                                                                  -> case coe v33 of
                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v35 v36
                                                                                         -> case coe
                                                                                                   v35 of
                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v37
                                                                                                -> case coe
                                                                                                          v32 of
                                                                                                     MAlonzo.Code.Agda.Builtin.Sigma.C32 v39 v40
                                                                                                       -> let v41
                                                                                                                = coe
                                                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                    (coe
                                                                                                                       v4)
                                                                                                                    (coe
                                                                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                       (coe
                                                                                                                          v37)
                                                                                                                       (coe
                                                                                                                          v34))
                                                                                                                    (coe
                                                                                                                       v32) in
                                                                                                          case coe
                                                                                                                 v36 of
                                                                                                            0 -> coe
                                                                                                                   v41
                                                                                                            _ -> let v42
                                                                                                                       = subInt
                                                                                                                           (coe
                                                                                                                              v36)
                                                                                                                           (coe
                                                                                                                              (1 ::
                                                                                                                                 Integer)) in
                                                                                                                 coe
                                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                      (coe
                                                                                                                         v4))
                                                                                                                   (coe
                                                                                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                         (coe
                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                            (coe
                                                                                                                               v4)))
                                                                                                                      (coe
                                                                                                                         v39)
                                                                                                                      (coe
                                                                                                                         v42))
                                                                                                                   v41
                                                                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                                  _ -> MAlonzo.RTE.mazUnreachableError)
                                                               (coe v7)))
                                                         (coe
                                                            MAlonzo.Code.Algebra.Operations.Ring.du32
                                                            (coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                               (coe
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                  (coe v4)))
                                                            (let v25
                                                                   = let v25
                                                                           = coe
                                                                               du580 (coe v11)
                                                                               (coe v8) in
                                                                     case coe v20 of
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v26 v27 v28
                                                                         -> case coe v27 of
                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v29
                                                                                -> coe
                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                        (coe v4))
                                                                                     v29
                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v30 v31
                                                                                -> let v32
                                                                                         = coe
                                                                                             MAlonzo.Code.Data.Vec.Base.du644
                                                                                             (coe
                                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                                (coe
                                                                                                   v28)
                                                                                                (coe
                                                                                                   v25)) in
                                                                                   case coe v30 of
                                                                                     MAlonzo.Code.Data.List.Kleene.Base.C42 v33 v34
                                                                                       -> case coe
                                                                                                 v33 of
                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v35 v36
                                                                                              -> case coe
                                                                                                        v35 of
                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v37
                                                                                                     -> case coe
                                                                                                               v32 of
                                                                                                          MAlonzo.Code.Agda.Builtin.Sigma.C32 v39 v40
                                                                                                            -> let v41
                                                                                                                     = coe
                                                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                         (coe
                                                                                                                            v4)
                                                                                                                         (coe
                                                                                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                            (coe
                                                                                                                               v37)
                                                                                                                            (coe
                                                                                                                               v34))
                                                                                                                         (coe
                                                                                                                            v32) in
                                                                                                               case coe
                                                                                                                      v36 of
                                                                                                                 0 -> coe
                                                                                                                        v41
                                                                                                                 _ -> let v42
                                                                                                                            = subInt
                                                                                                                                (coe
                                                                                                                                   v36)
                                                                                                                                (coe
                                                                                                                                   (1 ::
                                                                                                                                      Integer)) in
                                                                                                                      coe
                                                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                           (coe
                                                                                                                              v4))
                                                                                                                        (coe
                                                                                                                           MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                           (coe
                                                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                              (coe
                                                                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                 (coe
                                                                                                                                    v4)))
                                                                                                                           (coe
                                                                                                                              v39)
                                                                                                                           (coe
                                                                                                                              v42))
                                                                                                                        v41
                                                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                                       _ -> MAlonzo.RTE.mazUnreachableError in
                                                             let v26
                                                                   = coe du578 (coe v11) (coe v8) in
                                                             case coe v19 of
                                                               0 -> coe v25
                                                               _ -> let v27
                                                                          = subInt
                                                                              (coe v19)
                                                                              (coe
                                                                                 (1 :: Integer)) in
                                                                    coe
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                         (coe v4))
                                                                      (coe
                                                                         MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                         (coe
                                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                            (coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                               (coe v4)))
                                                                         (coe v26) (coe v27))
                                                                      v25)
                                                            (coe v7))
                                                         (let v25
                                                                = let v25
                                                                        = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                                            (coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                               (coe v4)) in
                                                                  let v26
                                                                        = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                                            (coe v25) in
                                                                  let v27
                                                                        = MAlonzo.Code.Algebra.Structures.d1290
                                                                            (coe v26) in
                                                                  let v28
                                                                        = MAlonzo.Code.Algebra.Structures.d1186
                                                                            (coe v27) in
                                                                  let v29
                                                                        = MAlonzo.Code.Algebra.Structures.d1094
                                                                            (coe v28) in
                                                                  let v30
                                                                        = MAlonzo.Code.Algebra.Structures.d372
                                                                            (coe v29) in
                                                                  let v31
                                                                        = MAlonzo.Code.Algebra.Structures.d324
                                                                            (coe v30) in
                                                                  coe
                                                                    MAlonzo.Code.Algebra.Structures.du104
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Structures.d124
                                                                       (coe v31)) in
                                                          coe
                                                            MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                                                            (coe
                                                               MAlonzo.Code.Relation.Binary.Bundles.du74
                                                               (coe v25))
                                                            (coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                  (coe v4))
                                                               (let v26
                                                                      = coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)) in
                                                                let v27
                                                                      = coe
                                                                          du578 (coe v11)
                                                                          (coe v8) in
                                                                let v28
                                                                      = addInt
                                                                          (coe
                                                                             mulInt (coe v7)
                                                                             (coe v19))
                                                                          (coe v19) in
                                                                case coe v28 of
                                                                  0 -> coe
                                                                         MAlonzo.Code.Algebra.Bundles.d2030
                                                                         (coe v26)
                                                                  _ -> let v29
                                                                             = subInt
                                                                                 (coe v28)
                                                                                 (coe
                                                                                    (1 ::
                                                                                       Integer)) in
                                                                       coe
                                                                         MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                         (coe v26) (coe v27)
                                                                         (coe v29))
                                                               (coe
                                                                  MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                  (coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                     (coe
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                        (coe v4)))
                                                                  (let v26
                                                                         = coe
                                                                             du580 (coe v11)
                                                                             (coe v8) in
                                                                   case coe v20 of
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v27 v28 v29
                                                                       -> case coe v28 of
                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v30
                                                                              -> coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                      (coe v4))
                                                                                   v30
                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v31 v32
                                                                              -> let v33
                                                                                       = coe
                                                                                           MAlonzo.Code.Data.Vec.Base.du644
                                                                                           (coe
                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                              (coe
                                                                                                 v29)
                                                                                              (coe
                                                                                                 v26)) in
                                                                                 case coe v31 of
                                                                                   MAlonzo.Code.Data.List.Kleene.Base.C42 v34 v35
                                                                                     -> case coe
                                                                                               v34 of
                                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v36 v37
                                                                                            -> case coe
                                                                                                      v36 of
                                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v38
                                                                                                   -> case coe
                                                                                                             v33 of
                                                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32 v40 v41
                                                                                                          -> let v42
                                                                                                                   = coe
                                                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                       (coe
                                                                                                                          v4)
                                                                                                                       (coe
                                                                                                                          MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                          (coe
                                                                                                                             v38)
                                                                                                                          (coe
                                                                                                                             v35))
                                                                                                                       (coe
                                                                                                                          v33) in
                                                                                                             case coe
                                                                                                                    v37 of
                                                                                                               0 -> coe
                                                                                                                      v42
                                                                                                               _ -> let v43
                                                                                                                          = subInt
                                                                                                                              (coe
                                                                                                                                 v37)
                                                                                                                              (coe
                                                                                                                                 (1 ::
                                                                                                                                    Integer)) in
                                                                                                                    coe
                                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                         (coe
                                                                                                                            v4))
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                         (coe
                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                            (coe
                                                                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                               (coe
                                                                                                                                  v4)))
                                                                                                                         (coe
                                                                                                                            v40)
                                                                                                                         (coe
                                                                                                                            v43))
                                                                                                                      v42
                                                                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                     _ -> MAlonzo.RTE.mazUnreachableError)
                                                                  (coe v7)))
                                                            (coe
                                                               MAlonzo.Code.Algebra.Operations.Ring.du32
                                                               (coe
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                  (coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                     (coe v4)))
                                                               (let v26
                                                                      = let v26
                                                                              = coe
                                                                                  du580 (coe v11)
                                                                                  (coe v8) in
                                                                        case coe v20 of
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v27 v28 v29
                                                                            -> case coe v28 of
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v30
                                                                                   -> coe
                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                           (coe v4))
                                                                                        v30
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v31 v32
                                                                                   -> let v33
                                                                                            = coe
                                                                                                MAlonzo.Code.Data.Vec.Base.du644
                                                                                                (coe
                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                                   (coe
                                                                                                      v29)
                                                                                                   (coe
                                                                                                      v26)) in
                                                                                      case coe
                                                                                             v31 of
                                                                                        MAlonzo.Code.Data.List.Kleene.Base.C42 v34 v35
                                                                                          -> case coe
                                                                                                    v34 of
                                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v36 v37
                                                                                                 -> case coe
                                                                                                           v36 of
                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v38
                                                                                                        -> case coe
                                                                                                                  v33 of
                                                                                                             MAlonzo.Code.Agda.Builtin.Sigma.C32 v40 v41
                                                                                                               -> let v42
                                                                                                                        = coe
                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                            (coe
                                                                                                                               v4)
                                                                                                                            (coe
                                                                                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                               (coe
                                                                                                                                  v38)
                                                                                                                               (coe
                                                                                                                                  v35))
                                                                                                                            (coe
                                                                                                                               v33) in
                                                                                                                  case coe
                                                                                                                         v37 of
                                                                                                                    0 -> coe
                                                                                                                           v42
                                                                                                                    _ -> let v43
                                                                                                                               = subInt
                                                                                                                                   (coe
                                                                                                                                      v37)
                                                                                                                                   (coe
                                                                                                                                      (1 ::
                                                                                                                                         Integer)) in
                                                                                                                         coe
                                                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                              (coe
                                                                                                                                 v4))
                                                                                                                           (coe
                                                                                                                              MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                              (coe
                                                                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                                 (coe
                                                                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                    (coe
                                                                                                                                       v4)))
                                                                                                                              (coe
                                                                                                                                 v40)
                                                                                                                              (coe
                                                                                                                                 v43))
                                                                                                                           v42
                                                                                                             _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                                          _ -> MAlonzo.RTE.mazUnreachableError in
                                                                let v27
                                                                      = coe
                                                                          du578 (coe v11)
                                                                          (coe v8) in
                                                                case coe v19 of
                                                                  0 -> coe v26
                                                                  _ -> let v28
                                                                             = subInt
                                                                                 (coe v19)
                                                                                 (coe
                                                                                    (1 ::
                                                                                       Integer)) in
                                                                       coe
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                            (coe v4))
                                                                         (coe
                                                                            MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                            (coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                               (coe
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                  (coe v4)))
                                                                            (coe v27) (coe v28))
                                                                         v26)
                                                               (coe v7))
                                                            (coe
                                                               MAlonzo.Code.Algebra.Operations.Ring.du32
                                                               (coe
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                  (coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                     (coe v4)))
                                                               (let v26
                                                                      = let v26
                                                                              = coe
                                                                                  du580 (coe v11)
                                                                                  (coe v8) in
                                                                        case coe v20 of
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v27 v28 v29
                                                                            -> case coe v28 of
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v30
                                                                                   -> coe
                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                           (coe v4))
                                                                                        v30
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v31 v32
                                                                                   -> let v33
                                                                                            = coe
                                                                                                MAlonzo.Code.Data.Vec.Base.du644
                                                                                                (coe
                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                                   (coe
                                                                                                      v29)
                                                                                                   (coe
                                                                                                      v26)) in
                                                                                      case coe
                                                                                             v31 of
                                                                                        MAlonzo.Code.Data.List.Kleene.Base.C42 v34 v35
                                                                                          -> case coe
                                                                                                    v34 of
                                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v36 v37
                                                                                                 -> case coe
                                                                                                           v36 of
                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v38
                                                                                                        -> case coe
                                                                                                                  v33 of
                                                                                                             MAlonzo.Code.Agda.Builtin.Sigma.C32 v40 v41
                                                                                                               -> let v42
                                                                                                                        = coe
                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                            (coe
                                                                                                                               v4)
                                                                                                                            (coe
                                                                                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                               (coe
                                                                                                                                  v38)
                                                                                                                               (coe
                                                                                                                                  v35))
                                                                                                                            (coe
                                                                                                                               v33) in
                                                                                                                  case coe
                                                                                                                         v37 of
                                                                                                                    0 -> coe
                                                                                                                           v42
                                                                                                                    _ -> let v43
                                                                                                                               = subInt
                                                                                                                                   (coe
                                                                                                                                      v37)
                                                                                                                                   (coe
                                                                                                                                      (1 ::
                                                                                                                                         Integer)) in
                                                                                                                         coe
                                                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                              (coe
                                                                                                                                 v4))
                                                                                                                           (coe
                                                                                                                              MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                              (coe
                                                                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                                 (coe
                                                                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                    (coe
                                                                                                                                       v4)))
                                                                                                                              (coe
                                                                                                                                 v40)
                                                                                                                              (coe
                                                                                                                                 v43))
                                                                                                                           v42
                                                                                                             _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                                          _ -> MAlonzo.RTE.mazUnreachableError in
                                                                let v27
                                                                      = coe
                                                                          du578 (coe v11)
                                                                          (coe v8) in
                                                                case coe v19 of
                                                                  0 -> coe v26
                                                                  _ -> let v28
                                                                             = subInt
                                                                                 (coe v19)
                                                                                 (coe
                                                                                    (1 ::
                                                                                       Integer)) in
                                                                       coe
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                            (coe v4))
                                                                         (coe
                                                                            MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                            (coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                               (coe
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                  (coe v4)))
                                                                            (coe v27) (coe v28))
                                                                         v26)
                                                               (coe v7))
                                                            (let v26
                                                                   = let v26
                                                                           = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                                               (coe
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                  (coe v4)) in
                                                                     let v27
                                                                           = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                                               (coe v26) in
                                                                     let v28
                                                                           = MAlonzo.Code.Algebra.Structures.d1290
                                                                               (coe v27) in
                                                                     let v29
                                                                           = MAlonzo.Code.Algebra.Structures.d1186
                                                                               (coe v28) in
                                                                     let v30
                                                                           = MAlonzo.Code.Algebra.Structures.d1094
                                                                               (coe v29) in
                                                                     let v31
                                                                           = MAlonzo.Code.Algebra.Structures.d372
                                                                               (coe v30) in
                                                                     let v32
                                                                           = MAlonzo.Code.Algebra.Structures.d324
                                                                               (coe v31) in
                                                                     coe
                                                                       MAlonzo.Code.Algebra.Structures.du104
                                                                       (coe
                                                                          MAlonzo.Code.Algebra.Structures.d124
                                                                          (coe v32)) in
                                                             let v27
                                                                   = MAlonzo.Code.Relation.Binary.Structures.d34
                                                                       (coe
                                                                          MAlonzo.Code.Relation.Binary.Bundles.d60
                                                                          (coe v26)) in
                                                             let v28
                                                                   = coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)))
                                                                       (let v28
                                                                              = let v28
                                                                                      = coe
                                                                                          du580
                                                                                          (coe v11)
                                                                                          (coe
                                                                                             v8) in
                                                                                case coe v20 of
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v29 v30 v31
                                                                                    -> case coe
                                                                                              v30 of
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v32
                                                                                           -> coe
                                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                                   (coe
                                                                                                      v4))
                                                                                                v32
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v33 v34
                                                                                           -> let v35
                                                                                                    = coe
                                                                                                        MAlonzo.Code.Data.Vec.Base.du644
                                                                                                        (coe
                                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                                           (coe
                                                                                                              v31)
                                                                                                           (coe
                                                                                                              v28)) in
                                                                                              case coe
                                                                                                     v33 of
                                                                                                MAlonzo.Code.Data.List.Kleene.Base.C42 v36 v37
                                                                                                  -> case coe
                                                                                                            v36 of
                                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v38 v39
                                                                                                         -> case coe
                                                                                                                   v38 of
                                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v40
                                                                                                                -> case coe
                                                                                                                          v35 of
                                                                                                                     MAlonzo.Code.Agda.Builtin.Sigma.C32 v42 v43
                                                                                                                       -> let v44
                                                                                                                                = coe
                                                                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                                    (coe
                                                                                                                                       v4)
                                                                                                                                    (coe
                                                                                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                                       (coe
                                                                                                                                          v40)
                                                                                                                                       (coe
                                                                                                                                          v37))
                                                                                                                                    (coe
                                                                                                                                       v35) in
                                                                                                                          case coe
                                                                                                                                 v39 of
                                                                                                                            0 -> coe
                                                                                                                                   v44
                                                                                                                            _ -> let v45
                                                                                                                                       = subInt
                                                                                                                                           (coe
                                                                                                                                              v39)
                                                                                                                                           (coe
                                                                                                                                              (1 ::
                                                                                                                                                 Integer)) in
                                                                                                                                 coe
                                                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                      (coe
                                                                                                                                         v4))
                                                                                                                                   (coe
                                                                                                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                                      (coe
                                                                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                                         (coe
                                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                                            (coe
                                                                                                                                               v4)))
                                                                                                                                      (coe
                                                                                                                                         v42)
                                                                                                                                      (coe
                                                                                                                                         v45))
                                                                                                                                   v44
                                                                                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                                                  _ -> MAlonzo.RTE.mazUnreachableError in
                                                                        let v29
                                                                              = coe
                                                                                  du578 (coe v11)
                                                                                  (coe v8) in
                                                                        case coe v19 of
                                                                          0 -> coe v28
                                                                          _ -> let v30
                                                                                     = subInt
                                                                                         (coe v19)
                                                                                         (coe
                                                                                            (1 ::
                                                                                               Integer)) in
                                                                               coe
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                    (coe v4))
                                                                                 (coe
                                                                                    MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                    (coe
                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                       (coe
                                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                          (coe v4)))
                                                                                    (coe v29)
                                                                                    (coe v30))
                                                                                 v28)
                                                                       (coe v7) in
                                                             coe
                                                               MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.C32
                                                               (coe v27 v28))
                                                            (coe
                                                               du584 (coe v4) (coe v20) (coe v11)
                                                               (coe v7) (coe v8) (coe v19)))
                                                         (coe
                                                            MAlonzo.Code.Algebra.Structures.d90
                                                            (MAlonzo.Code.Algebra.Structures.d124
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
                                                                                 (coe
                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                    (coe v4)))))))))
                                                            (let v25
                                                                   = coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v4)) in
                                                             let v26
                                                                   = coe du578 (coe v11) (coe v8) in
                                                             let v27
                                                                   = addInt
                                                                       (coe
                                                                          mulInt (coe v7) (coe v19))
                                                                       (coe v19) in
                                                             case coe v27 of
                                                               0 -> coe
                                                                      MAlonzo.Code.Algebra.Bundles.d2030
                                                                      (coe v25)
                                                               _ -> let v28
                                                                          = subInt
                                                                              (coe v27)
                                                                              (coe
                                                                                 (1 :: Integer)) in
                                                                    coe
                                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                      (coe v25) (coe v26) (coe v28))
                                                            (let v25
                                                                   = coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v4)) in
                                                             let v26
                                                                   = coe du578 (coe v11) (coe v8) in
                                                             let v27
                                                                   = addInt
                                                                       (coe
                                                                          mulInt (coe v7) (coe v19))
                                                                       (coe v19) in
                                                             case coe v27 of
                                                               0 -> coe
                                                                      MAlonzo.Code.Algebra.Bundles.d2030
                                                                      (coe v25)
                                                               _ -> let v28
                                                                          = subInt
                                                                              (coe v27)
                                                                              (coe
                                                                                 (1 :: Integer)) in
                                                                    coe
                                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                      (coe v25) (coe v26) (coe v28))
                                                            (let v25
                                                                   = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                                                                       (coe v0) (coe v1)
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                          (coe v4))
                                                                       (coe v15) (coe v20)
                                                                       (coe v7) in
                                                             let v26
                                                                   = coe du580 (coe v11) (coe v8) in
                                                             case coe v25 of
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v27 v28 v29
                                                                 -> case coe v28 of
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v30
                                                                        -> coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                (coe v4))
                                                                             v30
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v31 v32
                                                                        -> let v33
                                                                                 = coe
                                                                                     MAlonzo.Code.Data.Vec.Base.du644
                                                                                     (coe
                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                        (coe v29)
                                                                                        (coe
                                                                                           v26)) in
                                                                           case coe v31 of
                                                                             MAlonzo.Code.Data.List.Kleene.Base.C42 v34 v35
                                                                               -> case coe v34 of
                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v36 v37
                                                                                      -> case coe
                                                                                                v36 of
                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v38
                                                                                             -> case coe
                                                                                                       v33 of
                                                                                                  MAlonzo.Code.Agda.Builtin.Sigma.C32 v40 v41
                                                                                                    -> let v42
                                                                                                             = coe
                                                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                 (coe
                                                                                                                    v4)
                                                                                                                 (coe
                                                                                                                    MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                    (coe
                                                                                                                       v38)
                                                                                                                    (coe
                                                                                                                       v35))
                                                                                                                 (coe
                                                                                                                    v33) in
                                                                                                       case coe
                                                                                                              v37 of
                                                                                                         0 -> coe
                                                                                                                v42
                                                                                                         _ -> let v43
                                                                                                                    = subInt
                                                                                                                        (coe
                                                                                                                           v37)
                                                                                                                        (coe
                                                                                                                           (1 ::
                                                                                                                              Integer)) in
                                                                                                              coe
                                                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                   (coe
                                                                                                                      v4))
                                                                                                                (coe
                                                                                                                   MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                   (coe
                                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                         (coe
                                                                                                                            v4)))
                                                                                                                   (coe
                                                                                                                      v40)
                                                                                                                   (coe
                                                                                                                      v43))
                                                                                                                v42
                                                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                                                             _ -> MAlonzo.RTE.mazUnreachableError
                                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                                               _ -> MAlonzo.RTE.mazUnreachableError)
                                                            (coe
                                                               MAlonzo.Code.Algebra.Operations.Ring.du32
                                                               (coe
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                  (coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                     (coe v4)))
                                                               (let v25
                                                                      = coe
                                                                          du580 (coe v11)
                                                                          (coe v8) in
                                                                case coe v20 of
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v26 v27 v28
                                                                    -> case coe v27 of
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v29
                                                                           -> coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                   (coe v4))
                                                                                v29
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v30 v31
                                                                           -> let v32
                                                                                    = coe
                                                                                        MAlonzo.Code.Data.Vec.Base.du644
                                                                                        (coe
                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                           (coe v28)
                                                                                           (coe
                                                                                              v25)) in
                                                                              case coe v30 of
                                                                                MAlonzo.Code.Data.List.Kleene.Base.C42 v33 v34
                                                                                  -> case coe v33 of
                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v35 v36
                                                                                         -> case coe
                                                                                                   v35 of
                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v37
                                                                                                -> case coe
                                                                                                          v32 of
                                                                                                     MAlonzo.Code.Agda.Builtin.Sigma.C32 v39 v40
                                                                                                       -> let v41
                                                                                                                = coe
                                                                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                    (coe
                                                                                                                       v4)
                                                                                                                    (coe
                                                                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                       (coe
                                                                                                                          v37)
                                                                                                                       (coe
                                                                                                                          v34))
                                                                                                                    (coe
                                                                                                                       v32) in
                                                                                                          case coe
                                                                                                                 v36 of
                                                                                                            0 -> coe
                                                                                                                   v41
                                                                                                            _ -> let v42
                                                                                                                       = subInt
                                                                                                                           (coe
                                                                                                                              v36)
                                                                                                                           (coe
                                                                                                                              (1 ::
                                                                                                                                 Integer)) in
                                                                                                                 coe
                                                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                      (coe
                                                                                                                         v4))
                                                                                                                   (coe
                                                                                                                      MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                         (coe
                                                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                            (coe
                                                                                                                               v4)))
                                                                                                                      (coe
                                                                                                                         v39)
                                                                                                                      (coe
                                                                                                                         v42))
                                                                                                                   v41
                                                                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                                  _ -> MAlonzo.RTE.mazUnreachableError)
                                                               (coe v7))
                                                            (coe
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
                                                                                          (coe
                                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                             (coe
                                                                                                v4)))))))))))
                                                               (let v25
                                                                      = coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v4)) in
                                                                let v26
                                                                      = coe
                                                                          du578 (coe v11)
                                                                          (coe v8) in
                                                                let v27
                                                                      = addInt
                                                                          (coe
                                                                             mulInt (coe v7)
                                                                             (coe v19))
                                                                          (coe v19) in
                                                                case coe v27 of
                                                                  0 -> coe
                                                                         MAlonzo.Code.Algebra.Bundles.d2030
                                                                         (coe v25)
                                                                  _ -> let v28
                                                                             = subInt
                                                                                 (coe v27)
                                                                                 (coe
                                                                                    (1 ::
                                                                                       Integer)) in
                                                                       coe
                                                                         MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                         (coe v25) (coe v26)
                                                                         (coe v28)))
                                                            (d544
                                                               (coe v0) (coe v1) (coe v2) (coe v3)
                                                               (coe v4) (coe v15) (coe v20) (coe v7)
                                                               (coe du580 (coe v11) (coe v8)))))
                                                      (coe
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du894
                                                         (coe v4)
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                                                            (coe v0) (coe v1)
                                                            (coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                               (coe v4))
                                                            (coe v15) (coe v20) (coe v7))
                                                         (coe
                                                            addInt (coe mulInt (coe v7) (coe v19))
                                                            (coe v19))
                                                         (coe v17) (coe du578 (coe v11) (coe v8))
                                                         (coe du580 (coe v11) (coe v8))))
                                                   (coe
                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du1054
                                                      (coe v4)
                                                      (let v23
                                                             = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                 (coe v4) in
                                                       let v24
                                                             = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                                                                 (coe v0) (coe v1)
                                                                 (coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                                                    (coe v4))
                                                                 (coe v15) (coe v20) (coe v7) in
                                                       let v25
                                                             = addInt
                                                                 (coe mulInt (coe v7) (coe v19))
                                                                 (coe v19) in
                                                       case coe v24 of
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v26 v27 v28
                                                           -> case coe v27 of
                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v29
                                                                  -> let v30
                                                                           = coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                                               v23 v29 in
                                                                     coe
                                                                       seq (coe v30)
                                                                       (if coe v30
                                                                          then coe
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244
                                                                                 (coe v17)
                                                                                 (coe
                                                                                    addInt
                                                                                    (coe
                                                                                       (1 ::
                                                                                          Integer))
                                                                                    (coe v25))
                                                                          else coe
                                                                                 MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                                 (coe
                                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                    (coe
                                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                                                       (coe
                                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                                          v24)
                                                                                       (coe v25))
                                                                                    (coe v17)))
                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v30 v31
                                                                  -> coe
                                                                       MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                       (coe
                                                                          MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                                v24)
                                                                             (coe v25))
                                                                          (coe v17))
                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                         _ -> MAlonzo.RTE.mazUnreachableError)
                                                      (coe v11) (coe v8)))
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           MAlonzo.Code.Data.List.Kleene.Base.C48 v18
                             -> coe
                                  d524 (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) (coe v5)
                                  (coe v7)
                                  (coe
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                                     (coe v9)
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13
                                        v14)
                                     (coe v11))
                                  (coe v8)
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name576
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._.ρ′,Ρ"
d576 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d576 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du576 v11 v13
du576 ::
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du576 v0 v1
  = coe
      MAlonzo.Code.Data.Vec.Base.du644
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
         (coe v0) (coe v1))
name578
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._.ρ′"
d578 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  Integer -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d578 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du578 v11 v13
du578 ::
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du578 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28 (coe du576 (coe v0) (coe v1))
name580
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._.Ρ"
d580 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 -> MAlonzo.Code.Data.Vec.Base.T24
d580 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 = du580 v11 v13
du580 ::
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> MAlonzo.Code.Data.Vec.Base.T24
du580 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30 (coe du576 (coe v0) (coe v1))
name584
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation._.rearrange"
d584 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  Integer -> MAlonzo.Code.Data.Vec.Base.T24 -> Integer -> AgdaAny
d584 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14
  = du584 v4 v7 v11 v12 v13 v14
du584 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  Integer -> MAlonzo.Code.Data.Vec.Base.T24 -> Integer -> AgdaAny
du584 v0 v1 v2 v3 v4 v5
  = case coe v5 of
      0 -> coe
             MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.d38
             (let v6
                    = let v6
                            = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                   (coe v0)) in
                      let v7
                            = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                (coe v6) in
                      let v8 = MAlonzo.Code.Algebra.Structures.d1290 (coe v7) in
                      let v9 = MAlonzo.Code.Algebra.Structures.d1186 (coe v8) in
                      let v10 = MAlonzo.Code.Algebra.Structures.d1094 (coe v9) in
                      let v11 = MAlonzo.Code.Algebra.Structures.d372 (coe v10) in
                      let v12 = MAlonzo.Code.Algebra.Structures.d324 (coe v11) in
                      coe
                        MAlonzo.Code.Algebra.Structures.du104
                        (coe MAlonzo.Code.Algebra.Structures.d124 (coe v12)) in
              coe
                MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v6))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                      (coe v0))
                   (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d214
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v0)))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (let v7 = coe du580 (coe v2) (coe v4) in
                       case coe v1 of
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v8 v9 v10
                           -> case coe v9 of
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v11
                                  -> coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                          (coe v0))
                                       v11
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v12 v13
                                  -> let v14
                                           = coe
                                               MAlonzo.Code.Data.Vec.Base.du644
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                  (coe v10) (coe v7)) in
                                     case coe v12 of
                                       MAlonzo.Code.Data.List.Kleene.Base.C42 v15 v16
                                         -> case coe v15 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v17 v18
                                                -> case coe v17 of
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v19
                                                       -> case coe v14 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32 v21 v22
                                                              -> let v23
                                                                       = coe
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                           (coe v0)
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                              (coe v19) (coe v16))
                                                                           (coe v14) in
                                                                 case coe v18 of
                                                                   0 -> coe v23
                                                                   _ -> let v24
                                                                              = subInt
                                                                                  (coe v18)
                                                                                  (coe
                                                                                     (1 ::
                                                                                        Integer)) in
                                                                        coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v0))
                                                                          (coe
                                                                             MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0)))
                                                                             (coe v21) (coe v24))
                                                                          v23
                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError)
                      (coe v3)))
                (coe
                   MAlonzo.Code.Algebra.Operations.Ring.du32
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v0)))
                   (let v7 = coe du580 (coe v2) (coe v4) in
                    case coe v1 of
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v8 v9 v10
                        -> case coe v9 of
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v11
                               -> coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                       (coe v0))
                                    v11
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v12 v13
                               -> let v14
                                        = coe
                                            MAlonzo.Code.Data.Vec.Base.du644
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                               (coe v10) (coe v7)) in
                                  case coe v12 of
                                    MAlonzo.Code.Data.List.Kleene.Base.C42 v15 v16
                                      -> case coe v15 of
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v17 v18
                                             -> case coe v17 of
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v19
                                                    -> case coe v14 of
                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32 v21 v22
                                                           -> let v23
                                                                    = coe
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                        (coe v0)
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                           (coe v19) (coe v16))
                                                                        (coe v14) in
                                                              case coe v18 of
                                                                0 -> coe v23
                                                                _ -> let v24
                                                                           = subInt
                                                                               (coe v18)
                                                                               (coe
                                                                                  (1 :: Integer)) in
                                                                     coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v0))
                                                                       (coe
                                                                          MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v0)))
                                                                          (coe v21) (coe v24))
                                                                       v23
                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                           _ -> MAlonzo.RTE.mazUnreachableError
                                    _ -> MAlonzo.RTE.mazUnreachableError
                             _ -> MAlonzo.RTE.mazUnreachableError
                      _ -> MAlonzo.RTE.mazUnreachableError)
                   (coe v3))
                (coe
                   MAlonzo.Code.Algebra.Operations.Ring.du32
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v0)))
                   (let v7 = coe du580 (coe v2) (coe v4) in
                    case coe v1 of
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v8 v9 v10
                        -> case coe v9 of
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v11
                               -> coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                       (coe v0))
                                    v11
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v12 v13
                               -> let v14
                                        = coe
                                            MAlonzo.Code.Data.Vec.Base.du644
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                               (coe v10) (coe v7)) in
                                  case coe v12 of
                                    MAlonzo.Code.Data.List.Kleene.Base.C42 v15 v16
                                      -> case coe v15 of
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v17 v18
                                             -> case coe v17 of
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v19
                                                    -> case coe v14 of
                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32 v21 v22
                                                           -> let v23
                                                                    = coe
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                        (coe v0)
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                           (coe v19) (coe v16))
                                                                        (coe v14) in
                                                              case coe v18 of
                                                                0 -> coe v23
                                                                _ -> let v24
                                                                           = subInt
                                                                               (coe v18)
                                                                               (coe
                                                                                  (1 :: Integer)) in
                                                                     coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v0))
                                                                       (coe
                                                                          MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v0)))
                                                                          (coe v21) (coe v24))
                                                                       v23
                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                           _ -> MAlonzo.RTE.mazUnreachableError
                                    _ -> MAlonzo.RTE.mazUnreachableError
                             _ -> MAlonzo.RTE.mazUnreachableError
                      _ -> MAlonzo.RTE.mazUnreachableError)
                   (coe v3))
                (let v7
                       = let v7
                               = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                      (coe v0)) in
                         let v8
                               = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                   (coe v7) in
                         let v9 = MAlonzo.Code.Algebra.Structures.d1290 (coe v8) in
                         let v10 = MAlonzo.Code.Algebra.Structures.d1186 (coe v9) in
                         let v11 = MAlonzo.Code.Algebra.Structures.d1094 (coe v10) in
                         let v12 = MAlonzo.Code.Algebra.Structures.d372 (coe v11) in
                         let v13 = MAlonzo.Code.Algebra.Structures.d324 (coe v12) in
                         coe
                           MAlonzo.Code.Algebra.Structures.du104
                           (coe MAlonzo.Code.Algebra.Structures.d124 (coe v13)) in
                 let v8
                       = MAlonzo.Code.Relation.Binary.Structures.d34
                           (coe MAlonzo.Code.Relation.Binary.Bundles.d60 (coe v7)) in
                 let v9
                       = coe
                           MAlonzo.Code.Algebra.Operations.Ring.du32
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                 (coe v0)))
                           (let v9 = coe du580 (coe v2) (coe v4) in
                            case coe v1 of
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                                -> case coe v11 of
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                                       -> coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                               (coe v0))
                                            v13
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                                       -> let v16
                                                = coe
                                                    MAlonzo.Code.Data.Vec.Base.du644
                                                    (coe
                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                       (coe v12) (coe v9)) in
                                          case coe v14 of
                                            MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                              -> case coe v17 of
                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                                     -> case coe v19 of
                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                            -> case coe v16 of
                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                                   -> let v25
                                                                            = coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                (coe v0)
                                                                                (coe
                                                                                   MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                   (coe v21)
                                                                                   (coe v18))
                                                                                (coe v16) in
                                                                      case coe v20 of
                                                                        0 -> coe v25
                                                                        _ -> let v26
                                                                                   = subInt
                                                                                       (coe v20)
                                                                                       (coe
                                                                                          (1 ::
                                                                                             Integer)) in
                                                                             coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                  (coe v0))
                                                                               (coe
                                                                                  MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                  (coe
                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                     (coe
                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                        (coe v0)))
                                                                                  (coe v23)
                                                                                  (coe v26))
                                                                               v25
                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                            _ -> MAlonzo.RTE.mazUnreachableError
                                     _ -> MAlonzo.RTE.mazUnreachableError
                              _ -> MAlonzo.RTE.mazUnreachableError)
                           (coe v3) in
                 coe
                   MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.C32
                   (coe v8 v9))
                (let v7
                       = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                           (coe v0) in
                 let v8
                       = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                           (coe v7) in
                 let v9
                       = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                           (coe v8) in
                 let v10 = MAlonzo.Code.Algebra.Structures.d1290 (coe v9) in
                 let v11 = MAlonzo.Code.Algebra.Structures.d1186 (coe v10) in
                 let v12 = MAlonzo.Code.Algebra.Structures.d1096 (coe v11) in
                 coe
                   MAlonzo.Code.Agda.Builtin.Sigma.d28
                   (MAlonzo.Code.Algebra.Structures.d326 (coe v12))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (let v13 = coe du580 (coe v2) (coe v4) in
                       case coe v1 of
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v14 v15 v16
                           -> case coe v15 of
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v17
                                  -> coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                          (coe v0))
                                       v17
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v18 v19
                                  -> let v20
                                           = coe
                                               MAlonzo.Code.Data.Vec.Base.du644
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                  (coe v16) (coe v13)) in
                                     case coe v18 of
                                       MAlonzo.Code.Data.List.Kleene.Base.C42 v21 v22
                                         -> case coe v21 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v23 v24
                                                -> case coe v23 of
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v25
                                                       -> case coe v20 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32 v27 v28
                                                              -> let v29
                                                                       = coe
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                           (coe v0)
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                              (coe v25) (coe v22))
                                                                           (coe v20) in
                                                                 case coe v24 of
                                                                   0 -> coe v29
                                                                   _ -> let v30
                                                                              = subInt
                                                                                  (coe v24)
                                                                                  (coe
                                                                                     (1 ::
                                                                                        Integer)) in
                                                                        coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v0))
                                                                          (coe
                                                                             MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0)))
                                                                             (coe v27) (coe v30))
                                                                          v29
                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError)
                      (coe v3))))
      _ -> let v6 = subInt (coe v5) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.d38
             (let v7
                    = let v7
                            = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                   (coe v0)) in
                      let v8
                            = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                (coe v7) in
                      let v9 = MAlonzo.Code.Algebra.Structures.d1290 (coe v8) in
                      let v10 = MAlonzo.Code.Algebra.Structures.d1186 (coe v9) in
                      let v11 = MAlonzo.Code.Algebra.Structures.d1094 (coe v10) in
                      let v12 = MAlonzo.Code.Algebra.Structures.d372 (coe v11) in
                      let v13 = MAlonzo.Code.Algebra.Structures.d324 (coe v12) in
                      coe
                        MAlonzo.Code.Algebra.Structures.du104
                        (coe MAlonzo.Code.Algebra.Structures.d124 (coe v13)) in
              coe
                MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v7))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                      (coe v0))
                   (let v8
                          = coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                 (coe v0)) in
                    let v9 = coe du578 (coe v2) (coe v4) in
                    let v10 = addInt (coe mulInt (coe v3) (coe v5)) (coe v5) in
                    case coe v10 of
                      0 -> coe MAlonzo.Code.Algebra.Bundles.d2030 (coe v8)
                      _ -> let v11 = subInt (coe v10) (coe (1 :: Integer)) in
                           coe
                             MAlonzo.Code.Algebra.Operations.Ring.du32 (coe v8) (coe v9)
                             (coe v11))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (let v8 = coe du580 (coe v2) (coe v4) in
                       case coe v1 of
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
                           -> case coe v10 of
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
                                  -> coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                          (coe v0))
                                       v12
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
                                  -> let v15
                                           = coe
                                               MAlonzo.Code.Data.Vec.Base.du644
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                  (coe v11) (coe v8)) in
                                     case coe v13 of
                                       MAlonzo.Code.Data.List.Kleene.Base.C42 v16 v17
                                         -> case coe v16 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v18 v19
                                                -> case coe v18 of
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v20
                                                       -> case coe v15 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32 v22 v23
                                                              -> let v24
                                                                       = coe
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                           (coe v0)
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                              (coe v20) (coe v17))
                                                                           (coe v15) in
                                                                 case coe v19 of
                                                                   0 -> coe v24
                                                                   _ -> let v25
                                                                              = subInt
                                                                                  (coe v19)
                                                                                  (coe
                                                                                     (1 ::
                                                                                        Integer)) in
                                                                        coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v0))
                                                                          (coe
                                                                             MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0)))
                                                                             (coe v22) (coe v25))
                                                                          v24
                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError)
                      (coe v3)))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                      (coe v0))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (coe du578 (coe v2) (coe v4)) (coe v6))
                      (coe v3))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (let v8 = coe du580 (coe v2) (coe v4) in
                       case coe v1 of
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
                           -> case coe v10 of
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
                                  -> coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                          (coe v0))
                                       v12
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
                                  -> let v15
                                           = coe
                                               MAlonzo.Code.Data.Vec.Base.du644
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                  (coe v11) (coe v8)) in
                                     case coe v13 of
                                       MAlonzo.Code.Data.List.Kleene.Base.C42 v16 v17
                                         -> case coe v16 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v18 v19
                                                -> case coe v18 of
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v20
                                                       -> case coe v15 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32 v22 v23
                                                              -> let v24
                                                                       = coe
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                           (coe v0)
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                              (coe v20) (coe v17))
                                                                           (coe v15) in
                                                                 case coe v19 of
                                                                   0 -> coe v24
                                                                   _ -> let v25
                                                                              = subInt
                                                                                  (coe v19)
                                                                                  (coe
                                                                                     (1 ::
                                                                                        Integer)) in
                                                                        coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v0))
                                                                          (coe
                                                                             MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0)))
                                                                             (coe v22) (coe v25))
                                                                          v24
                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError)
                      (coe v3)))
                (coe
                   MAlonzo.Code.Algebra.Operations.Ring.du32
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v0)))
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v0))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (coe du578 (coe v2) (coe v4)) (coe v6))
                      (let v8 = coe du580 (coe v2) (coe v4) in
                       case coe v1 of
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
                           -> case coe v10 of
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
                                  -> coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                          (coe v0))
                                       v12
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
                                  -> let v15
                                           = coe
                                               MAlonzo.Code.Data.Vec.Base.du644
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                  (coe v11) (coe v8)) in
                                     case coe v13 of
                                       MAlonzo.Code.Data.List.Kleene.Base.C42 v16 v17
                                         -> case coe v16 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v18 v19
                                                -> case coe v18 of
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v20
                                                       -> case coe v15 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32 v22 v23
                                                              -> let v24
                                                                       = coe
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                           (coe v0)
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                              (coe v20) (coe v17))
                                                                           (coe v15) in
                                                                 case coe v19 of
                                                                   0 -> coe v24
                                                                   _ -> let v25
                                                                              = subInt
                                                                                  (coe v19)
                                                                                  (coe
                                                                                     (1 ::
                                                                                        Integer)) in
                                                                        coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v0))
                                                                          (coe
                                                                             MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0)))
                                                                             (coe v22) (coe v25))
                                                                          v24
                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError))
                   (coe v3))
                (let v8
                       = let v8
                               = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                      (coe v0)) in
                         let v9
                               = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                   (coe v8) in
                         let v10 = MAlonzo.Code.Algebra.Structures.d1290 (coe v9) in
                         let v11 = MAlonzo.Code.Algebra.Structures.d1186 (coe v10) in
                         let v12 = MAlonzo.Code.Algebra.Structures.d1094 (coe v11) in
                         let v13 = MAlonzo.Code.Algebra.Structures.d372 (coe v12) in
                         let v14 = MAlonzo.Code.Algebra.Structures.d324 (coe v13) in
                         coe
                           MAlonzo.Code.Algebra.Structures.du104
                           (coe MAlonzo.Code.Algebra.Structures.d124 (coe v14)) in
                 coe
                   MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                   (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v8))
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                         (coe v0))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (coe
                            MAlonzo.Code.Algebra.Operations.Ring.du32
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                  (coe v0)))
                            (coe du578 (coe v2) (coe v4)) (coe v6))
                         (coe v3))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (let v9 = coe du580 (coe v2) (coe v4) in
                          case coe v1 of
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                              -> case coe v11 of
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                                     -> coe
                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                             (coe v0))
                                          v13
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                                     -> let v16
                                              = coe
                                                  MAlonzo.Code.Data.Vec.Base.du644
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                     (coe v12) (coe v9)) in
                                        case coe v14 of
                                          MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                            -> case coe v17 of
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                                   -> case coe v19 of
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                          -> case coe v16 of
                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                                 -> let v25
                                                                          = coe
                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                              (coe v0)
                                                                              (coe
                                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                 (coe v21)
                                                                                 (coe v18))
                                                                              (coe v16) in
                                                                    case coe v20 of
                                                                      0 -> coe v25
                                                                      _ -> let v26
                                                                                 = subInt
                                                                                     (coe v20)
                                                                                     (coe
                                                                                        (1 ::
                                                                                           Integer)) in
                                                                           coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v0))
                                                                             (coe
                                                                                MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                      (coe v0)))
                                                                                (coe v23) (coe v26))
                                                                             v25
                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                          _ -> MAlonzo.RTE.mazUnreachableError
                                   _ -> MAlonzo.RTE.mazUnreachableError
                            _ -> MAlonzo.RTE.mazUnreachableError)
                         (coe v3)))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0))
                         (coe
                            MAlonzo.Code.Algebra.Operations.Ring.du32
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                  (coe v0)))
                            (coe du578 (coe v2) (coe v4)) (coe v6))
                         (let v9 = coe du580 (coe v2) (coe v4) in
                          case coe v1 of
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                              -> case coe v11 of
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                                     -> coe
                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                             (coe v0))
                                          v13
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                                     -> let v16
                                              = coe
                                                  MAlonzo.Code.Data.Vec.Base.du644
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                     (coe v12) (coe v9)) in
                                        case coe v14 of
                                          MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                            -> case coe v17 of
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                                   -> case coe v19 of
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                          -> case coe v16 of
                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                                 -> let v25
                                                                          = coe
                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                              (coe v0)
                                                                              (coe
                                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                 (coe v21)
                                                                                 (coe v18))
                                                                              (coe v16) in
                                                                    case coe v20 of
                                                                      0 -> coe v25
                                                                      _ -> let v26
                                                                                 = subInt
                                                                                     (coe v20)
                                                                                     (coe
                                                                                        (1 ::
                                                                                           Integer)) in
                                                                           coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v0))
                                                                             (coe
                                                                                MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                      (coe v0)))
                                                                                (coe v23) (coe v26))
                                                                             v25
                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                          _ -> MAlonzo.RTE.mazUnreachableError
                                   _ -> MAlonzo.RTE.mazUnreachableError
                            _ -> MAlonzo.RTE.mazUnreachableError))
                      (coe v3))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0))
                         (coe
                            MAlonzo.Code.Algebra.Operations.Ring.du32
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                  (coe v0)))
                            (coe du578 (coe v2) (coe v4)) (coe v6))
                         (let v9 = coe du580 (coe v2) (coe v4) in
                          case coe v1 of
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                              -> case coe v11 of
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                                     -> coe
                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                             (coe v0))
                                          v13
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                                     -> let v16
                                              = coe
                                                  MAlonzo.Code.Data.Vec.Base.du644
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                     (coe v12) (coe v9)) in
                                        case coe v14 of
                                          MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                            -> case coe v17 of
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                                   -> case coe v19 of
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                          -> case coe v16 of
                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                                 -> let v25
                                                                          = coe
                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                              (coe v0)
                                                                              (coe
                                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                 (coe v21)
                                                                                 (coe v18))
                                                                              (coe v16) in
                                                                    case coe v20 of
                                                                      0 -> coe v25
                                                                      _ -> let v26
                                                                                 = subInt
                                                                                     (coe v20)
                                                                                     (coe
                                                                                        (1 ::
                                                                                           Integer)) in
                                                                           coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v0))
                                                                             (coe
                                                                                MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                      (coe v0)))
                                                                                (coe v23) (coe v26))
                                                                             v25
                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                          _ -> MAlonzo.RTE.mazUnreachableError
                                   _ -> MAlonzo.RTE.mazUnreachableError
                            _ -> MAlonzo.RTE.mazUnreachableError))
                      (coe v3))
                   (let v9
                          = let v9
                                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                         (coe v0)) in
                            let v10
                                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                      (coe v9) in
                            let v11 = MAlonzo.Code.Algebra.Structures.d1290 (coe v10) in
                            let v12 = MAlonzo.Code.Algebra.Structures.d1186 (coe v11) in
                            let v13 = MAlonzo.Code.Algebra.Structures.d1094 (coe v12) in
                            let v14 = MAlonzo.Code.Algebra.Structures.d372 (coe v13) in
                            let v15 = MAlonzo.Code.Algebra.Structures.d324 (coe v14) in
                            coe
                              MAlonzo.Code.Algebra.Structures.du104
                              (coe MAlonzo.Code.Algebra.Structures.d124 (coe v15)) in
                    let v10
                          = MAlonzo.Code.Relation.Binary.Structures.d34
                              (coe MAlonzo.Code.Relation.Binary.Bundles.d60 (coe v9)) in
                    let v11
                          = coe
                              MAlonzo.Code.Algebra.Operations.Ring.du32
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                    (coe v0)))
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                    (coe v0))
                                 (coe
                                    MAlonzo.Code.Algebra.Operations.Ring.du32
                                    (coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                       (coe
                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                          (coe v0)))
                                    (coe du578 (coe v2) (coe v4)) (coe v6))
                                 (let v11 = coe du580 (coe v2) (coe v4) in
                                  case coe v1 of
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v12 v13 v14
                                      -> case coe v13 of
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v15
                                             -> coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                  (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                     (coe v0))
                                                  v15
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v16 v17
                                             -> let v18
                                                      = coe
                                                          MAlonzo.Code.Data.Vec.Base.du644
                                                          (coe
                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                             (coe v14) (coe v11)) in
                                                case coe v16 of
                                                  MAlonzo.Code.Data.List.Kleene.Base.C42 v19 v20
                                                    -> case coe v19 of
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v21 v22
                                                           -> case coe v21 of
                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v23
                                                                  -> case coe v18 of
                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32 v25 v26
                                                                         -> let v27
                                                                                  = coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                      (coe v0)
                                                                                      (coe
                                                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                         (coe v23)
                                                                                         (coe v20))
                                                                                      (coe v18) in
                                                                            case coe v22 of
                                                                              0 -> coe v27
                                                                              _ -> let v28
                                                                                         = subInt
                                                                                             (coe
                                                                                                v22)
                                                                                             (coe
                                                                                                (1 ::
                                                                                                   Integer)) in
                                                                                   coe
                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                        (coe v0))
                                                                                     (coe
                                                                                        MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                        (coe
                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                           (coe
                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                              (coe
                                                                                                 v0)))
                                                                                        (coe v25)
                                                                                        (coe v28))
                                                                                     v27
                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                           _ -> MAlonzo.RTE.mazUnreachableError
                                    _ -> MAlonzo.RTE.mazUnreachableError))
                              (coe v3) in
                    coe
                      MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.C32
                      (coe v10 v11))
                   (coe
                      MAlonzo.Code.Relation.Binary.Structures.d36
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
                                                 (coe
                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                    (coe v0)))))))))))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0))
                            (coe
                               MAlonzo.Code.Algebra.Operations.Ring.du32
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                  (coe
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                     (coe v0)))
                               (coe du578 (coe v2) (coe v4)) (coe v6))
                            (let v9 = coe du580 (coe v2) (coe v4) in
                             case coe v1 of
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                                 -> case coe v11 of
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                                        -> coe
                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                (coe v0))
                                             v13
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                                        -> let v16
                                                 = coe
                                                     MAlonzo.Code.Data.Vec.Base.du644
                                                     (coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                        (coe v12) (coe v9)) in
                                           case coe v14 of
                                             MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                               -> case coe v17 of
                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                                      -> case coe v19 of
                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                             -> case coe v16 of
                                                                  MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                                    -> let v25
                                                                             = coe
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                 (coe v0)
                                                                                 (coe
                                                                                    MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                    (coe v21)
                                                                                    (coe v18))
                                                                                 (coe v16) in
                                                                       case coe v20 of
                                                                         0 -> coe v25
                                                                         _ -> let v26
                                                                                    = subInt
                                                                                        (coe v20)
                                                                                        (coe
                                                                                           (1 ::
                                                                                              Integer)) in
                                                                              coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0))
                                                                                (coe
                                                                                   MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                      (coe
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                         (coe v0)))
                                                                                   (coe v23)
                                                                                   (coe v26))
                                                                                v25
                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                             _ -> MAlonzo.RTE.mazUnreachableError
                                      _ -> MAlonzo.RTE.mazUnreachableError
                               _ -> MAlonzo.RTE.mazUnreachableError))
                         (coe v3))
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0))
                         (coe
                            MAlonzo.Code.Algebra.Operations.Ring.du32
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                  (coe v0)))
                            (coe
                               MAlonzo.Code.Algebra.Operations.Ring.du32
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                  (coe
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                     (coe v0)))
                               (coe du578 (coe v2) (coe v4)) (coe v6))
                            (coe v3))
                         (coe
                            MAlonzo.Code.Algebra.Operations.Ring.du32
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                  (coe v0)))
                            (let v9 = coe du580 (coe v2) (coe v4) in
                             case coe v1 of
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                                 -> case coe v11 of
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                                        -> coe
                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                (coe v0))
                                             v13
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                                        -> let v16
                                                 = coe
                                                     MAlonzo.Code.Data.Vec.Base.du644
                                                     (coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                        (coe v12) (coe v9)) in
                                           case coe v14 of
                                             MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                               -> case coe v17 of
                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                                      -> case coe v19 of
                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                             -> case coe v16 of
                                                                  MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                                    -> let v25
                                                                             = coe
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                 (coe v0)
                                                                                 (coe
                                                                                    MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                    (coe v21)
                                                                                    (coe v18))
                                                                                 (coe v16) in
                                                                       case coe v20 of
                                                                         0 -> coe v25
                                                                         _ -> let v26
                                                                                    = subInt
                                                                                        (coe v20)
                                                                                        (coe
                                                                                           (1 ::
                                                                                              Integer)) in
                                                                              coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0))
                                                                                (coe
                                                                                   MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                      (coe
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                         (coe v0)))
                                                                                   (coe v23)
                                                                                   (coe v26))
                                                                                v25
                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                             _ -> MAlonzo.RTE.mazUnreachableError
                                      _ -> MAlonzo.RTE.mazUnreachableError
                               _ -> MAlonzo.RTE.mazUnreachableError)
                            (coe v3)))
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du562
                         (coe v0)
                         (coe
                            MAlonzo.Code.Algebra.Operations.Ring.du32
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                  (coe v0)))
                            (coe du578 (coe v2) (coe v4)) (coe v6))
                         (let v9 = coe du580 (coe v2) (coe v4) in
                          case coe v1 of
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                              -> case coe v11 of
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                                     -> coe
                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                             (coe v0))
                                          v13
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                                     -> let v16
                                              = coe
                                                  MAlonzo.Code.Data.Vec.Base.du644
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                     (coe v12) (coe v9)) in
                                        case coe v14 of
                                          MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                                            -> case coe v17 of
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v19 v20
                                                   -> case coe v19 of
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v21
                                                          -> case coe v16 of
                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                                 -> let v25
                                                                          = coe
                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                              (coe v0)
                                                                              (coe
                                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                 (coe v21)
                                                                                 (coe v18))
                                                                              (coe v16) in
                                                                    case coe v20 of
                                                                      0 -> coe v25
                                                                      _ -> let v26
                                                                                 = subInt
                                                                                     (coe v20)
                                                                                     (coe
                                                                                        (1 ::
                                                                                           Integer)) in
                                                                           coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v0))
                                                                             (coe
                                                                                MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                      (coe v0)))
                                                                                (coe v23) (coe v26))
                                                                             v25
                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                          _ -> MAlonzo.RTE.mazUnreachableError
                                   _ -> MAlonzo.RTE.mazUnreachableError
                            _ -> MAlonzo.RTE.mazUnreachableError)
                         (coe v3))))
                (coe
                   MAlonzo.Code.Algebra.Structures.d90
                   (MAlonzo.Code.Algebra.Structures.d124
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
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                           (coe v0)))))))))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (coe du578 (coe v2) (coe v4))
                      (coe addInt (coe v6) (coe mulInt (coe v3) (coe v5))))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (coe du578 (coe v2) (coe v4)) (coe v6))
                      (coe v3))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (let v8 = coe du580 (coe v2) (coe v4) in
                       case coe v1 of
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
                           -> case coe v10 of
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
                                  -> coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                          (coe v0))
                                       v12
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
                                  -> let v15
                                           = coe
                                               MAlonzo.Code.Data.Vec.Base.du644
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                  (coe v11) (coe v8)) in
                                     case coe v13 of
                                       MAlonzo.Code.Data.List.Kleene.Base.C42 v16 v17
                                         -> case coe v16 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v18 v19
                                                -> case coe v18 of
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v20
                                                       -> case coe v15 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32 v22 v23
                                                              -> let v24
                                                                       = coe
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                           (coe v0)
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                              (coe v20) (coe v17))
                                                                           (coe v15) in
                                                                 case coe v19 of
                                                                   0 -> coe v24
                                                                   _ -> let v25
                                                                              = subInt
                                                                                  (coe v19)
                                                                                  (coe
                                                                                     (1 ::
                                                                                        Integer)) in
                                                                        coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v0))
                                                                          (coe
                                                                             MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0)))
                                                                             (coe v22) (coe v25))
                                                                          v24
                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError)
                      (coe v3))
                   (coe
                      MAlonzo.Code.Algebra.Operations.Ring.du32
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)))
                      (let v8 = coe du580 (coe v2) (coe v4) in
                       case coe v1 of
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
                           -> case coe v10 of
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
                                  -> coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                          (coe v0))
                                       v12
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
                                  -> let v15
                                           = coe
                                               MAlonzo.Code.Data.Vec.Base.du644
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                  (coe v11) (coe v8)) in
                                     case coe v13 of
                                       MAlonzo.Code.Data.List.Kleene.Base.C42 v16 v17
                                         -> case coe v16 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v18 v19
                                                -> case coe v18 of
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v20
                                                       -> case coe v15 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32 v22 v23
                                                              -> let v24
                                                                       = coe
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                           (coe v0)
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                              (coe v20) (coe v17))
                                                                           (coe v15) in
                                                                 case coe v19 of
                                                                   0 -> coe v24
                                                                   _ -> let v25
                                                                              = subInt
                                                                                  (coe v19)
                                                                                  (coe
                                                                                     (1 ::
                                                                                        Integer)) in
                                                                        coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v0))
                                                                          (coe
                                                                             MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                             (coe
                                                                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                   (coe v0)))
                                                                             (coe v22) (coe v25))
                                                                          v24
                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError)
                      (coe v3))
                   (coe
                      MAlonzo.Code.Relation.Binary.Structures.d36
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
                                                 (coe
                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                    (coe v0)))))))))))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (coe
                            MAlonzo.Code.Algebra.Operations.Ring.du32
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                  (coe v0)))
                            (coe du578 (coe v2) (coe v4)) (coe v6))
                         (coe v3))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (coe du578 (coe v2) (coe v4))
                         (coe addInt (coe v6) (coe mulInt (coe v3) (coe v5))))
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du598
                         (coe v0) (coe du578 (coe v2) (coe v4)) (coe v6) (coe v3)))
                   (coe
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
                                                 (coe
                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                    (coe v0)))))))))))
                      (coe
                         MAlonzo.Code.Algebra.Operations.Ring.du32
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)))
                         (let v8 = coe du580 (coe v2) (coe v4) in
                          case coe v1 of
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
                              -> case coe v10 of
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
                                     -> coe
                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                             (coe v0))
                                          v12
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
                                     -> let v15
                                              = coe
                                                  MAlonzo.Code.Data.Vec.Base.du644
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                     (coe v11) (coe v8)) in
                                        case coe v13 of
                                          MAlonzo.Code.Data.List.Kleene.Base.C42 v16 v17
                                            -> case coe v16 of
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v18 v19
                                                   -> case coe v18 of
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v20
                                                          -> case coe v15 of
                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32 v22 v23
                                                                 -> let v24
                                                                          = coe
                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                              (coe v0)
                                                                              (coe
                                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                 (coe v20)
                                                                                 (coe v17))
                                                                              (coe v15) in
                                                                    case coe v19 of
                                                                      0 -> coe v24
                                                                      _ -> let v25
                                                                                 = subInt
                                                                                     (coe v19)
                                                                                     (coe
                                                                                        (1 ::
                                                                                           Integer)) in
                                                                           coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                (coe v0))
                                                                             (coe
                                                                                MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                (coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                   (coe
                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                      (coe v0)))
                                                                                (coe v22) (coe v25))
                                                                             v24
                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                        _ -> MAlonzo.RTE.mazUnreachableError
                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                          _ -> MAlonzo.RTE.mazUnreachableError
                                   _ -> MAlonzo.RTE.mazUnreachableError
                            _ -> MAlonzo.RTE.mazUnreachableError)
                         (coe v3)))))
name600
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.⊡-hom"
d600 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  Integer -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d600 v0 v1 v2 v3 v4 v5 v6 v7 v8
  = case coe v7 of
      0 -> coe
             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d720
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                (coe v4))
      _ -> let v9 = subInt (coe v7) (coe (1 :: Integer)) in
           coe
             d544 (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) (coe v5) (coe v6)
             (coe v9) (coe v8)
