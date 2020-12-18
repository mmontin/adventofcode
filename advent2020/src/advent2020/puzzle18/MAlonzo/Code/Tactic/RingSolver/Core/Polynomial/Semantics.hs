{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Semantics where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Operations.Ring
import qualified MAlonzo.Code.Data.List.Kleene.Base
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters

name226 = "Tactic.RingSolver.Core.Polynomial.Semantics._.Coeff"
d226 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer -> ()
d226 = erased
name238 = "Tactic.RingSolver.Core.Polynomial.Semantics._.Poly"
d238 a0 a1 a2 a3 a4 a5 = ()
name364 = "Tactic.RingSolver.Core.Polynomial.Semantics.drop"
d364 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> MAlonzo.Code.Data.Vec.Base.T24
d364 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du364 v7 v8
du364 ::
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> MAlonzo.Code.Data.Vec.Base.T24
du364 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C146 -> coe v1
      MAlonzo.Code.Data.Nat.Base.C152 v3
        -> case coe v1 of
             MAlonzo.Code.Data.Vec.Base.C36 v5 v6 -> coe du364 (coe v3) (coe v6)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name376 = "Tactic.RingSolver.Core.Polynomial.Semantics.drop-1"
d376 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d376 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du376 v7 v8
du376 ::
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du376 v0 v1
  = coe
      MAlonzo.Code.Data.Vec.Base.du644 (coe du364 (coe v0) (coe v1))
name382 = "Tactic.RingSolver.Core.Polynomial.Semantics._*⟨_⟩^_"
d382 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> AgdaAny -> Integer -> AgdaAny
d382 v0 v1 v2 v3 v4 v5 v6 v7 = du382 v4 v5 v6 v7
du382 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> AgdaAny -> Integer -> AgdaAny
du382 v0 v1 v2 v3
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
name396 = "Tactic.RingSolver.Core.Polynomial.Semantics._⟦∷⟧_"
d396 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> AgdaAny
d396 v0 v1 v2 v3 v4 v5 v6 v7 = du396 v4 v6 v7
du396 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> AgdaAny
du396 v0 v1 v2
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Sigma.C32 v3 v4
        -> case coe v4 of
             MAlonzo.Code.Data.List.Kleene.Base.C46
               -> case coe v2 of
                    MAlonzo.Code.Agda.Builtin.Sigma.C32 v5 v6
                      -> case coe v3 of
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v7 v8 v9
                             -> case coe v8 of
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v10
                                    -> coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                                         (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                                            (coe v0))
                                         v10
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v11 v12
                                    -> let v13
                                             = coe
                                                 MAlonzo.Code.Data.Vec.Base.du644
                                                 (coe du364 (coe v9) (coe v6)) in
                                       case coe v11 of
                                         MAlonzo.Code.Data.List.Kleene.Base.C42 v14 v15
                                           -> case coe v14 of
                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v16 v17
                                                  -> case coe v16 of
                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v18
                                                         -> case coe v13 of
                                                              MAlonzo.Code.Agda.Builtin.Sigma.C32 v20 v21
                                                                -> let v22
                                                                         = coe
                                                                             du396 (coe v0)
                                                                             (coe
                                                                                MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                (coe v18) (coe v15))
                                                                             (coe v13) in
                                                                   case coe v17 of
                                                                     0 -> coe v22
                                                                     _ -> let v23
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
                                                                               (coe v20) (coe v23))
                                                                            v22
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             MAlonzo.Code.Data.List.Kleene.Base.C48 v5
               -> case coe v2 of
                    MAlonzo.Code.Agda.Builtin.Sigma.C32 v6 v7
                      -> coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d202
                           (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                              (coe v0))
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d204
                              (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d252
                                 (coe v0))
                              v6
                              (case coe v5 of
                                 MAlonzo.Code.Data.List.Kleene.Base.C42 v8 v9
                                   -> case coe v8 of
                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v10 v11
                                          -> case coe v10 of
                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v12
                                                 -> let v14
                                                          = coe
                                                              du396 (coe v0)
                                                              (coe
                                                                 MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                 (coe v12) (coe v9))
                                                              (coe v2) in
                                                    case coe v11 of
                                                      0 -> coe v14
                                                      _ -> let v15
                                                                 = subInt
                                                                     (coe v11)
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
                                                                (coe v6) (coe v15))
                                                             v14
                                               _ -> MAlonzo.RTE.mazUnreachableError
                                        _ -> MAlonzo.RTE.mazUnreachableError
                                 _ -> MAlonzo.RTE.mazUnreachableError))
                           (case coe v3 of
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
                                                    (coe du364 (coe v10) (coe v7)) in
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
                                                                                du396 (coe v0)
                                                                                (coe
                                                                                   MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                                   (coe v19)
                                                                                   (coe v16))
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
                                                                                  (coe v21)
                                                                                  (coe v24))
                                                                               v23
                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                            _ -> MAlonzo.RTE.mazUnreachableError
                                     _ -> MAlonzo.RTE.mazUnreachableError
                              _ -> MAlonzo.RTE.mazUnreachableError)
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name400 = "Tactic.RingSolver.Core.Polynomial.Semantics.⅀⟦_⟧"
d400 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 -> AgdaAny
d400 v0 v1 v2 v3 v4 v5 v6 v7
  = case coe v6 of
      MAlonzo.Code.Data.List.Kleene.Base.C42 v8 v9
        -> case coe v8 of
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v10 v11
               -> case coe v10 of
                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v12
                      -> case coe v7 of
                           MAlonzo.Code.Agda.Builtin.Sigma.C32 v14 v15
                             -> let v16
                                      = coe
                                          du396 (coe v4)
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v12) (coe v9))
                                          (coe v7) in
                                case coe v11 of
                                  0 -> coe v16
                                  _ -> let v17 = subInt (coe v11) (coe (1 :: Integer)) in
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
                                            (coe v14) (coe v17))
                                         v16
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name404 = "Tactic.RingSolver.Core.Polynomial.Semantics.⟦_⟧"
d404 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d404 v0 v1 v2 v3 v4 v5 v6 v7 = du404 v0 v1 v2 v3 v4 v6 v7
du404 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du404 v0 v1 v2 v3 v4 v5 v6
  = case coe v5 of
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C198 v7 v8 v9
        -> case coe v8 of
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C200 v10
               -> coe
                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d710
                    (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d414
                       (coe v4))
                    v10
             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C208 v11 v12
               -> let v13 = subInt (coe v7) (coe (1 :: Integer)) in
                  let v14
                        = coe
                            MAlonzo.Code.Data.Vec.Base.du644 (coe du364 (coe v9) (coe v6)) in
                  case coe v11 of
                    MAlonzo.Code.Data.List.Kleene.Base.C42 v15 v16
                      -> case coe v15 of
                           MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C162 v17 v18
                             -> case coe v17 of
                                  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.C222 v19
                                    -> case coe v14 of
                                         MAlonzo.Code.Agda.Builtin.Sigma.C32 v21 v22
                                           -> let v23
                                                    = coe
                                                        du396 (coe v4)
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                           (coe v19) (coe v16))
                                                        (coe v14) in
                                              case coe v18 of
                                                0 -> coe v23
                                                _ -> let v24
                                                           = subInt
                                                               (coe v18) (coe (1 :: Integer)) in
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
                                                          (coe v21) (coe v24))
                                                       v23
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
