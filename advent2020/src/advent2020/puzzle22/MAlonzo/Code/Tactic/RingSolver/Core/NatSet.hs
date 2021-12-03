{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.NatSet where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.Maybe.Base
import qualified MAlonzo.Code.Data.Nat.Base

name16 = "Tactic.RingSolver.Core.NatSet.para"
d16 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> [AgdaAny] -> AgdaAny -> AgdaAny) ->
  AgdaAny -> [AgdaAny] -> AgdaAny
d16 v0 v1 v2 v3 v4 v5 v6 = du16 v4 v5 v6
du16 ::
  (AgdaAny -> [AgdaAny] -> AgdaAny -> AgdaAny) ->
  AgdaAny -> [AgdaAny] -> AgdaAny
du16 v0 v1 v2
  = case coe v2 of
      [] -> coe v1
      (:) v3 v4 -> coe v0 v3 v4 (coe du16 (coe v0) (coe v1) (coe v4))
      _ -> MAlonzo.RTE.mazUnreachableError
name30 = "Tactic.RingSolver.Core.NatSet.NatSet"
d30 :: ()
d30 = erased
name32 = "Tactic.RingSolver.Core.NatSet.insert"
d32 :: Integer -> [Integer] -> [Integer]
d32 v0 v1
  = coe
      du16 (coe du42)
      (\ v2 ->
         coe
           MAlonzo.Code.Agda.Builtin.List.C22 (coe v2)
           (coe MAlonzo.Code.Agda.Builtin.List.C16))
      v1 v0
name42 = "Tactic.RingSolver.Core.NatSet._.f"
d42 ::
  Integer ->
  [Integer] ->
  Integer ->
  [Integer] -> (Integer -> [Integer]) -> Integer -> [Integer]
d42 v0 v1 v2 v3 v4 v5 = du42 v2 v3 v4 v5
du42 ::
  Integer ->
  [Integer] -> (Integer -> [Integer]) -> Integer -> [Integer]
du42 v0 v1 v2 v3
  = let v4 = MAlonzo.Code.Data.Nat.Base.d262 (coe v3) (coe v0) in
    case coe v4 of
      MAlonzo.Code.Data.Nat.Base.C246 v6
        -> coe
             MAlonzo.Code.Agda.Builtin.List.C22 (coe v3)
             (coe MAlonzo.Code.Agda.Builtin.List.C22 (coe v6) (coe v1))
      MAlonzo.Code.Data.Nat.Base.C250
        -> coe MAlonzo.Code.Agda.Builtin.List.C22 (coe v0) (coe v1)
      MAlonzo.Code.Data.Nat.Base.C256 v6
        -> coe MAlonzo.Code.Agda.Builtin.List.C22 (coe v0) (coe v2 v6)
      _ -> MAlonzo.RTE.mazUnreachableError
name86 = "Tactic.RingSolver.Core.NatSet.delete"
d86 :: Integer -> [Integer] -> [Integer]
d86 v0 v1
  = coe
      du16 (coe du96) (\ v2 -> coe MAlonzo.Code.Agda.Builtin.List.C16) v1
      v0
name96 = "Tactic.RingSolver.Core.NatSet._.f"
d96 ::
  Integer ->
  [Integer] ->
  Integer ->
  [Integer] -> (Integer -> [Integer]) -> Integer -> [Integer]
d96 v0 v1 v2 v3 v4 v5 = du96 v2 v3 v4 v5
du96 ::
  Integer ->
  [Integer] -> (Integer -> [Integer]) -> Integer -> [Integer]
du96 v0 v1 v2 v3
  = let v4 = MAlonzo.Code.Data.Nat.Base.d262 (coe v3) (coe v0) in
    case coe v4 of
      MAlonzo.Code.Data.Nat.Base.C246 v6
        -> coe
             MAlonzo.Code.Agda.Builtin.List.C22
             (coe addInt (coe addInt (coe (1 :: Integer)) (coe v3)) (coe v6))
             (coe v1)
      MAlonzo.Code.Data.Nat.Base.C250
        -> case coe v1 of
             [] -> coe v1
             (:) v6 v7
               -> coe
                    MAlonzo.Code.Agda.Builtin.List.C22
                    (coe addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v6))
                    (coe v7)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Data.Nat.Base.C256 v6
        -> coe MAlonzo.Code.Agda.Builtin.List.C22 (coe v0) (coe v2 v6)
      _ -> MAlonzo.RTE.mazUnreachableError
name146 = "Tactic.RingSolver.Core.NatSet.lookup"
d146 :: Integer -> [Integer] -> MAlonzo.Code.Data.Maybe.Base.T22
d146 v0 v1
  = coe
      MAlonzo.Code.Data.List.Base.du216 (coe du156)
      (\ v2 v3 -> coe MAlonzo.Code.Data.Maybe.Base.C26) v1 v0
      (0 :: Integer)
name156 = "Tactic.RingSolver.Core.NatSet._.f"
d156 ::
  Integer ->
  [Integer] ->
  Integer ->
  (Integer -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  Integer -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22
d156 v0 v1 v2 v3 v4 v5 = du156 v2 v3 v4 v5
du156 ::
  Integer ->
  (Integer -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  Integer -> Integer -> MAlonzo.Code.Data.Maybe.Base.T22
du156 v0 v1 v2 v3
  = let v4 = MAlonzo.Code.Data.Nat.Base.d262 (coe v2) (coe v0) in
    case coe v4 of
      MAlonzo.Code.Data.Nat.Base.C246 v6
        -> coe MAlonzo.Code.Data.Maybe.Base.C26
      MAlonzo.Code.Data.Nat.Base.C250
        -> coe MAlonzo.Code.Data.Maybe.Base.C30 (coe v3)
      MAlonzo.Code.Data.Nat.Base.C256 v6
        -> coe v1 v6 (addInt (coe (1 :: Integer)) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
name198 = "Tactic.RingSolver.Core.NatSet.member"
d198 :: Integer -> [Integer] -> Bool
d198 v0 v1
  = coe
      MAlonzo.Code.Data.Maybe.Base.du34 (coe d146 (coe v0) (coe v1))
name202 = "Tactic.RingSolver.Core.NatSet.fromList"
d202 :: [Integer] -> [Integer]
d202
  = coe
      MAlonzo.Code.Data.List.Base.du216 (coe d32)
      (coe MAlonzo.Code.Agda.Builtin.List.C16)
name204 = "Tactic.RingSolver.Core.NatSet.toList"
d204 :: [Integer] -> [Integer]
d204 v0
  = coe
      MAlonzo.Code.Data.List.Base.du482 (coe (1 :: Integer))
      (coe
         MAlonzo.Code.Data.List.Base.du20
         (coe MAlonzo.Code.Data.Nat.Base.d82)
         (coe
            MAlonzo.Code.Data.List.Base.du342
            (coe
               (\ v1 v2 ->
                  addInt (coe addInt (coe (1 :: Integer)) (coe v1)) (coe v2)))
            (coe (0 :: Integer)) (coe v0)))
