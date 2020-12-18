{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.Reflection where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Reflection.Term

name6 = "Data.Nat.Reflection.toTerm"
d6 :: Integer -> MAlonzo.Code.Agda.Builtin.Reflection.T160
d6 v0
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Agda.Builtin.Reflection.C174
             (coe
                (MAlonzo.RTE.QName
                   (8 :: Integer) (13537827747504913145 :: Integer)
                   "Agda.Builtin.Nat.Nat.zero"
                   (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
             (coe MAlonzo.Code.Agda.Builtin.List.C16)
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Agda.Builtin.Reflection.C174
             (coe
                (MAlonzo.RTE.QName
                   (12 :: Integer) (13537827747504913145 :: Integer)
                   "Agda.Builtin.Nat.Nat.suc"
                   (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
             (coe
                MAlonzo.Code.Agda.Builtin.List.C22
                (coe
                   MAlonzo.Code.Agda.Builtin.Reflection.C84
                   (coe
                      MAlonzo.Code.Agda.Builtin.Reflection.C68
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C50)
                      (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                   (coe d6 (coe v1)))
                (coe MAlonzo.Code.Agda.Builtin.List.C16))
name10 = "Data.Nat.Reflection.toFinTerm"
d10 :: Integer -> MAlonzo.Code.Agda.Builtin.Reflection.T160
d10 v0
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Agda.Builtin.Reflection.C174
             (coe
                (MAlonzo.RTE.QName
                   (10 :: Integer) (2085323462298651273 :: Integer)
                   "Data.Fin.Base.Fin.zero"
                   (MAlonzo.RTE.Fixity MAlonzo.RTE.NonAssoc MAlonzo.RTE.Unrelated)))
             (let v1 = 1 :: Integer in
              let v2 = coe MAlonzo.Code.Agda.Builtin.List.C16 in
              case coe v1 of
                0 -> coe MAlonzo.Code.Agda.Builtin.List.C16
                _ -> let v3 = 0 :: Integer in
                     coe
                       MAlonzo.Code.Agda.Builtin.List.C22
                       (coe
                          MAlonzo.Code.Agda.Builtin.Reflection.C84
                          (coe
                             MAlonzo.Code.Agda.Builtin.Reflection.C68
                             (coe MAlonzo.Code.Agda.Builtin.Reflection.C52)
                             (coe MAlonzo.Code.Agda.Builtin.Reflection.C58))
                          (coe MAlonzo.Code.Agda.Builtin.Reflection.C212))
                       (coe MAlonzo.Code.Reflection.Term.d74 (coe v3) (coe v2)))
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Agda.Builtin.Reflection.C174
             (coe
                (MAlonzo.RTE.QName
                   (16 :: Integer) (2085323462298651273 :: Integer)
                   "Data.Fin.Base.Fin.suc"
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
                           (coe d10 (coe v1)))
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
                       (coe MAlonzo.Code.Reflection.Term.d74 (coe v4) (coe v3)))
