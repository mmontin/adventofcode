{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Operations.Ring
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Data.Fin.Base
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
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics

name306
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables._.PowInd"
d306 a0 a1 a2 a3 a4 a5 a6 = ()
name344
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables._.ι"
d344 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
d344 v0 v1 v2 v3 v4 = du344 v4
du344 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
du344 v0
  = let v1
          = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
              (coe v0) in
    coe
      (\ v2 v3 ->
         let v4
               = coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130 (coe v2)
                   (coe v3) in
         let v5
               = let v5 = coe MAlonzo.Code.Data.List.Kleene.Base.C46 in
                 let v6
                       = coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                           (coe (0 :: Integer))
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                              (coe
                                 MAlonzo.Code.Algebra.Bundles.d2030
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                    (coe v1))))
                           (coe
                              MAlonzo.Code.Data.Nat.Properties.d4748
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130 (coe v2)
                                 (coe v3))) in
                 let v7 = 1 :: Integer in
                 let v8
                       = MAlonzo.Code.Algebra.Bundles.d2030
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                              (coe v1)) in
                 let v9
                       = coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v1
                           v8 in
                 seq
                   (coe v9)
                   (if coe v9
                      then coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244 (coe v5)
                             (coe (2 :: Integer))
                      else coe
                             MAlonzo.Code.Data.List.Kleene.Base.C48
                             (coe
                                MAlonzo.Code.Data.List.Kleene.Base.C42
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                   (coe MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v6)
                                   (coe v7))
                                (coe v5))) in
         let v6
               = coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140
                   (coe v3) in
         case coe v5 of
           MAlonzo.Code.Data.List.Kleene.Base.C46
             -> coe
                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                  (coe (0 :: Integer))
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                     (coe
                        MAlonzo.Code.Algebra.Bundles.d2028
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                           (coe v1))))
                  (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v2))
           MAlonzo.Code.Data.List.Kleene.Base.C48 v7
             -> case coe v7 of
                  MAlonzo.Code.Data.List.Kleene.Base.C42 v8 v9
                    -> case coe v8 of
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v10 v11
                           -> case coe v10 of
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v12
                                  -> case coe v11 of
                                       0 -> case coe v9 of
                                              MAlonzo.Code.Data.List.Kleene.Base.C46
                                                -> case coe v12 of
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v14 v15 v16
                                                       -> coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                                                            (coe v14) (coe v15)
                                                            (coe
                                                               MAlonzo.Code.Data.Nat.Properties.du4738
                                                               (coe
                                                                  MAlonzo.Code.Data.Nat.Base.C152
                                                                  v16)
                                                               (coe v6))
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              MAlonzo.Code.Data.List.Kleene.Base.C48 v14
                                                -> coe
                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                                                     (coe addInt (coe (1 :: Integer)) (coe v4))
                                                     (coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208
                                                        (coe
                                                           MAlonzo.Code.Data.List.Kleene.Base.C42
                                                           (coe
                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                              (coe
                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                 v12)
                                                              (coe (0 :: Integer)))
                                                           (coe v9))
                                                        (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                     (coe v6)
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                                              (coe addInt (coe (1 :: Integer)) (coe v4))
                                              (coe
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208
                                                 (coe
                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                    (coe
                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                       (coe
                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                          v12)
                                                       (coe v11))
                                                    (coe v9))
                                                 (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                              (coe v6)
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError
           _ -> MAlonzo.RTE.mazUnreachableError)
name466
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables._.⟦_⟧"
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
name480
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables.ι-hom"
d480 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d480 v0 v1 v2 v3 v4 v5 v6 v7 = du480 v4 v5 v6 v7
du480 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du480 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.d38
      (let v4
             = let v4
                     = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                         (coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                            (coe v0)) in
               let v5
                     = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                         (coe v4) in
               let v6 = MAlonzo.Code.Algebra.Structures.d1290 (coe v5) in
               let v7 = MAlonzo.Code.Algebra.Structures.d1186 (coe v6) in
               let v8 = MAlonzo.Code.Algebra.Structures.d1094 (coe v7) in
               let v9 = MAlonzo.Code.Algebra.Structures.d372 (coe v8) in
               let v10 = MAlonzo.Code.Algebra.Structures.d324 (coe v9) in
               coe
                 MAlonzo.Code.Algebra.Structures.du104
                 (coe MAlonzo.Code.Algebra.Structures.d124 (coe v10)) in
       coe
         MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
         (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v4))
         (let v5
                = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                    (coe v0) in
          let v6
                = let v6
                        = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                            (coe v0) in
                  let v7 = coe MAlonzo.Code.Data.List.Kleene.Base.C46 in
                  let v8
                        = coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                            (coe (0 :: Integer))
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                               (coe
                                  MAlonzo.Code.Algebra.Bundles.d2030
                                  (coe
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                        (coe v0)))))
                            (coe
                               MAlonzo.Code.Data.Nat.Properties.d4748
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130 (coe v1)
                                  (coe v2))) in
                  let v9 = 1 :: Integer in
                  let v10
                        = MAlonzo.Code.Algebra.Bundles.d2030
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                  (coe v0))) in
                  let v11
                        = coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v6
                            v10 in
                  seq
                    (coe v11)
                    (if coe v11
                       then coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244 (coe v7)
                              (coe (2 :: Integer))
                       else coe
                              MAlonzo.Code.Data.List.Kleene.Base.C48
                              (coe
                                 MAlonzo.Code.Data.List.Kleene.Base.C42
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                    (coe
                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v8)
                                    (coe v9))
                                 (coe v7))) in
          let v7
                = coe
                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140
                    (coe v2) in
          case coe v6 of
            MAlonzo.Code.Data.List.Kleene.Base.C46
              -> let v8
                       = MAlonzo.Code.Algebra.Bundles.d2028
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                              (coe v5)) in
                 coe
                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                   (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                      (coe v0))
                   v8
            MAlonzo.Code.Data.List.Kleene.Base.C48 v8
              -> case coe v8 of
                   MAlonzo.Code.Data.List.Kleene.Base.C42 v9 v10
                     -> case coe v9 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v11 v12
                            -> case coe v11 of
                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v13
                                   -> case coe v12 of
                                        0 -> case coe v10 of
                                               MAlonzo.Code.Data.List.Kleene.Base.C46
                                                 -> case coe v13 of
                                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v15 v16 v17
                                                        -> let v18
                                                                 = coe
                                                                     MAlonzo.Code.Data.Nat.Properties.du4738
                                                                     (coe
                                                                        MAlonzo.Code.Data.Nat.Base.C152
                                                                        v17)
                                                                     (coe v7) in
                                                           case coe v16 of
                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v19
                                                               -> coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                                                       (coe v0))
                                                                    v19
                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v20 v21
                                                               -> let v22
                                                                        = coe
                                                                            MAlonzo.Code.Data.Vec.Base.du644
                                                                            (coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                               (coe v18)
                                                                               (coe v3)) in
                                                                  case coe v20 of
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42 v23 v24
                                                                      -> case coe v23 of
                                                                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v25 v26
                                                                             -> case coe v25 of
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v27
                                                                                    -> case coe
                                                                                              v22 of
                                                                                         MAlonzo.Code.Agda.Builtin.Sigma.C32 v29 v30
                                                                                           -> let v31
                                                                                                    = coe
                                                                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                                                        (coe
                                                                                                           v0)
                                                                                                        (coe
                                                                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                                           (coe
                                                                                                              v27)
                                                                                                           (coe
                                                                                                              v24))
                                                                                                        (coe
                                                                                                           v22) in
                                                                                              case coe
                                                                                                     v26 of
                                                                                                0 -> coe
                                                                                                       v31
                                                                                                _ -> let v32
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
                                                                                                             v29)
                                                                                                          (coe
                                                                                                             v32))
                                                                                                       v31
                                                                                         _ -> MAlonzo.RTE.mazUnreachableError
                                                                                  _ -> MAlonzo.RTE.mazUnreachableError
                                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                                             _ -> MAlonzo.RTE.mazUnreachableError
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               MAlonzo.Code.Data.List.Kleene.Base.C48 v15
                                                 -> let v16
                                                          = coe
                                                              MAlonzo.Code.Data.Vec.Base.du644
                                                              (coe
                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                                 (coe v7) (coe v3)) in
                                                    let v17 = 0 :: Integer in
                                                    case coe v16 of
                                                      MAlonzo.Code.Agda.Builtin.Sigma.C32 v18 v19
                                                        -> let v20
                                                                 = coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                     (coe v0)
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                        (coe v13) (coe v10))
                                                                     (coe v16) in
                                                           case coe v17 of
                                                             0 -> coe v20
                                                             _ -> let v21 = -1 :: Integer in
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
                                        _ -> let v15
                                                   = coe
                                                       MAlonzo.Code.Data.Vec.Base.du644
                                                       (coe
                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                          (coe v7) (coe v3)) in
                                             case coe v15 of
                                               MAlonzo.Code.Agda.Builtin.Sigma.C32 v16 v17
                                                 -> let v18
                                                          = coe
                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                              (coe v0)
                                                              (coe
                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                 (coe v13) (coe v10))
                                                              (coe v15) in
                                                    case coe v12 of
                                                      0 -> coe v18
                                                      _ -> let v19
                                                                 = subInt
                                                                     (coe v12)
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
                                                                (coe v16) (coe v19))
                                                             v18
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError
            _ -> MAlonzo.RTE.mazUnreachableError)
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du686
            v0
            (let v5
                   = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                       (coe v0) in
             let v6 = coe MAlonzo.Code.Data.List.Kleene.Base.C46 in
             let v7
                   = coe
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                       (coe (0 :: Integer))
                       (coe
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                          (coe
                             MAlonzo.Code.Algebra.Bundles.d2030
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                   (coe v0)))))
                       (coe
                          MAlonzo.Code.Data.Nat.Properties.d4748
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130 (coe v1)
                             (coe v2))) in
             let v8 = 1 :: Integer in
             let v9
                   = MAlonzo.Code.Algebra.Bundles.d2030
                       (coe
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                             (coe v0))) in
             let v10
                   = coe
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v5
                       v9 in
             seq
               (coe v10)
               (if coe v10
                  then coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244 (coe v6)
                         (coe (2 :: Integer))
                  else coe
                         MAlonzo.Code.Data.List.Kleene.Base.C48
                         (coe
                            MAlonzo.Code.Data.List.Kleene.Base.C42
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                               (coe MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v7)
                               (coe v8))
                            (coe v6))))
            (coe
               MAlonzo.Code.Data.Vec.Base.du644
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                  (coe v3))))
         (coe MAlonzo.Code.Data.Vec.Base.du94 (coe v3) (coe v2))
         (let v5
                = let v5
                        = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                               (coe v0)) in
                  let v6
                        = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                            (coe v5) in
                  let v7 = MAlonzo.Code.Algebra.Structures.d1290 (coe v6) in
                  let v8 = MAlonzo.Code.Algebra.Structures.d1186 (coe v7) in
                  let v9 = MAlonzo.Code.Algebra.Structures.d1094 (coe v8) in
                  let v10 = MAlonzo.Code.Algebra.Structures.d372 (coe v9) in
                  let v11 = MAlonzo.Code.Algebra.Structures.d324 (coe v10) in
                  coe
                    MAlonzo.Code.Algebra.Structures.du104
                    (coe MAlonzo.Code.Algebra.Structures.d124 (coe v11)) in
          coe
            MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
            (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v5))
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du686
               v0
               (let v6
                      = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                          (coe v0) in
                let v7 = coe MAlonzo.Code.Data.List.Kleene.Base.C46 in
                let v8
                      = coe
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                          (coe (0 :: Integer))
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                             (coe
                                MAlonzo.Code.Algebra.Bundles.d2030
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                   (coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                      (coe v0)))))
                          (coe
                             MAlonzo.Code.Data.Nat.Properties.d4748
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130 (coe v1)
                                (coe v2))) in
                let v9 = 1 :: Integer in
                let v10
                      = MAlonzo.Code.Algebra.Bundles.d2030
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                (coe v0))) in
                let v11
                      = coe
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v6
                          v10 in
                seq
                  (coe v11)
                  (if coe v11
                     then coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244 (coe v7)
                            (coe (2 :: Integer))
                     else coe
                            MAlonzo.Code.Data.List.Kleene.Base.C48
                            (coe
                               MAlonzo.Code.Data.List.Kleene.Base.C42
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                  (coe MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v8)
                                  (coe v9))
                               (coe v7))))
               (coe
                  MAlonzo.Code.Data.Vec.Base.du644
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                     (coe v3))))
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
               (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                  (coe v0))
               (MAlonzo.Code.Agda.Builtin.Sigma.d28
                  (coe
                     MAlonzo.Code.Data.Vec.Base.du644
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                        (coe v3))))
               (let v6
                      = MAlonzo.Code.Algebra.Bundles.d2030
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                (coe v0))) in
                coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                  (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                     (coe v0))
                  v6))
            (coe MAlonzo.Code.Data.Vec.Base.du94 (coe v3) (coe v2))
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
                  (MAlonzo.Code.Agda.Builtin.Sigma.d28
                     (coe
                        MAlonzo.Code.Data.Vec.Base.du644
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                           (coe v3))))
                  (let v7
                         = MAlonzo.Code.Algebra.Bundles.d2030
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                   (coe v0))) in
                   coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                        (coe v0))
                     v7))
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                  (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                     (coe v0))
                  (MAlonzo.Code.Agda.Builtin.Sigma.d28
                     (coe
                        MAlonzo.Code.Data.Vec.Base.du644
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                           (coe v3))))
                  (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d214
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                        (coe v0))))
               (coe MAlonzo.Code.Data.Vec.Base.du94 (coe v3) (coe v2))
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
                     (MAlonzo.Code.Agda.Builtin.Sigma.d28
                        (coe
                           MAlonzo.Code.Data.Vec.Base.du644
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                              (coe v3))))
                     (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d214
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                           (coe v0))))
                  (MAlonzo.Code.Agda.Builtin.Sigma.d28
                     (coe
                        MAlonzo.Code.Data.Vec.Base.du644
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                           (coe v3))))
                  (coe MAlonzo.Code.Data.Vec.Base.du94 (coe v3) (coe v2))
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
                   let v9
                         = MAlonzo.Code.Relation.Binary.Structures.d34
                             (coe MAlonzo.Code.Relation.Binary.Bundles.d60 (coe v8)) in
                   let v10 = coe MAlonzo.Code.Data.Vec.Base.du94 (coe v3) (coe v2) in
                   coe
                     MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.C32
                     (coe v9 v10))
                  (let v8
                         = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                             (coe v0) in
                   let v9
                         = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                             (coe v8) in
                   let v10
                         = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                             (coe v9) in
                   let v11 = MAlonzo.Code.Algebra.Structures.d1290 (coe v10) in
                   let v12 = MAlonzo.Code.Algebra.Structures.d1186 (coe v11) in
                   let v13 = MAlonzo.Code.Algebra.Structures.d1096 (coe v12) in
                   coe
                     MAlonzo.Code.Agda.Builtin.Sigma.d30
                     (MAlonzo.Code.Algebra.Structures.d326 (coe v13))
                     (MAlonzo.Code.Agda.Builtin.Sigma.d28
                        (coe
                           MAlonzo.Code.Data.Vec.Base.du644
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                              (coe v3))))))
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
                  (MAlonzo.Code.Agda.Builtin.Sigma.d28
                     (coe
                        MAlonzo.Code.Data.Vec.Base.du644
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                           (coe v3))))
                  (MAlonzo.Code.Agda.Builtin.Sigma.d28
                     (coe
                        MAlonzo.Code.Data.Vec.Base.du644
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                           (coe v3))))
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                        (coe v0))
                     (let v7
                            = let v7
                                    = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                        (coe v0) in
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                (coe v7) in
                      MAlonzo.Code.Algebra.Bundles.d2030 (coe v7)))
                  (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d214
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                        (coe v0)))
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
                     (MAlonzo.Code.Agda.Builtin.Sigma.d28
                        (coe
                           MAlonzo.Code.Data.Vec.Base.du644
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                              (coe v3)))))
                  (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d720
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                        (coe v0)))))
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du832
               (coe v0)
               (coe
                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                  (coe (0 :: Integer))
                  (coe
                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                     (coe
                        MAlonzo.Code.Algebra.Bundles.d2030
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                              (coe v0)))))
                  (coe
                     MAlonzo.Code.Data.Nat.Properties.d4748
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130 (coe v1)
                        (coe v2))))
               (coe (0 :: Integer)) (coe MAlonzo.Code.Data.List.Kleene.Base.C46)
               (coe
                  MAlonzo.Code.Agda.Builtin.Sigma.d28
                  (coe
                     MAlonzo.Code.Data.Vec.Base.du644
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                        (coe v3))))
               (coe
                  MAlonzo.Code.Agda.Builtin.Sigma.d30
                  (coe
                     MAlonzo.Code.Data.Vec.Base.du644
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
                        (coe v3))))))
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du1054
            (coe v0)
            (let v5
                   = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                       (coe v0) in
             let v6 = coe MAlonzo.Code.Data.List.Kleene.Base.C46 in
             let v7
                   = coe
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                       (coe (0 :: Integer))
                       (coe
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                          (coe
                             MAlonzo.Code.Algebra.Bundles.d2030
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                   (coe v0)))))
                       (coe
                          MAlonzo.Code.Data.Nat.Properties.d4748
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130 (coe v1)
                             (coe v2))) in
             let v8 = 1 :: Integer in
             let v9
                   = MAlonzo.Code.Algebra.Bundles.d2030
                       (coe
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                             (coe v0))) in
             let v10
                   = coe
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v5
                       v9 in
             coe
               seq (coe v10)
               (if coe v10
                  then coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244 (coe v6)
                         (coe (2 :: Integer))
                  else coe
                         MAlonzo.Code.Data.List.Kleene.Base.C48
                         (coe
                            MAlonzo.Code.Data.List.Kleene.Base.C42
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                               (coe MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v7)
                               (coe v8))
                            (coe v6))))
            (coe
               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140 (coe v2))
            (coe v3)))
