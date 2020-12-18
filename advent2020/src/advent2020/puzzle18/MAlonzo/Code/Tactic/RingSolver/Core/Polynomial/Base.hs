{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Operations.Ring
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.Fin.Base
import qualified MAlonzo.Code.Data.List.Kleene.Base
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Product
import qualified MAlonzo.Code.Induction.WellFounded
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters

name56 = "Tactic.RingSolver.Core.Polynomial.Base.InjectionOrdering"
d56 a0 a1 a2 a3 a4 a5 a6 a7 = ()
data T56
  = C68 MAlonzo.Code.Data.Nat.Base.T142 |
    C78 MAlonzo.Code.Data.Nat.Base.T142 | C84
name96 = "Tactic.RingSolver.Core.Polynomial.Base.inj-compare"
d96 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> T56
d96 v0 v1 v2 v3 v4 v5 v6 v7 = du96 v6 v7
du96 ::
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> T56
du96 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C146
        -> case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C146 -> coe C84
             MAlonzo.Code.Data.Nat.Base.C152 v3 -> coe C78 v3
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Data.Nat.Base.C152 v3
        -> case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C146 -> coe C68 v3
             MAlonzo.Code.Data.Nat.Base.C152 v5 -> coe du96 (coe v3) (coe v5)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name120 = "Tactic.RingSolver.Core.Polynomial.Base.space"
d120 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> MAlonzo.Code.Data.Fin.Base.T6 -> Integer
d120 v0 v1 v2 v3 v4 = du120 v3 v4
du120 :: Integer -> MAlonzo.Code.Data.Fin.Base.T6 -> Integer
du120 v0 v1
  = coe addInt (coe (1 :: Integer)) (coe du130 (coe v0) (coe v1))
name130 = "Tactic.RingSolver.Core.Polynomial.Base._.go"
d130 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  Integer -> MAlonzo.Code.Data.Fin.Base.T6 -> Integer
d130 v0 v1 v2 v3 v4 v5 v6 = du130 v5 v6
du130 :: Integer -> MAlonzo.Code.Data.Fin.Base.T6 -> Integer
du130 v0 v1
  = case coe v1 of
      MAlonzo.Code.Data.Fin.Base.C10
        -> coe subInt (coe v0) (coe (1 :: Integer))
      MAlonzo.Code.Data.Fin.Base.C16 v3
        -> let v4 = subInt (coe v0) (coe (1 :: Integer)) in
           coe du130 (coe v4) (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
name140 = "Tactic.RingSolver.Core.Polynomial.Base.space≤′n"
d140 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T142
d140 v0 v1 v2 v3 v4 = du140 v4
du140 ::
  MAlonzo.Code.Data.Fin.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T142
du140 v0
  = case coe v0 of
      MAlonzo.Code.Data.Fin.Base.C10
        -> coe MAlonzo.Code.Data.Nat.Base.C146
      MAlonzo.Code.Data.Fin.Base.C16 v2
        -> coe MAlonzo.Code.Data.Nat.Base.C152 (coe du140 (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
name148 = "Tactic.RingSolver.Core.Polynomial.Base.PowInd"
d148 a0 a1 a2 a3 a4 = ()
data T148 = C162 AgdaAny Integer
name158 = "Tactic.RingSolver.Core.Polynomial.Base.PowInd.coeff"
d158 :: T148 -> AgdaAny
d158 v0
  = case coe v0 of
      C162 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name160 = "Tactic.RingSolver.Core.Polynomial.Base.PowInd.pow"
d160 :: T148 -> Integer
d160 v0
  = case coe v0 of
      C162 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name166 = "Tactic.RingSolver.Core.Polynomial.Base.Poly"
d166 a0 a1 a2 a3 = ()
data T166 = C198 Integer T168 MAlonzo.Code.Data.Nat.Base.T142
name168 = "Tactic.RingSolver.Core.Polynomial.Base.FlatPoly"
d168 a0 a1 a2 a3 = ()
data T168
  = C200 AgdaAny |
    C208 MAlonzo.Code.Data.List.Kleene.Base.T24 AgdaAny
name170 = "Tactic.RingSolver.Core.Polynomial.Base.Coeff"
d170 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> ()
d170 = erased
name174 = "Tactic.RingSolver.Core.Polynomial.Base.NonZero"
d174 a0 a1 a2 a3 = ()
newtype T174 = C222 T166
name178 = "Tactic.RingSolver.Core.Polynomial.Base.Zero"
d178 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> ()
d178 = erased
name182 = "Tactic.RingSolver.Core.Polynomial.Base.Normalised"
d182 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> MAlonzo.Code.Data.List.Kleene.Base.T24 -> ()
d182 = erased
name192 = "Tactic.RingSolver.Core.Polynomial.Base.Poly.i"
d192 :: T166 -> Integer
d192 v0
  = case coe v0 of
      C198 v1 v2 v3 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name194 = "Tactic.RingSolver.Core.Polynomial.Base.Poly.flat"
d194 :: T166 -> T168
d194 v0
  = case coe v0 of
      C198 v1 v2 v3 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name196 = "Tactic.RingSolver.Core.Polynomial.Base.Poly.i≤n"
d196 :: T166 -> MAlonzo.Code.Data.Nat.Base.T142
d196 v0
  = case coe v0 of
      C198 v1 v2 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name218 = "Tactic.RingSolver.Core.Polynomial.Base.NonZero.poly"
d218 :: T174 -> T166
d218 v0
  = case coe v0 of
      C222 v1 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name230 = "Tactic.RingSolver.Core.Polynomial.Base.zero?"
d230 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> MAlonzo.Code.Relation.Nullary.T32
d230 v0 v1 v2 v3 v4 = du230 v2 v4
du230 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  T166 -> MAlonzo.Code.Relation.Nullary.T32
du230 v0 v1
  = case coe v1 of
      C198 v2 v3 v4
        -> case coe v3 of
             C200 v5
               -> let v6
                        = coe
                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v0
                            v5 in
                  if coe v6
                    then coe
                           MAlonzo.Code.Relation.Nullary.C46 (coe v6)
                           (coe
                              MAlonzo.Code.Relation.Nullary.C22
                              (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                    else coe
                           MAlonzo.Code.Relation.Nullary.C46 (coe v6)
                           (coe MAlonzo.Code.Relation.Nullary.C26)
             C208 v6 v7
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name244 = "Tactic.RingSolver.Core.Polynomial.Base._⍓*_"
d244 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  Integer -> MAlonzo.Code.Data.List.Kleene.Base.T30
d244 v0 v1 v2 v3 v4 v5 = du244 v4 v5
du244 ::
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  Integer -> MAlonzo.Code.Data.List.Kleene.Base.T30
du244 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.List.Kleene.Base.C46 -> coe v0
      MAlonzo.Code.Data.List.Kleene.Base.C48 v2
        -> coe
             MAlonzo.Code.Data.List.Kleene.Base.C48
             (coe du248 (coe v2) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
name248 = "Tactic.RingSolver.Core.Polynomial.Base._⍓+_"
d248 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  Integer -> MAlonzo.Code.Data.List.Kleene.Base.T24
d248 v0 v1 v2 v3 v4 v5 = du248 v4 v5
du248 ::
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  Integer -> MAlonzo.Code.Data.List.Kleene.Base.T24
du248 v0 v1
  = coe
      MAlonzo.Code.Data.List.Kleene.Base.C42
      (coe
         C162
         (coe d158 (coe MAlonzo.Code.Data.List.Kleene.Base.d38 (coe v0)))
         (coe
            addInt
            (coe d160 (coe MAlonzo.Code.Data.List.Kleene.Base.d38 (coe v0)))
            (coe v1)))
      (coe MAlonzo.Code.Data.List.Kleene.Base.d40 (coe v0))
name268 = "Tactic.RingSolver.Core.Polynomial.Base._∷↓_"
d268 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  T148 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d268 v0 v1 v2 v3 v4 v5 = du268 v2 v4 v5
du268 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  T148 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
du268 v0 v1 v2
  = case coe v1 of
      C162 v3 v4
        -> case coe v3 of
             C198 v5 v6 v7
               -> case coe v6 of
                    C200 v8
                      -> let v9
                               = coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v0
                                   v8 in
                         coe
                           seq (coe v9)
                           (if coe v9
                              then coe du244 (coe v2) (coe addInt (coe (1 :: Integer)) (coe v4))
                              else coe
                                     MAlonzo.Code.Data.List.Kleene.Base.C48
                                     (coe
                                        MAlonzo.Code.Data.List.Kleene.Base.C42
                                        (coe C162 (coe C222 v3) (coe v4)) (coe v2)))
                    C208 v9 v10
                      -> coe
                           MAlonzo.Code.Data.List.Kleene.Base.C48
                           (coe
                              MAlonzo.Code.Data.List.Kleene.Base.C42
                              (coe C162 (coe C222 v3) (coe v4)) (coe v2))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name286 = "Tactic.RingSolver.Core.Polynomial.Base._⊐↑_"
d286 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer -> T166 -> MAlonzo.Code.Data.Nat.Base.T142 -> T166
d286 v0 v1 v2 v3 v4 v5 v6 = du286 v5 v6
du286 :: T166 -> MAlonzo.Code.Data.Nat.Base.T142 -> T166
du286 v0 v1
  = case coe v0 of
      C198 v2 v3 v4
        -> coe
             C198 (coe v2) (coe v3)
             (coe
                MAlonzo.Code.Data.Nat.Properties.du4738
                (coe MAlonzo.Code.Data.Nat.Base.C152 v4) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
name298 = "Tactic.RingSolver.Core.Polynomial.Base._⊐↓_"
d298 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> T166
d298 v0 v1 v2 v3 v4 v5 v6 = du298 v2 v3 v4 v5 v6
du298 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> T166
du298 v0 v1 v2 v3 v4
  = case coe v3 of
      MAlonzo.Code.Data.List.Kleene.Base.C46
        -> coe
             C198 (coe (0 :: Integer))
             (coe
                C200
                (coe
                   MAlonzo.Code.Algebra.Bundles.d2028
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                      (coe v0))))
             (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v2))
      MAlonzo.Code.Data.List.Kleene.Base.C48 v5
        -> case coe v5 of
             MAlonzo.Code.Data.List.Kleene.Base.C42 v6 v7
               -> case coe v6 of
                    C162 v8 v9
                      -> case coe v8 of
                           C222 v10
                             -> case coe v9 of
                                  0 -> case coe v7 of
                                         MAlonzo.Code.Data.List.Kleene.Base.C46
                                           -> case coe v10 of
                                                C198 v12 v13 v14
                                                  -> coe
                                                       C198 (coe v12) (coe v13)
                                                       (coe
                                                          MAlonzo.Code.Data.Nat.Properties.du4738
                                                          (coe MAlonzo.Code.Data.Nat.Base.C152 v14)
                                                          (coe v4))
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         MAlonzo.Code.Data.List.Kleene.Base.C48 v12
                                           -> coe
                                                C198 (coe addInt (coe (1 :: Integer)) (coe v1))
                                                (coe
                                                   C208
                                                   (coe
                                                      MAlonzo.Code.Data.List.Kleene.Base.C42
                                                      (coe C162 (coe C222 v10) (coe (0 :: Integer)))
                                                      (coe v7))
                                                   (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                (coe v4)
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> coe
                                         C198 (coe addInt (coe (1 :: Integer)) (coe v1))
                                         (coe
                                            C208
                                            (coe
                                               MAlonzo.Code.Data.List.Kleene.Base.C42
                                               (coe C162 (coe C222 v10) (coe v9)) (coe v7))
                                            (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                         (coe v4)
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name320 = "Tactic.RingSolver.Core.Polynomial.Base.PolyF"
d320 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> ()
d320 = erased
name324 = "Tactic.RingSolver.Core.Polynomial.Base.Fold"
d324 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> ()
d324 = erased
name330 = "Tactic.RingSolver.Core.Polynomial.Base.para"
d330 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  (MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
   MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d330 v0 v1 v2 v3 v4 v5 = du330 v2 v4 v5
du330 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  (MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
   MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
du330 v0 v1 v2
  = case coe v2 of
      MAlonzo.Code.Data.List.Kleene.Base.C42 v3 v4
        -> case coe v3 of
             C162 v5 v6
               -> case coe v5 of
                    C222 v7
                      -> case coe v4 of
                           MAlonzo.Code.Data.List.Kleene.Base.C46
                             -> let v9
                                      = coe
                                          v1
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v7)
                                             (coe v4)) in
                                case coe v9 of
                                  MAlonzo.Code.Agda.Builtin.Sigma.C32 v10 v11
                                    -> case coe v10 of
                                         C198 v12 v13 v14
                                           -> case coe v13 of
                                                C200 v15
                                                  -> let v16
                                                           = coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                               v0 v15 in
                                                     coe
                                                       seq (coe v16)
                                                       (if coe v16
                                                          then coe
                                                                 du244 (coe v11)
                                                                 (coe
                                                                    addInt (coe (1 :: Integer))
                                                                    (coe v6))
                                                          else coe
                                                                 MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v10) (coe v6))
                                                                    (coe v11)))
                                                C208 v16 v17
                                                  -> coe
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48
                                                       (coe
                                                          MAlonzo.Code.Data.List.Kleene.Base.C42
                                                          (coe C162 (coe C222 v10) (coe v6))
                                                          (coe v11))
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           MAlonzo.Code.Data.List.Kleene.Base.C48 v9
                             -> let v10
                                      = coe
                                          v1
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v7)
                                             (coe du330 (coe v0) (coe v1) (coe v9))) in
                                case coe v10 of
                                  MAlonzo.Code.Agda.Builtin.Sigma.C32 v11 v12
                                    -> case coe v11 of
                                         C198 v13 v14 v15
                                           -> case coe v14 of
                                                C200 v16
                                                  -> let v17
                                                           = coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                               v0 v16 in
                                                     coe
                                                       seq (coe v17)
                                                       (if coe v17
                                                          then coe
                                                                 du244 (coe v12)
                                                                 (coe
                                                                    addInt (coe (1 :: Integer))
                                                                    (coe v6))
                                                          else coe
                                                                 MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v11) (coe v6))
                                                                    (coe v12)))
                                                C208 v17 v18
                                                  -> coe
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48
                                                       (coe
                                                          MAlonzo.Code.Data.List.Kleene.Base.C42
                                                          (coe C162 (coe C222 v11) (coe v6))
                                                          (coe v12))
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name360 = "Tactic.RingSolver.Core.Polynomial.Base.poly-map"
d360 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  (T166 -> T166) ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d360 v0 v1 v2 v3 v4 = du360 v2 v4
du360 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  (T166 -> T166) ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
du360 v0 v1
  = coe du330 (coe v0) (coe MAlonzo.Code.Data.Product.du158 (coe v1))
name366 = "Tactic.RingSolver.Core.Polynomial.Base._⊞_"
d366 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> T166 -> T166
d366 v0 v1 v2 v3 v4 v5
  = case coe v4 of
      C198 v6 v7 v8
        -> case coe v5 of
             C198 v9 v10 v11
               -> coe
                    d378 (coe v0) (coe v1) (coe v2) (coe v6) (coe v9) (coe v3) (coe v8)
                    (coe v11) (coe du96 (coe v8) (coe v11)) (coe v7) (coe v10)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name378 = "Tactic.RingSolver.Core.Polynomial.Base.⊞-match"
d378 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> T56 -> T168 -> T168 -> T166
d378 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10
  = case coe v8 of
      C68 v13
        -> let v15 = subInt (coe v4) (coe (1 :: Integer)) in
           case coe v10 of
             C208 v17 v18
               -> let v19
                        = d384
                            (coe v0) (coe v1) (coe v2) (coe v3) (coe v15) (coe v13) (coe v9)
                            (coe v17) in
                  case coe v19 of
                    MAlonzo.Code.Data.List.Kleene.Base.C46
                      -> coe
                           C198 (coe (0 :: Integer))
                           (coe
                              C200
                              (coe
                                 MAlonzo.Code.Algebra.Bundles.d2028
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                    (coe v2))))
                           (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v5))
                    MAlonzo.Code.Data.List.Kleene.Base.C48 v20
                      -> case coe v20 of
                           MAlonzo.Code.Data.List.Kleene.Base.C42 v21 v22
                             -> case coe v21 of
                                  C162 v23 v24
                                    -> case coe v23 of
                                         C222 v25
                                           -> case coe v24 of
                                                0 -> case coe v22 of
                                                       MAlonzo.Code.Data.List.Kleene.Base.C46
                                                         -> case coe v25 of
                                                              C198 v27 v28 v29
                                                                -> coe
                                                                     C198 (coe v27) (coe v28)
                                                                     (coe
                                                                        MAlonzo.Code.Data.Nat.Properties.du4738
                                                                        (coe
                                                                           MAlonzo.Code.Data.Nat.Base.C152
                                                                           v29)
                                                                        (coe v7))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48 v27
                                                         -> coe
                                                              C198 (coe v4)
                                                              (coe
                                                                 C208
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v25)
                                                                       (coe (0 :: Integer)))
                                                                    (coe v22))
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                              (coe v7)
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> coe
                                                       C198 (coe v4)
                                                       (coe
                                                          C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe C162 (coe C222 v25) (coe v24))
                                                             (coe v22))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v7)
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      C78 v14
        -> let v15 = subInt (coe v3) (coe (1 :: Integer)) in
           case coe v9 of
             C208 v17 v18
               -> let v19
                        = d384
                            (coe v0) (coe v1) (coe v2) (coe v4) (coe v15) (coe v14) (coe v10)
                            (coe v17) in
                  case coe v19 of
                    MAlonzo.Code.Data.List.Kleene.Base.C46
                      -> coe
                           C198 (coe (0 :: Integer))
                           (coe
                              C200
                              (coe
                                 MAlonzo.Code.Algebra.Bundles.d2028
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                    (coe v2))))
                           (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v5))
                    MAlonzo.Code.Data.List.Kleene.Base.C48 v20
                      -> case coe v20 of
                           MAlonzo.Code.Data.List.Kleene.Base.C42 v21 v22
                             -> case coe v21 of
                                  C162 v23 v24
                                    -> case coe v23 of
                                         C222 v25
                                           -> case coe v24 of
                                                0 -> case coe v22 of
                                                       MAlonzo.Code.Data.List.Kleene.Base.C46
                                                         -> case coe v25 of
                                                              C198 v27 v28 v29
                                                                -> coe
                                                                     C198 (coe v27) (coe v28)
                                                                     (coe
                                                                        MAlonzo.Code.Data.Nat.Properties.du4738
                                                                        (coe
                                                                           MAlonzo.Code.Data.Nat.Base.C152
                                                                           v29)
                                                                        (coe v6))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48 v27
                                                         -> coe
                                                              C198 (coe v3)
                                                              (coe
                                                                 C208
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v25)
                                                                       (coe (0 :: Integer)))
                                                                    (coe v22))
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                              (coe v6)
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> coe
                                                       C198 (coe v3)
                                                       (coe
                                                          C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe C162 (coe C222 v25) (coe v24))
                                                             (coe v22))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v6)
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      C84
        -> case coe v9 of
             C200 v13
               -> case coe v10 of
                    C200 v14
                      -> coe
                           C198 (coe (0 :: Integer))
                           (coe
                              C200
                              (coe
                                 MAlonzo.Code.Algebra.Bundles.d2022
                                 (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                    (coe v2))
                                 v13 v14))
                           (coe v6)
                    _ -> MAlonzo.RTE.mazUnreachableError
             C208 v14 v15
               -> let v16 = subInt (coe v3) (coe (1 :: Integer)) in
                  case coe v14 of
                    MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                      -> case coe v17 of
                           C162 v19 v20
                             -> case coe v10 of
                                  C208 v22 v23
                                    -> case coe v22 of
                                         MAlonzo.Code.Data.List.Kleene.Base.C42 v24 v25
                                           -> case coe v24 of
                                                C162 v26 v27
                                                  -> let v28
                                                           = MAlonzo.Code.Data.Nat.Base.d262
                                                               (coe v20) (coe v27) in
                                                     case coe v28 of
                                                       MAlonzo.Code.Data.Nat.Base.C246 v30
                                                         -> let v31
                                                                  = d400
                                                                      (coe v0) (coe v1) (coe v2)
                                                                      (coe v16) (coe v26) (coe v30)
                                                                      (coe v25) (coe v18) in
                                                            case coe v19 of
                                                              C222 v32
                                                                -> case coe v20 of
                                                                     0 -> case coe v31 of
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                              -> case coe v32 of
                                                                                   C198 v34 v35 v36
                                                                                     -> coe
                                                                                          C198
                                                                                          (coe v34)
                                                                                          (coe v35)
                                                                                          (coe
                                                                                             MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                             (coe
                                                                                                MAlonzo.Code.Data.Nat.Base.C152
                                                                                                v36)
                                                                                             (coe
                                                                                                v6))
                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C48 v34
                                                                              -> coe
                                                                                   C198 (coe v3)
                                                                                   (coe
                                                                                      C208
                                                                                      (coe
                                                                                         MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                         (coe
                                                                                            C162
                                                                                            (coe
                                                                                               C222
                                                                                               v32)
                                                                                            (coe
                                                                                               (0 ::
                                                                                                  Integer)))
                                                                                         (coe v31))
                                                                                      (coe
                                                                                         MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                   (coe v6)
                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                     _ -> coe
                                                                            C198 (coe v3)
                                                                            (coe
                                                                               C208
                                                                               (coe
                                                                                  MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                  (coe
                                                                                     C162
                                                                                     (coe C222 v32)
                                                                                     (coe v20))
                                                                                  (coe v31))
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                            (coe v6)
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       MAlonzo.Code.Data.Nat.Base.C250
                                                         -> let v30
                                                                  = d388
                                                                      (coe v0) (coe v1) (coe v2)
                                                                      (coe v16) (coe v18)
                                                                      (coe v25) in
                                                            let v31
                                                                  = d366
                                                                      (coe v0) (coe v1) (coe v2)
                                                                      (coe v16) (coe d218 (coe v19))
                                                                      (coe d218 (coe v26)) in
                                                            case coe v31 of
                                                              C198 v32 v33 v34
                                                                -> case coe v33 of
                                                                     C200 v35
                                                                       -> let v36
                                                                                = let v36
                                                                                        = coe
                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                                                            v2
                                                                                            v35 in
                                                                                  seq
                                                                                    (coe v36)
                                                                                    (if coe v36
                                                                                       then coe
                                                                                              du244
                                                                                              (coe
                                                                                                 v30)
                                                                                              (coe
                                                                                                 addInt
                                                                                                 (coe
                                                                                                    (1 ::
                                                                                                       Integer))
                                                                                                 (coe
                                                                                                    v20))
                                                                                       else coe
                                                                                              MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                                              (coe
                                                                                                 MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                                 (coe
                                                                                                    C162
                                                                                                    (coe
                                                                                                       C222
                                                                                                       v31)
                                                                                                    (coe
                                                                                                       v20))
                                                                                                 (coe
                                                                                                    v30))) in
                                                                          case coe v36 of
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                              -> coe
                                                                                   C198
                                                                                   (coe
                                                                                      (0 ::
                                                                                         Integer))
                                                                                   (coe
                                                                                      C200
                                                                                      (coe
                                                                                         MAlonzo.Code.Algebra.Bundles.d2028
                                                                                         (coe
                                                                                            MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                                                                            (coe
                                                                                               v2))))
                                                                                   (coe
                                                                                      MAlonzo.Code.Data.Nat.Properties.d4748
                                                                                      (coe v5))
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C48 v37
                                                                              -> case coe v37 of
                                                                                   MAlonzo.Code.Data.List.Kleene.Base.C42 v38 v39
                                                                                     -> case coe
                                                                                               v38 of
                                                                                          C162 v40 v41
                                                                                            -> case coe
                                                                                                      v40 of
                                                                                                 C222 v42
                                                                                                   -> case coe
                                                                                                             v41 of
                                                                                                        0 -> case coe
                                                                                                                    v39 of
                                                                                                               MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                                                                 -> case coe
                                                                                                                           v42 of
                                                                                                                      C198 v44 v45 v46
                                                                                                                        -> coe
                                                                                                                             C198
                                                                                                                             (coe
                                                                                                                                v44)
                                                                                                                             (coe
                                                                                                                                v45)
                                                                                                                             (coe
                                                                                                                                MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                                                                (coe
                                                                                                                                   MAlonzo.Code.Data.Nat.Base.C152
                                                                                                                                   v46)
                                                                                                                                (coe
                                                                                                                                   v6))
                                                                                                                      _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                               MAlonzo.Code.Data.List.Kleene.Base.C48 v44
                                                                                                                 -> coe
                                                                                                                      C198
                                                                                                                      (coe
                                                                                                                         v3)
                                                                                                                      (coe
                                                                                                                         C208
                                                                                                                         (coe
                                                                                                                            MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                                                            (coe
                                                                                                                               C162
                                                                                                                               (coe
                                                                                                                                  C222
                                                                                                                                  v42)
                                                                                                                               (coe
                                                                                                                                  (0 ::
                                                                                                                                     Integer)))
                                                                                                                            (coe
                                                                                                                               v39))
                                                                                                                         (coe
                                                                                                                            MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                                                      (coe
                                                                                                                         v6)
                                                                                                               _ -> MAlonzo.RTE.mazUnreachableError
                                                                                                        _ -> coe
                                                                                                               C198
                                                                                                               (coe
                                                                                                                  v3)
                                                                                                               (coe
                                                                                                                  C208
                                                                                                                  (coe
                                                                                                                     MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                                                     (coe
                                                                                                                        C162
                                                                                                                        (coe
                                                                                                                           C222
                                                                                                                           v42)
                                                                                                                        (coe
                                                                                                                           v41))
                                                                                                                     (coe
                                                                                                                        v39))
                                                                                                                  (coe
                                                                                                                     MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                                               (coe
                                                                                                                  v6)
                                                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                     C208 v36 v37
                                                                       -> case coe v20 of
                                                                            0 -> case coe v30 of
                                                                                   MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                                     -> case coe
                                                                                               v31 of
                                                                                          C198 v38 v39 v40
                                                                                            -> coe
                                                                                                 C198
                                                                                                 (coe
                                                                                                    v38)
                                                                                                 (coe
                                                                                                    v39)
                                                                                                 (coe
                                                                                                    MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Data.Nat.Base.C152
                                                                                                       v40)
                                                                                                    (coe
                                                                                                       v6))
                                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                                   MAlonzo.Code.Data.List.Kleene.Base.C48 v38
                                                                                     -> coe
                                                                                          C198
                                                                                          (coe v3)
                                                                                          (coe
                                                                                             C208
                                                                                             (coe
                                                                                                MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                                (coe
                                                                                                   C162
                                                                                                   (coe
                                                                                                      C222
                                                                                                      v31)
                                                                                                   (coe
                                                                                                      (0 ::
                                                                                                         Integer)))
                                                                                                (coe
                                                                                                   v30))
                                                                                             (coe
                                                                                                MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                          (coe v6)
                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                            _ -> coe
                                                                                   C198 (coe v3)
                                                                                   (coe
                                                                                      C208
                                                                                      (coe
                                                                                         MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                         (coe
                                                                                            C162
                                                                                            (coe
                                                                                               C222
                                                                                               v31)
                                                                                            (coe
                                                                                               v20))
                                                                                         (coe v30))
                                                                                      (coe
                                                                                         MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                   (coe v6)
                                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       MAlonzo.Code.Data.Nat.Base.C256 v30
                                                         -> let v31
                                                                  = d400
                                                                      (coe v0) (coe v1) (coe v2)
                                                                      (coe v16) (coe v19) (coe v30)
                                                                      (coe v18) (coe v25) in
                                                            case coe v26 of
                                                              C222 v32
                                                                -> case coe v27 of
                                                                     0 -> case coe v31 of
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                              -> case coe v32 of
                                                                                   C198 v34 v35 v36
                                                                                     -> coe
                                                                                          C198
                                                                                          (coe v34)
                                                                                          (coe v35)
                                                                                          (coe
                                                                                             MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                             (coe
                                                                                                MAlonzo.Code.Data.Nat.Base.C152
                                                                                                v36)
                                                                                             (coe
                                                                                                v6))
                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C48 v34
                                                                              -> coe
                                                                                   C198 (coe v3)
                                                                                   (coe
                                                                                      C208
                                                                                      (coe
                                                                                         MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                         (coe
                                                                                            C162
                                                                                            (coe
                                                                                               C222
                                                                                               v32)
                                                                                            (coe
                                                                                               (0 ::
                                                                                                  Integer)))
                                                                                         (coe v31))
                                                                                      (coe
                                                                                         MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                   (coe v6)
                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                     _ -> coe
                                                                            C198 (coe v3)
                                                                            (coe
                                                                               C208
                                                                               (coe
                                                                                  MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                  (coe
                                                                                     C162
                                                                                     (coe C222 v32)
                                                                                     (coe v27))
                                                                                  (coe v31))
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                            (coe v6)
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name384 = "Tactic.RingSolver.Core.Polynomial.Base.⊞-inj"
d384 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  T168 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d384 v0 v1 v2 v3 v4 v5 v6 v7
  = case coe v7 of
      MAlonzo.Code.Data.List.Kleene.Base.C42 v8 v9
        -> case coe v8 of
             C162 v10 v11
               -> case coe v10 of
                    C222 v12
                      -> case coe v12 of
                           C198 v14 v15 v16
                             -> case coe v11 of
                                  0 -> let v17
                                             = d378
                                                 (coe v0) (coe v1) (coe v2) (coe v14) (coe v3)
                                                 (coe v4) (coe v16) (coe v5)
                                                 (coe du96 (coe v16) (coe v5)) (coe v15) (coe v6) in
                                       let v18 = 0 :: Integer in
                                       case coe v17 of
                                         C198 v19 v20 v21
                                           -> case coe v20 of
                                                C200 v22
                                                  -> let v23
                                                           = coe
                                                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                               v2 v22 in
                                                     coe
                                                       seq (coe v23)
                                                       (if coe v23
                                                          then coe
                                                                 du244 (coe v9) (coe (1 :: Integer))
                                                          else coe
                                                                 MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v17)
                                                                       (coe v18))
                                                                    (coe v9)))
                                                C208 v23 v24
                                                  -> coe
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48
                                                       (coe
                                                          MAlonzo.Code.Data.List.Kleene.Base.C42
                                                          (coe C162 (coe C222 v17) (coe v18))
                                                          (coe v9))
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> let v17 = subInt (coe v11) (coe (1 :: Integer)) in
                                       let v18
                                             = coe
                                                 MAlonzo.Code.Data.List.Kleene.Base.C48
                                                 (coe
                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                    (coe C162 (coe C222 v12) (coe v17)) (coe v9)) in
                                       let v19 = coe C198 (coe v3) (coe v6) (coe v5) in
                                       let v20 = 0 :: Integer in
                                       case coe v6 of
                                         C200 v21
                                           -> let v22
                                                    = coe
                                                        MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                        v2 v21 in
                                              coe
                                                seq (coe v22)
                                                (if coe v22
                                                   then coe du244 (coe v18) (coe (1 :: Integer))
                                                   else coe
                                                          MAlonzo.Code.Data.List.Kleene.Base.C48
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe C162 (coe C222 v19) (coe v20))
                                                             (coe v18)))
                                         C208 v22 v23
                                           -> coe
                                                MAlonzo.Code.Data.List.Kleene.Base.C48
                                                (coe
                                                   MAlonzo.Code.Data.List.Kleene.Base.C42
                                                   (coe C162 (coe C222 v19) (coe v20)) (coe v18))
                                         _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name388 = "Tactic.RingSolver.Core.Polynomial.Base.⊞-coeffs"
d388 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d388 v0 v1 v2 v3 v4 v5
  = case coe v4 of
      MAlonzo.Code.Data.List.Kleene.Base.C46 -> coe v5
      MAlonzo.Code.Data.List.Kleene.Base.C48 v6
        -> case coe v6 of
             MAlonzo.Code.Data.List.Kleene.Base.C42 v7 v8
               -> case coe v7 of
                    C162 v9 v10
                      -> coe
                           d400 (coe v0) (coe v1) (coe v2) (coe v3) (coe v9) (coe v10)
                           (coe v8) (coe v5)
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name396 = "Tactic.RingSolver.Core.Polynomial.Base.⊞-zip"
d396 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T240 ->
  T174 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  T174 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d396 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10
  = case coe v6 of
      MAlonzo.Code.Data.Nat.Base.C246 v12
        -> coe
             MAlonzo.Code.Data.List.Kleene.Base.C48
             (coe
                MAlonzo.Code.Data.List.Kleene.Base.C42 (coe C162 (coe v7) (coe v3))
                (coe
                   d400 (coe v0) (coe v1) (coe v2) (coe v5) (coe v9) (coe v12)
                   (coe v10) (coe v8)))
      MAlonzo.Code.Data.Nat.Base.C250
        -> let v12
                 = d388 (coe v0) (coe v1) (coe v2) (coe v5) (coe v8) (coe v10) in
           let v13
                 = d366
                     (coe v0) (coe v1) (coe v2) (coe v5) (coe d218 (coe v7))
                     (coe d218 (coe v9)) in
           case coe v13 of
             C198 v14 v15 v16
               -> case coe v15 of
                    C200 v17
                      -> let v18
                               = coe
                                   MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v2
                                   v17 in
                         coe
                           seq (coe v18)
                           (if coe v18
                              then coe du244 (coe v12) (coe addInt (coe (1 :: Integer)) (coe v3))
                              else coe
                                     MAlonzo.Code.Data.List.Kleene.Base.C48
                                     (coe
                                        MAlonzo.Code.Data.List.Kleene.Base.C42
                                        (coe C162 (coe C222 v13) (coe v3)) (coe v12)))
                    C208 v18 v19
                      -> coe
                           MAlonzo.Code.Data.List.Kleene.Base.C48
                           (coe
                              MAlonzo.Code.Data.List.Kleene.Base.C42
                              (coe C162 (coe C222 v13) (coe v3)) (coe v12))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Data.Nat.Base.C256 v12
        -> coe
             MAlonzo.Code.Data.List.Kleene.Base.C48
             (coe
                MAlonzo.Code.Data.List.Kleene.Base.C42 (coe C162 (coe v9) (coe v4))
                (coe
                   d400 (coe v0) (coe v1) (coe v2) (coe v5) (coe v7) (coe v12)
                   (coe v8) (coe v10)))
      _ -> MAlonzo.RTE.mazUnreachableError
name400 = "Tactic.RingSolver.Core.Polynomial.Base.⊞-zip-r"
d400 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  T174 ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d400 v0 v1 v2 v3 v4 v5 v6 v7
  = case coe v7 of
      MAlonzo.Code.Data.List.Kleene.Base.C46
        -> coe
             MAlonzo.Code.Data.List.Kleene.Base.C48
             (coe
                MAlonzo.Code.Data.List.Kleene.Base.C42 (coe C162 (coe v4) (coe v5))
                (coe v6))
      MAlonzo.Code.Data.List.Kleene.Base.C48 v8
        -> case coe v8 of
             MAlonzo.Code.Data.List.Kleene.Base.C42 v9 v10
               -> case coe v9 of
                    C162 v11 v12
                      -> coe
                           d396 (coe v0) (coe v1) (coe v2) (coe v5) (coe v12) (coe v3)
                           (coe MAlonzo.Code.Data.Nat.Base.d262 (coe v5) (coe v12)) (coe v4)
                           (coe v6) (coe v11) (coe v10)
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name530 = "Tactic.RingSolver.Core.Polynomial.Base.⊟-step"
d530 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> MAlonzo.Code.Induction.WellFounded.T42 -> T166 -> T166
d530 v0 v1 v2 v3 v4 v5 = du530 v2 v3 v5
du530 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> T166
du530 v0 v1 v2
  = case coe v2 of
      C198 v3 v4 v5
        -> case coe v4 of
             C200 v6
               -> coe
                    C198 (coe (0 :: Integer))
                    (coe
                       C200
                       (coe
                          MAlonzo.Code.Algebra.Bundles.d2026
                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                             (coe v0))
                          v6))
                    (coe v5)
             C208 v7 v8
               -> let v9 = subInt (coe v3) (coe (1 :: Integer)) in
                  let v10
                        = coe
                            du330 (coe v0)
                            (coe MAlonzo.Code.Data.Product.du158 (coe du530 (coe v0) (coe v9)))
                            (coe v7) in
                  case coe v10 of
                    MAlonzo.Code.Data.List.Kleene.Base.C46
                      -> coe
                           C198 (coe (0 :: Integer))
                           (coe
                              C200
                              (coe
                                 MAlonzo.Code.Algebra.Bundles.d2028
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                    (coe v0))))
                           (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v1))
                    MAlonzo.Code.Data.List.Kleene.Base.C48 v11
                      -> case coe v11 of
                           MAlonzo.Code.Data.List.Kleene.Base.C42 v12 v13
                             -> case coe v12 of
                                  C162 v14 v15
                                    -> case coe v14 of
                                         C222 v16
                                           -> case coe v15 of
                                                0 -> case coe v13 of
                                                       MAlonzo.Code.Data.List.Kleene.Base.C46
                                                         -> case coe v16 of
                                                              C198 v18 v19 v20
                                                                -> coe
                                                                     C198 (coe v18) (coe v19)
                                                                     (coe
                                                                        MAlonzo.Code.Data.Nat.Properties.du4738
                                                                        (coe
                                                                           MAlonzo.Code.Data.Nat.Base.C152
                                                                           v20)
                                                                        (coe v5))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48 v18
                                                         -> coe
                                                              C198 (coe v3)
                                                              (coe
                                                                 C208
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v16)
                                                                       (coe (0 :: Integer)))
                                                                    (coe v13))
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                              (coe v5)
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> coe
                                                       C198 (coe v3)
                                                       (coe
                                                          C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe C162 (coe C222 v16) (coe v15))
                                                             (coe v13))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v5)
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name546 = "Tactic.RingSolver.Core.Polynomial.Base.⊟_"
d546 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> T166
d546 v0 v1 v2 v3 = du546 v2 v3
du546 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> T166
du546 v0 v1 = coe du530 (coe v0) (coe v1)
name550 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-step′"
d550 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 -> T166 -> T166 -> T166
d550 v0 v1 v2 v3 v4 v5 = du550 v0 v1 v2 v3 v5
du550 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> T166 -> T166
du550 v0 v1 v2 v3 v4
  = case coe v4 of
      C198 v5 v6 v7 -> coe du556 v0 v1 v2 v5 v3 v6 v7
      _ -> MAlonzo.RTE.mazUnreachableError
name556 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-step"
d556 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  T168 -> MAlonzo.Code.Data.Nat.Base.T142 -> T166 -> T166
d556 v0 v1 v2 v3 v4 v5 v6 = du556 v0 v1 v2 v3 v4 v6
du556 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer -> T168 -> MAlonzo.Code.Data.Nat.Base.T142 -> T166 -> T166
du556 v0 v1 v2 v3 v4 v5
  = case coe v5 of
      C200 v6
        -> coe
             (\ v7 v8 ->
                case coe v8 of
                  C198 v9 v10 v11
                    -> case coe v10 of
                         C200 v12
                           -> coe
                                C198 (coe (0 :: Integer))
                                (coe
                                   C200
                                   (coe
                                      MAlonzo.Code.Algebra.Bundles.d2024
                                      (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                         (coe v2))
                                      v6 v12))
                                (coe v11)
                         C208 v13 v14
                           -> let v15 = subInt (coe v9) (coe (1 :: Integer)) in
                              let v16
                                    = coe
                                        du570 (coe v0) (coe v1) (coe v2) (coe v15) (coe v6)
                                        (coe v13) in
                              case coe v16 of
                                MAlonzo.Code.Data.List.Kleene.Base.C46
                                  -> coe
                                       C198 (coe (0 :: Integer))
                                       (coe
                                          C200
                                          (coe
                                             MAlonzo.Code.Algebra.Bundles.d2028
                                             (coe
                                                MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                                (coe v2))))
                                       (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v4))
                                MAlonzo.Code.Data.List.Kleene.Base.C48 v17
                                  -> case coe v17 of
                                       MAlonzo.Code.Data.List.Kleene.Base.C42 v18 v19
                                         -> case coe v18 of
                                              C162 v20 v21
                                                -> case coe v20 of
                                                     C222 v22
                                                       -> case coe v21 of
                                                            0 -> case coe v19 of
                                                                   MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                     -> case coe v22 of
                                                                          C198 v24 v25 v26
                                                                            -> coe
                                                                                 C198 (coe v24)
                                                                                 (coe v25)
                                                                                 (coe
                                                                                    MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                    (coe
                                                                                       MAlonzo.Code.Data.Nat.Base.C152
                                                                                       v26)
                                                                                    (coe v11))
                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                   MAlonzo.Code.Data.List.Kleene.Base.C48 v24
                                                                     -> coe
                                                                          C198 (coe v9)
                                                                          (coe
                                                                             C208
                                                                             (coe
                                                                                MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                (coe
                                                                                   C162
                                                                                   (coe C222 v22)
                                                                                   (coe
                                                                                      (0 ::
                                                                                         Integer)))
                                                                                (coe v19))
                                                                             (coe
                                                                                MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                          (coe v11)
                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                            _ -> coe
                                                                   C198 (coe v9)
                                                                   (coe
                                                                      C208
                                                                      (coe
                                                                         MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                         (coe
                                                                            C162 (coe C222 v22)
                                                                            (coe v21))
                                                                         (coe v19))
                                                                      (coe
                                                                         MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                   (coe v11)
                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                              _ -> MAlonzo.RTE.mazUnreachableError
                                       _ -> MAlonzo.RTE.mazUnreachableError
                                _ -> MAlonzo.RTE.mazUnreachableError
                         _ -> MAlonzo.RTE.mazUnreachableError
                  _ -> MAlonzo.RTE.mazUnreachableError)
      C208 v7 v8
        -> let v9 = subInt (coe v3) (coe (1 :: Integer)) in
           coe du566 (coe v0) (coe v1) (coe v2) (coe v9) (coe v4) (coe v7)
      _ -> MAlonzo.RTE.mazUnreachableError
name560 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-Κ"
d560 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 -> AgdaAny -> T166 -> T166
d560 v0 v1 v2 v3 v4 v5 v6 = du560 v0 v1 v2 v3 v5 v6
du560 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> AgdaAny -> T166 -> T166
du560 v0 v1 v2 v3 v4 v5
  = case coe v5 of
      C198 v6 v7 v8
        -> case coe v7 of
             C200 v9
               -> coe
                    C198 (coe (0 :: Integer))
                    (coe
                       C200
                       (coe
                          MAlonzo.Code.Algebra.Bundles.d2024
                          (MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                             (coe v2))
                          v4 v9))
                    (coe v8)
             C208 v10 v11
               -> let v12 = subInt (coe v6) (coe (1 :: Integer)) in
                  let v13
                        = coe
                            du570 (coe v0) (coe v1) (coe v2) (coe v12) (coe v4) (coe v10) in
                  case coe v13 of
                    MAlonzo.Code.Data.List.Kleene.Base.C46
                      -> coe
                           C198 (coe (0 :: Integer))
                           (coe
                              C200
                              (coe
                                 MAlonzo.Code.Algebra.Bundles.d2028
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                    (coe v2))))
                           (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v3))
                    MAlonzo.Code.Data.List.Kleene.Base.C48 v14
                      -> case coe v14 of
                           MAlonzo.Code.Data.List.Kleene.Base.C42 v15 v16
                             -> case coe v15 of
                                  C162 v17 v18
                                    -> case coe v17 of
                                         C222 v19
                                           -> case coe v18 of
                                                0 -> case coe v16 of
                                                       MAlonzo.Code.Data.List.Kleene.Base.C46
                                                         -> case coe v19 of
                                                              C198 v21 v22 v23
                                                                -> coe
                                                                     C198 (coe v21) (coe v22)
                                                                     (coe
                                                                        MAlonzo.Code.Data.Nat.Properties.du4738
                                                                        (coe
                                                                           MAlonzo.Code.Data.Nat.Base.C152
                                                                           v23)
                                                                        (coe v8))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48 v21
                                                         -> coe
                                                              C198 (coe v6)
                                                              (coe
                                                                 C208
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v19)
                                                                       (coe (0 :: Integer)))
                                                                    (coe v16))
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                              (coe v8)
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> coe
                                                       C198 (coe v6)
                                                       (coe
                                                          C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe C162 (coe C222 v19) (coe v18))
                                                             (coe v16))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v8)
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name566 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-⅀"
d566 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> T166 -> T166
d566 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du566 v0 v1 v2 v3 v4 v6 v7 v8
du566 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> T166 -> T166
du566 v0 v1 v2 v3 v4 v5 v6 v7
  = case coe v7 of
      C198 v8 v9 v10
        -> case coe v9 of
             C200 v11
               -> let v12
                        = coe
                            du570 (coe v0) (coe v1) (coe v2) (coe v3) (coe v11) (coe v5) in
                  case coe v12 of
                    MAlonzo.Code.Data.List.Kleene.Base.C46
                      -> coe
                           C198 (coe (0 :: Integer))
                           (coe
                              C200
                              (coe
                                 MAlonzo.Code.Algebra.Bundles.d2028
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                    (coe v2))))
                           (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v4))
                    MAlonzo.Code.Data.List.Kleene.Base.C48 v13
                      -> case coe v13 of
                           MAlonzo.Code.Data.List.Kleene.Base.C42 v14 v15
                             -> case coe v14 of
                                  C162 v16 v17
                                    -> case coe v16 of
                                         C222 v18
                                           -> case coe v17 of
                                                0 -> case coe v15 of
                                                       MAlonzo.Code.Data.List.Kleene.Base.C46
                                                         -> case coe v18 of
                                                              C198 v20 v21 v22
                                                                -> coe
                                                                     C198 (coe v20) (coe v21)
                                                                     (coe
                                                                        MAlonzo.Code.Data.Nat.Properties.du4738
                                                                        (coe
                                                                           MAlonzo.Code.Data.Nat.Base.C152
                                                                           v22)
                                                                        (coe v6))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48 v20
                                                         -> coe
                                                              C198
                                                              (coe
                                                                 addInt (coe (1 :: Integer))
                                                                 (coe v3))
                                                              (coe
                                                                 C208
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v18)
                                                                       (coe (0 :: Integer)))
                                                                    (coe v15))
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                              (coe v6)
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> coe
                                                       C198
                                                       (coe addInt (coe (1 :: Integer)) (coe v3))
                                                       (coe
                                                          C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe C162 (coe C222 v18) (coe v17))
                                                             (coe v15))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v6)
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             C208 v12 v13
               -> let v14 = subInt (coe v8) (coe (1 :: Integer)) in
                  coe
                    du588 (coe v0) (coe v1) (coe v2) (coe v3) (coe v14) (coe v4)
                    (coe v6) (coe v10) (coe du96 (coe v6) (coe v10)) (coe v5) (coe v12)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name570 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-Κ-inj"
