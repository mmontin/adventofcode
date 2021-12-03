{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.NonReflective where

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
import qualified MAlonzo.Code.Data.List.Kleene.Base
import qualified MAlonzo.Code.Data.Maybe.Base
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Relation.Binary.Reflection
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Expression
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Addition
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Constants
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Multiplication
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics

name152 = "Tactic.RingSolver.NonReflective.Ops.zero-homo"
d152 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> AgdaAny
d152 v0 v1 v2 v3 v4 = du152 v2 v3
du152 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny
du152 v0 v1
  = let v2
          = coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d212 v0
              v1 in
    case coe v2 of
      MAlonzo.Code.Data.Maybe.Base.C30 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name166 = "Tactic.RingSolver.NonReflective.Ops.homo"
d166 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56
d166 v0 v1 v2 = du166 v2
du166 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56
du166 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.C1151
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.C43
         (coe
            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
            (coe v0))
         (coe
            (\ v1 ->
               coe
                 MAlonzo.Code.Data.Maybe.Base.du34
                 (coe
                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d212 v0
                    v1))))
      (coe v0)
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du728
         (coe v0))
      (\ v1 v2 -> coe du152 (coe v0) v1)
name172 = "Tactic.RingSolver.NonReflective.Ops._.⟦_⟧"
d172 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d172 v0 v1 v2 = du172 v2
du172 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du172 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
      (coe
         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
         (coe v0))
      (coe (\ v4 -> v4)) v2 v3
name212 = "Tactic.RingSolver.NonReflective.Ops._.Poly"
d212 a0 a1 a2 a3 = ()
name330 = "Tactic.RingSolver.NonReflective.Ops.norm"
d330 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166
d330 v0 v1 v2 v3 v4
  = case coe v4 of
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C22 v5
        -> coe
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
             (coe (0 :: Integer))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 (coe v5))
             (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v3))
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C24 v5
        -> let v6
                 = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                     (coe du166 (coe v2)) in
           let v7
                 = coe
                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130 (coe v3)
                     (coe v5) in
           let v8
                 = let v8
                         = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                             (coe du166 (coe v2)) in
                   let v9 = coe MAlonzo.Code.Data.List.Kleene.Base.C46 in
                   let v10
                         = coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                             (coe (0 :: Integer))
                             (coe
                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d214
                                   (coe v2)))
                             (coe
                                MAlonzo.Code.Data.Nat.Properties.d4748
                                (coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du130
                                   (coe v3) (coe v5))) in
                   let v11 = 1 :: Integer in
                   let v12
                         = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d214
                             (coe v2) in
                   let v13
                         = coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v8
                             v12 in
                   seq
                     (coe v13)
                     (if coe v13
                        then coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du244 (coe v9)
                               (coe (2 :: Integer))
                        else coe
                               MAlonzo.Code.Data.List.Kleene.Base.C48
                               (coe
                                  MAlonzo.Code.Data.List.Kleene.Base.C42
                                  (coe
                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                     (coe
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                        v10)
                                     (coe v11))
                                  (coe v9))) in
           let v9
                 = coe
                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du140
                     (coe v5) in
           case coe v8 of
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
                             (coe v6))))
                    (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v3))
             MAlonzo.Code.Data.List.Kleene.Base.C48 v10
               -> case coe v10 of
                    MAlonzo.Code.Data.List.Kleene.Base.C42 v11 v12
                      -> case coe v11 of
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v13 v14
                             -> case coe v13 of
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v15
                                    -> case coe v14 of
                                         0 -> case coe v12 of
                                                MAlonzo.Code.Data.List.Kleene.Base.C46
                                                  -> case coe v15 of
                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v17 v18 v19
                                                         -> coe
                                                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                                                              (coe v17) (coe v18)
                                                              (coe
                                                                 MAlonzo.Code.Data.Nat.Properties.du4738
                                                                 (coe
                                                                    MAlonzo.Code.Data.Nat.Base.C152
                                                                    v19)
                                                                 (coe v9))
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                MAlonzo.Code.Data.List.Kleene.Base.C48 v17
                                                  -> coe
                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                                                       (coe addInt (coe (1 :: Integer)) (coe v7))
                                                       (coe
                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe
                                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                                (coe
                                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                                   v15)
                                                                (coe (0 :: Integer)))
                                                             (coe v12))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v9)
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> coe
                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198
                                                (coe addInt (coe (1 :: Integer)) (coe v7))
                                                (coe
                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208
                                                   (coe
                                                      MAlonzo.Code.Data.List.Kleene.Base.C42
                                                      (coe
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222
                                                            v15)
                                                         (coe v14))
                                                      (coe v12))
                                                   (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                (coe v9)
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C26 v5 v6
        -> coe
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d366 (coe v0)
             (coe v1)
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                (coe du166 (coe v2)))
             (coe v3) (coe d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v5))
             (coe d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6))
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C28 v5 v6
        -> coe
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du550 v0 v1
             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                (coe du166 (coe v2)))
             v3 (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v5))
             (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6))
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C30 v5 v6
        -> let v7
                 = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                     (coe du166 (coe v2)) in
           let v8 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v5) in
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
                             (coe v7))))
                    (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v3))
             _ -> let v9 = subInt (coe v6) (coe (1 :: Integer)) in
                  coe
                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756 (coe v0)
                    (coe v1) (coe v7) (coe v3) (coe v8) (coe v9)
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C32 v5
        -> coe
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                (coe du166 (coe v2)))
             (coe v3) (coe d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v5))
      _ -> MAlonzo.RTE.mazUnreachableError
