{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Puzzle22 where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Data.Bool.Base
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.List.Membership.DecSetoid
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Nat.Show
import qualified MAlonzo.Code.IO
import qualified MAlonzo.Code.Level
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties
import qualified MAlonzo.Code.Relation.Nullary

name2 = "Puzzle22.dec≡₁"
d2 :: [Integer] -> [Integer] -> MAlonzo.Code.Relation.Nullary.T32
d2 v0 v1
  = case coe v0 of
      []
        -> case coe v1 of
             []
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
                    (coe MAlonzo.Code.Relation.Nullary.C22 erased)
             (:) v2 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      (:) v2 v3
        -> case coe v1 of
             []
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             (:) v4 v5
               -> let v6
                        = MAlonzo.Code.Data.Nat.Properties.d1360 (coe v2) (coe v4) in
                  case coe v6 of
                    MAlonzo.Code.Relation.Nullary.C46 v7 v8
                      -> if coe v7
                           then coe
                                  seq (coe v8)
                                  (let v9 = d2 (coe v3) (coe v5) in
                                   case coe v9 of
                                     MAlonzo.Code.Relation.Nullary.C46 v10 v11
                                       -> if coe v10
                                            then coe
                                                   seq (coe v11)
                                                   (coe
                                                      MAlonzo.Code.Relation.Nullary.C46 (coe v10)
                                                      (coe
                                                         MAlonzo.Code.Relation.Nullary.C22 erased))
                                            else coe
                                                   seq (coe v11)
                                                   (coe
                                                      MAlonzo.Code.Relation.Nullary.C46 (coe v10)
                                                      (coe MAlonzo.Code.Relation.Nullary.C26))
                                     _ -> MAlonzo.RTE.mazUnreachableError)
                           else coe
                                  seq (coe v8)
                                  (coe
                                     MAlonzo.Code.Relation.Nullary.C46 (coe v7)
                                     (coe MAlonzo.Code.Relation.Nullary.C26))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name60 = "Puzzle22.dec≡"
d60 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Relation.Nullary.T32
d60 v0 v1
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Sigma.C32 v2 v3
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Sigma.C32 v4 v5
               -> let v6 = d2 (coe v2) (coe v4) in
                  case coe v6 of
                    MAlonzo.Code.Relation.Nullary.C46 v7 v8
                      -> if coe v7
                           then coe
                                  seq (coe v8)
                                  (let v9 = d2 (coe v3) (coe v5) in
                                   case coe v9 of
                                     MAlonzo.Code.Relation.Nullary.C46 v10 v11
                                       -> if coe v10
                                            then coe
                                                   seq (coe v11)
                                                   (coe
                                                      MAlonzo.Code.Relation.Nullary.C46 (coe v10)
                                                      (coe
                                                         MAlonzo.Code.Relation.Nullary.C22 erased))
                                            else coe
                                                   seq (coe v11)
                                                   (coe
                                                      MAlonzo.Code.Relation.Nullary.C46 (coe v10)
                                                      (coe MAlonzo.Code.Relation.Nullary.C26))
                                     _ -> MAlonzo.RTE.mazUnreachableError)
                           else coe
                                  seq (coe v8)
                                  (coe
                                     MAlonzo.Code.Relation.Nullary.C46 (coe v7)
                                     (coe MAlonzo.Code.Relation.Nullary.C26))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name99 = "Puzzle22..absurdlambda"
d99 ::
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d99 = erased
name140 = "Puzzle22.joueur1"
d140 :: [Integer]
d140
  = coe
      MAlonzo.Code.Agda.Builtin.List.C22 (coe (4 :: Integer))
      (coe
         MAlonzo.Code.Agda.Builtin.List.C22 (coe (25 :: Integer))
         (coe
            MAlonzo.Code.Agda.Builtin.List.C22 (coe (3 :: Integer))
            (coe
               MAlonzo.Code.Agda.Builtin.List.C22 (coe (11 :: Integer))
               (coe
                  MAlonzo.Code.Agda.Builtin.List.C22 (coe (2 :: Integer))
                  (coe
                     MAlonzo.Code.Agda.Builtin.List.C22 (coe (29 :: Integer))
                     (coe
                        MAlonzo.Code.Agda.Builtin.List.C22 (coe (41 :: Integer))
                        (coe
                           MAlonzo.Code.Agda.Builtin.List.C22 (coe (23 :: Integer))
                           (coe
                              MAlonzo.Code.Agda.Builtin.List.C22 (coe (30 :: Integer))
                              (coe
                                 MAlonzo.Code.Agda.Builtin.List.C22 (coe (21 :: Integer))
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.List.C22 (coe (50 :: Integer))
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.List.C22 (coe (8 :: Integer))
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.List.C22 (coe (1 :: Integer))
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.List.C22
                                             (coe (24 :: Integer))
                                             (coe
                                                MAlonzo.Code.Agda.Builtin.List.C22
                                                (coe (27 :: Integer))
                                                (coe
                                                   MAlonzo.Code.Agda.Builtin.List.C22
                                                   (coe (10 :: Integer))
                                                   (coe
                                                      MAlonzo.Code.Agda.Builtin.List.C22
                                                      (coe (42 :: Integer))
                                                      (coe
                                                         MAlonzo.Code.Agda.Builtin.List.C22
                                                         (coe (43 :: Integer))
                                                         (coe
                                                            MAlonzo.Code.Agda.Builtin.List.C22
                                                            (coe (38 :: Integer))
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.List.C22
                                                               (coe (15 :: Integer))
                                                               (coe
                                                                  MAlonzo.Code.Agda.Builtin.List.C22
                                                                  (coe (18 :: Integer))
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.List.C22
                                                                     (coe (13 :: Integer))
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.List.C22
                                                                        (coe (32 :: Integer))
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.List.C22
                                                                           (coe (37 :: Integer))
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.List.C22
                                                                              (coe (34 :: Integer))
                                                                              (coe
                                                                                 MAlonzo.Code.Agda.Builtin.List.C16)))))))))))))))))))))))))
