{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Puzzle18 where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.Nat.Show
import qualified MAlonzo.Code.Data.Product
import qualified MAlonzo.Code.Data.String.Base
import qualified MAlonzo.Code.IO
import qualified MAlonzo.Code.Level
import qualified MAlonzo.Code.Puzzle18Input

name8 = "Puzzle18.parseExpression"
d8 ::
  Integer ->
  MAlonzo.Code.Puzzle18Input.T2 ->
  [MAlonzo.Code.Puzzle18Input.T8] ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d8 v0 v1 v2
  = case coe v2 of
      [] -> coe MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v0) (coe v2)
      (:) v3 v4
        -> case coe v3 of
             MAlonzo.Code.Puzzle18Input.C10
               -> coe
                    d8 (coe v0) (coe v1)
                    (coe
                       MAlonzo.Code.Agda.Builtin.List.C22
                       (coe
                          MAlonzo.Code.Puzzle18Input.C16
                          (coe
                             MAlonzo.Code.Agda.Builtin.Sigma.d28
                             (coe
                                d8 (coe (0 :: Integer)) (coe MAlonzo.Code.Puzzle18Input.C4)
                                (coe v4))))
                       (coe
                          MAlonzo.Code.Agda.Builtin.Sigma.d30
                          (coe
                             d8 (coe (0 :: Integer)) (coe MAlonzo.Code.Puzzle18Input.C4)
                             (coe v4))))
             MAlonzo.Code.Puzzle18Input.C12
               -> coe MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe v0) (coe v4)
             MAlonzo.Code.Puzzle18Input.C14 v5
               -> coe d8 (coe v0) (coe v5) (coe v4)
             MAlonzo.Code.Puzzle18Input.C16 v5
               -> case coe v1 of
                    MAlonzo.Code.Puzzle18Input.C4
                      -> coe d8 (coe addInt (coe v0) (coe v5)) (coe v1) (coe v4)
                    MAlonzo.Code.Puzzle18Input.C6
                      -> coe d8 (coe mulInt (coe v0) (coe v5)) (coe v1) (coe v4)
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name50 = "Puzzle18.parseExpression'"
d50 ::
  Integer ->
  Integer ->
  [MAlonzo.Code.Puzzle18Input.T8] ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d50 v0 v1 v2
  = case coe v2 of
      []
        -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe mulInt (coe v0) (coe v1))
             (coe v2)
      (:) v3 v4
        -> case coe v3 of
             MAlonzo.Code.Puzzle18Input.C10
               -> coe
                    d50 (coe v0) (coe v1)
                    (coe
                       MAlonzo.Code.Agda.Builtin.List.C22
                       (coe
                          MAlonzo.Code.Puzzle18Input.C16
                          (coe
                             MAlonzo.Code.Agda.Builtin.Sigma.d28
                             (coe d50 (coe (1 :: Integer)) (coe (0 :: Integer)) (coe v4))))
                       (coe
                          MAlonzo.Code.Agda.Builtin.Sigma.d30
                          (coe d50 (coe (1 :: Integer)) (coe (0 :: Integer)) (coe v4))))
             MAlonzo.Code.Puzzle18Input.C12
               -> coe
                    MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe mulInt (coe v0) (coe v1))
                    (coe v4)
             MAlonzo.Code.Puzzle18Input.C14 v5
               -> case coe v5 of
                    MAlonzo.Code.Puzzle18Input.C4 -> coe d50 (coe v0) (coe v1) (coe v4)
                    MAlonzo.Code.Puzzle18Input.C6
                      -> coe
                           d50 (coe mulInt (coe v0) (coe v1)) (coe (0 :: Integer)) (coe v4)
                    _ -> MAlonzo.RTE.mazUnreachableError
             MAlonzo.Code.Puzzle18Input.C16 v5
               -> coe d50 (coe v0) (coe addInt (coe v1) (coe v5)) (coe v4)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name92 = "Puzzle18.results"
d92 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d92
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.C32
      (coe
         MAlonzo.Code.Data.List.Base.du230
         (coe
            (\ v0 v1 ->
               addInt
                 (coe
                    MAlonzo.Code.Agda.Builtin.Sigma.d28
                    (coe
                       d8 (coe (0 :: Integer)) (coe MAlonzo.Code.Puzzle18Input.C4)
                       (coe v1)))
                 (coe v0)))
         (coe (0 :: Integer)) (coe MAlonzo.Code.Puzzle18Input.d18))
      (coe
         MAlonzo.Code.Data.List.Base.du230
         (coe
            (\ v0 v1 ->
               addInt
                 (coe
                    MAlonzo.Code.Agda.Builtin.Sigma.d28
                    (coe d50 (coe (1 :: Integer)) (coe (0 :: Integer)) (coe v1)))
                 (coe v0)))
         (coe (0 :: Integer)) (coe MAlonzo.Code.Puzzle18Input.d18))
main = coe d94
name94 = "Puzzle18.main"
d94 ::
  MAlonzo.Code.Agda.Builtin.IO.T8 AgdaAny MAlonzo.Code.Level.T8
d94
  = coe
      MAlonzo.Code.IO.du42 (coe ())
      (coe
         MAlonzo.Code.IO.d150
         (coe
            MAlonzo.Code.Data.Product.du264
            (coe
               (\ v0 v1 ->
                  coe
                    MAlonzo.Code.Data.String.Base.d126
                    (Data.Text.pack "R\233ponse 1 : ")
                    (coe
                       MAlonzo.Code.Data.String.Base.d126 v0
                       (coe
                          MAlonzo.Code.Data.String.Base.d126
                          (Data.Text.pack " ; R\233ponse 2 : ") v1))))
            (coe
               MAlonzo.Code.Data.Product.du148
               (coe MAlonzo.Code.Data.Nat.Show.d14)
               (coe (\ v0 -> MAlonzo.Code.Data.Nat.Show.d14)) (coe d92))))