name352 = "Tactic.RingSolver.NonReflective.Ops.⟦_⇓⟧"
d352 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d352 v0 v1 v2 v3 v4
  = let v5 = coe du166 (coe v2) in
    let v6 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) in
    coe
      (\ v7 ->
         case coe v6 of
           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v8 v9 v10
             -> case coe v9 of
                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v11
                    -> coe
                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                            (coe v5))
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
                                                             (coe v5)
                                                             (coe
                                                                MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                (coe v19) (coe v16))
                                                             (coe v14) in
                                                   case coe v18 of
                                                     0 -> coe v23
                                                     _ -> let v24
                                                                = subInt
                                                                    (coe v18)
                                                                    (coe (1 :: Integer)) in
                                                          coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                            (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                               (coe v5))
                                                            (coe
                                                               MAlonzo.Code.Algebra.Operations.Ring.du32
                                                               (coe
                                                                  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                  (coe
                                                                     MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                     (coe v5)))
                                                               (coe v21) (coe v24))
                                                            v23
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError
           _ -> MAlonzo.RTE.mazUnreachableError)
name380 = "Tactic.RingSolver.NonReflective.Ops.correct"
d380 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d380 v0 v1 v2 v3 = coe d408 (coe v0) (coe v1) (coe v2) (coe v3)
name408 = "Tactic.RingSolver.NonReflective.Ops._.go"
d408 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d408 v0 v1 v2 v3 v4 v5
  = case coe v4 of
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C22 v6
        -> coe
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Constants.du376
             (coe du166 (coe v2)) (coe v6)
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C24 v6
        -> coe
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables.du480
             (coe du166 (coe v2)) (coe v3) (coe v6) (coe v5)
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C26 v6 v7
        -> coe
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
                                        (coe v2))))))))))
             (let v8 = coe du166 (coe v2) in
              let v9
                    = let v9 = coe du166 (coe v2) in
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d366
                        (coe v0) (coe v1)
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                           (coe v9))
                        (coe v3) (coe d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6))
                        (coe d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7)) in
              case coe v9 of
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                  -> case coe v11 of
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                         -> coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                 (coe v8))
                              v13
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                         -> let v16
                                  = coe
                                      MAlonzo.Code.Data.Vec.Base.du644
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                         (coe v12) (coe v5)) in
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
                                                                  (coe v8)
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
                                                                    (coe v8))
                                                                 (coe
                                                                    MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                    (coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v8)))
                                                                    (coe v23) (coe v26))
                                                                 v25
                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                            _ -> MAlonzo.RTE.mazUnreachableError
                                     _ -> MAlonzo.RTE.mazUnreachableError
                              _ -> MAlonzo.RTE.mazUnreachableError
                       _ -> MAlonzo.RTE.mazUnreachableError
                _ -> MAlonzo.RTE.mazUnreachableError)
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d202 v2
                (let v8 = coe du166 (coe v2) in
                 let v9 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) in
                 case coe v9 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                     -> case coe v11 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v8))
                                 v13
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                            -> let v16
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v12) (coe v5)) in
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
                                                                     (coe v8)
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
                                                                       (coe v8))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v8)))
                                                                       (coe v23) (coe v26))
                                                                    v25
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError)
                (let v8 = coe du166 (coe v2) in
                 let v9 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7) in
                 case coe v9 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                     -> case coe v11 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v8))
                                 v13
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                            -> let v16
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v12) (coe v5)) in
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
                                                                     (coe v8)
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
                                                                       (coe v8))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v8)))
                                                                       (coe v23) (coe v26))
                                                                    v25
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d202 v2
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v6) (coe v5))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v7) (coe v5)))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Addition.du480
                v0 v1 v0 v1 (coe du166 (coe v2))
                (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6))
                (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7)) v5)
             (coe
                MAlonzo.Code.Algebra.Structures.d90
                (MAlonzo.Code.Algebra.Structures.d124
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
                                        (coe v2)))))))))
                (coe d352 v0 v1 v2 v3 v6 v5)
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v6) (coe v5))
                (coe d352 v0 v1 v2 v3 v7 v5)
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v7) (coe v5))
                (d408 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) (coe v5))
                (d408 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7) (coe v5)))
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C28 v6 v7
        -> coe
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
                                        (coe v2))))))))))
             (let v8 = coe du166 (coe v2) in
              let v9
                    = let v9 = coe du166 (coe v2) in
                      let v10
                            = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                (coe v9) in
                      coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du550 v0 v1 v10
                        v3 (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6))
                        (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7)) in
              case coe v9 of
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                  -> case coe v11 of
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                         -> coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                 (coe v8))
                              v13
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                         -> let v16
                                  = coe
                                      MAlonzo.Code.Data.Vec.Base.du644
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                         (coe v12) (coe v5)) in
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
                                                                  (coe v8)
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
                                                                    (coe v8))
                                                                 (coe
                                                                    MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                    (coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v8)))
                                                                    (coe v23) (coe v26))
                                                                 v25
                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                            _ -> MAlonzo.RTE.mazUnreachableError
                                     _ -> MAlonzo.RTE.mazUnreachableError
                              _ -> MAlonzo.RTE.mazUnreachableError
                       _ -> MAlonzo.RTE.mazUnreachableError
                _ -> MAlonzo.RTE.mazUnreachableError)
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204 v2
                (let v8 = coe du166 (coe v2) in
                 let v9 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) in
                 case coe v9 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                     -> case coe v11 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v8))
                                 v13
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                            -> let v16
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v12) (coe v5)) in
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
                                                                     (coe v8)
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
                                                                       (coe v8))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v8)))
                                                                       (coe v23) (coe v26))
                                                                    v25
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError)
                (let v8 = coe du166 (coe v2) in
                 let v9 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7) in
                 case coe v9 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v10 v11 v12
                     -> case coe v11 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v13
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v8))
                                 v13
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v14 v15
                            -> let v16
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v12) (coe v5)) in
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
                                                                     (coe v8)
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
                                                                       (coe v8))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v8)))
                                                                       (coe v23) (coe v26))
                                                                    v25
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204 v2
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v6) (coe v5))
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v7) (coe v5)))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Multiplication.du878
                v0 v1 v0 v1 (coe du166 (coe v2))
                (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6))
                (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7)) v5)
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
                                     (coe v2))))))))
                (coe d352 v0 v1 v2 v3 v6 v5)
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v6) (coe v5))
                (coe d352 v0 v1 v2 v3 v7 v5)
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v7) (coe v5))
                (d408 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) (coe v5))
                (d408 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7) (coe v5)))
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C30 v6 v7
        -> coe
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
                                        (coe v2))))))))))
             (let v8 = coe du166 (coe v2) in
              let v9 = coe du166 (coe v2) in
              let v10
                    = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                        (coe v9) in
              let v11 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) in
              case coe v7 of
                0 -> let v12
                           = MAlonzo.Code.Algebra.Bundles.d2030
                               (coe
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                  (coe v10)) in
                     coe
                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                       (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                          (coe v8))
                       v12
                _ -> let v12
                           = let v12 = subInt (coe v7) (coe (1 :: Integer)) in
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.d756
                               (coe v0) (coe v1) (coe v10) (coe v3) (coe v11) (coe v12) in
                     case coe v12 of
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v13 v14 v15
                         -> case coe v14 of
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v16
                                -> coe
                                     MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                     (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                        (coe v8))
                                     v16
                              MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v17 v18
                                -> let v19
                                         = coe
                                             MAlonzo.Code.Data.Vec.Base.du644
                                             (coe
                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                (coe v15) (coe v5)) in
                                   case coe v17 of
                                     MAlonzo.Code.Data.List.Kleene.Base.C42 v20 v21
                                       -> case coe v20 of
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v22 v23
                                              -> case coe v22 of
                                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v24
                                                     -> case coe v19 of
                                                          MAlonzo.Code.Agda.Builtin.Sigma.C32 v26 v27
                                                            -> let v28
                                                                     = coe
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du396
                                                                         (coe v8)
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                            (coe v24) (coe v21))
                                                                         (coe v19) in
                                                               case coe v23 of
                                                                 0 -> coe v28
                                                                 _ -> let v29
                                                                            = subInt
                                                                                (coe v23)
                                                                                (coe
                                                                                   (1 ::
                                                                                      Integer)) in
                                                                      coe
                                                                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                        (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                           (coe v8))
                                                                        (coe
                                                                           MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                           (coe
                                                                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                              (coe
                                                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                 (coe v8)))
                                                                           (coe v26) (coe v29))
                                                                        v28
                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                            _ -> MAlonzo.RTE.mazUnreachableError
                                     _ -> MAlonzo.RTE.mazUnreachableError
                              _ -> MAlonzo.RTE.mazUnreachableError
                       _ -> MAlonzo.RTE.mazUnreachableError)
             (let v8 = coe du166 (coe v2) in
              let v9
                    = coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                           (coe v8)) in
              let v10
                    = let v10 = coe du166 (coe v2) in
                      let v11 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) in
                      case coe v11 of
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v12 v13 v14
                          -> case coe v13 of
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v15
                                 -> coe
                                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                         (coe v10))
                                      v15
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v16 v17
                                 -> let v18
                                          = coe
                                              MAlonzo.Code.Data.Vec.Base.du644
                                              (coe
                                                 MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                                 (coe v14) (coe v5)) in
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
                                                                          (coe v10)
                                                                          (coe
                                                                             MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                             (coe v23) (coe v20))
                                                                          (coe v18) in
                                                                case coe v22 of
                                                                  0 -> coe v27
                                                                  _ -> let v28
                                                                             = subInt
                                                                                 (coe v22)
                                                                                 (coe
                                                                                    (1 ::
                                                                                       Integer)) in
                                                                       coe
                                                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                            (coe v10))
                                                                         (coe
                                                                            MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                            (coe
                                                                               MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                               (coe
                                                                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                                  (coe v10)))
                                                                            (coe v25) (coe v28))
                                                                         v27
                                                           _ -> MAlonzo.RTE.mazUnreachableError
                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                             _ -> MAlonzo.RTE.mazUnreachableError
                                      _ -> MAlonzo.RTE.mazUnreachableError
                               _ -> MAlonzo.RTE.mazUnreachableError
                        _ -> MAlonzo.RTE.mazUnreachableError in
              case coe v7 of
                0 -> coe MAlonzo.Code.Algebra.Bundles.d2030 (coe v9)
                _ -> let v11 = subInt (coe v7) (coe (1 :: Integer)) in
                     coe
                       MAlonzo.Code.Algebra.Operations.Ring.du32 (coe v9) (coe v10)
                       (coe v11))
             (let v8 = coe du166 (coe v2) in
              let v9
                    = coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                           (coe v8)) in
              let v10
                    = coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                           (coe v2))
                        (coe (\ v10 -> v10)) (coe v6) (coe v5) in
              case coe v7 of
                0 -> coe MAlonzo.Code.Algebra.Bundles.d2030 (coe v9)
                _ -> let v11 = subInt (coe v7) (coe (1 :: Integer)) in
                     coe
                       MAlonzo.Code.Algebra.Operations.Ring.du32 (coe v9) (coe v10)
                       (coe v11))
             (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.d600
                (coe v0) (coe v1) (coe v0) (coe v1) (coe du166 (coe v2)) (coe v3)
                (coe d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6)) (coe v7)
                (coe v5))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du634
                (coe du166 (coe v2)) (coe d352 v0 v1 v2 v3 v6 v5)
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v8 -> v8)) (coe v6) (coe v5))
                (coe v7)
                (coe d408 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) (coe v5)))
      MAlonzo.Code.Tactic.RingSolver.Core.Expression.C32 v6
        -> coe
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
                                        (coe v2))))))))))
             (let v7 = coe du166 (coe v2) in
              let v8
                    = let v8 = coe du166 (coe v2) in
                      let v9
                            = MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d250
                                (coe v8) in
                      coe
                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.du530 (coe v9)
                        (coe v3) (coe d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6)) in
              case coe v8 of
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
                  -> case coe v10 of
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
                         -> coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                 (coe v7))
                              v12
                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
                         -> let v15
                                  = coe
                                      MAlonzo.Code.Data.Vec.Base.du644
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                         (coe v11) (coe v5)) in
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
                                                                  (coe v7)
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                     (coe v20) (coe v17))
                                                                  (coe v15) in
                                                        case coe v19 of
                                                          0 -> coe v24
                                                          _ -> let v25
                                                                     = subInt
                                                                         (coe v19)
                                                                         (coe (1 :: Integer)) in
                                                               coe
                                                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                    (coe v7))
                                                                 (coe
                                                                    MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                    (coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                          (coe v7)))
                                                                    (coe v22) (coe v25))
                                                                 v24
                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                            _ -> MAlonzo.RTE.mazUnreachableError
                                     _ -> MAlonzo.RTE.mazUnreachableError
                              _ -> MAlonzo.RTE.mazUnreachableError
                       _ -> MAlonzo.RTE.mazUnreachableError
                _ -> MAlonzo.RTE.mazUnreachableError)
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206 v2
                (let v7 = coe du166 (coe v2) in
                 let v8 = d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) in
                 case coe v8 of
                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v9 v10 v11
                     -> case coe v10 of
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v12
                            -> coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                    (coe v7))
                                 v12
                          MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v13 v14
                            -> let v15
                                     = coe
                                         MAlonzo.Code.Data.Vec.Base.du644
                                         (coe
                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics.du364
                                            (coe v11) (coe v5)) in
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
                                                                     (coe v7)
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                        (coe v20) (coe v17))
                                                                     (coe v15) in
                                                           case coe v19 of
                                                             0 -> coe v24
                                                             _ -> let v25
                                                                        = subInt
                                                                            (coe v19)
                                                                            (coe (1 :: Integer)) in
                                                                  coe
                                                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                                                                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                       (coe v7))
                                                                    (coe
                                                                       MAlonzo.Code.Algebra.Operations.Ring.du32
                                                                       (coe
                                                                          MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                                                                          (coe
                                                                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                                                             (coe v7)))
                                                                       (coe v22) (coe v25))
                                                                    v24
                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> MAlonzo.RTE.mazUnreachableError))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d206 v2
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v7 -> v7)) (coe v6) (coe v5)))
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation.du512
                (coe du166 (coe v2))
                (d330 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6)) v5)
             (coe
                MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d64
                (MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                   (coe v2))
                (coe d352 v0 v1 v2 v3 v6 v5)
                (coe
                   MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
                      (coe v2))
                   (coe (\ v7 -> v7)) (coe v6) (coe v5))
                (d408 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) (coe v5)))
      _ -> MAlonzo.RTE.mazUnreachableError