name142 = "Puzzle22.joueur2"
d142 :: [Integer]
d142
  = coe
      MAlonzo.Code.Agda.Builtin.List.C22 (coe (12 :: Integer))
      (coe
         MAlonzo.Code.Agda.Builtin.List.C22 (coe (6 :: Integer))
         (coe
            MAlonzo.Code.Agda.Builtin.List.C22 (coe (36 :: Integer))
            (coe
               MAlonzo.Code.Agda.Builtin.List.C22 (coe (35 :: Integer))
               (coe
                  MAlonzo.Code.Agda.Builtin.List.C22 (coe (40 :: Integer))
                  (coe
                     MAlonzo.Code.Agda.Builtin.List.C22 (coe (47 :: Integer))
                     (coe
                        MAlonzo.Code.Agda.Builtin.List.C22 (coe (31 :: Integer))
                        (coe
                           MAlonzo.Code.Agda.Builtin.List.C22 (coe (9 :: Integer))
                           (coe
                              MAlonzo.Code.Agda.Builtin.List.C22 (coe (46 :: Integer))
                              (coe
                                 MAlonzo.Code.Agda.Builtin.List.C22 (coe (49 :: Integer))
                                 (coe
                                    MAlonzo.Code.Agda.Builtin.List.C22 (coe (19 :: Integer))
                                    (coe
                                       MAlonzo.Code.Agda.Builtin.List.C22 (coe (16 :: Integer))
                                       (coe
                                          MAlonzo.Code.Agda.Builtin.List.C22 (coe (5 :: Integer))
                                          (coe
                                             MAlonzo.Code.Agda.Builtin.List.C22
                                             (coe (26 :: Integer))
                                             (coe
                                                MAlonzo.Code.Agda.Builtin.List.C22
                                                (coe (39 :: Integer))
                                                (coe
                                                   MAlonzo.Code.Agda.Builtin.List.C22
                                                   (coe (48 :: Integer))
                                                   (coe
                                                      MAlonzo.Code.Agda.Builtin.List.C22
                                                      (coe (7 :: Integer))
                                                      (coe
                                                         MAlonzo.Code.Agda.Builtin.List.C22
                                                         (coe (44 :: Integer))
                                                         (coe
                                                            MAlonzo.Code.Agda.Builtin.List.C22
                                                            (coe (45 :: Integer))
                                                            (coe
                                                               MAlonzo.Code.Agda.Builtin.List.C22
                                                               (coe (20 :: Integer))
                                                               (coe
                                                                  MAlonzo.Code.Agda.Builtin.List.C22
                                                                  (coe (17 :: Integer))
                                                                  (coe
                                                                     MAlonzo.Code.Agda.Builtin.List.C22
                                                                     (coe (14 :: Integer))
                                                                     (coe
                                                                        MAlonzo.Code.Agda.Builtin.List.C22
                                                                        (coe (33 :: Integer))
                                                                        (coe
                                                                           MAlonzo.Code.Agda.Builtin.List.C22
                                                                           (coe (28 :: Integer))
                                                                           (coe
                                                                              MAlonzo.Code.Agda.Builtin.List.C22
                                                                              (coe (22 :: Integer))
                                                                              (coe
                                                                                 MAlonzo.Code.Agda.Builtin.List.C16)))))))))))))))))))))))))
