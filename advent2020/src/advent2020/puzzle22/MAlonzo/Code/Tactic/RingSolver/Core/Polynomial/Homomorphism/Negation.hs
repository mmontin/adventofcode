{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation where

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
import qualified MAlonzo.Code.Data.List.Kleene.Base
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Product
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Induction.WellFounded
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial
import qualified MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics

name338
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation._.Poly"
d338 a0 a1 a2 a3 a4 a5 = ()
name396
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation._.⊟_"
d396 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
d396 v0 v1 v2 v3 v4 = du396 v4
du396 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
du396 v0
  = let v1
          = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
              (coe v0) in
    coe
      (\ v2 ->
         coe
           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530 (coe v1)
           (coe v2))
name398
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation._.⊟-step"
d398 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
d398 v0 v1 v2 v3 v4 = du398 v4
du398 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
du398 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
         (coe v0))
      v1 v3
name466
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation._.⟦_⟧"
d466 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d466 v0 v1 v2 v3 v4 v5 v6 v7 = du466 v4 v6 v7
du466 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du466 v0 v1 v2
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
name476
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation.⊟-step-hom"
d476 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d476 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du476 v4 v7 v8
du476 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du476 v0 v1 v2
  = case coe v1 of
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v3 v4 v5
        -> case coe v4 of
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v6
               -> coe
                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d716
                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                       (coe v0))
                    v6
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v7 v8
               -> let v9 = subInt (coe v3) (coe (1 :: Integer)) in
                  coe
                    MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.d38
                    (let v10
                           = let v10
                                   = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                       (coe
                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                          (coe v0)) in
                             let v11
                                   = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                       (coe v10) in
                             let v12 = MAlonzo.Code.Algebra.Structures.d1290 (coe v11) in
                             let v13 = MAlonzo.Code.Algebra.Structures.d1186 (coe v12) in
                             let v14 = MAlonzo.Code.Algebra.Structures.d1094 (coe v13) in
                             let v15 = MAlonzo.Code.Algebra.Structures.d372 (coe v14) in
                             let v16 = MAlonzo.Code.Algebra.Structures.d324 (coe v15) in
                             coe
                               MAlonzo.Code.Algebra.Structures.du104
                               (coe MAlonzo.Code.Algebra.Structures.d124 (coe v16)) in
                     coe
                       MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                       (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v10))
                       (let v11
                              = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                  (coe v0) in
                        let v12
                              = coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du330
                                  (coe
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                     (coe v0))
                                  (coe
                                     MAlonzo.Code.Data.Product.du158
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                           (coe v0))
                                        (coe v9)))
                                  (coe v7) in
                        case coe v12 of
                          MAlonzo.Code.Data.List.Kleene.Base.C46
                            -> let v13
                                     = MAlonzo.Code.Algebra.Bundles.d2028
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                            (coe v11)) in
                               coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v0))
                                 v13
                          MAlonzo.Code.Data.List.Kleene.Base.C48 v13
                            -> case coe v13 of
                                 MAlonzo.Code.Data.List.Kleene.Base.C42 v14 v15
                                   -> case coe v14 of
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v16 v17
                                          -> case coe v16 of
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v18
                                                 -> case coe v17 of
                                                      0 -> case coe v15 of
                                                             MAlonzo.Code.Data.List.Kleene.Base.C46
                                                               -> case coe v18 of
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v20 v21 v22
                                                                      -> let v23
                                                                               = coe
                                                                                   MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                   (coe
                                                                                      MAlonzo.Code.Data.Nat.Base.C152
                                                                                      v22)
                                                                                   (coe v5) in
                                                                         case coe v21 of
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v24
                                                                             -> coe
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                                  (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                                     (coe v0))
                                                                                  v24
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v25 v26
                                                                             -> let v27
                                                                                      = coe
                                                                                          MAlonzo.Code.Data.Vec.Base.du644
                                                                                          (coe
                                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                                             (coe
                                                                                                v23)
                                                                                             (coe
                                                                                                v2)) in
                                                                                case coe v25 of
                                                                                  MAlonzo.Code.Data.List.Kleene.Base.C42 v28 v29
                                                                                    -> case coe
                                                                                              v28 of
                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v30 v31
                                                                                           -> case coe
                                                                                                     v30 of
                                                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v32
                                                                                                  -> case coe
                                                                                                            v27 of
                                                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32 v34 v35
                                                                                                         -> let v36
                                                                                                                  = coe
                                                                                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                                      (coe
                                                                                                                         v0)
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                                         (coe
                                                                                                                            v32)
                                                                                                                         (coe
                                                                                                                            v29))
                                                                                                                      (coe
                                                                                                                         v27) in
                                                                                                            case coe
                                                                                                                   v31 of
                                                                                                              0 -> coe
                                                                                                                     v36
                                                                                                              _ -> let v37
                                                                                                                         = subInt
                                                                                                                             (coe
                                                                                                                                v31)
                                                                                                                             (coe
                                                                                                                                (1 ::
                                                                                                                                   Integer)) in
                                                                                                                   coe
                                                                                                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                                                                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                        (coe
                                                                                                                           v0))
                                                                                                                     (coe
                                                                                                                        MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                                                                        (coe
                                                                                                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                                                                           (coe
                                                                                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                                                              (coe
                                                                                                                                 v0)))
                                                                                                                        (coe
                                                                                                                           v34)
                                                                                                                        (coe
                                                                                                                           v37))
                                                                                                                     v36
                                                                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                _ -> MAlonzo.RTE.mazUnreachableError
                                                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                                             MAlonzo.Code.Data.List.Kleene.Base.C48 v20
                                                               -> let v21
                                                                        = coe
                                                                            MAlonzo.Code.Data.Vec.Base.du644
                                                                            (coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                               (coe v5) (coe v2)) in
                                                                  let v22 = 0 :: Integer in
                                                                  case coe v21 of
                                                                    MAlonzo.Code.Agda.Builtin.Sigma.C32 v23 v24
                                                                      -> let v25
                                                                               = coe
                                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                   (coe v0)
                                                                                   (coe
                                                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                      (coe v18)
                                                                                      (coe v15))
                                                                                   (coe v21) in
                                                                         case coe v22 of
                                                                           0 -> coe v25
                                                                           _ -> let v26
                                                                                      = -1 ::
                                                                                          Integer in
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
                                                                                     (coe v23)
                                                                                     (coe v26))
                                                                                  v25
                                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                                             _ -> MAlonzo.RTE.mazUnreachableError
                                                      _ -> let v20
                                                                 = coe
                                                                     MAlonzo.Code.Data.Vec.Base.du644
                                                                     (coe
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                        (coe v5) (coe v2)) in
                                                           case coe v20 of
                                                             MAlonzo.Code.Agda.Builtin.Sigma.C32 v21 v22
                                                               -> let v23
                                                                        = coe
                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                            (coe v0)
                                                                            (coe
                                                                               MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                               (coe v18) (coe v15))
                                                                            (coe v20) in
                                                                  case coe v17 of
                                                                    0 -> coe v23
                                                                    _ -> let v24
                                                                               = subInt
                                                                                   (coe v17)
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
                          _ -> MAlonzo.RTE.mazUnreachableError)
                       (coe
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du686
                          v0
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du330
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                (coe v0))
                             (coe
                                MAlonzo.Code.Data.Product.du158
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                      (coe v0))
                                   (coe v9)))
                             (coe v7))
                          (coe
                             MAlonzo.Code.Data.Vec.Base.du644
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                (coe v5) (coe v2))))
                       (coe
                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                             (coe v0))
                          (let v11
                                 = coe
                                     MAlonzo.Code.Data.Vec.Base.du644
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                        (coe v5) (coe v2)) in
                           case coe v7 of
                             MAlonzo.Code.Data.List.Kleene.Base.C42 v12 v13
                               -> case coe v12 of
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v14 v15
                                      -> case coe v14 of
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v16
                                             -> case coe v11 of
                                                  MAlonzo.Code.Agda.Builtin.Sigma.C32 v18 v19
                                                    -> let v20
                                                             = coe
                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                 (coe v0)
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                    (coe v16) (coe v13))
                                                                 (coe v11) in
                                                       case coe v15 of
                                                         0 -> coe v20
                                                         _ -> let v21
                                                                    = subInt
                                                                        (coe v15)
                                                                        (coe (1 :: Integer)) in
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
                                                                   (coe v18) (coe v21))
                                                                v20
                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                           _ -> MAlonzo.RTE.mazUnreachableError
                                    _ -> MAlonzo.RTE.mazUnreachableError
                             _ -> MAlonzo.RTE.mazUnreachableError))
                       (let v11
                              = let v11
                                      = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                          (coe
                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                             (coe v0)) in
                                let v12
                                      = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                          (coe v11) in
                                let v13 = MAlonzo.Code.Algebra.Structures.d1290 (coe v12) in
                                let v14 = MAlonzo.Code.Algebra.Structures.d1186 (coe v13) in
                                let v15 = MAlonzo.Code.Algebra.Structures.d1094 (coe v14) in
                                let v16 = MAlonzo.Code.Algebra.Structures.d372 (coe v15) in
                                let v17 = MAlonzo.Code.Algebra.Structures.d324 (coe v16) in
                                coe
                                  MAlonzo.Code.Algebra.Structures.du104
                                  (coe MAlonzo.Code.Algebra.Structures.d124 (coe v17)) in
                        coe
                          MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                          (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v11))
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du686
                             v0
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du330
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                   (coe v0))
                                (coe
                                   MAlonzo.Code.Data.Product.du158
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                         (coe v0))
                                      (coe v9)))
                                (coe v7))
                             (coe
                                MAlonzo.Code.Data.Vec.Base.du644
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                   (coe v5) (coe v2))))
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                (coe v0))
                             (let v12
                                    = coe
                                        MAlonzo.Code.Data.Vec.Base.du644
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                           (coe v5) (coe v2)) in
                              case coe v7 of
                                MAlonzo.Code.Data.List.Kleene.Base.C42 v13 v14
                                  -> case coe v13 of
                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v15 v16
                                         -> case coe v15 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v17
                                                -> case coe v12 of
                                                     MAlonzo.Code.Agda.Builtin.Sigma.C32 v19 v20
                                                       -> let v21
                                                                = coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                    (coe v0)
                                                                    (coe
                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                       (coe v17) (coe v14))
                                                                    (coe v12) in
                                                          case coe v16 of
                                                            0 -> coe v21
                                                            _ -> let v22
                                                                       = subInt
                                                                           (coe v16)
                                                                           (coe (1 :: Integer)) in
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
                                                                      (coe v19) (coe v22))
                                                                   v21
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError))
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                (coe v0))
                             (let v12
                                    = coe
                                        MAlonzo.Code.Data.Vec.Base.du644
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                           (coe v5) (coe v2)) in
                              case coe v7 of
                                MAlonzo.Code.Data.List.Kleene.Base.C42 v13 v14
                                  -> case coe v13 of
                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v15 v16
                                         -> case coe v15 of
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v17
                                                -> case coe v12 of
                                                     MAlonzo.Code.Agda.Builtin.Sigma.C32 v19 v20
                                                       -> let v21
                                                                = coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                    (coe v0)
                                                                    (coe
                                                                       MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                       (coe v17) (coe v14))
                                                                    (coe v12) in
                                                          case coe v16 of
                                                            0 -> coe v21
                                                            _ -> let v22
                                                                       = subInt
                                                                           (coe v16)
                                                                           (coe (1 :: Integer)) in
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
                                                                      (coe v19) (coe v22))
                                                                   v21
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError))
                          (let v12
                                 = let v12
                                         = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                             (coe
                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                (coe v0)) in
                                   let v13
                                         = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                             (coe v12) in
                                   let v14 = MAlonzo.Code.Algebra.Structures.d1290 (coe v13) in
                                   let v15 = MAlonzo.Code.Algebra.Structures.d1186 (coe v14) in
                                   let v16 = MAlonzo.Code.Algebra.Structures.d1094 (coe v15) in
                                   let v17 = MAlonzo.Code.Algebra.Structures.d372 (coe v16) in
                                   let v18 = MAlonzo.Code.Algebra.Structures.d324 (coe v17) in
                                   coe
                                     MAlonzo.Code.Algebra.Structures.du104
                                     (coe MAlonzo.Code.Algebra.Structures.d124 (coe v18)) in
                           let v13
                                 = MAlonzo.Code.Relation.Binary.Structures.d34
                                     (coe MAlonzo.Code.Relation.Binary.Bundles.d60 (coe v12)) in
                           let v14
                                 = coe
                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                        (coe v0))
                                     (let v14
                                            = coe
                                                MAlonzo.Code.Data.Vec.Base.du644
                                                (coe
                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                   (coe v5) (coe v2)) in
                                      case coe v7 of
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
                                        _ -> MAlonzo.RTE.mazUnreachableError) in
                           coe
                             MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.C32
                             (coe v13 v14))
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du1264
                             (coe v0)
                             (coe
                                MAlonzo.Code.Agda.Builtin.Sigma.d28
                                (coe
                                   MAlonzo.Code.Data.Vec.Base.du644
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                      (coe v5) (coe v2))))
                             (coe
                                MAlonzo.Code.Agda.Builtin.Sigma.d30
                                (coe
                                   MAlonzo.Code.Data.Vec.Base.du644
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                      (coe v5) (coe v2))))
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                   (coe v0))
                                (coe v9))
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                   (coe v0)))
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d64
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                      (coe v0))))
                             (coe
                                (\ v12 v13 ->
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
                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                           (coe v0))
                                        v12
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v13))
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                           (coe v0))
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v13 v12))
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                           (coe v0))
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v12 v13))
                                     (coe
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
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v12
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                 (coe v0))
                                              v13))
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                 (coe v0))
                                              v13)
                                           v12)
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                 (coe v0))
                                              v13 v12))
                                        (coe
                                           MAlonzo.Code.Algebra.Structures.d1292
                                           (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                              (coe
                                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                 (coe
                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                    (coe v0))))
                                           v12
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                 (coe v0))
                                              v13))
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d70
                                           (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                              (coe
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                 (coe v0)))
                                           v13 v12))
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d64
                                        (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0)))
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v13 v12)
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v12 v13)
                                        (coe
                                           MAlonzo.Code.Algebra.Structures.d1292
                                           (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                              (coe
                                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                 (coe
                                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                    (coe v0))))
                                           v13 v12))))
                             (coe
                                (\ v12 v13 ->
                                   coe
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
                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d202
                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                           (coe v0))
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v12)
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v13))
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                           (coe v0))
                                        (coe
                                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d202
                                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0))
                                           v12 v13))
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d76
                                        (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                              (coe v0)))
                                        v12 v13)))
                             (coe
                                (\ v12 ->
                                   coe
                                     du476 (coe v0) (coe v12)
                                     (coe
                                        MAlonzo.Code.Agda.Builtin.Sigma.d30
                                        (coe
                                           MAlonzo.Code.Data.Vec.Base.du644
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                              (coe v5) (coe v2))))))
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
                                (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                      (coe v0)))
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                      (coe v0))
                                   (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                         (coe v0))))
                                (MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.d38
                                   (let v12
                                          = let v12
                                                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                      (coe
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                         (coe v0)) in
                                            let v13
                                                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                      (coe v12) in
                                            let v14
                                                  = MAlonzo.Code.Algebra.Structures.d1290
                                                      (coe v13) in
                                            let v15
                                                  = MAlonzo.Code.Algebra.Structures.d1186
                                                      (coe v14) in
                                            let v16
                                                  = MAlonzo.Code.Algebra.Structures.d1094
                                                      (coe v15) in
                                            let v17
                                                  = MAlonzo.Code.Algebra.Structures.d372
                                                      (coe v16) in
                                            let v18
                                                  = MAlonzo.Code.Algebra.Structures.d324
                                                      (coe v17) in
                                            coe
                                              MAlonzo.Code.Algebra.Structures.du104
                                              (coe
                                                 MAlonzo.Code.Algebra.Structures.d124 (coe v18)) in
                                    coe
                                      MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                                      (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v12))
                                      (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                            (coe v0)))
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                            (coe v0))
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                               (coe v0))
                                            (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))))
                                         (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                               (coe v0))))
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                            (coe v0))
                                         (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                               (coe v0))))
                                      (let v13
                                             = let v13
                                                     = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                            (coe v0)) in
                                               let v14
                                                     = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                         (coe v13) in
                                               let v15
                                                     = MAlonzo.Code.Algebra.Structures.d1290
                                                         (coe v14) in
                                               let v16
                                                     = MAlonzo.Code.Algebra.Structures.d1186
                                                         (coe v15) in
                                               let v17
                                                     = MAlonzo.Code.Algebra.Structures.d1094
                                                         (coe v16) in
                                               let v18
                                                     = MAlonzo.Code.Algebra.Structures.d372
                                                         (coe v17) in
                                               let v19
                                                     = MAlonzo.Code.Algebra.Structures.d324
                                                         (coe v18) in
                                               coe
                                                 MAlonzo.Code.Algebra.Structures.du104
                                                 (coe
                                                    MAlonzo.Code.Algebra.Structures.d124
                                                    (coe v19)) in
                                       coe
                                         MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                                         (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v13))
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0))))
                                            (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))))
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0)))
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0)))))
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                               (coe v0))
                                            (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))))
                                         (let v14
                                                = let v14
                                                        = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                            (coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                               (coe v0)) in
                                                  let v15
                                                        = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                            (coe v14) in
                                                  let v16
                                                        = MAlonzo.Code.Algebra.Structures.d1290
                                                            (coe v15) in
                                                  let v17
                                                        = MAlonzo.Code.Algebra.Structures.d1186
                                                            (coe v16) in
                                                  let v18
                                                        = MAlonzo.Code.Algebra.Structures.d1094
                                                            (coe v17) in
                                                  let v19
                                                        = MAlonzo.Code.Algebra.Structures.d372
                                                            (coe v18) in
                                                  let v20
                                                        = MAlonzo.Code.Algebra.Structures.d324
                                                            (coe v19) in
                                                  coe
                                                    MAlonzo.Code.Algebra.Structures.du104
                                                    (coe
                                                       MAlonzo.Code.Algebra.Structures.d124
                                                       (coe v20)) in
                                          coe
                                            MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
                                            (coe
                                               MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v14))
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                  (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0))
                                                  (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                     (coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                        (coe v0)))
                                                  (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                     (coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                        (coe v0)))))
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0))))
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0))))
                                            (let v15
                                                   = let v15
                                                           = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                               (coe
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                  (coe v0)) in
                                                     let v16
                                                           = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                               (coe v15) in
                                                     let v17
                                                           = MAlonzo.Code.Algebra.Structures.d1290
                                                               (coe v16) in
                                                     let v18
                                                           = MAlonzo.Code.Algebra.Structures.d1186
                                                               (coe v17) in
                                                     let v19
                                                           = MAlonzo.Code.Algebra.Structures.d1094
                                                               (coe v18) in
                                                     let v20
                                                           = MAlonzo.Code.Algebra.Structures.d372
                                                               (coe v19) in
                                                     let v21
                                                           = MAlonzo.Code.Algebra.Structures.d324
                                                               (coe v20) in
                                                     coe
                                                       MAlonzo.Code.Algebra.Structures.du104
                                                       (coe
                                                          MAlonzo.Code.Algebra.Structures.d124
                                                          (coe v21)) in
                                             let v16
                                                   = MAlonzo.Code.Relation.Binary.Structures.d34
                                                       (coe
                                                          MAlonzo.Code.Relation.Binary.Bundles.d60
                                                          (coe v15)) in
                                             let v17
                                                   = coe
                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                          (coe v0))
                                                       (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                          (coe
                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                             (coe v0))) in
                                             coe
                                               MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.C32
                                               (coe v16 v17))
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d64
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0)))
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                  (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0))
                                                  (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                     (coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                        (coe v0)))
                                                  (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                     (coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                        (coe v0))))
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0)))
                                               (let v15
                                                      = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                          (coe v0) in
                                                let v16
                                                      = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                          (coe v15) in
                                                let v17
                                                      = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                          (coe v16) in
                                                let v18
                                                      = MAlonzo.Code.Algebra.Structures.d1290
                                                          (coe v17) in
                                                let v19
                                                      = coe
                                                          MAlonzo.Code.Algebra.Structures.du1258
                                                          (coe v18) in
                                                coe
                                                  MAlonzo.Code.Agda.Builtin.Sigma.d28
                                                  (MAlonzo.Code.Algebra.Structures.d920 (coe v19))
                                                  (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                     (coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                        (coe v0))))))
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d70
                                            (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0)))
                                            (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0)))
                                            (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0)))))
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
                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                               (coe v0))
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0))))
                                            (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                               (coe
                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))))
                                         (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                               (coe v0)))
                                         (let v13
                                                = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                    (coe v0) in
                                          let v14
                                                = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                                    (coe v13) in
                                          let v15
                                                = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                                    (coe v14) in
                                          let v16
                                                = MAlonzo.Code.Algebra.Structures.d1290 (coe v15) in
                                          let v17
                                                = coe
                                                    MAlonzo.Code.Algebra.Structures.du1258
                                                    (coe v16) in
                                          coe
                                            MAlonzo.Code.Agda.Builtin.Sigma.d30
                                            (MAlonzo.Code.Algebra.Structures.d920 (coe v17))
                                            (coe
                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206
                                               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                  (coe v0))
                                               (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d208
                                                  (coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                     (coe v0)))))))))
                             (coe v7)))
                       (coe
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du1054
                          (coe v0)
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du330
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                (coe v0))
                             (coe
                                MAlonzo.Code.Data.Product.du158
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                      (coe v0))
                                   (coe v9)))
                             (coe v7))
                          (coe v5) (coe v2)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name512
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation.⊟-hom"
d512 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d512 v0 v1 v2 v3 v4 v5 = du512 v4
du512 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du512 v0 = coe du476 (coe v0)