name442 = "Tactic.RingSolver.NonReflective.Ops._._⊜_"
d442 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d442 v0 v1 v2 v3 = du442
du442 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du442 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32
name444 = "Tactic.RingSolver.NonReflective.Ops._.close"
d444 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  () -> Integer -> AgdaAny -> AgdaAny
d444 v0 v1 v2 = du444
du444 :: () -> Integer -> AgdaAny -> AgdaAny
du444 v0 v1 v2
  = coe
      MAlonzo.Code.Relation.Binary.Reflection.du106
      (coe
         (\ v3 -> coe MAlonzo.Code.Tactic.RingSolver.Core.Expression.C24))
      v1 v2
name446 = "Tactic.RingSolver.NonReflective.Ops._.prove"
d446 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  AgdaAny -> AgdaAny
d446 v0 v1 v2
  = coe
      MAlonzo.Code.Relation.Binary.Reflection.du92
      (let v3
             = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                 (coe v2) in
       let v4
             = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                 (coe v3) in
       let v5 = MAlonzo.Code.Algebra.Structures.d1290 (coe v4) in
       let v6 = MAlonzo.Code.Algebra.Structures.d1186 (coe v5) in
       let v7 = MAlonzo.Code.Algebra.Structures.d1094 (coe v6) in
       let v8 = MAlonzo.Code.Algebra.Structures.d372 (coe v7) in
       let v9 = MAlonzo.Code.Algebra.Structures.d324 (coe v8) in
       coe
         MAlonzo.Code.Algebra.Structures.du104
         (coe MAlonzo.Code.Algebra.Structures.d124 (coe v9)))
      (\ v3 v4 v5 ->
         coe
           MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
           (coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
              (coe v2))
           (coe (\ v6 -> v6)) v4 v5)
      (coe d352 (coe v0) (coe v1) (coe v2))
      (coe d380 (coe v0) (coe v1) (coe v2))