name148 = "Puzzle22.score"
d148 :: Integer -> Integer -> [Integer] -> Integer
d148 v0 v1 v2
  = case coe v2 of
      [] -> coe v1
      (:) v3 v4
        -> coe
             d148 (coe addInt (coe (1 :: Integer)) (coe v0))
             (coe addInt (coe mulInt (coe v0) (coe v3)) (coe v1)) (coe v4)
      _ -> MAlonzo.RTE.mazUnreachableError
name160 = "Puzzle22.result"
d160 :: [Integer] -> Integer
d160 v0
  = coe
      d148 (coe (1 :: Integer)) (coe (0 :: Integer))
      (coe MAlonzo.Code.Data.List.Base.du774 v0)
name164 = "Puzzle22.partie"
d164 :: [Integer] -> [Integer] -> Integer
d164 v0 v1
  = case coe v0 of
      []
        -> coe
             d148 (coe (1 :: Integer)) (coe (0 :: Integer))
             (coe MAlonzo.Code.Data.List.Base.du774 v1)
      (:) v2 v3
        -> case coe v1 of
             []
               -> coe
                    d148 (coe (1 :: Integer)) (coe (0 :: Integer))
                    (coe MAlonzo.Code.Data.List.Base.du774 v0)
             (:) v4 v5
               -> coe
                    MAlonzo.Code.Data.Bool.Base.du42
                    (coe
                       MAlonzo.Code.Relation.Nullary.d42
                       (coe MAlonzo.Code.Data.Nat.Properties.d1464 (coe v2) (coe v4)))
                    (coe
                       d164 (coe v3)
                       (coe
                          MAlonzo.Code.Data.List.Base.du58 (coe v5)
                          (coe
                             MAlonzo.Code.Agda.Builtin.List.C22 (coe v4)
                             (coe
                                MAlonzo.Code.Agda.Builtin.List.C22 (coe v2)
                                (coe MAlonzo.Code.Agda.Builtin.List.C16)))))
                    (coe
                       d164
                       (coe
                          MAlonzo.Code.Data.List.Base.du58 (coe v3)
                          (coe
                             MAlonzo.Code.Agda.Builtin.List.C22 (coe v2)
                             (coe
                                MAlonzo.Code.Agda.Builtin.List.C22 (coe v4)
                                (coe MAlonzo.Code.Agda.Builtin.List.C16))))
                       (coe v5))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name180 = "Puzzle22.partie₂"
