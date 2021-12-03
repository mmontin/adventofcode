{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Digit where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Data.Fin.Base
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.DivMod
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Induction.WellFounded
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary

name4 = "Data.Digit.Digit"
d4 :: Integer -> ()
d4 = erased
name8 = "Data.Digit.Decimal"
d8 :: ()
d8 = erased
name10 = "Data.Digit.Bit"
d10 :: ()
d10 = erased
name12 = "Data.Digit.0b"
d12 :: MAlonzo.Code.Data.Fin.Base.T6
d12 = coe MAlonzo.Code.Data.Fin.Base.C10
name14 = "Data.Digit.1b"
d14 :: MAlonzo.Code.Data.Fin.Base.T6
d14
  = coe
      MAlonzo.Code.Data.Fin.Base.C16 (coe MAlonzo.Code.Data.Fin.Base.C10)
name20 = "Data.Digit.toNatDigits"
d20 :: Integer -> AgdaAny -> Integer -> [Integer]
d20 v0 v1 v2 = du20 v0 v2
du20 :: Integer -> Integer -> [Integer]
du20 v0 v1
  = case coe v0 of
      1 -> coe
             MAlonzo.Code.Data.List.Base.du282 (coe v1) (coe (1 :: Integer))
      _ -> let v2 = subInt (coe v0) (coe (2 :: Integer)) in
           coe du38 (coe v2) (coe v1) (coe MAlonzo.Code.Agda.Builtin.List.C16)
name38 = "Data.Digit._.aux"
d38 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Induction.WellFounded.T42 -> [Integer] -> [Integer]
d38 v0 v1 v2 v3 v4 v5 = du38 v0 v3 v5
du38 :: Integer -> Integer -> [Integer] -> [Integer]
du38 v0 v1 v2
  = case coe v1 of
      0 -> coe
             MAlonzo.Code.Agda.Builtin.List.C22 (coe (0 :: Integer)) (coe v2)
      _ -> let v3
                 = MAlonzo.Code.Relation.Nullary.d42
                     (coe
                        MAlonzo.Code.Data.Nat.Properties.d1684 (coe (0 :: Integer))
                        (coe
                           MAlonzo.Code.Data.Nat.DivMod.du12 (coe v1)
                           (coe addInt (coe (2 :: Integer)) (coe v0)))) in
           if coe v3
             then coe
                    du38 (coe v0)
                    (coe
                       MAlonzo.Code.Data.Nat.DivMod.du12 (coe v1)
                       (coe addInt (coe (2 :: Integer)) (coe v0)))
                    (coe
                       MAlonzo.Code.Agda.Builtin.List.C22
                       (coe
                          MAlonzo.Code.Data.Nat.DivMod.du24 (coe v1)
                          (coe addInt (coe (2 :: Integer)) (coe v0)))
                       (coe v2))
             else coe
                    MAlonzo.Code.Agda.Builtin.List.C22
                    (coe
                       MAlonzo.Code.Data.Nat.DivMod.du24 (coe v1)
                       (coe addInt (coe (2 :: Integer)) (coe v0)))
                    (coe v2)
name74 = "Data.Digit._._.q<n"
d74 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T6 ->
   MAlonzo.Code.Induction.WellFounded.T42) ->
  [Integer] -> MAlonzo.Code.Data.Nat.Base.T6
d74 v0 v1 v2 v3 v4 v5 = du74 v0 v1
du74 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du74 v0 v1
  = coe
      MAlonzo.Code.Data.Nat.DivMod.du440
      (coe addInt (coe (1 :: Integer)) (coe v1))
      (coe addInt (coe (2 :: Integer)) (coe v0))
name76 = "Data.Digit.Expansion"
d76 :: Integer -> ()
d76 = erased
name82 = "Data.Digit.fromDigits"
d82 :: Integer -> [MAlonzo.Code.Data.Fin.Base.T6] -> Integer
d82 v0 v1
  = case coe v1 of
      [] -> coe (0 :: Integer)
      (:) v2 v3
        -> coe
             addInt (coe MAlonzo.Code.Data.Fin.Base.du20 (coe v2))
             (coe mulInt (coe d82 (coe v0) (coe v3)) (coe v0))
      _ -> MAlonzo.RTE.mazUnreachableError
name98 = "Data.Digit.toDigits"
d98 ::
  Integer ->
  AgdaAny -> Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d98 v0 v1 v2 = du98 v0 v2
du98 :: Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du98 v0 v1
  = let v2 = subInt (coe v0) (coe (2 :: Integer)) in
    coe
      MAlonzo.Code.Induction.WellFounded.du164 erased
      (coe du152 (coe v2)) v1
name108 = "Data.Digit._.base"
d108 ::
  Integer -> MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer -> Integer
d108 v0 v1 v2 = du108 v0
du108 :: Integer -> Integer
du108 v0 = coe addInt (coe (2 :: Integer)) (coe v0)
name110 = "Data.Digit._.Pred"
d110 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer -> Integer -> ()
d110 = erased
name120 = "Data.Digit._.cons"
d120 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d120 v0 v1 v2 v3 v4 v5 = du120 v4 v5
du120 ::
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du120 v0 v1
  = case coe v1 of
      MAlonzo.Code.Agda.Builtin.Sigma.C32 v2 v3
        -> coe
             MAlonzo.Code.Agda.Builtin.Sigma.C32
             (coe MAlonzo.Code.Agda.Builtin.List.C22 (coe v0) (coe v2)) erased
      _ -> MAlonzo.RTE.mazUnreachableError
name136 = "Data.Digit._.lem"
d136 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  Integer ->
  Integer -> Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T142