d570 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  AgdaAny ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d570 v0 v1 v2 v3 v4 v5 v6 = du570 v0 v1 v2 v3 v5 v6
du570 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
du570 v0 v1 v2 v3 v4 v5
  = coe
      du330 (coe v2)
      (coe
         MAlonzo.Code.Data.Product.du158
         (coe du560 (coe v0) (coe v1) (coe v2) (coe v3) (coe v4)))
      (coe v5)
name576 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-⅀-inj"
d576 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 -> T166 -> T166
d576 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du576 v0 v1 v2 v3 v4 v6 v7 v8
du576 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 -> T166 -> T166
du576 v0 v1 v2 v3 v4 v5 v6 v7
  = case coe v7 of
      C198 v8 v9 v10
        -> case coe v9 of
             C200 v11
               -> let v12
                        = coe
                            du570 (coe v0) (coe v1) (coe v2) (coe v3) (coe v11) (coe v6) in
                  case coe v12 of
                    MAlonzo.Code.Data.List.Kleene.Base.C46
                      -> coe
                           C198 (coe (0 :: Integer))
                           (coe
                              C200
                              (coe
                                 MAlonzo.Code.Algebra.Bundles.d2028
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                    (coe v2))))
                           (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v4))
                    MAlonzo.Code.Data.List.Kleene.Base.C48 v13
                      -> case coe v13 of
                           MAlonzo.Code.Data.List.Kleene.Base.C42 v14 v15
                             -> case coe v14 of
                                  C162 v16 v17
                                    -> case coe v16 of
                                         C222 v18
                                           -> case coe v17 of
                                                0 -> case coe v15 of
                                                       MAlonzo.Code.Data.List.Kleene.Base.C46
                                                         -> case coe v18 of
                                                              C198 v20 v21 v22
                                                                -> coe
                                                                     C198 (coe v20) (coe v21)
                                                                     (coe
                                                                        MAlonzo.Code.Data.Nat.Properties.du4738
                                                                        (coe
                                                                           MAlonzo.Code.Data.Nat.Base.C152
                                                                           v22)
                                                                        (coe v5))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48 v20
                                                         -> coe
                                                              C198
                                                              (coe
                                                                 addInt (coe (1 :: Integer))
                                                                 (coe v3))
                                                              (coe
                                                                 C208
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v18)
                                                                       (coe (0 :: Integer)))
                                                                    (coe v15))
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                              (coe v5)
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> coe
                                                       C198
                                                       (coe addInt (coe (1 :: Integer)) (coe v3))
                                                       (coe
                                                          C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe C162 (coe C222 v18) (coe v17))
                                                             (coe v15))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v5)
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             C208 v12 v13
               -> let v14 = subInt (coe v8) (coe (1 :: Integer)) in
                  coe
                    du588 (coe v0) (coe v1) (coe v2) (coe v3) (coe v14) (coe v4)
                    (coe v5) (coe v10) (coe du96 (coe v5) (coe v10)) (coe v6) (coe v12)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name588 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-match"
