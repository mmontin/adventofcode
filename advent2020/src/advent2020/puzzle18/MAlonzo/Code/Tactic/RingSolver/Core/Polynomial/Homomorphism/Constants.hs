{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Constants where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Operations.Ring
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Data.List.Kleene.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics

name284
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Constants._.κ"
d284 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  AgdaAny -> MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
d284 v0 v1 v2 = du284 v1 v2
du284 ::
  Integer ->
  AgdaAny -> MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
du284 v0 v1
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
      (coe (0 :: Integer))
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 (coe v1))
      (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v0))
name368
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Constants._.⟦_⟧"
d368 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d368 v0 v1 v2 v3 v4 v5 v6 v7 = du368 v4 v6 v7
du368 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du368 v0 v1 v2
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
name376
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Constants.κ-hom"
d376 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer -> AgdaAny -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d376 v0 v1 v2 v3 v4 v5 v6 v7 = du376 v4 v6
du376 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> AgdaAny
du376 v0 v1
  = let v2
          = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
              (coe v0) in
    let v3
          = coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                 (coe v0))
              v1 in
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
                                 (coe v2))))))))))
      v3