d136 v0 v1 v2 v3 v4 v5 = du136 v3 v4 v5
du136 ::
  Integer -> Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T142
du136 v0 v1 v2
  = coe
      MAlonzo.Code.Data.Nat.Properties.du4764
      (coe
         addInt
         (coe
            mulInt (coe addInt (coe (1 :: Integer)) (coe v0))
            (coe addInt (coe (2 :: Integer)) (coe v1)))
         (coe v2))
      (coe
         MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
         (coe MAlonzo.Code.Data.Nat.Properties.d1472)
         (\ v3 v4 v5 -> coe MAlonzo.Code.Data.Nat.Properties.du1520 v4 v5)
         (coe addInt (coe (2 :: Integer)) (coe v0))
         (coe
            addInt
            (coe
               mulInt (coe addInt (coe (1 :: Integer)) (coe v0))
               (coe addInt (coe (2 :: Integer)) (coe v1)))
            (coe v2))
         (coe
            MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
            (coe MAlonzo.Code.Data.Nat.Properties.d1472)
            (\ v3 v4 v5 v6 v7 ->
               coe MAlonzo.Code.Data.Nat.Properties.du1640 v6 v7)
            (coe addInt (coe (2 :: Integer)) (coe v0))
            (coe
               addInt
               (coe
                  addInt
                  (coe
                     addInt
                     (coe
                        addInt (coe (2 :: Integer))
                        (coe mulInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1)))
                     (coe v0))
                  (coe v0))
               (coe v2))
            (coe
               addInt
               (coe
                  mulInt (coe addInt (coe (1 :: Integer)) (coe v0))
                  (coe addInt (coe (2 :: Integer)) (coe v1)))
               (coe v2))
            (coe
               MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
               (coe
                  MAlonzo.Code.Relation.Binary.Structures.d34
                  (MAlonzo.Code.Relation.Binary.Structures.d80
                     (coe MAlonzo.Code.Data.Nat.Properties.d1472))
                  (addInt
                     (coe
                        mulInt (coe addInt (coe (1 :: Integer)) (coe v0))
                        (coe addInt (coe (2 :: Integer)) (coe v1)))
                     (coe v2))))
            (coe
               MAlonzo.Code.Data.Nat.Properties.du2078
               (coe addInt (coe (2 :: Integer)) (coe v0)))))
name152 = "Data.Digit._.helper"
d152 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  Integer ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T142 ->
   MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d152 v0 v1 v2 v3 v4 = du152 v0 v3 v4
du152 ::
  Integer ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T142 ->
   MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du152 v0 v1 v2
  = let v3
          = coe
              MAlonzo.Code.Data.Nat.DivMod.du656 (coe v1) (coe du108 (coe v0)) in
    case coe v3 of
      MAlonzo.Code.Data.Nat.DivMod.C628 v4 v5
        -> case coe v4 of
             0 -> coe
                    MAlonzo.Code.Agda.Builtin.Sigma.C32
                    (coe
                       MAlonzo.Code.Agda.Builtin.List.C22 (coe v5)
                       (coe MAlonzo.Code.Agda.Builtin.List.C16))
                    erased
             _ -> coe
                    du120 (coe v5)
                    (coe
                       v2 v4
                       (coe
                          du136 (coe MAlonzo.Code.Data.Nat.Base.d82 (coe v4)) (coe v0)
                          (coe MAlonzo.Code.Data.Fin.Base.du20 (coe v5))))
      _ -> MAlonzo.RTE.mazUnreachableError
name172 = "Data.Digit.digitChars"
d172 :: MAlonzo.Code.Data.Vec.Base.T24
d172
  = coe
      MAlonzo.Code.Data.Vec.Base.C36 '0'
      (coe
         MAlonzo.Code.Data.Vec.Base.C36 '1'
         (coe
            MAlonzo.Code.Data.Vec.Base.C36 '2'
            (coe
               MAlonzo.Code.Data.Vec.Base.C36 '3'
               (coe
                  MAlonzo.Code.Data.Vec.Base.C36 '4'
                  (coe
                     MAlonzo.Code.Data.Vec.Base.C36 '5'
                     (coe
                        MAlonzo.Code.Data.Vec.Base.C36 '6'
                        (coe
                           MAlonzo.Code.Data.Vec.Base.C36 '7'
                           (coe
                              MAlonzo.Code.Data.Vec.Base.C36 '8'
                              (coe
                                 MAlonzo.Code.Data.Vec.Base.C36 '9'
                                 (coe
                                    MAlonzo.Code.Data.Vec.Base.C36 'a'
                                    (coe
                                       MAlonzo.Code.Data.Vec.Base.C36 'b'
                                       (coe
                                          MAlonzo.Code.Data.Vec.Base.C36 'c'
                                          (coe
                                             MAlonzo.Code.Data.Vec.Base.C36 'd'
                                             (coe
                                                MAlonzo.Code.Data.Vec.Base.C36 'e'
                                                (coe
                                                   MAlonzo.Code.Data.Vec.Base.C36 'f'
                                                   (coe
                                                      MAlonzo.Code.Data.Vec.Base.C28))))))))))))))))
name178 = "Data.Digit.showDigit"
d178 ::
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Fin.Base.T6 -> MAlonzo.Code.Agda.Builtin.Char.T6
d178 v0 v1 v2 = du178 v2
du178 ::
  MAlonzo.Code.Data.Fin.Base.T6 -> MAlonzo.Code.Agda.Builtin.Char.T6
du178 v0 = coe MAlonzo.Code.Data.Vec.Base.du94 (coe d172) (coe v0)