d588 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  T56 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 -> T166
d588 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11
  = du588 v0 v1 v2 v3 v4 v5 v7 v8 v9 v10 v11
du588 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  T56 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 -> T166
du588 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10
  = case coe v8 of
      C68 v13
        -> let v15
                 = coe
                     du330 (coe v2)
                     (coe
                        MAlonzo.Code.Data.Product.du158
                        (coe
                           du576 (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) (coe v13)
                           (coe v9)))
                     (coe v10) in
           case coe v15 of
             MAlonzo.Code.Data.List.Kleene.Base.C46
               -> coe
                    C198 (coe (0 :: Integer))
                    (coe
                       C200
                       (coe
                          MAlonzo.Code.Algebra.Bundles.d2028
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                             (coe v2))))
                    (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v5))
             MAlonzo.Code.Data.List.Kleene.Base.C48 v16
               -> case coe v16 of
                    MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                      -> case coe v17 of
                           C162 v19 v20
                             -> case coe v19 of
                                  C222 v21
                                    -> case coe v20 of
                                         0 -> case coe v18 of
                                                MAlonzo.Code.Data.List.Kleene.Base.C46
                                                  -> case coe v21 of
                                                       C198 v23 v24 v25
                                                         -> coe
                                                              C198 (coe v23) (coe v24)
                                                              (coe
                                                                 MAlonzo.Code.Data.Nat.Properties.du4738
                                                                 (coe
                                                                    MAlonzo.Code.Data.Nat.Base.C152
                                                                    v25)
                                                                 (coe v7))
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                MAlonzo.Code.Data.List.Kleene.Base.C48 v23
                                                  -> coe
                                                       C198
                                                       (coe addInt (coe (1 :: Integer)) (coe v4))
                                                       (coe
                                                          C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe
                                                                C162 (coe C222 v21)
                                                                (coe (0 :: Integer)))
                                                             (coe v18))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v7)
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> coe
                                                C198 (coe addInt (coe (1 :: Integer)) (coe v4))
                                                (coe
                                                   C208
                                                   (coe
                                                      MAlonzo.Code.Data.List.Kleene.Base.C42
                                                      (coe C162 (coe C222 v21) (coe v20)) (coe v18))
                                                   (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                (coe v7)
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      C78 v14
        -> let v15
                 = coe
                     du330 (coe v2)
                     (coe
                        MAlonzo.Code.Data.Product.du158
                        (coe
                           du576 (coe v0) (coe v1) (coe v2) (coe v4) (coe v3) (coe v14)
                           (coe v10)))
                     (coe v9) in
           case coe v15 of
             MAlonzo.Code.Data.List.Kleene.Base.C46
               -> coe
                    C198 (coe (0 :: Integer))
                    (coe
                       C200
                       (coe
                          MAlonzo.Code.Algebra.Bundles.d2028
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                             (coe v2))))
                    (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v5))
             MAlonzo.Code.Data.List.Kleene.Base.C48 v16
               -> case coe v16 of
                    MAlonzo.Code.Data.List.Kleene.Base.C42 v17 v18
                      -> case coe v17 of
                           C162 v19 v20
                             -> case coe v19 of
                                  C222 v21
                                    -> case coe v20 of
                                         0 -> case coe v18 of
                                                MAlonzo.Code.Data.List.Kleene.Base.C46
                                                  -> case coe v21 of
                                                       C198 v23 v24 v25
                                                         -> coe
                                                              C198 (coe v23) (coe v24)
                                                              (coe
                                                                 MAlonzo.Code.Data.Nat.Properties.du4738
                                                                 (coe
                                                                    MAlonzo.Code.Data.Nat.Base.C152
                                                                    v25)
                                                                 (coe v6))
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                MAlonzo.Code.Data.List.Kleene.Base.C48 v23
                                                  -> coe
                                                       C198
                                                       (coe addInt (coe (1 :: Integer)) (coe v3))
                                                       (coe
                                                          C208
                                                          (coe
                                                             MAlonzo.Code.Data.List.Kleene.Base.C42
                                                             (coe
                                                                C162 (coe C222 v21)
                                                                (coe (0 :: Integer)))
                                                             (coe v18))
                                                          (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                       (coe v6)
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> coe
                                                C198 (coe addInt (coe (1 :: Integer)) (coe v3))
                                                (coe
                                                   C208
                                                   (coe
                                                      MAlonzo.Code.Data.List.Kleene.Base.C42
                                                      (coe C162 (coe C222 v21) (coe v20)) (coe v18))
                                                   (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                (coe v6)
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      C84
        -> case coe v10 of
             MAlonzo.Code.Data.List.Kleene.Base.C42 v13 v14
               -> case coe v13 of
                    C162 v15 v16
                      -> case coe v15 of
                           C222 v17
                             -> case coe v14 of
                                  MAlonzo.Code.Data.List.Kleene.Base.C46
                                    -> let v19
                                             = coe
                                                 du244
                                                 (coe
                                                    du330 (coe v2)
                                                    (coe
                                                       MAlonzo.Code.Data.Product.du158
                                                       (coe
                                                          du550 (coe v0) (coe v1) (coe v2) (coe v3)
                                                          (coe v17)))
                                                    (coe v9))
                                                 (coe v16) in
                                       case coe v19 of
                                         MAlonzo.Code.Data.List.Kleene.Base.C46
                                           -> coe
                                                C198 (coe (0 :: Integer))
                                                (coe
                                                   C200
                                                   (coe
                                                      MAlonzo.Code.Algebra.Bundles.d2028
                                                      (coe
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                                         (coe v2))))
                                                (coe
                                                   MAlonzo.Code.Data.Nat.Properties.d4748 (coe v5))
                                         MAlonzo.Code.Data.List.Kleene.Base.C48 v20
                                           -> case coe v20 of
                                                MAlonzo.Code.Data.List.Kleene.Base.C42 v21 v22
                                                  -> case coe v21 of
                                                       C162 v23 v24
                                                         -> case coe v23 of
                                                              C222 v25
                                                                -> case coe v24 of
                                                                     0 -> case coe v22 of
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                              -> case coe v25 of
                                                                                   C198 v27 v28 v29
                                                                                     -> coe
                                                                                          C198
                                                                                          (coe v27)
                                                                                          (coe v28)
                                                                                          (coe
                                                                                             MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                             (coe
                                                                                                MAlonzo.Code.Data.Nat.Base.C152
                                                                                                v29)
                                                                                             (coe
                                                                                                v6))
                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C48 v27
                                                                              -> coe
                                                                                   C198
                                                                                   (coe
                                                                                      addInt
                                                                                      (coe
                                                                                         (1 ::
                                                                                            Integer))
                                                                                      (coe v3))
                                                                                   (coe
                                                                                      C208
                                                                                      (coe
                                                                                         MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                         (coe
                                                                                            C162
                                                                                            (coe
                                                                                               C222
                                                                                               v25)
                                                                                            (coe
                                                                                               (0 ::
                                                                                                  Integer)))
                                                                                         (coe v22))
                                                                                      (coe
                                                                                         MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                   (coe v6)
                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                     _ -> coe
                                                                            C198
                                                                            (coe
                                                                               addInt
                                                                               (coe (1 :: Integer))
                                                                               (coe v3))
                                                                            (coe
                                                                               C208
                                                                               (coe
                                                                                  MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                  (coe
                                                                                     C162
                                                                                     (coe C222 v25)
                                                                                     (coe v24))
                                                                                  (coe v22))
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                            (coe v6)
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  MAlonzo.Code.Data.List.Kleene.Base.C48 v19
                                    -> let v20
                                             = coe
                                                 du244
                                                 (coe
                                                    du330 (coe v2)
                                                    (coe
                                                       (\ v20 ->
                                                          case coe v20 of
                                                            MAlonzo.Code.Agda.Builtin.Sigma.C32 v21 v22
                                                              -> case coe v21 of
                                                                   C198 v23 v24 v25
                                                                     -> coe
                                                                          MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                                          (coe
                                                                             du556 v0 v1 v2 v23 v3
                                                                             v24 v25 v17)
                                                                          (coe
                                                                             d388 (coe v0) (coe v1)
                                                                             (coe v2) (coe v3)
                                                                             (coe
                                                                                du330 (coe v2)
                                                                                (coe
                                                                                   MAlonzo.Code.Data.Product.du158
                                                                                   (coe
                                                                                      du556 v0 v1 v2
                                                                                      v23 v3 v24
                                                                                      v25))
                                                                                (coe v19))
                                                                             (coe v22))
                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                            _ -> MAlonzo.RTE.mazUnreachableError))
                                                    (coe v9))
                                                 (coe v16) in
                                       case coe v20 of
                                         MAlonzo.Code.Data.List.Kleene.Base.C46
                                           -> coe
                                                C198 (coe (0 :: Integer))
                                                (coe
                                                   C200
                                                   (coe
                                                      MAlonzo.Code.Algebra.Bundles.d2028
                                                      (coe
                                                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                                         (coe v2))))
                                                (coe
                                                   MAlonzo.Code.Data.Nat.Properties.d4748 (coe v5))
                                         MAlonzo.Code.Data.List.Kleene.Base.C48 v21
                                           -> case coe v21 of
                                                MAlonzo.Code.Data.List.Kleene.Base.C42 v22 v23
                                                  -> case coe v22 of
                                                       C162 v24 v25
                                                         -> case coe v24 of
                                                              C222 v26
                                                                -> case coe v25 of
                                                                     0 -> case coe v23 of
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                              -> case coe v26 of
                                                                                   C198 v28 v29 v30
                                                                                     -> coe
                                                                                          C198
                                                                                          (coe v28)
                                                                                          (coe v29)
                                                                                          (coe
                                                                                             MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                             (coe
                                                                                                MAlonzo.Code.Data.Nat.Base.C152
                                                                                                v30)
                                                                                             (coe
                                                                                                v6))
                                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C48 v28
                                                                              -> coe
                                                                                   C198
                                                                                   (coe
                                                                                      addInt
                                                                                      (coe
                                                                                         (1 ::
                                                                                            Integer))
                                                                                      (coe v3))
                                                                                   (coe
                                                                                      C208
                                                                                      (coe
                                                                                         MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                         (coe
                                                                                            C162
                                                                                            (coe
                                                                                               C222
                                                                                               v26)
                                                                                            (coe
                                                                                               (0 ::
                                                                                                  Integer)))
                                                                                         (coe v23))
                                                                                      (coe
                                                                                         MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                   (coe v6)
                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                     _ -> coe
                                                                            C198
                                                                            (coe
                                                                               addInt
                                                                               (coe (1 :: Integer))
                                                                               (coe v3))
                                                                            (coe
                                                                               C208
                                                                               (coe
                                                                                  MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                  (coe
                                                                                     C162
                                                                                     (coe C222 v26)
                                                                                     (coe v25))
                                                                                  (coe v23))
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                            (coe v6)
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name592 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-coeffs"
d592 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
d592 v0 v1 v2 v3 v4 v5 v6 = du592 v0 v1 v2 v3 v5 v6
du592 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Data.List.Kleene.Base.T30
du592 v0 v1 v2 v3 v4 v5
  = case coe v5 of
      MAlonzo.Code.Data.List.Kleene.Base.C42 v6 v7
        -> case coe v6 of
             C162 v8 v9
               -> case coe v8 of
                    C222 v10
                      -> case coe v7 of
                           MAlonzo.Code.Data.List.Kleene.Base.C46
                             -> coe
                                  du244
                                  (coe
                                     du330 (coe v2)
                                     (coe
                                        MAlonzo.Code.Data.Product.du158
                                        (coe du550 (coe v0) (coe v1) (coe v2) (coe v3) (coe v10)))
                                     (coe v4))
                                  (coe v9)
                           MAlonzo.Code.Data.List.Kleene.Base.C48 v12
                             -> coe
                                  du244
                                  (coe
                                     du330 (coe v2)
                                     (coe
                                        (\ v13 ->
                                           case coe v13 of
                                             MAlonzo.Code.Agda.Builtin.Sigma.C32 v14 v15
                                               -> case coe v14 of
                                                    C198 v16 v17 v18
                                                      -> coe
                                                           MAlonzo.Code.Agda.Builtin.Sigma.C32
                                                           (coe du556 v0 v1 v2 v16 v3 v17 v18 v10)
                                                           (coe
                                                              d388 (coe v0) (coe v1) (coe v2)
                                                              (coe v3)
                                                              (coe
                                                                 du330 (coe v2)
                                                                 (coe
                                                                    MAlonzo.Code.Data.Product.du158
                                                                    (coe
                                                                       du556 v0 v1 v2 v16 v3 v17
                                                                       v18))
                                                                 (coe v12))
                                                              (coe v15))
                                                    _ -> MAlonzo.RTE.mazUnreachableError
                                             _ -> MAlonzo.RTE.mazUnreachableError))
                                     (coe v4))
                                  (coe v9)
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name596 = "Tactic.RingSolver.Core.Polynomial.Base.⊠-cons"
d596 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 ->
  T166 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d596 v0 v1 v2 v3 v4 v5 v6 v7 = du596 v0 v1 v2 v3 v5 v6 v7
du596 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer ->
  T166 ->
  MAlonzo.Code.Data.List.Kleene.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du596 v0 v1 v2 v3 v4 v5 v6
  = case coe v6 of
      MAlonzo.Code.Agda.Builtin.Sigma.C32 v7 v8
        -> case coe v7 of
             C198 v9 v10 v11
               -> coe
                    MAlonzo.Code.Agda.Builtin.Sigma.C32
                    (coe du556 v0 v1 v2 v9 v3 v10 v11 v4)
                    (coe
                       d388 (coe v0) (coe v1) (coe v2) (coe v3)
                       (coe
                          du330 (coe v2)
                          (coe
                             MAlonzo.Code.Data.Product.du158 (coe du556 v0 v1 v2 v9 v3 v10 v11))
                          (coe v5))
                       (coe v8))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name730 = "Tactic.RingSolver.Core.Polynomial.Base._⊠_"
d730 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> T166 -> T166
d730 v0 v1 v2 v3 = coe du550 (coe v0) (coe v1) (coe v2) (coe v3)
name734 = "Tactic.RingSolver.Core.Polynomial.Base.κ"
d734 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> AgdaAny -> T166
d734 v0 v1 v2 = du734 v1 v2
du734 :: Integer -> AgdaAny -> T166
du734 v0 v1
  = coe
      C198 (coe (0 :: Integer)) (coe C200 (coe v1))
      (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v0))
name740 = "Tactic.RingSolver.Core.Polynomial.Base.ι"
d740 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> MAlonzo.Code.Data.Fin.Base.T6 -> T166
d740 v0 v1 v2 v3 v4 = du740 v2 v3 v4
du740 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> MAlonzo.Code.Data.Fin.Base.T6 -> T166
du740 v0 v1 v2
  = let v3 = coe du130 (coe v1) (coe v2) in
    let v4
          = let v4 = coe MAlonzo.Code.Data.List.Kleene.Base.C46 in
            let v5
                  = coe
                      C198 (coe (0 :: Integer))
                      (coe
                         C200
                         (coe
                            MAlonzo.Code.Algebra.Bundles.d2030
                            (coe
                               MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                               (coe v0))))
                      (coe
                         MAlonzo.Code.Data.Nat.Properties.d4748
                         (coe du130 (coe v1) (coe v2))) in
            let v6 = 1 :: Integer in
            let v7
                  = MAlonzo.Code.Algebra.Bundles.d2030
                      (coe
                         MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                         (coe v0)) in
            let v8
                  = coe
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26 v0
                      v7 in
            seq
              (coe v8)
              (if coe v8
                 then coe du244 (coe v4) (coe (2 :: Integer))
                 else coe
                        MAlonzo.Code.Data.List.Kleene.Base.C48
                        (coe
                           MAlonzo.Code.Data.List.Kleene.Base.C42
                           (coe C162 (coe C222 v5) (coe v6)) (coe v4))) in
    let v5 = coe du140 (coe v2) in
    case coe v4 of
      MAlonzo.Code.Data.List.Kleene.Base.C46
        -> coe
             C198 (coe (0 :: Integer))
             (coe
                C200
                (coe
                   MAlonzo.Code.Algebra.Bundles.d2028
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                      (coe v0))))
             (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v1))
      MAlonzo.Code.Data.List.Kleene.Base.C48 v6
        -> case coe v6 of
             MAlonzo.Code.Data.List.Kleene.Base.C42 v7 v8
               -> case coe v7 of
                    C162 v9 v10
                      -> case coe v9 of
                           C222 v11
                             -> case coe v10 of
                                  0 -> case coe v8 of
                                         MAlonzo.Code.Data.List.Kleene.Base.C46
                                           -> case coe v11 of
                                                C198 v13 v14 v15
                                                  -> coe
                                                       C198 (coe v13) (coe v14)
                                                       (coe
                                                          MAlonzo.Code.Data.Nat.Properties.du4738
                                                          (coe MAlonzo.Code.Data.Nat.Base.C152 v15)
                                                          (coe v5))
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         MAlonzo.Code.Data.List.Kleene.Base.C48 v13
                                           -> coe
                                                C198 (coe addInt (coe (1 :: Integer)) (coe v3))
                                                (coe
                                                   C208
                                                   (coe
                                                      MAlonzo.Code.Data.List.Kleene.Base.C42
                                                      (coe C162 (coe C222 v11) (coe (0 :: Integer)))
                                                      (coe v8))
                                                   (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                (coe v5)
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> coe
                                         C198 (coe addInt (coe (1 :: Integer)) (coe v3))
                                         (coe
                                            C208
                                            (coe
                                               MAlonzo.Code.Data.List.Kleene.Base.C42
                                               (coe C162 (coe C222 v11) (coe v10)) (coe v8))
                                            (coe MAlonzo.Code.Agda.Builtin.Unit.C8))
                                         (coe v5)
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name746 = "Tactic.RingSolver.Core.Polynomial.Base.⊡-mult"
d746 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> Integer -> T166 -> T166
d746 v0 v1 v2 v3 v4 v5
  = case coe v4 of
      0 -> coe v5
      _ -> let v6 = subInt (coe v4) (coe (1 :: Integer)) in
           coe
             du550 v0 v1 v2 v3
             (d746 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6) (coe v5)) v5
name756 = "Tactic.RingSolver.Core.Polynomial.Base._⊡_+1"
d756 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> Integer -> T166
d756 v0 v1 v2 v3 v4 v5
  = case coe v4 of
      C198 v6 v7 v8
        -> case coe v7 of
             C200 v9
               -> coe
                    C198 (coe (0 :: Integer))
                    (coe
                       C200
                       (coe
                          MAlonzo.Code.Algebra.Operations.Ring.du32
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                             (coe v2))
                          (coe v9) (coe v5)))
                    (coe v8)
             C208 v10 v11
               -> let v12 = subInt (coe v6) (coe (1 :: Integer)) in
                  case coe v10 of
                    MAlonzo.Code.Data.List.Kleene.Base.C42 v13 v14
                      -> case coe v13 of
                           C162 v15 v16
                             -> case coe v14 of
                                  MAlonzo.Code.Data.List.Kleene.Base.C46
                                    -> let v17
                                             = d756
                                                 (coe v0) (coe v1) (coe v2) (coe v12)
                                                 (coe d218 (coe v15)) (coe v5) in
                                       let v18 = addInt (coe mulInt (coe v5) (coe v16)) (coe v16) in
                                       case coe v17 of
                                         C198 v19 v20 v21
                                           -> case coe v20 of
                                                C200 v22
                                                  -> let v23
                                                           = let v23
                                                                   = coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d26
                                                                       v2 v22 in
                                                             seq
                                                               (coe v23)
                                                               (if coe v23
                                                                  then coe
                                                                         du244 (coe v14)
                                                                         (coe
                                                                            addInt
                                                                            (coe (1 :: Integer))
                                                                            (coe v18))
                                                                  else coe
                                                                         MAlonzo.Code.Data.List.Kleene.Base.C48
                                                                         (coe
                                                                            MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                            (coe
                                                                               C162 (coe C222 v17)
                                                                               (coe v18))
                                                                            (coe v14))) in
                                                     case coe v23 of
                                                       MAlonzo.Code.Data.List.Kleene.Base.C46
                                                         -> coe
                                                              C198 (coe (0 :: Integer))
                                                              (coe
                                                                 C200
                                                                 (coe
                                                                    MAlonzo.Code.Algebra.Bundles.d2028
                                                                    (coe
                                                                       MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                                                                       (coe v2))))
                                                              (coe
                                                                 MAlonzo.Code.Data.Nat.Properties.d4748
                                                                 (coe v3))
                                                       MAlonzo.Code.Data.List.Kleene.Base.C48 v24
                                                         -> case coe v24 of
                                                              MAlonzo.Code.Data.List.Kleene.Base.C42 v25 v26
                                                                -> case coe v25 of
                                                                     C162 v27 v28
                                                                       -> case coe v27 of
                                                                            C222 v29
                                                                              -> case coe v28 of
                                                                                   0 -> case coe
                                                                                               v26 of
                                                                                          MAlonzo.Code.Data.List.Kleene.Base.C46
                                                                                            -> case coe
                                                                                                      v29 of
                                                                                                 C198 v31 v32 v33
                                                                                                   -> coe
                                                                                                        C198
                                                                                                        (coe
                                                                                                           v31)
                                                                                                        (coe
                                                                                                           v32)
                                                                                                        (coe
                                                                                                           MAlonzo.Code.Data.Nat.Properties.du4738
                                                                                                           (coe
                                                                                                              MAlonzo.Code.Data.Nat.Base.C152
                                                                                                              v33)
                                                                                                           (coe
                                                                                                              v8))
                                                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                                                          MAlonzo.Code.Data.List.Kleene.Base.C48 v31
                                                                                            -> coe
                                                                                                 C198
                                                                                                 (coe
                                                                                                    v6)
                                                                                                 (coe
                                                                                                    C208
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                                       (coe
                                                                                                          C162
                                                                                                          (coe
                                                                                                             C222
                                                                                                             v29)
                                                                                                          (coe
                                                                                                             (0 ::
                                                                                                                Integer)))
                                                                                                       (coe
                                                                                                          v26))
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                                 (coe
                                                                                                    v8)
                                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                                   _ -> coe
                                                                                          C198
                                                                                          (coe v6)
                                                                                          (coe
                                                                                             C208
                                                                                             (coe
                                                                                                MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                                                (coe
                                                                                                   C162
                                                                                                   (coe
                                                                                                      C222
                                                                                                      v29)
                                                                                                   (coe
                                                                                                      v28))
                                                                                                (coe
                                                                                                   v26))
                                                                                             (coe
                                                                                                MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                                                          (coe v8)
                                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                                     _ -> MAlonzo.RTE.mazUnreachableError
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                C208 v23 v24
                                                  -> case coe v18 of
                                                       0 -> case coe v17 of
                                                              C198 v25 v26 v27
                                                                -> coe
                                                                     C198 (coe v25) (coe v26)
                                                                     (coe
                                                                        MAlonzo.Code.Data.Nat.Properties.du4738
                                                                        (coe
                                                                           MAlonzo.Code.Data.Nat.Base.C152
                                                                           v27)
                                                                        (coe v8))
                                                              _ -> MAlonzo.RTE.mazUnreachableError
                                                       _ -> coe
                                                              C198 (coe v6)
                                                              (coe
                                                                 C208
                                                                 (coe
                                                                    MAlonzo.Code.Data.List.Kleene.Base.C42
                                                                    (coe
                                                                       C162 (coe C222 v17)
                                                                       (coe v18))
                                                                    (coe v14))
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Unit.C8))
                                                              (coe v8)
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  MAlonzo.Code.Data.List.Kleene.Base.C48 v17
                                    -> coe
                                         d746 (coe v0) (coe v1) (coe v2) (coe v3) (coe v5)
                                         (coe C198 (coe v6) (coe C208 v10 v11) (coe v8))
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name780 = "Tactic.RingSolver.Core.Polynomial.Base._⊡_"
d780 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T14 ->
  Integer -> T166 -> Integer -> T166
d780 v0 v1 v2 v3 v4 v5
  = case coe v5 of
      0 -> coe
             C198 (coe (0 :: Integer))
             (coe
                C200
                (coe
                   MAlonzo.Code.Algebra.Bundles.d2030
                   (coe
                      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.d24
                      (coe v2))))
             (coe MAlonzo.Code.Data.Nat.Properties.d4748 (coe v3))
      _ -> let v6 = subInt (coe v5) (coe (1 :: Integer)) in
           coe d756 (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) (coe v6)