d180 ::
  [MAlonzo.Code.Agda.Builtin.Sigma.T14] ->
  [Integer] -> [Integer] -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d180 v0 v1 v2
  = case coe v1 of
      []
        -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C32
             (coe MAlonzo.Code.Agda.Builtin.Bool.C8) (coe d160 (coe v2))
      (:) v3 v4
        -> case coe v2 of
             []
               -> coe
                    MAlonzo.Code.Agda.Builtin.Sigma.C32
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C10) (coe d160 (coe v1))
             (:) v5 v6
               -> let v7
                        = MAlonzo.Code.Relation.Nullary.d42
                            (coe
                               MAlonzo.Code.Data.List.Membership.DecSetoid.du62
                               (coe
                                  MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du254
                                  (coe d60))
                               (coe MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v1) (coe v2))
                               (coe v0)) in
                  if coe v7
                    then coe
                           MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v7) (coe d160 (coe v1))
                    else (let v8
                                = MAlonzo.Code.Data.Bool.Base.d24
                                    (coe
                                       MAlonzo.Code.Relation.Nullary.d42
                                       (coe
                                          MAlonzo.Code.Data.Nat.Properties.d1464 (coe v3)
                                          (coe MAlonzo.Code.Data.List.Base.du272 v4)))
                                    (coe
                                       MAlonzo.Code.Relation.Nullary.d42
                                       (coe
                                          MAlonzo.Code.Data.Nat.Properties.d1464 (coe v5)
                                          (coe MAlonzo.Code.Data.List.Base.du272 v6))) in
                          if coe v8
                            then coe
                                   MAlonzo.Code.Data.Bool.Base.du42
                                   (coe
                                      MAlonzo.Code.Agda.Builtin.Sigma.d28
                                      (coe
                                         d180 (coe MAlonzo.Code.Agda.Builtin.List.C16)
                                         (coe MAlonzo.Code.Data.List.Base.du470 (coe v3) (coe v4))
                                         (coe MAlonzo.Code.Data.List.Base.du470 (coe v5) (coe v6))))
                                   (coe
                                      d180
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.List.C22
                                         (coe MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v1) (coe v2))
                                         (coe v0))
                                      (coe
                                         MAlonzo.Code.Data.List.Base.du58 (coe v4)
                                         (coe
                                            MAlonzo.Code.Agda.Builtin.List.C22 (coe v3)
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.List.C22 (coe v5)
                                               (coe MAlonzo.Code.Agda.Builtin.List.C16))))
                                      (coe v6))
                                   (coe
                                      d180
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.List.C22
                                         (coe MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v1) (coe v2))
                                         (coe v0))
                                      (coe v4)
                                      (coe
                                         MAlonzo.Code.Data.List.Base.du58 (coe v6)
                                         (coe
                                            MAlonzo.Code.Agda.Builtin.List.C22 (coe v5)
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.List.C22 (coe v3)
                                               (coe MAlonzo.Code.Agda.Builtin.List.C16)))))
                            else coe
                                   MAlonzo.Code.Data.Bool.Base.du42
                                   (coe
                                      MAlonzo.Code.Relation.Nullary.d42
                                      (coe
                                         MAlonzo.Code.Data.Nat.Properties.d1464 (coe v3) (coe v5)))
                                   (coe
                                      d180
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.List.C22
                                         (coe MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v1) (coe v2))
                                         (coe v0))
                                      (coe v4)
                                      (coe
                                         MAlonzo.Code.Data.List.Base.du58 (coe v6)
                                         (coe
                                            MAlonzo.Code.Agda.Builtin.List.C22 (coe v5)
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.List.C22 (coe v3)
                                               (coe MAlonzo.Code.Agda.Builtin.List.C16)))))
                                   (coe
                                      d180
                                      (coe
                                         MAlonzo.Code.Agda.Builtin.List.C22
                                         (coe MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v1) (coe v2))
                                         (coe v0))
                                      (coe
                                         MAlonzo.Code.Data.List.Base.du58 (coe v4)
                                         (coe
                                            MAlonzo.Code.Agda.Builtin.List.C22 (coe v3)
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.List.C22 (coe v5)
                                               (coe MAlonzo.Code.Agda.Builtin.List.C16))))
                                      (coe v6)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name193 = "Puzzle22..absurdlambda"
d193 ::
  Integer ->
  [Integer] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d193 = erased
main = coe d264
name264 = "Puzzle22.main"
d264 ::
  MAlonzo.Code.Agda.Builtin.IO.T8 AgdaAny MAlonzo.Code.Level.T8
d264
  = coe
      MAlonzo.Code.IO.du42 (coe ())
      (coe
         MAlonzo.Code.IO.d150
         (coe
            MAlonzo.Code.Data.Nat.Show.d14
            (coe
               MAlonzo.Code.Agda.Builtin.Sigma.d30
               (coe
                  d180 (coe MAlonzo.Code.Agda.Builtin.List.C16) (coe d140)
                  (coe d142)))))