name448 = "Tactic.RingSolver.NonReflective.Ops._.solve"
d448 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer -> AgdaAny -> AgdaAny -> AgdaAny
d448 v0 v1 v2
  = coe
      MAlonzo.Code.Relation.Binary.Reflection.du116
      (let v3
             = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                 (coe v2) in
       let v4
             = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                 (coe v3) in
       let v5 = MAlonzo.Code.Algebra.Structures.d1290 (coe v4) in
       let v6 = MAlonzo.Code.Algebra.Structures.d1186 (coe v5) in
       let v7 = MAlonzo.Code.Algebra.Structures.d1094 (coe v6) in
       let v8 = MAlonzo.Code.Algebra.Structures.d372 (coe v7) in
       let v9 = MAlonzo.Code.Algebra.Structures.d324 (coe v8) in
       coe
         MAlonzo.Code.Algebra.Structures.du104
         (coe MAlonzo.Code.Algebra.Structures.d124 (coe v9)))
      (coe
         (\ v3 -> coe MAlonzo.Code.Tactic.RingSolver.Core.Expression.C24))
      (\ v3 v4 v5 ->
         coe
           MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
           (coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
              (coe v2))
           (coe (\ v6 -> v6)) v4 v5)
      (coe d352 (coe v0) (coe v1) (coe v2))
      (coe d380 (coe v0) (coe v1) (coe v2))
