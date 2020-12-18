{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Data.Bool.Base
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.Maybe.Base
import qualified MAlonzo.Code.Data.Nat.Reflection
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Reflection.Term
import qualified MAlonzo.Code.Tactic.RingSolver.Core.NatSet
import qualified MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp

name4 = "Tactic.RingSolver.RingNames"
d4 = ()
data T4
  = C22 MAlonzo.Code.Data.Maybe.Base.T22
        MAlonzo.Code.Data.Maybe.Base.T22 MAlonzo.Code.Data.Maybe.Base.T22
        MAlonzo.Code.Data.Maybe.Base.T22
name14 = "Tactic.RingSolver.RingNames.+′"
d14 :: T4 -> MAlonzo.Code.Data.Maybe.Base.T22
d14 v0
  = case coe v0 of
      C22 v1 v2 v3 v4 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name16 = "Tactic.RingSolver.RingNames.*′"
d16 :: T4 -> MAlonzo.Code.Data.Maybe.Base.T22
d16 v0
  = case coe v0 of
      C22 v1 v2 v3 v4 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name18 = "Tactic.RingSolver.RingNames.^′"
d18 :: T4 -> MAlonzo.Code.Data.Maybe.Base.T22
d18 v0
  = case coe v0 of
      C22 v1 v2 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name20 = "Tactic.RingSolver.RingNames.-′"
d20 :: T4 -> MAlonzo.Code.Data.Maybe.Base.T22
d20 v0
  = case coe v0 of
      C22 v1 v2 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name24 = "Tactic.RingSolver.checkIsRing"
d24 :: MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d24 v0
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d298 v0
      (coe
         MAlonzo.Code.Agda.Builtin.Reflection.C180
         (coe
            (MAlonzo.RTE.QName
               (172 :: Integer) (11528919355260747559 :: Integer)
               "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing"
               (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
         (let v1 = 2 :: Integer in
          let v2 = coe MAlonzo.Code.Agda.Builtin.List.C16 in
          case coe v1 of
            0 -> coe MAlonzo.Code.Agda.Builtin.List.C16
            _ -> let v3 = 1 :: Integer in
                 coe
                   MAlonzo.Code.Agda.Builtin.List.C22
                   (coe
                      MAlonzo.Code.Agda.Builtin.Reflection.C84
                      (coe
                         MAlonzo.Code.Agda.Builtin.Reflection.C68
                         (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                         (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                   (coe MAlonzo.Code.Reflection.Term.d66 (coe v3) (coe v2))))
name28 = "Tactic.RingSolver.getVariableIDs"
d28 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Data.Maybe.Base.T22
d28 = coe d34 (coe MAlonzo.Code.Agda.Builtin.List.C16)
name34 = "Tactic.RingSolver._.go"
d34 ::
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Data.Maybe.Base.T22
d34 v0 v1
  = let v2 = coe MAlonzo.Code.Data.Maybe.Base.C26 in
    case coe v1 of
      MAlonzo.Code.Agda.Builtin.Reflection.C174 v3 v4
        -> case coe v3 of
             MAlonzo.RTE.QName 16 15090436609435731260 _ _
               -> coe MAlonzo.Code.Data.Maybe.Base.C30 (coe v0)
             MAlonzo.RTE.QName 22 15090436609435731260 _ _
               -> case coe v4 of
                    (:) v5 v6
                      -> case coe v6 of
                           (:) v7 v8
                             -> case coe v8 of
                                  (:) v9 v10
                                    -> case coe v9 of
                                         MAlonzo.Code.Agda.Builtin.Reflection.C84 v11 v12
                                           -> case coe v11 of
                                                MAlonzo.Code.Agda.Builtin.Reflection.C68 v13 v14
                                                  -> case coe v13 of
                                                       MAlonzo.Code.Agda.Builtin.Reflection.C50
                                                         -> case coe v14 of
                                                              MAlonzo.Code.Agda.Builtin.Reflection.C58
                                                                -> case coe v12 of
                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C168 v15 v16
                                                                       -> case coe v16 of
                                                                            []
                                                                              -> case coe v10 of
                                                                                   (:) v17 v18
                                                                                     -> case coe
                                                                                               v17 of
                                                                                          MAlonzo.Code.Agda.Builtin.Reflection.C84 v19 v20
                                                                                            -> case coe
                                                                                                      v19 of
                                                                                                 MAlonzo.Code.Agda.Builtin.Reflection.C68 v21 v22
                                                                                                   -> case coe
                                                                                                             v21 of
                                                                                                        MAlonzo.Code.Agda.Builtin.Reflection.C50
                                                                                                          -> case coe
                                                                                                                    v22 of
                                                                                                               MAlonzo.Code.Agda.Builtin.Reflection.C58
                                                                                                                 -> coe
                                                                                                                      d34
                                                                                                                      (coe
                                                                                                                         MAlonzo.Code.Tactic.RingSolver.Core.NatSet.d32
                                                                                                                         (coe
                                                                                                                            v15)
                                                                                                                         (coe
                                                                                                                            v0))
                                                                                                                      (coe
                                                                                                                         v20)
                                                                                                               _ -> coe
                                                                                                                      v2
                                                                                                        _ -> coe
                                                                                                               v2
                                                                                                 _ -> MAlonzo.RTE.mazUnreachableError
                                                                                          _ -> MAlonzo.RTE.mazUnreachableError
                                                                                   _ -> coe v2
                                                                            _ -> coe v2
                                                                     _ -> coe v2
                                                              _ -> coe v2
                                                       _ -> coe v2
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> MAlonzo.RTE.mazUnreachableError
                                  _ -> coe v2
                           _ -> coe v2
                    _ -> coe v2
             _ -> coe v2
      _ -> coe v2
name48 = "Tactic.RingSolver.OverRing._$ʳ_"
d48 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d48 v0 v1 v2
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.C180 (coe v1)
      (let v3 = 2 :: Integer in
       let v4
             = coe
                 MAlonzo.Code.Agda.Builtin.List.C22
                 (coe
                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                    (coe
                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                    (coe v0))
                 (coe v2) in
       case coe v3 of
         0 -> coe v4
         _ -> let v5 = 1 :: Integer in
              coe
                MAlonzo.Code.Agda.Builtin.List.C22
                (coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C84
                   (coe
                      MAlonzo.Code.Agda.Builtin.Reflection.C68
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                (coe MAlonzo.Code.Reflection.Term.d74 (coe v5) (coe v4)))
name54 = "Tactic.RingSolver.OverRing.checkIsListOfVariables"
d54 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d54 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
      (coe
         MAlonzo.Code.Agda.Builtin.Reflection.d298 v1
         (coe
            MAlonzo.Code.Agda.Builtin.Reflection.C180
            (coe
               (MAlonzo.RTE.QName
                  (10 :: Integer) (15090436609435731260 :: Integer)
                  "Agda.Builtin.List.List"
                  (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
            (let v2 = 1 :: Integer in
             let v3
                   = coe
                       MAlonzo.Code.Agda.Builtin.List.C22
                       (coe
                          MAlonzo.Code.Agda.Builtin.Reflection.C84
                          (coe
                             MAlonzo.Code.Agda.Builtin.Reflection.C68
                             (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                             (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                          (coe
                             d48 (coe v0)
                             (coe
                                (MAlonzo.RTE.QName
                                   (198 :: Integer) (11528919355260747559 :: Integer)
                                   "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                   (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                             (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                       (coe MAlonzo.Code.Agda.Builtin.List.C16) in
             case coe v2 of
               0 -> coe v3
               _ -> let v4 = 0 :: Integer in
                    coe
                      MAlonzo.Code.Agda.Builtin.List.C22
                      (coe
                         MAlonzo.Code.Agda.Builtin.Reflection.C84
                         (coe
                            MAlonzo.Code.Agda.Builtin.Reflection.C68
                            (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                            (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                         (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                      (coe MAlonzo.Code.Reflection.Term.d74 (coe v4) (coe v3)))))
      MAlonzo.Code.Agda.Builtin.Reflection.d300
name58 = "Tactic.RingSolver.OverRing.getFieldName"
d58 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny -> AgdaAny
d58 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
      (coe
         MAlonzo.Code.Agda.Builtin.Reflection.d300
         (d48 (coe v0) (coe v1) (coe MAlonzo.Code.Agda.Builtin.List.C16)))
      (\ v2 ->
         coe
           MAlonzo.Code.Agda.Builtin.Reflection.d276 () erased
           (case coe v2 of
              MAlonzo.Code.Agda.Builtin.Reflection.C180 v3 v4
                -> coe MAlonzo.Code.Data.Maybe.Base.C30 (coe v3)
              _ -> coe MAlonzo.Code.Data.Maybe.Base.C26))
name68 = "Tactic.RingSolver.OverRing.getRingOperatorNames"
d68 :: MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d68 v0
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
      (coe
         MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
         (coe
            MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
            (coe
               MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
               (coe MAlonzo.Code.Agda.Builtin.Reflection.d276 () erased (coe C22))
               (\ v1 ->
                  coe
                    MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                    (d58
                       (coe v0)
                       (coe
                          (MAlonzo.RTE.QName
                             (202 :: Integer) (11528919355260747559 :: Integer)
                             "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._+_"
                             (MAlonzo.RTE.Fixity
                                MAlonzo.RTE.LeftAssoc (MAlonzo.RTE.Related (6.0 :: Double))))))
                    (\ v2 ->
                       coe
                         MAlonzo.Code.Agda.Builtin.Reflection.d276 () erased (coe v1 v2))))
            (\ v1 ->
               coe
                 MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                 (d58
                    (coe v0)
                    (coe
                       (MAlonzo.RTE.QName
                          (204 :: Integer) (11528919355260747559 :: Integer)
                          "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._*_"
                          (MAlonzo.RTE.Fixity
                             MAlonzo.RTE.LeftAssoc (MAlonzo.RTE.Related (7.0 :: Double))))))
                 (\ v2 ->
                    coe
                      MAlonzo.Code.Agda.Builtin.Reflection.d276 () erased (coe v1 v2))))
         (\ v1 ->
            coe
              MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
              (d58
                 (coe v0)
                 (coe
                    (MAlonzo.RTE.QName
                       (334 :: Integer) (11528919355260747559 :: Integer)
                       "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._^_"
                       (MAlonzo.RTE.Fixity
                          MAlonzo.RTE.RightAssoc (MAlonzo.RTE.Related (8.0 :: Double))))))
              (\ v2 ->
                 coe
                   MAlonzo.Code.Agda.Builtin.Reflection.d276 () erased (coe v1 v2))))
      (\ v1 ->
         coe
           MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
           (d58
              (coe v0)
              (coe
                 (MAlonzo.RTE.QName
                    (206 :: Integer) (11528919355260747559 :: Integer)
                    "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.-_"
                    (MAlonzo.RTE.Fixity
                       MAlonzo.RTE.NonAssoc (MAlonzo.RTE.Related (8.0 :: Double))))))
           (\ v2 ->
              coe
                MAlonzo.Code.Agda.Builtin.Reflection.d276 () erased (coe v1 v2)))
name80 = "Tactic.RingSolver.OverRing._._.*′"
d80 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22
d80 v0 v1 v2 = du80 v1
du80 :: T4 -> MAlonzo.Code.Data.Maybe.Base.T22
du80 v0 = coe d16 (coe v0)
name82 = "Tactic.RingSolver.OverRing._._.+′"
d82 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22
d82 v0 v1 v2 = du82 v1
du82 :: T4 -> MAlonzo.Code.Data.Maybe.Base.T22
du82 v0 = coe d14 (coe v0)
name84 = "Tactic.RingSolver.OverRing._._.-′"
d84 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22
d84 v0 v1 v2 = du84 v1
du84 :: T4 -> MAlonzo.Code.Data.Maybe.Base.T22
du84 v0 = coe d20 (coe v0)
name86 = "Tactic.RingSolver.OverRing._._.^′"
d86 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22
d86 v0 v1 v2 = du86 v1
du86 :: T4 -> MAlonzo.Code.Data.Maybe.Base.T22
du86 v0 = coe d18 (coe v0)
name98 = "Tactic.RingSolver.OverRing._._⇓≟_"
d98 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer -> MAlonzo.Code.Data.Maybe.Base.T22 -> AgdaAny -> Bool
d98 v0 v1 v2 v3 v4 = du98 v3 v4
du98 :: MAlonzo.Code.Data.Maybe.Base.T22 -> AgdaAny -> Bool
du98 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Maybe.Base.C26
        -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      MAlonzo.Code.Data.Maybe.Base.C30 v2
        -> coe MAlonzo.Code.Agda.Builtin.Reflection.d8 v2 v1
      _ -> MAlonzo.RTE.mazUnreachableError
name108 = "Tactic.RingSolver.OverRing._.ToExpr.E⟨_⟩₂"
d108 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d108 v0 v1 v2 v3 v4 v5
  = let v6 = coe MAlonzo.Code.Agda.Builtin.Reflection.C212 in
    case coe v5 of
      (:) v7 v8
        -> case coe v7 of
             MAlonzo.Code.Agda.Builtin.Reflection.C84 v9 v10
               -> case coe v9 of
                    MAlonzo.Code.Agda.Builtin.Reflection.C68 v11 v12
                      -> let v13
                               = d108 (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) (coe v8) in
                         case coe v11 of
                           MAlonzo.Code.Agda.Builtin.Reflection.C50
                             -> case coe v12 of
                                  MAlonzo.Code.Agda.Builtin.Reflection.C58
                                    -> case coe v8 of
                                         (:) v14 v15
                                           -> case coe v14 of
                                                MAlonzo.Code.Agda.Builtin.Reflection.C84 v16 v17
                                                  -> case coe v16 of
                                                       MAlonzo.Code.Agda.Builtin.Reflection.C68 v18 v19
                                                         -> case coe v18 of
                                                              MAlonzo.Code.Agda.Builtin.Reflection.C50
                                                                -> case coe v19 of
                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C58
                                                                       -> case coe v15 of
                                                                            []
                                                                              -> coe
                                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C174
                                                                                   (coe v4)
                                                                                   (let v20
                                                                                          = 1 ::
                                                                                              Integer in
                                                                                    let v21
                                                                                          = coe
                                                                                              MAlonzo.Code.Agda.Builtin.List.C22
                                                                                              (coe
                                                                                                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                 (coe
                                                                                                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                    (coe
                                                                                                       v19))
                                                                                                 (coe
                                                                                                    d48
                                                                                                    (coe
                                                                                                       v0)
                                                                                                    (coe
                                                                                                       (MAlonzo.RTE.QName
                                                                                                          (198 ::
                                                                                                             Integer)
                                                                                                          (11528919355260747559 ::
                                                                                                             Integer)
                                                                                                          "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                                                                                          (MAlonzo.RTE.Fixity
                                                                                                             MAlonzo.RTE.NonAssoc
                                                                                                             MAlonzo.RTE.Unrelated)))
                                                                                                    (coe
                                                                                                       v15)))
                                                                                              (coe
                                                                                                 MAlonzo.Code.Agda.Builtin.List.C22
                                                                                                 (coe
                                                                                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                       (coe
                                                                                                          MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                       (coe
                                                                                                          v19))
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Data.Nat.Reflection.d6
                                                                                                       (coe
                                                                                                          v2)))
                                                                                                 (coe
                                                                                                    MAlonzo.Code.Agda.Builtin.List.C22
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                       (coe
                                                                                                          v16)
                                                                                                       (coe
                                                                                                          d114
                                                                                                          (coe
                                                                                                             v0)
                                                                                                          (coe
                                                                                                             v1)
                                                                                                          (coe
                                                                                                             v2)
                                                                                                          (coe
                                                                                                             v3)
                                                                                                          (coe
                                                                                                             v10)))
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Agda.Builtin.List.C22
                                                                                                       (coe
                                                                                                          MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                          (coe
                                                                                                             v16)
                                                                                                          (coe
                                                                                                             d114
                                                                                                             (coe
                                                                                                                v0)
                                                                                                             (coe
                                                                                                                v1)
                                                                                                             (coe
                                                                                                                v2)
                                                                                                             (coe
                                                                                                                v3)
                                                                                                             (coe
                                                                                                                v17)))
                                                                                                       (coe
                                                                                                          v15)))) in
                                                                                    case coe v20 of
                                                                                      0 -> coe v21
                                                                                      _ -> let v22
                                                                                                 = 0 ::
                                                                                                     Integer in
                                                                                           coe
                                                                                             MAlonzo.Code.Agda.Builtin.List.C22
                                                                                             (coe
                                                                                                MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                (coe
                                                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                   (coe
                                                                                                      MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                   (coe
                                                                                                      v19))
                                                                                                (coe
                                                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                                                                             (coe
                                                                                                MAlonzo.Code.Reflection.Term.d74
                                                                                                (coe
                                                                                                   v22)
                                                                                                (coe
                                                                                                   v21)))
                                                                            _ -> coe v13
                                                                     _ -> coe v13
                                                              _ -> coe v13
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> coe v13
                                  _ -> coe v13
                           _ -> coe v13
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> coe v6
name110 = "Tactic.RingSolver.OverRing._.ToExpr.E⟨_⟩₁"
d110 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d110 v0 v1 v2 v3 v4 v5
  = let v6 = coe MAlonzo.Code.Agda.Builtin.Reflection.C212 in
    case coe v5 of
      (:) v7 v8
        -> case coe v7 of
             MAlonzo.Code.Agda.Builtin.Reflection.C84 v9 v10
               -> case coe v9 of
                    MAlonzo.Code.Agda.Builtin.Reflection.C68 v11 v12
                      -> let v13
                               = d110 (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) (coe v8) in
                         case coe v11 of
                           MAlonzo.Code.Agda.Builtin.Reflection.C50
                             -> case coe v12 of
                                  MAlonzo.Code.Agda.Builtin.Reflection.C58
                                    -> case coe v8 of
                                         []
                                           -> coe
                                                MAlonzo.Code.Agda.Builtin.Reflection.C174 (coe v4)
                                                (let v14 = 1 :: Integer in
                                                 let v15
                                                       = coe
                                                           MAlonzo.Code.Agda.Builtin.List.C22
                                                           (coe
                                                              MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                              (coe
                                                                 MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                 (coe v12))
                                                              (coe
                                                                 d48 (coe v0)
                                                                 (coe
                                                                    (MAlonzo.RTE.QName
                                                                       (198 :: Integer)
                                                                       (11528919355260747559 ::
                                                                          Integer)
                                                                       "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                                                       (MAlonzo.RTE.Fixity
                                                                          MAlonzo.RTE.NonAssoc
                                                                          MAlonzo.RTE.Unrelated)))
                                                                 (coe v8)))
                                                           (coe
                                                              MAlonzo.Code.Agda.Builtin.List.C22
                                                              (coe
                                                                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                    (coe
                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                    (coe v12))
                                                                 (coe
                                                                    MAlonzo.Code.Data.Nat.Reflection.d6
                                                                    (coe v2)))
                                                              (coe
                                                                 MAlonzo.Code.Agda.Builtin.List.C22
                                                                 (coe
                                                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                    (coe v9)
                                                                    (coe
                                                                       d114 (coe v0) (coe v1)
                                                                       (coe v2) (coe v3) (coe v10)))
                                                                 (coe v8))) in
                                                 case coe v14 of
                                                   0 -> coe v15
                                                   _ -> let v16 = 0 :: Integer in
                                                        coe
                                                          MAlonzo.Code.Agda.Builtin.List.C22
                                                          (coe
                                                             MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                             (coe
                                                                MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                (coe
                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                (coe v12))
                                                             (coe
                                                                MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                                          (coe
                                                             MAlonzo.Code.Reflection.Term.d74
                                                             (coe v16) (coe v15)))
                                         _ -> coe v13
                                  _ -> coe v13
                           _ -> coe v13
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> coe v6
name112 = "Tactic.RingSolver.OverRing._.ToExpr.E⟨^⟩"
d112 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d112 v0 v1 v2 v3 v4
  = let v5 = coe MAlonzo.Code.Agda.Builtin.Reflection.C212 in
    case coe v4 of
      (:) v6 v7
        -> case coe v6 of
             MAlonzo.Code.Agda.Builtin.Reflection.C84 v8 v9
               -> case coe v8 of
                    MAlonzo.Code.Agda.Builtin.Reflection.C68 v10 v11
                      -> let v12 = d112 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7) in
                         case coe v10 of
                           MAlonzo.Code.Agda.Builtin.Reflection.C50
                             -> case coe v11 of
                                  MAlonzo.Code.Agda.Builtin.Reflection.C58
                                    -> case coe v7 of
                                         (:) v13 v14
                                           -> case coe v13 of
                                                MAlonzo.Code.Agda.Builtin.Reflection.C84 v15 v16
                                                  -> case coe v15 of
                                                       MAlonzo.Code.Agda.Builtin.Reflection.C68 v17 v18
                                                         -> case coe v17 of
                                                              MAlonzo.Code.Agda.Builtin.Reflection.C50
                                                                -> case coe v18 of
                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C58
                                                                       -> case coe v14 of
                                                                            []
                                                                              -> coe
                                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C174
                                                                                   (coe
                                                                                      (MAlonzo.RTE.QName
                                                                                         (30 ::
                                                                                            Integer)
                                                                                         (4058621091251856968 ::
                                                                                            Integer)
                                                                                         "Tactic.RingSolver.Core.Expression.Expr._\8859_"
                                                                                         (MAlonzo.RTE.Fixity
                                                                                            MAlonzo.RTE.RightAssoc
                                                                                            (MAlonzo.RTE.Related
                                                                                               (8.0 ::
                                                                                                  Double)))))
                                                                                   (let v19
                                                                                          = 1 ::
                                                                                              Integer in
                                                                                    let v20
                                                                                          = coe
                                                                                              MAlonzo.Code.Agda.Builtin.List.C22
                                                                                              (coe
                                                                                                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                 (coe
                                                                                                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                    (coe
                                                                                                       v18))
                                                                                                 (coe
                                                                                                    d48
                                                                                                    (coe
                                                                                                       v0)
                                                                                                    (coe
                                                                                                       (MAlonzo.RTE.QName
                                                                                                          (198 ::
                                                                                                             Integer)
                                                                                                          (11528919355260747559 ::
                                                                                                             Integer)
                                                                                                          "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                                                                                          (MAlonzo.RTE.Fixity
                                                                                                             MAlonzo.RTE.NonAssoc
                                                                                                             MAlonzo.RTE.Unrelated)))
                                                                                                    (coe
                                                                                                       v14)))
                                                                                              (coe
                                                                                                 MAlonzo.Code.Agda.Builtin.List.C22
                                                                                                 (coe
                                                                                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                       (coe
                                                                                                          MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                       (coe
                                                                                                          v18))
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Data.Nat.Reflection.d6
                                                                                                       (coe
                                                                                                          v2)))
                                                                                                 (coe
                                                                                                    MAlonzo.Code.Agda.Builtin.List.C22
                                                                                                    (coe
                                                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                       (coe
                                                                                                          v15)
                                                                                                       (coe
                                                                                                          d114
                                                                                                          (coe
                                                                                                             v0)
                                                                                                          (coe
                                                                                                             v1)
                                                                                                          (coe
                                                                                                             v2)
                                                                                                          (coe
                                                                                                             v3)
                                                                                                          (coe
                                                                                                             v9)))
                                                                                                    (coe
                                                                                                       v7))) in
                                                                                    case coe v19 of
                                                                                      0 -> coe v20
                                                                                      _ -> let v21
                                                                                                 = 0 ::
                                                                                                     Integer in
                                                                                           coe
                                                                                             MAlonzo.Code.Agda.Builtin.List.C22
                                                                                             (coe
                                                                                                MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                (coe
                                                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                   (coe
                                                                                                      MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                   (coe
                                                                                                      v18))
                                                                                                (coe
                                                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                                                                             (coe
                                                                                                MAlonzo.Code.Reflection.Term.d74
                                                                                                (coe
                                                                                                   v21)
                                                                                                (coe
                                                                                                   v20)))
                                                                            _ -> coe v12
                                                                     _ -> coe v12
                                                              _ -> coe v12
                                                       _ -> MAlonzo.RTE.mazUnreachableError
                                                _ -> MAlonzo.RTE.mazUnreachableError
                                         _ -> coe v12
                                  _ -> coe v12
                           _ -> coe v12
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> coe v5
name114 = "Tactic.RingSolver.OverRing._.ToExpr.E"
d114 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d114 v0 v1 v2 v3 v4
  = let v5
          = coe
              MAlonzo.Code.Agda.Builtin.Reflection.C174
              (coe
                 (MAlonzo.RTE.QName
                    (22 :: Integer) (4058621091251856968 :: Integer)
                    "Tactic.RingSolver.Core.Expression.Expr.\922"
                    (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
              (let v5 = 1 :: Integer in
               let v6
                     = coe
                         MAlonzo.Code.Agda.Builtin.List.C22
                         (coe
                            MAlonzo.Code.Agda.Builtin.Reflection.C84
                            (coe
                               MAlonzo.Code.Agda.Builtin.Reflection.C68
                               (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                               (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                            (coe
                               d48 (coe v0)
                               (coe
                                  (MAlonzo.RTE.QName
                                     (198 :: Integer) (11528919355260747559 :: Integer)
                                     "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                     (MAlonzo.RTE.Fixity
                                        MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                               (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                         (coe
                            MAlonzo.Code.Agda.Builtin.List.C22
                            (coe
                               MAlonzo.Code.Agda.Builtin.Reflection.C84
                               (coe
                                  MAlonzo.Code.Agda.Builtin.Reflection.C68
                                  (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                  (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                               (coe MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                            (coe
                               MAlonzo.Code.Agda.Builtin.List.C22
                               (coe
                                  MAlonzo.Code.Agda.Builtin.Reflection.C84
                                  (coe
                                     MAlonzo.Code.Agda.Builtin.Reflection.C68
                                     (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                     (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                  (coe v4))
                               (coe MAlonzo.Code.Agda.Builtin.List.C16))) in
               case coe v5 of
                 0 -> coe v6
                 _ -> let v7 = 0 :: Integer in
                      coe
                        MAlonzo.Code.Agda.Builtin.List.C22
                        (coe
                           MAlonzo.Code.Agda.Builtin.Reflection.C84
                           (coe
                              MAlonzo.Code.Agda.Builtin.Reflection.C68
                              (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                              (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                           (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                        (coe MAlonzo.Code.Reflection.Term.d74 (coe v7) (coe v6))) in
    case coe v4 of
      MAlonzo.Code.Agda.Builtin.Reflection.C168 v6 v7
        -> coe
             MAlonzo.Code.Data.Maybe.Base.du64
             (coe
                MAlonzo.Code.Agda.Builtin.Reflection.C174
                (coe
                   (MAlonzo.RTE.QName
                      (22 :: Integer) (4058621091251856968 :: Integer)
                      "Tactic.RingSolver.Core.Expression.Expr.\922"
                      (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                (let v8 = 1 :: Integer in
                 let v9
                       = coe
                           MAlonzo.Code.Agda.Builtin.List.C22
                           (coe
                              MAlonzo.Code.Agda.Builtin.Reflection.C84
                              (coe
                                 MAlonzo.Code.Agda.Builtin.Reflection.C68
                                 (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                 (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                              (coe
                                 d48 (coe v0)
                                 (coe
                                    (MAlonzo.RTE.QName
                                       (198 :: Integer) (11528919355260747559 :: Integer)
                                       "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                       (MAlonzo.RTE.Fixity
                                          MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                 (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                           (coe
                              MAlonzo.Code.Agda.Builtin.List.C22
                              (coe
                                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                 (coe MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                              (coe
                                 MAlonzo.Code.Agda.Builtin.List.C22
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                    (coe v4))
                                 (coe MAlonzo.Code.Agda.Builtin.List.C16))) in
                 case coe v8 of
                   0 -> coe v9
                   _ -> let v10 = 0 :: Integer in
                        coe
                          MAlonzo.Code.Agda.Builtin.List.C22
                          (coe
                             MAlonzo.Code.Agda.Builtin.Reflection.C84
                             (coe
                                MAlonzo.Code.Agda.Builtin.Reflection.C68
                                (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                             (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                          (coe MAlonzo.Code.Reflection.Term.d74 (coe v10) (coe v9))))
             (coe v3 v6)
      MAlonzo.Code.Agda.Builtin.Reflection.C174 v6 v7
        -> case coe v6 of
             MAlonzo.RTE.QName 12 13537827747504913145 _ _
               -> case coe v7 of
                    (:) v8 v9
                      -> case coe v8 of
                           MAlonzo.Code.Agda.Builtin.Reflection.C84 v10 v11
                             -> case coe v10 of
                                  MAlonzo.Code.Agda.Builtin.Reflection.C68 v12 v13
                                    -> case coe v12 of
                                         MAlonzo.Code.Agda.Builtin.Reflection.C50
                                           -> case coe v13 of
                                                MAlonzo.Code.Agda.Builtin.Reflection.C58
                                                  -> case coe v9 of
                                                       []
                                                         -> coe
                                                              MAlonzo.Code.Agda.Builtin.Reflection.C174
                                                              (coe
                                                                 (MAlonzo.RTE.QName
                                                                    (26 :: Integer)
                                                                    (4058621091251856968 :: Integer)
                                                                    "Tactic.RingSolver.Core.Expression.Expr._\8853_"
                                                                    (MAlonzo.RTE.Fixity
                                                                       MAlonzo.RTE.LeftAssoc
                                                                       (MAlonzo.RTE.Related
                                                                          (6.0 :: Double)))))
                                                              (let v14 = 1 :: Integer in
                                                               let v15
                                                                     = coe
                                                                         MAlonzo.Code.Agda.Builtin.List.C22
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                            (coe
                                                                               MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                               (coe v13))
                                                                            (coe
                                                                               d48 (coe v0)
                                                                               (coe
                                                                                  (MAlonzo.RTE.QName
                                                                                     (198 ::
                                                                                        Integer)
                                                                                     (11528919355260747559 ::
                                                                                        Integer)
                                                                                     "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                                                                     (MAlonzo.RTE.Fixity
                                                                                        MAlonzo.RTE.NonAssoc
                                                                                        MAlonzo.RTE.Unrelated)))
                                                                               (coe v9)))
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.List.C22
                                                                            (coe
                                                                               MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                  (coe
                                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                  (coe v13))
                                                                               (coe
                                                                                  MAlonzo.Code.Data.Nat.Reflection.d6
                                                                                  (coe v2)))
                                                                            (coe
                                                                               MAlonzo.Code.Agda.Builtin.List.C22
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                  (coe v10)
                                                                                  (coe
                                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C174
                                                                                     (coe
                                                                                        (MAlonzo.RTE.QName
                                                                                           (22 ::
                                                                                              Integer)
                                                                                           (4058621091251856968 ::
                                                                                              Integer)
                                                                                           "Tactic.RingSolver.Core.Expression.Expr.\922"
                                                                                           (MAlonzo.RTE.Fixity
                                                                                              MAlonzo.RTE.NonAssoc
                                                                                              MAlonzo.RTE.Unrelated)))
                                                                                     (let v15
                                                                                            = 1 ::
                                                                                                Integer in
                                                                                      let v16
                                                                                            = coe
                                                                                                MAlonzo.Code.Agda.Builtin.List.C22
                                                                                                (coe
                                                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                   (coe
                                                                                                      MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                      (coe
                                                                                                         MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                      (coe
                                                                                                         v13))
                                                                                                   (coe
                                                                                                      d48
                                                                                                      (coe
                                                                                                         v0)
                                                                                                      (coe
                                                                                                         (MAlonzo.RTE.QName
                                                                                                            (198 ::
                                                                                                               Integer)
                                                                                                            (11528919355260747559 ::
                                                                                                               Integer)
                                                                                                            "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                                                                                            (MAlonzo.RTE.Fixity
                                                                                                               MAlonzo.RTE.NonAssoc
                                                                                                               MAlonzo.RTE.Unrelated)))
                                                                                                      (coe
                                                                                                         v9)))
                                                                                                (coe
                                                                                                   MAlonzo.Code.Agda.Builtin.List.C22
                                                                                                   (coe
                                                                                                      MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                      (coe
                                                                                                         MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                         (coe
                                                                                                            MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                         (coe
                                                                                                            v13))
                                                                                                      (coe
                                                                                                         MAlonzo.Code.Data.Nat.Reflection.d6
                                                                                                         (coe
                                                                                                            v2)))
                                                                                                   (coe
                                                                                                      MAlonzo.Code.Agda.Builtin.List.C22
                                                                                                      (coe
                                                                                                         MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                         (coe
                                                                                                            v10)
                                                                                                         (coe
                                                                                                            MAlonzo.Code.Data.Nat.Reflection.d6
                                                                                                            (coe
                                                                                                               (1 ::
                                                                                                                  Integer))))
                                                                                                      (coe
                                                                                                         v9))) in
                                                                                      case coe
                                                                                             v15 of
                                                                                        0 -> coe v16
                                                                                        _ -> let v17
                                                                                                   = 0 ::
                                                                                                       Integer in
                                                                                             coe
                                                                                               MAlonzo.Code.Agda.Builtin.List.C22
                                                                                               (coe
                                                                                                  MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                                  (coe
                                                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                                     (coe
                                                                                                        MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                                     (coe
                                                                                                        v13))
                                                                                                  (coe
                                                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                                                                               (coe
                                                                                                  MAlonzo.Code.Reflection.Term.d74
                                                                                                  (coe
                                                                                                     v17)
                                                                                                  (coe
                                                                                                     v16)))))
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.List.C22
                                                                                  (coe
                                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                     (coe v10)
                                                                                     (coe
                                                                                        d114
                                                                                        (coe v0)
                                                                                        (coe v1)
                                                                                        (coe v2)
                                                                                        (coe v3)
                                                                                        (coe v11)))
                                                                                  (coe v9)))) in
                                                               case coe v14 of
                                                                 0 -> coe v15
                                                                 _ -> let v16 = 0 :: Integer in
                                                                      coe
                                                                        MAlonzo.Code.Agda.Builtin.List.C22
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                              (coe
                                                                                 MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                              (coe v13))
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                                                        (coe
                                                                           MAlonzo.Code.Reflection.Term.d74
                                                                           (coe v16) (coe v15)))
                                                       _ -> coe v5
                                                _ -> coe v5
                                         _ -> coe v5
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> coe v5
             _ -> coe v5
      MAlonzo.Code.Agda.Builtin.Reflection.C180 v6 v7
        -> let v8
                 = coe
                     MAlonzo.Code.Data.Bool.Base.du42
                     (let v8 = d14 (coe v1) in
                      case coe v8 of
                        MAlonzo.Code.Data.Maybe.Base.C26
                          -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
                        MAlonzo.Code.Data.Maybe.Base.C30 v9
                          -> coe MAlonzo.Code.Agda.Builtin.Reflection.d8 v9 v6
                        _ -> MAlonzo.RTE.mazUnreachableError)
                     (coe
                        d108 (coe v0) (coe v1) (coe v2) (coe v3)
                        (coe
                           (MAlonzo.RTE.QName
                              (26 :: Integer) (4058621091251856968 :: Integer)
                              "Tactic.RingSolver.Core.Expression.Expr._\8853_"
                              (MAlonzo.RTE.Fixity
                                 MAlonzo.RTE.LeftAssoc (MAlonzo.RTE.Related (6.0 :: Double)))))
                        (coe v7))
                     (coe
                        MAlonzo.Code.Data.Bool.Base.du42
                        (let v8 = d16 (coe v1) in
                         case coe v8 of
                           MAlonzo.Code.Data.Maybe.Base.C26
                             -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
                           MAlonzo.Code.Data.Maybe.Base.C30 v9
                             -> coe MAlonzo.Code.Agda.Builtin.Reflection.d8 v9 v6
                           _ -> MAlonzo.RTE.mazUnreachableError)
                        (coe
                           d108 (coe v0) (coe v1) (coe v2) (coe v3)
                           (coe
                              (MAlonzo.RTE.QName
                                 (28 :: Integer) (4058621091251856968 :: Integer)
                                 "Tactic.RingSolver.Core.Expression.Expr._\8855_"
                                 (MAlonzo.RTE.Fixity
                                    MAlonzo.RTE.LeftAssoc (MAlonzo.RTE.Related (7.0 :: Double)))))
                           (coe v7))
                        (coe
                           MAlonzo.Code.Data.Bool.Base.du42
                           (let v8 = d18 (coe v1) in
                            case coe v8 of
                              MAlonzo.Code.Data.Maybe.Base.C26
                                -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
                              MAlonzo.Code.Data.Maybe.Base.C30 v9
                                -> coe MAlonzo.Code.Agda.Builtin.Reflection.d8 v9 v6
                              _ -> MAlonzo.RTE.mazUnreachableError)
                           (coe d112 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7))
                           (coe
                              MAlonzo.Code.Data.Bool.Base.du42
                              (let v8 = d20 (coe v1) in
                               case coe v8 of
                                 MAlonzo.Code.Data.Maybe.Base.C26
                                   -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
                                 MAlonzo.Code.Data.Maybe.Base.C30 v9
                                   -> coe MAlonzo.Code.Agda.Builtin.Reflection.d8 v9 v6
                                 _ -> MAlonzo.RTE.mazUnreachableError)
                              (coe
                                 d110 (coe v0) (coe v1) (coe v2) (coe v3)
                                 (coe
                                    (MAlonzo.RTE.QName
                                       (32 :: Integer) (4058621091251856968 :: Integer)
                                       "Tactic.RingSolver.Core.Expression.Expr.\8861_"
                                       (MAlonzo.RTE.Fixity
                                          MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                 (coe v7))
                              (coe
                                 MAlonzo.Code.Agda.Builtin.Reflection.C174
                                 (coe
                                    (MAlonzo.RTE.QName
                                       (22 :: Integer) (4058621091251856968 :: Integer)
                                       "Tactic.RingSolver.Core.Expression.Expr.\922"
                                       (MAlonzo.RTE.Fixity
                                          MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                 (let v8 = 1 :: Integer in
                                  let v9
                                        = coe
                                            MAlonzo.Code.Agda.Builtin.List.C22
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.Reflection.C84
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                  (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                  (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                               (coe
                                                  d48 (coe v0)
                                                  (coe
                                                     (MAlonzo.RTE.QName
                                                        (198 :: Integer)
                                                        (11528919355260747559 :: Integer)
                                                        "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                                        (MAlonzo.RTE.Fixity
                                                           MAlonzo.RTE.NonAssoc
                                                           MAlonzo.RTE.Unrelated)))
                                                  (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.List.C22
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                     (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                     (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                  (coe
                                                     MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.List.C22
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                     (coe v4))
                                                  (coe MAlonzo.Code.Agda.Builtin.List.C16))) in
                                  case coe v8 of
                                    0 -> coe v9
                                    _ -> let v10 = 0 :: Integer in
                                         coe
                                           MAlonzo.Code.Agda.Builtin.List.C22
                                           (coe
                                              MAlonzo.Code.Agda.Builtin.Reflection.C84
                                              (coe
                                                 MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                 (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                 (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                              (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                           (coe
                                              MAlonzo.Code.Reflection.Term.d74 (coe v10)
                                              (coe v9))))))) in
           case coe v6 of
             MAlonzo.RTE.QName 202 11528919355260747559 _ _
               -> coe
                    d108 (coe v0) (coe v1) (coe v2) (coe v3)
                    (coe
                       (MAlonzo.RTE.QName
                          (26 :: Integer) (4058621091251856968 :: Integer)
                          "Tactic.RingSolver.Core.Expression.Expr._\8853_"
                          (MAlonzo.RTE.Fixity
                             MAlonzo.RTE.LeftAssoc (MAlonzo.RTE.Related (6.0 :: Double)))))
                    (coe v7)
             MAlonzo.RTE.QName 204 11528919355260747559 _ _
               -> coe
                    d108 (coe v0) (coe v1) (coe v2) (coe v3)
                    (coe
                       (MAlonzo.RTE.QName
                          (28 :: Integer) (4058621091251856968 :: Integer)
                          "Tactic.RingSolver.Core.Expression.Expr._\8855_"
                          (MAlonzo.RTE.Fixity
                             MAlonzo.RTE.LeftAssoc (MAlonzo.RTE.Related (7.0 :: Double)))))
                    (coe v7)
             MAlonzo.RTE.QName 206 11528919355260747559 _ _
               -> coe
                    d110 (coe v0) (coe v1) (coe v2) (coe v3)
                    (coe
                       (MAlonzo.RTE.QName
                          (32 :: Integer) (4058621091251856968 :: Integer)
                          "Tactic.RingSolver.Core.Expression.Expr.\8861_"
                          (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                    (coe v7)
             MAlonzo.RTE.QName 334 11528919355260747559 _ _
               -> coe d112 (coe v0) (coe v1) (coe v2) (coe v3) (coe v7)
             _ -> coe v8
      _ -> coe v5
name168 = "Tactic.RingSolver.OverRing._.callSolver"
d168 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74]
d168 v0 v1 v2 v3 v4 v5
  = let v6 = 2 :: Integer in
    let v7
          = coe
              MAlonzo.Code.Agda.Builtin.List.C22
              (coe
                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                 (coe
                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                 (coe v0))
              (coe
                 MAlonzo.Code.Agda.Builtin.List.C22
                 (coe
                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                    (coe
                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                    (coe MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                 (coe
                    MAlonzo.Code.Agda.Builtin.List.C22
                    (coe
                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                       (coe
                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                       (coe
                          MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d26 (coe v2)
                          (coe v3)
                          (coe
                             d48 (coe v0)
                             (coe
                                (MAlonzo.RTE.QName
                                   (460 :: Integer) (13355546136547469431 :: Integer)
                                   "Tactic.RingSolver.NonReflective._\8860_"
                                   (MAlonzo.RTE.Fixity
                                      MAlonzo.RTE.LeftAssoc (MAlonzo.RTE.Related (6.0 :: Double)))))
                             (coe
                                MAlonzo.Code.Agda.Builtin.List.C22
                                (coe
                                   MAlonzo.Code.Agda.Builtin.Reflection.C84
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Reflection.C68
                                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                   (coe MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                                (coe
                                   MAlonzo.Code.Agda.Builtin.List.C22
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Reflection.C84
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.Reflection.C68
                                         (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                         (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                      (coe
                                         d114 (coe v0) (coe v1) (coe v2) (coe du180 (coe v2))
                                         (coe v4)))
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.List.C22
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.Reflection.C84
                                         (coe
                                            MAlonzo.Code.Agda.Builtin.Reflection.C68
                                            (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                            (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                         (coe
                                            d114 (coe v0) (coe v1) (coe v2) (coe du180 (coe v2))
                                            (coe v5)))
                                      (coe MAlonzo.Code.Agda.Builtin.List.C16)))))))
                    (coe
                       MAlonzo.Code.Agda.Builtin.List.C22
                       (coe
                          MAlonzo.Code.Agda.Builtin.Reflection.C84
                          (coe
                             MAlonzo.Code.Agda.Builtin.Reflection.C68
                             (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                             (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                          (coe
                             MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d14 (coe v2)
                             (coe v3)
                             (coe
                                d48 (coe v0)
                                (coe
                                   (MAlonzo.RTE.QName
                                      (338 :: Integer) (11528919355260747559 :: Integer)
                                      "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.refl"
                                      (MAlonzo.RTE.Fixity
                                         MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                (let v7 = 1 :: Integer in
                                 let v8 = coe MAlonzo.Code.Agda.Builtin.List.C16 in
                                 case coe v7 of
                                   0 -> coe MAlonzo.Code.Agda.Builtin.List.C16
                                   _ -> let v9 = 0 :: Integer in
                                        coe
                                          MAlonzo.Code.Agda.Builtin.List.C22
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.Reflection.C84
                                             (coe
                                                MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                             (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                          (coe
                                             MAlonzo.Code.Reflection.Term.d74 (coe v9) (coe v8))))))
                       (coe MAlonzo.Code.Agda.Builtin.List.C16)))) in
    case coe v6 of
      0 -> coe v7
      _ -> let v8 = 1 :: Integer in
           coe
             MAlonzo.Code.Agda.Builtin.List.C22
             (coe
                MAlonzo.Code.Agda.Builtin.Reflection.C84
                (coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C68
                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
             (coe MAlonzo.Code.Reflection.Term.d74 (coe v8) (coe v7))
name180 = "Tactic.RingSolver.OverRing._._.Ι′"
d180 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  Integer -> MAlonzo.Code.Data.Maybe.Base.T22
d180 v0 v1 v2 v3 v4 v5 v6 = du180 v2 v6
du180 :: Integer -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22
du180 v0 v1
  = coe
      MAlonzo.Code.Data.Bool.Base.du42 (coe ltInt (coe v1) (coe v0))
      (coe
         MAlonzo.Code.Data.Maybe.Base.C30
         (coe
            MAlonzo.Code.Agda.Builtin.Reflection.C168 (coe v1)
            (coe MAlonzo.Code.Agda.Builtin.List.C16)))
      (coe MAlonzo.Code.Data.Maybe.Base.C26)
name186 = "Tactic.RingSolver.OverRing._._._.E"
d186 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d186 v0 v1 v2 v3 v4 v5 = du186 v0 v1 v2
du186 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du186 v0 v1 v2
  = coe d114 (coe v0) (coe v1) (coe v2) (coe du180 (coe v2))
name188 = "Tactic.RingSolver.OverRing._._._.E⟨_⟩₁"
d188 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d188 v0 v1 v2 v3 v4 v5 = du188 v0 v1 v2
du188 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du188 v0 v1 v2
  = coe d110 (coe v0) (coe v1) (coe v2) (coe du180 (coe v2))
name190 = "Tactic.RingSolver.OverRing._._._.E⟨_⟩₂"
d190 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d190 v0 v1 v2 v3 v4 v5 = du190 v0 v1 v2
du190 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du190 v0 v1 v2
  = coe d108 (coe v0) (coe v1) (coe v2) (coe du180 (coe v2))
name192 = "Tactic.RingSolver.OverRing._._._.E⟨^⟩"
d192 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d192 v0 v1 v2 v3 v4 v5 = du192 v0 v1 v2
du192 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du192 v0 v1 v2
  = coe d112 (coe v0) (coe v1) (coe v2) (coe du180 (coe v2))
name194 = "Tactic.RingSolver.OverRing._.constructSoln"
d194 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d194 v0 v1 v2 v3 v4 v5
  = coe
      d48 (coe v0)
      (coe
         (MAlonzo.RTE.QName
            (306 :: Integer) (11528919355260747559 :: Integer)
            "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.trans"
            (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
      (let v6 = 3 :: Integer in
       let v7
             = coe
                 MAlonzo.Code.Agda.Builtin.List.C22
                 (coe
                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                    (coe
                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                    (coe
                       d48 (coe v0)
                       (coe
                          (MAlonzo.RTE.QName
                             (304 :: Integer) (11528919355260747559 :: Integer)
                             "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.sym"
                             (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                       (let v7 = 2 :: Integer in
                        let v8
                              = coe
                                  MAlonzo.Code.Agda.Builtin.List.C22
                                  (coe
                                     MAlonzo.Code.Agda.Builtin.Reflection.C84
                                     (coe
                                        MAlonzo.Code.Agda.Builtin.Reflection.C68
                                        (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                        (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                     (coe
                                        d48 (coe v0)
                                        (coe
                                           (MAlonzo.RTE.QName
                                              (380 :: Integer) (13355546136547469431 :: Integer)
                                              "Tactic.RingSolver.NonReflective.Ops.correct"
                                              (MAlonzo.RTE.Fixity
                                                 MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                        (let v8 = 1 :: Integer in
                                         let v9
                                               = coe
                                                   MAlonzo.Code.Agda.Builtin.List.C22
                                                   (coe
                                                      MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                      (coe
                                                         MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                         (coe
                                                            MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                                         (coe
                                                            MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                      (coe
                                                         d114 (coe v0) (coe v1) (coe v2)
                                                         (coe
                                                            (\ v9 ->
                                                               coe
                                                                 MAlonzo.Code.Data.Maybe.Base.du82
                                                                 (\ v10 ->
                                                                    coe
                                                                      MAlonzo.Code.Agda.Builtin.Reflection.C174
                                                                      (coe
                                                                         (MAlonzo.RTE.QName
                                                                            (24 :: Integer)
                                                                            (4058621091251856968 ::
                                                                               Integer)
                                                                            "Tactic.RingSolver.Core.Expression.Expr.\921"
                                                                            (MAlonzo.RTE.Fixity
                                                                               MAlonzo.RTE.NonAssoc
                                                                               MAlonzo.RTE.Unrelated)))
                                                                      (let v11 = 1 :: Integer in
                                                                       let v12
                                                                             = coe
                                                                                 MAlonzo.Code.Agda.Builtin.List.C22
                                                                                 (coe
                                                                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                    (coe
                                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                       (coe
                                                                                          MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                       (coe
                                                                                          MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                                                    (coe
                                                                                       d48 (coe v0)
                                                                                       (coe
                                                                                          (MAlonzo.RTE.QName
                                                                                             (198 ::
                                                                                                Integer)
                                                                                             (11528919355260747559 ::
                                                                                                Integer)
                                                                                             "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                                                                             (MAlonzo.RTE.Fixity
                                                                                                MAlonzo.RTE.NonAssoc
                                                                                                MAlonzo.RTE.Unrelated)))
                                                                                       (coe
                                                                                          MAlonzo.Code.Agda.Builtin.List.C16)))
                                                                                 (coe
                                                                                    MAlonzo.Code.Agda.Builtin.List.C22
                                                                                    (coe
                                                                                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                       (coe
                                                                                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                          (coe
                                                                                             MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                          (coe
                                                                                             MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                                                       (coe
                                                                                          MAlonzo.Code.Data.Nat.Reflection.d6
                                                                                          (coe v2)))
                                                                                    (coe
                                                                                       MAlonzo.Code.Agda.Builtin.List.C22
                                                                                       (coe
                                                                                          MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                          (coe
                                                                                             MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                             (coe
                                                                                                MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                                                                             (coe
                                                                                                MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                                                          (coe
                                                                                             MAlonzo.Code.Data.Nat.Reflection.d10
                                                                                             (coe
                                                                                                v10)))
                                                                                       (coe
                                                                                          MAlonzo.Code.Agda.Builtin.List.C16))) in
                                                                       case coe v11 of
                                                                         0 -> coe v12
                                                                         _ -> let v13
                                                                                    = 0 ::
                                                                                        Integer in
                                                                              coe
                                                                                MAlonzo.Code.Agda.Builtin.List.C22
                                                                                (coe
                                                                                   MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                                   (coe
                                                                                      MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                                      (coe
                                                                                         MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                                      (coe
                                                                                         MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                                                   (coe
                                                                                      MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                                                                (coe
                                                                                   MAlonzo.Code.Reflection.Term.d74
                                                                                   (coe v13)
                                                                                   (coe v12))))
                                                                 (MAlonzo.Code.Tactic.RingSolver.Core.NatSet.d146
                                                                    (coe v9) (coe v3))))
                                                         (coe v4)))
                                                   (coe
                                                      MAlonzo.Code.Agda.Builtin.List.C22
                                                      (coe
                                                         MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                         (coe
                                                            MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                         (coe
                                                            MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d104
                                                            (coe v3)))
                                                      (coe MAlonzo.Code.Agda.Builtin.List.C16)) in
                                         case coe v8 of
                                           0 -> coe v9
                                           _ -> let v10 = 0 :: Integer in
                                                coe
                                                  MAlonzo.Code.Agda.Builtin.List.C22
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                                  (coe
                                                     MAlonzo.Code.Reflection.Term.d74 (coe v10)
                                                     (coe v9)))))
                                  (coe MAlonzo.Code.Agda.Builtin.List.C16) in
                        case coe v7 of
                          0 -> coe v8
                          _ -> let v9 = 1 :: Integer in
                               coe
                                 MAlonzo.Code.Agda.Builtin.List.C22
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                 (coe MAlonzo.Code.Reflection.Term.d74 (coe v9) (coe v8)))))
                 (coe
                    MAlonzo.Code.Agda.Builtin.List.C22
                    (coe
                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                       (coe
                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                       (coe
                          d48 (coe v0)
                          (coe
                             (MAlonzo.RTE.QName
                                (380 :: Integer) (13355546136547469431 :: Integer)
                                "Tactic.RingSolver.NonReflective.Ops.correct"
                                (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                          (let v7 = 1 :: Integer in
                           let v8
                                 = coe
                                     MAlonzo.Code.Agda.Builtin.List.C22
                                     (coe
                                        MAlonzo.Code.Agda.Builtin.Reflection.C84
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.Reflection.C68
                                           (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                           (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                        (coe
                                           d114 (coe v0) (coe v1) (coe v2)
                                           (coe
                                              (\ v8 ->
                                                 coe
                                                   MAlonzo.Code.Data.Maybe.Base.du82
                                                   (\ v9 ->
                                                      coe
                                                        MAlonzo.Code.Agda.Builtin.Reflection.C174
                                                        (coe
                                                           (MAlonzo.RTE.QName
                                                              (24 :: Integer)
                                                              (4058621091251856968 :: Integer)
                                                              "Tactic.RingSolver.Core.Expression.Expr.\921"
                                                              (MAlonzo.RTE.Fixity
                                                                 MAlonzo.RTE.NonAssoc
                                                                 MAlonzo.RTE.Unrelated)))
                                                        (let v10 = 1 :: Integer in
                                                         let v11
                                                               = coe
                                                                   MAlonzo.Code.Agda.Builtin.List.C22
                                                                   (coe
                                                                      MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                      (coe
                                                                         MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                                      (coe
                                                                         d48 (coe v0)
                                                                         (coe
                                                                            (MAlonzo.RTE.QName
                                                                               (198 :: Integer)
                                                                               (11528919355260747559 ::
                                                                                  Integer)
                                                                               "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                                                               (MAlonzo.RTE.Fixity
                                                                                  MAlonzo.RTE.NonAssoc
                                                                                  MAlonzo.RTE.Unrelated)))
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.List.C16)))
                                                                   (coe
                                                                      MAlonzo.Code.Agda.Builtin.List.C22
                                                                      (coe
                                                                         MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                            (coe
                                                                               MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                            (coe
                                                                               MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                                         (coe
                                                                            MAlonzo.Code.Data.Nat.Reflection.d6
                                                                            (coe v2)))
                                                                      (coe
                                                                         MAlonzo.Code.Agda.Builtin.List.C22
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                            (coe
                                                                               MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                                                               (coe
                                                                                  MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                                            (coe
                                                                               MAlonzo.Code.Data.Nat.Reflection.d10
                                                                               (coe v9)))
                                                                         (coe
                                                                            MAlonzo.Code.Agda.Builtin.List.C16))) in
                                                         case coe v10 of
                                                           0 -> coe v11
                                                           _ -> let v12 = 0 :: Integer in
                                                                coe
                                                                  MAlonzo.Code.Agda.Builtin.List.C22
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C84
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Reflection.C68
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                                                  (coe
                                                                     MAlonzo.Code.Reflection.Term.d74
                                                                     (coe v12) (coe v11))))
                                                   (MAlonzo.Code.Tactic.RingSolver.Core.NatSet.d146
                                                      (coe v8) (coe v3))))
                                           (coe v5)))
                                     (coe
                                        MAlonzo.Code.Agda.Builtin.List.C22
                                        (coe
                                           MAlonzo.Code.Agda.Builtin.Reflection.C84
                                           (coe
                                              MAlonzo.Code.Agda.Builtin.Reflection.C68
                                              (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                              (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                           (coe
                                              MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d104
                                              (coe v3)))
                                        (coe MAlonzo.Code.Agda.Builtin.List.C16)) in
                           case coe v7 of
                             0 -> coe v8
                             _ -> let v9 = 0 :: Integer in
                                  coe
                                    MAlonzo.Code.Agda.Builtin.List.C22
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                                    (coe MAlonzo.Code.Reflection.Term.d74 (coe v9) (coe v8)))))
                    (coe MAlonzo.Code.Agda.Builtin.List.C16)) in
       case coe v6 of
         0 -> coe v7
         _ -> let v8 = 2 :: Integer in
              coe
                MAlonzo.Code.Agda.Builtin.List.C22
                (coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C84
                   (coe
                      MAlonzo.Code.Agda.Builtin.Reflection.C68
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                (coe MAlonzo.Code.Reflection.Term.d74 (coe v8) (coe v7)))
name214 = "Tactic.RingSolver.OverRing._._._.E"
d214 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d214 v0 v1 v2 v3 v4 v5 = du214 v0 v1 v2 v3
du214 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du214 v0 v1 v2 v3
  = coe
      d114 (coe v0) (coe v1) (coe v2)
      (coe
         (\ v4 ->
            coe
              MAlonzo.Code.Data.Maybe.Base.du82
              (\ v5 ->
                 coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C174
                   (coe
                      (MAlonzo.RTE.QName
                         (24 :: Integer) (4058621091251856968 :: Integer)
                         "Tactic.RingSolver.Core.Expression.Expr.\921"
                         (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                   (let v6 = 1 :: Integer in
                    let v7
                          = coe
                              MAlonzo.Code.Agda.Builtin.List.C22
                              (coe
                                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                 (coe
                                    d48 (coe v0)
                                    (coe
                                       (MAlonzo.RTE.QName
                                          (198 :: Integer) (11528919355260747559 :: Integer)
                                          "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                          (MAlonzo.RTE.Fixity
                                             MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                    (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                              (coe
                                 MAlonzo.Code.Agda.Builtin.List.C22
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                    (coe MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.List.C22
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                       (coe MAlonzo.Code.Data.Nat.Reflection.d10 (coe v5)))
                                    (coe MAlonzo.Code.Agda.Builtin.List.C16))) in
                    case coe v6 of
                      0 -> coe v7
                      _ -> let v8 = 0 :: Integer in
                           coe
                             MAlonzo.Code.Agda.Builtin.List.C22
                             (coe
                                MAlonzo.Code.Agda.Builtin.Reflection.C84
                                (coe
                                   MAlonzo.Code.Agda.Builtin.Reflection.C68
                                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                             (coe MAlonzo.Code.Reflection.Term.d74 (coe v8) (coe v7))))
              (MAlonzo.Code.Tactic.RingSolver.Core.NatSet.d146
                 (coe v4) (coe v3))))
name216 = "Tactic.RingSolver.OverRing._._._.E⟨_⟩₁"
d216 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d216 v0 v1 v2 v3 v4 v5 = du216 v0 v1 v2 v3
du216 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du216 v0 v1 v2 v3
  = coe
      d110 (coe v0) (coe v1) (coe v2)
      (coe
         (\ v4 ->
            coe
              MAlonzo.Code.Data.Maybe.Base.du82
              (\ v5 ->
                 coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C174
                   (coe
                      (MAlonzo.RTE.QName
                         (24 :: Integer) (4058621091251856968 :: Integer)
                         "Tactic.RingSolver.Core.Expression.Expr.\921"
                         (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                   (let v6 = 1 :: Integer in
                    let v7
                          = coe
                              MAlonzo.Code.Agda.Builtin.List.C22
                              (coe
                                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                 (coe
                                    d48 (coe v0)
                                    (coe
                                       (MAlonzo.RTE.QName
                                          (198 :: Integer) (11528919355260747559 :: Integer)
                                          "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                          (MAlonzo.RTE.Fixity
                                             MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                    (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                              (coe
                                 MAlonzo.Code.Agda.Builtin.List.C22
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                    (coe MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.List.C22
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                       (coe MAlonzo.Code.Data.Nat.Reflection.d10 (coe v5)))
                                    (coe MAlonzo.Code.Agda.Builtin.List.C16))) in
                    case coe v6 of
                      0 -> coe v7
                      _ -> let v8 = 0 :: Integer in
                           coe
                             MAlonzo.Code.Agda.Builtin.List.C22
                             (coe
                                MAlonzo.Code.Agda.Builtin.Reflection.C84
                                (coe
                                   MAlonzo.Code.Agda.Builtin.Reflection.C68
                                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                             (coe MAlonzo.Code.Reflection.Term.d74 (coe v8) (coe v7))))
              (MAlonzo.Code.Tactic.RingSolver.Core.NatSet.d146
                 (coe v4) (coe v3))))
name218 = "Tactic.RingSolver.OverRing._._._.E⟨_⟩₂"
d218 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d218 v0 v1 v2 v3 v4 v5 = du218 v0 v1 v2 v3
du218 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du218 v0 v1 v2 v3
  = coe
      d108 (coe v0) (coe v1) (coe v2)
      (coe
         (\ v4 ->
            coe
              MAlonzo.Code.Data.Maybe.Base.du82
              (\ v5 ->
                 coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C174
                   (coe
                      (MAlonzo.RTE.QName
                         (24 :: Integer) (4058621091251856968 :: Integer)
                         "Tactic.RingSolver.Core.Expression.Expr.\921"
                         (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                   (let v6 = 1 :: Integer in
                    let v7
                          = coe
                              MAlonzo.Code.Agda.Builtin.List.C22
                              (coe
                                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                 (coe
                                    d48 (coe v0)
                                    (coe
                                       (MAlonzo.RTE.QName
                                          (198 :: Integer) (11528919355260747559 :: Integer)
                                          "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                          (MAlonzo.RTE.Fixity
                                             MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                    (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                              (coe
                                 MAlonzo.Code.Agda.Builtin.List.C22
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                    (coe MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.List.C22
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                       (coe MAlonzo.Code.Data.Nat.Reflection.d10 (coe v5)))
                                    (coe MAlonzo.Code.Agda.Builtin.List.C16))) in
                    case coe v6 of
                      0 -> coe v7
                      _ -> let v8 = 0 :: Integer in
                           coe
                             MAlonzo.Code.Agda.Builtin.List.C22
                             (coe
                                MAlonzo.Code.Agda.Builtin.Reflection.C84
                                (coe
                                   MAlonzo.Code.Agda.Builtin.Reflection.C68
                                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                             (coe MAlonzo.Code.Reflection.Term.d74 (coe v8) (coe v7))))
              (MAlonzo.Code.Tactic.RingSolver.Core.NatSet.d146
                 (coe v4) (coe v3))))
name220 = "Tactic.RingSolver.OverRing._._._.E⟨^⟩"
d220 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d220 v0 v1 v2 v3 v4 v5 = du220 v0 v1 v2 v3
du220 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du220 v0 v1 v2 v3
  = coe
      d112 (coe v0) (coe v1) (coe v2)
      (coe
         (\ v4 ->
            coe
              MAlonzo.Code.Data.Maybe.Base.du82
              (\ v5 ->
                 coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C174
                   (coe
                      (MAlonzo.RTE.QName
                         (24 :: Integer) (4058621091251856968 :: Integer)
                         "Tactic.RingSolver.Core.Expression.Expr.\921"
                         (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                   (let v6 = 1 :: Integer in
                    let v7
                          = coe
                              MAlonzo.Code.Agda.Builtin.List.C22
                              (coe
                                 MAlonzo.Code.Agda.Builtin.Reflection.C84
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C68
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                    (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                 (coe
                                    d48 (coe v0)
                                    (coe
                                       (MAlonzo.RTE.QName
                                          (198 :: Integer) (11528919355260747559 :: Integer)
                                          "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
                                          (MAlonzo.RTE.Fixity
                                             MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
                                    (coe MAlonzo.Code.Agda.Builtin.List.C16)))
                              (coe
                                 MAlonzo.Code.Agda.Builtin.List.C22
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.C84
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C68
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                       (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                    (coe MAlonzo.Code.Data.Nat.Reflection.d6 (coe v2)))
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.List.C22
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.C84
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.Reflection.C68
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                       (coe MAlonzo.Code.Data.Nat.Reflection.d10 (coe v5)))
                                    (coe MAlonzo.Code.Agda.Builtin.List.C16))) in
                    case coe v6 of
                      0 -> coe v7
                      _ -> let v8 = 0 :: Integer in
                           coe
                             MAlonzo.Code.Agda.Builtin.List.C22
                             (coe
                                MAlonzo.Code.Agda.Builtin.Reflection.C84
                                (coe
                                   MAlonzo.Code.Agda.Builtin.Reflection.C68
                                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                                   (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                                (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                             (coe MAlonzo.Code.Reflection.Term.d74 (coe v8) (coe v7))))
              (MAlonzo.Code.Tactic.RingSolver.Core.NatSet.d146
                 (coe v4) (coe v3))))
name224 = "Tactic.RingSolver.solve-∀-macro"
d224 ::
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d224 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
      (d24
         (coe
            MAlonzo.Code.Agda.Builtin.Reflection.C180 (coe v0)
            (coe MAlonzo.Code.Agda.Builtin.List.C16)))
      (\ v2 ->
         coe
           MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
           MAlonzo.Code.Agda.Builtin.Reflection.d354
           (\ v3 ->
              coe
                MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                (d68 (coe v2))
                (\ v4 ->
                   coe
                     MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                     (coe
                        MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                        (coe MAlonzo.Code.Agda.Builtin.Reflection.d296 v1)
                        MAlonzo.Code.Agda.Builtin.Reflection.d302)
                     (\ v5 ->
                        coe
                          MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                          (coe
                             MAlonzo.Code.Agda.Builtin.Reflection.d276 () erased
                             (MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d42
                                (coe (2 :: Integer))
                                (coe
                                   MAlonzo.Code.Agda.Builtin.Sigma.d30
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.d30
                                      (coe
                                         MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d76
                                         v5)))))
                          (\ v6 ->
                             case coe v6 of
                               MAlonzo.Code.Data.Maybe.Base.C26
                                 -> coe
                                      MAlonzo.Code.Agda.Builtin.Reflection.d294 () erased
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.List.C22
                                         (coe
                                            MAlonzo.Code.Agda.Builtin.Reflection.C262
                                            (coe (Data.Text.pack "Malformed call to solve.")))
                                         (coe
                                            MAlonzo.Code.Agda.Builtin.List.C22
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.Reflection.C262
                                               (coe
                                                  (Data.Text.pack
                                                     "Expected target type to be like: \8704 x y \8594 x + y \8776 y + x.")))
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.List.C22
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Reflection.C262
                                                  (coe (Data.Text.pack "Instead: ")))
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.List.C22
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Reflection.C264
                                                     (coe v5))
                                                  (coe MAlonzo.Code.Agda.Builtin.List.C16)))))
                               MAlonzo.Code.Data.Maybe.Base.C30 v7
                                 -> case coe v7 of
                                      MAlonzo.Code.Data.Vec.Base.C36 v9 v10
                                        -> case coe v10 of
                                             MAlonzo.Code.Data.Vec.Base.C36 v12 v13
                                               -> coe
                                                    seq (coe v13)
                                                    (coe
                                                       MAlonzo.Code.Agda.Builtin.Reflection.d288 v1
                                                       (coe
                                                          MAlonzo.Code.Agda.Builtin.Reflection.C180
                                                          (coe
                                                             (MAlonzo.RTE.QName
                                                                (456 :: Integer)
                                                                (13355546136547469431 :: Integer)
                                                                "Tactic.RingSolver.NonReflective.solve"
                                                                (MAlonzo.RTE.Fixity
                                                                   MAlonzo.RTE.NonAssoc
                                                                   MAlonzo.RTE.Unrelated)))
                                                          (coe
                                                             d168 (coe v2) (coe v4)
                                                             (coe
                                                                MAlonzo.Code.Agda.Builtin.Sigma.d28
                                                                (coe
                                                                   MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d76
                                                                   v5))
                                                             (coe
                                                                MAlonzo.Code.Agda.Builtin.Sigma.d28
                                                                (coe
                                                                   MAlonzo.Code.Agda.Builtin.Sigma.d30
                                                                   (coe
                                                                      MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d76
                                                                      v5)))
                                                             (coe v9) (coe v12))))
                                             _ -> MAlonzo.RTE.mazUnreachableError
                                      _ -> MAlonzo.RTE.mazUnreachableError
                               _ -> MAlonzo.RTE.mazUnreachableError)))))
name234 = "Tactic.RingSolver._._$ʳ_"
d234 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d234 v0 v1 v2 = du234 v2
du234 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du234 v0 = coe d48 (coe v0)
name238 = "Tactic.RingSolver._._⇓≟_"
d238 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer -> MAlonzo.Code.Data.Maybe.Base.T22 -> AgdaAny -> Bool
d238 v0 v1 v2 v3 v4 v5 v6 = du238 v5 v6
du238 :: MAlonzo.Code.Data.Maybe.Base.T22 -> AgdaAny -> Bool
du238 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Maybe.Base.C26
        -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      MAlonzo.Code.Data.Maybe.Base.C30 v2
        -> coe MAlonzo.Code.Agda.Builtin.Reflection.d8 v2 v1
      _ -> MAlonzo.RTE.mazUnreachableError
name240 = "Tactic.RingSolver._.callSolver"
d240 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74]
d240 v0 v1 v2 = du240 v2
du240 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74]
du240 v0 = coe d168 (coe v0)
name242 = "Tactic.RingSolver._.checkIsListOfVariables"
d242 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d242 v0 v1 v2 = du242 v2
du242 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
du242 v0 = coe d54 (coe v0)
name244 = "Tactic.RingSolver._.constructSoln"
d244 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d244 v0 v1 v2 = du244 v2
du244 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du244 v0 = coe d194 (coe v0)
name246 = "Tactic.RingSolver._.getFieldName"
d246 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny -> AgdaAny
d246 v0 v1 v2 = du246 v2
du246 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny -> AgdaAny
du246 v0 = coe d58 (coe v0)
name248 = "Tactic.RingSolver._.getRingOperatorNames"
d248 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d248 v0 v1 v2 = du248 v2
du248 :: MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
du248 v0 = coe d68 (coe v0)
name254 = "Tactic.RingSolver._.ToExpr.E"
d254 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d254 v0 v1 v2 = du254 v2
du254 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du254 v0 = coe d114 (coe v0)
name256 = "Tactic.RingSolver._.ToExpr.E⟨_⟩₁"
d256 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d256 v0 v1 v2 = du256 v2
du256 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du256 v0 = coe d110 (coe v0)
name258 = "Tactic.RingSolver._.ToExpr.E⟨_⟩₂"
d258 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d258 v0 v1 v2 = du258 v2
du258 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du258 v0 = coe d108 (coe v0)
name260 = "Tactic.RingSolver._.ToExpr.E⟨^⟩"
d260 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d260 v0 v1 v2 = du260 v2
du260 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du260 v0 = coe d112 (coe v0)
name278 = "Tactic.RingSolver.solve-∀"
d278 ::
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d278 = coe d224
name280 = "Tactic.RingSolver.solve-macro"
d280 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d280 v0 v1 v2
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
      (d24
         (coe
            MAlonzo.Code.Agda.Builtin.Reflection.C180 (coe v1)
            (coe MAlonzo.Code.Agda.Builtin.List.C16)))
      (\ v3 ->
         coe
           MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
           MAlonzo.Code.Agda.Builtin.Reflection.d354
           (\ v4 ->
              coe
                MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                (d68 (coe v3))
                (\ v5 ->
                   coe
                     MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                     (d54 (coe v3) (coe v0))
                     (\ v6 ->
                        coe
                          MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                          MAlonzo.Code.Agda.Builtin.Reflection.d354
                          (\ v7 ->
                             coe
                               MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                               (coe
                                  MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                                  (coe MAlonzo.Code.Agda.Builtin.Reflection.d296 v2)
                                  MAlonzo.Code.Agda.Builtin.Reflection.d302)
                               (\ v8 ->
                                  coe
                                    MAlonzo.Code.Agda.Builtin.Reflection.d286 () () erased erased
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.Reflection.d276 () erased
                                       (coe d28 v6))
                                    (\ v9 ->
                                       case coe v9 of
                                         MAlonzo.Code.Data.Maybe.Base.C26
                                           -> coe
                                                MAlonzo.Code.Agda.Builtin.Reflection.d294 () erased
                                                (coe
                                                   MAlonzo.Code.Agda.Builtin.List.C22
                                                   (coe
                                                      MAlonzo.Code.Agda.Builtin.Reflection.C262
                                                      (coe
                                                         (Data.Text.pack
                                                            "Malformed call to solve.")))
                                                   (coe
                                                      MAlonzo.Code.Agda.Builtin.List.C22
                                                      (coe
                                                         MAlonzo.Code.Agda.Builtin.Reflection.C262
                                                         (coe
                                                            (Data.Text.pack
                                                               "First argument should be a list of free variables.")))
                                                      (coe
                                                         MAlonzo.Code.Agda.Builtin.List.C22
                                                         (coe
                                                            MAlonzo.Code.Agda.Builtin.Reflection.C262
                                                            (coe (Data.Text.pack "Instead: ")))
                                                         (coe
                                                            MAlonzo.Code.Agda.Builtin.List.C22
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.Reflection.C264
                                                               (coe v6))
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.List.C16)))))
                                         MAlonzo.Code.Data.Maybe.Base.C30 v10
                                           -> coe
                                                MAlonzo.Code.Agda.Builtin.Reflection.d286 () ()
                                                erased erased
                                                (coe
                                                   MAlonzo.Code.Agda.Builtin.Reflection.d276 ()
                                                   erased
                                                   (MAlonzo.Code.Tactic.RingSolver.Core.ReflectionHelp.d42
                                                      (coe (2 :: Integer)) (coe v8)))
                                                (\ v11 ->
                                                   case coe v11 of
                                                     MAlonzo.Code.Data.Maybe.Base.C26
                                                       -> coe
                                                            MAlonzo.Code.Agda.Builtin.Reflection.d294
                                                            () erased
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.List.C22
                                                               (coe
                                                                  MAlonzo.Code.Agda.Builtin.Reflection.C262
                                                                  (coe
                                                                     (Data.Text.pack
                                                                        "Malformed call to solve.")))
                                                               (coe
                                                                  MAlonzo.Code.Agda.Builtin.List.C22
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.Reflection.C262
                                                                     (coe
                                                                        (Data.Text.pack
                                                                           "First argument should be a list of free variables.")))
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.List.C22
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.Reflection.C262
                                                                        (coe
                                                                           (Data.Text.pack
                                                                              "Instead: ")))
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.List.C22
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.Reflection.C264
                                                                           (coe v8))
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.List.C16)))))
                                                     MAlonzo.Code.Data.Maybe.Base.C30 v12
                                                       -> case coe v12 of
                                                            MAlonzo.Code.Data.Vec.Base.C36 v14 v15
                                                              -> case coe v15 of
                                                                   MAlonzo.Code.Data.Vec.Base.C36 v17 v18
                                                                     -> coe
                                                                          seq (coe v18)
                                                                          (coe
                                                                             MAlonzo.Code.Agda.Builtin.Reflection.d288
                                                                             v2
                                                                             (d194
                                                                                (coe v3) (coe v5)
                                                                                (coe
                                                                                   MAlonzo.Code.Data.List.Base.du272
                                                                                   v10)
                                                                                (coe v10) (coe v14)
                                                                                (coe v17)))
                                                                   _ -> MAlonzo.RTE.mazUnreachableError
                                                            _ -> MAlonzo.RTE.mazUnreachableError
                                                     _ -> MAlonzo.RTE.mazUnreachableError)
                                         _ -> MAlonzo.RTE.mazUnreachableError)))))))
name292 = "Tactic.RingSolver._._$ʳ_"
d292 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d292 v0 v1 v2 v3 = du292 v3
du292 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du292 v0 = coe d48 (coe v0)
name296 = "Tactic.RingSolver._._⇓≟_"
d296 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer -> MAlonzo.Code.Data.Maybe.Base.T22 -> AgdaAny -> Bool
d296 v0 v1 v2 v3 v4 v5 v6 v7 = du296 v6 v7
du296 :: MAlonzo.Code.Data.Maybe.Base.T22 -> AgdaAny -> Bool
du296 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Maybe.Base.C26
        -> coe MAlonzo.Code.Agda.Builtin.Bool.C8
      MAlonzo.Code.Data.Maybe.Base.C30 v2
        -> coe MAlonzo.Code.Agda.Builtin.Reflection.d8 v2 v1
      _ -> MAlonzo.RTE.mazUnreachableError
name298 = "Tactic.RingSolver._.callSolver"
d298 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74]
d298 v0 v1 v2 v3 = du298 v3
du298 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  MAlonzo.Code.Data.Vec.Base.T24 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74]
du298 v0 = coe d168 (coe v0)
name300 = "Tactic.RingSolver._.checkIsListOfVariables"
d300 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d300 v0 v1 v2 v3 = du300 v3
du300 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
du300 v0 = coe d54 (coe v0)
name302 = "Tactic.RingSolver._.constructSoln"
d302 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d302 v0 v1 v2 v3 = du302 v3
du302 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du302 v0 = coe d194 (coe v0)
name304 = "Tactic.RingSolver._.getFieldName"
d304 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny -> AgdaAny
d304 v0 v1 v2 v3 = du304 v3
du304 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny -> AgdaAny
du304 v0 = coe d58 (coe v0)
name306 = "Tactic.RingSolver._.getRingOperatorNames"
d306 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d306 v0 v1 v2 v3 = du306 v3
du306 :: MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
du306 v0 = coe d68 (coe v0)
name312 = "Tactic.RingSolver._.ToExpr.E"
d312 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d312 v0 v1 v2 v3 = du312 v3
du312 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du312 v0 = coe d114 (coe v0)
name314 = "Tactic.RingSolver._.ToExpr.E⟨_⟩₁"
d314 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d314 v0 v1 v2 v3 = du314 v3
du314 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du314 v0 = coe d110 (coe v0)
name316 = "Tactic.RingSolver._.ToExpr.E⟨_⟩₂"
d316 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d316 v0 v1 v2 v3 = du316 v3
du316 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du316 v0 = coe d108 (coe v0)
name318 = "Tactic.RingSolver._.ToExpr.E⟨^⟩"
d318 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
d318 v0 v1 v2 v3 = du318 v3
du318 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  T4 ->
  Integer ->
  (Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T160
du318 v0 = coe d112 (coe v0)
name336 = "Tactic.RingSolver.solve"
d336 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T160 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Reflection.T160 -> AgdaAny
d336 = coe d280