name450 = "Tactic.RingSolver.NonReflective.Ops._.solve₁"
d450 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer -> AgdaAny -> AgdaAny
d450 v0 v1 v2
  = coe
      MAlonzo.Code.Relation.Binary.Reflection.du132
      (let v3
             = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                 (coe v2) in
       let v4
             = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                 (coe v3) in
       let v5 = MAlonzo.Code.Algebra.Structures.d1290 (coe v4) in
       let v6 = MAlonzo.Code.Algebra.Structures.d1186 (coe v5) in
       let v7 = MAlonzo.Code.Algebra.Structures.d1094 (coe v6) in
       let v8 = MAlonzo.Code.Algebra.Structures.d372 (coe v7) in
       let v9 = MAlonzo.Code.Algebra.Structures.d324 (coe v8) in
       coe
         MAlonzo.Code.Algebra.Structures.du104
         (coe MAlonzo.Code.Algebra.Structures.d124 (coe v9)))
      (coe
         (\ v3 -> coe MAlonzo.Code.Tactic.RingSolver.Core.Expression.C24))
      (\ v3 v4 v5 ->
         coe
           MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
           (coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
              (coe v2))
           (coe (\ v6 -> v6)) v4 v5)
      (coe d352 (coe v0) (coe v1) (coe v2))
      (coe d380 (coe v0) (coe v1) (coe v2))
name456 = "Tactic.RingSolver.NonReflective.solve"
d456 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer -> AgdaAny -> AgdaAny -> AgdaAny
d456 v0 v1 v2
  = coe
      MAlonzo.Code.Relation.Binary.Reflection.du116
      (let v3
             = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                 (coe v2) in
       let v4
             = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                 (coe v3) in
       let v5 = MAlonzo.Code.Algebra.Structures.d1290 (coe v4) in
       let v6 = MAlonzo.Code.Algebra.Structures.d1186 (coe v5) in
       let v7 = MAlonzo.Code.Algebra.Structures.d1094 (coe v6) in
       let v8 = MAlonzo.Code.Algebra.Structures.d372 (coe v7) in
       let v9 = MAlonzo.Code.Algebra.Structures.d324 (coe v8) in
       coe
         MAlonzo.Code.Algebra.Structures.du104
         (coe MAlonzo.Code.Algebra.Structures.d124 (coe v9)))
      (coe
         (\ v3 -> coe MAlonzo.Code.Tactic.RingSolver.Core.Expression.C24))
      (\ v3 v4 v5 ->
         coe
           MAlonzo.Code.Tactic.RingSolver.Core.Expression.du80
           (coe
              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.du332
              (coe v2))
           (coe (\ v6 -> v6)) v4 v5)
      (coe d352 (coe v0) (coe v1) (coe v2))
      (coe d380 (coe v0) (coe v1) (coe v2))
name460 = "Tactic.RingSolver.NonReflective._⊜_"
d460 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d460 v0 v1 = du460
du460 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Expression.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du460 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32
