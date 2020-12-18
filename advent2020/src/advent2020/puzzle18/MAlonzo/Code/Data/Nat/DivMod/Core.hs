{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.DivMod.Core where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Nat
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Sum.Base
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary

name18 = "Data.Nat.DivMod.Core.mod-cong₃"
d18 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d18 = erased
name28 = "Data.Nat.DivMod.Core.modₕ-skipTo0"
d28 ::
  Integer ->
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d28 = erased
name50 = "Data.Nat.DivMod.Core.a[modₕ]1≡0"
d50 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d50 = erased
name58 = "Data.Nat.DivMod.Core.n[modₕ]n≡0"
d58 :: Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d58 = erased
name70 = "Data.Nat.DivMod.Core.a[modₕ]n<n"
d70 ::
  Integer -> Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d70 v0 v1 v2
  = case coe v1 of
      0 -> coe MAlonzo.Code.Data.Nat.Properties.du2078 (coe v0)
      _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v2 of
             0 -> coe d70 (coe (0 :: Integer)) (coe v3) (coe v0)
             _ -> let v4 = subInt (coe v2) (coe (1 :: Integer)) in
                  coe
                    d70 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v3) (coe v4)
name96 = "Data.Nat.DivMod.Core.a[modₕ]n≤a"
d96 ::
  Integer -> Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d96 v0 v1 v2
  = case coe v1 of
      0 -> coe
             MAlonzo.Code.Data.Nat.Properties.du1418
             (coe
                MAlonzo.Code.Agda.Builtin.Nat.d90 v0 (addInt (coe v0) (coe v2))
                (0 :: Integer) v2)
      _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v2 of
             0 -> coe
                    MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                    (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                    (\ v4 v5 v6 -> coe MAlonzo.Code.Data.Nat.Properties.du1520 v5 v6)
                    (coe MAlonzo.Code.Agda.Builtin.Nat.d90 v0 v0 v1 (0 :: Integer))
                    (coe addInt (coe v0) (coe v1))
                    (coe
                       MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                       (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                       (\ v4 v5 v6 v7 v8 ->
                          coe MAlonzo.Code.Data.Nat.Properties.du1640 v7 v8)
                       (coe MAlonzo.Code.Agda.Builtin.Nat.d90 v0 v0 v1 (0 :: Integer))
                       (coe v3) (coe addInt (coe v0) (coe v1))
                       (coe
                          MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                          (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                          (\ v4 v5 v6 v7 v8 ->
                             coe MAlonzo.Code.Data.Nat.Properties.du1640 v7 v8)
                          (coe v3) (coe v1) (coe addInt (coe v0) (coe v1))
                          (coe
                             MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                             (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                             (\ v4 v5 v6 v7 v8 ->
                                coe MAlonzo.Code.Data.Nat.Properties.du1640 v7 v8)
                             (coe v1) (coe addInt (coe v0) (coe v1))
                             (coe addInt (coe v0) (coe v1))
                             (coe
                                MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                                (coe
                                   MAlonzo.Code.Relation.Binary.Structures.d34
                                   (MAlonzo.Code.Relation.Binary.Structures.d80
                                      (coe MAlonzo.Code.Data.Nat.Properties.d1472))
                                   (addInt (coe v0) (coe v1))))
                             (coe MAlonzo.Code.Data.Nat.Properties.du2090 (coe v1)))
                          (coe MAlonzo.Code.Data.Nat.Properties.d1508 (coe v3)))
                       (coe d96 (coe (0 :: Integer)) (coe v3) (coe v0)))
             _ -> let v4 = subInt (coe v2) (coe (1 :: Integer)) in
                  coe
                    MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                    (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                    (\ v5 v6 v7 -> coe MAlonzo.Code.Data.Nat.Properties.du1520 v6 v7)
                    (coe
                       MAlonzo.Code.Agda.Builtin.Nat.d90 v0 (addInt (coe v0) (coe v2)) v1
                       v2)
                    (coe addInt (coe v0) (coe v1))
                    (coe
                       MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                       (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                       (\ v5 v6 v7 v8 v9 ->
                          coe MAlonzo.Code.Data.Nat.Properties.du1640 v8 v9)
                       (coe
                          MAlonzo.Code.Agda.Builtin.Nat.d90 v0 (addInt (coe v0) (coe v2)) v1
                          v2)
                       (coe addInt (coe v0) (coe v1)) (coe addInt (coe v0) (coe v1))
                       (coe
                          MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                          (coe
                             MAlonzo.Code.Relation.Binary.Structures.d34
                             (MAlonzo.Code.Relation.Binary.Structures.d80
                                (coe MAlonzo.Code.Data.Nat.Properties.d1472))
                             (addInt (coe v0) (coe v1))))
                       (coe
                          d96 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v3) (coe v4)))
name124 = "Data.Nat.DivMod.Core.a≤n⇒a[modₕ]n≡a"
d124 ::
  Integer ->
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d124 = erased
name146 = "Data.Nat.DivMod.Core.modₕ-idem"
d146 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d146 = erased
name176 = "Data.Nat.DivMod.Core.a+1[modₕ]n≡0⇒a[modₕ]n≡n-1"
d176 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d176 = erased
name216 = "Data.Nat.DivMod.Core.k<1+a[modₕ]n⇒k≤a[modₕ]n"
d216 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d216 v0 v1 v2 v3 v4 = du216 v0 v2 v3 v4
du216 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du216 v0 v1 v2 v3
  = case coe v1 of
      0 -> case coe v3 of
             MAlonzo.Code.Data.Nat.Base.C18 v6 -> coe v6
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> let v4 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v2 of
             0 -> coe du216 (coe (0 :: Integer)) (coe v4) (coe v0) (coe v3)
             _ -> let v5 = subInt (coe v2) (coe (1 :: Integer)) in
                  coe
                    du216 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v4) (coe v5)
                    (coe v3)
name260 = "Data.Nat.DivMod.Core.1+a[modₕ]n≤1+k⇒a[modₕ]n≤k"
d260 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d260 v0 v1 v2 v3 v4 v5 = du260 v0 v2 v3 v5
du260 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du260 v0 v1 v2 v3
  = case coe v1 of
      0 -> case coe v3 of
             MAlonzo.Code.Data.Nat.Base.C18 v6 -> coe v6
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> let v4 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v2 of
             0 -> coe du260 (coe (0 :: Integer)) (coe v4) (coe v0) (coe v3)
             _ -> let v5 = subInt (coe v2) (coe (1 :: Integer)) in
                  coe
                    du260 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v4) (coe v5)
                    (coe v3)
name308 = "Data.Nat.DivMod.Core.a+n[modₕ]n≡a[modₕ]n"
d308 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d308 = erased
name336 = "Data.Nat.DivMod.Core._.mod₁"
d336 ::
  Integer -> Integer -> Integer -> Integer -> Integer -> Integer
d336 v0 v1 v2 = du336 v0 v1
du336 :: Integer -> Integer -> Integer -> Integer -> Integer
du336 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Nat.d90 v0
      (addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1))
name338 = "Data.Nat.DivMod.Core._.mod₂"
d338 ::
  Integer -> Integer -> Integer -> Integer -> Integer -> Integer
d338 v0 v1 v2 = du338 v0 v1
du338 :: Integer -> Integer -> Integer -> Integer -> Integer
du338 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Nat.d90
      (addInt (coe (1 :: Integer)) (coe v0))
      (addInt (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1))
name358 = "Data.Nat.DivMod.Core.div-cong₃"
d358 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d358 = erased
name368 = "Data.Nat.DivMod.Core.divₕ-restart"
d368 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d368 = erased
name392 = "Data.Nat.DivMod.Core.divₕ-finish"
d392 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d392 = erased
name416 = "Data.Nat.DivMod.Core.acc≤divₕ[acc]"
d416 ::
  Integer ->
  Integer -> Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d416 v0 v1 v2 v3
  = case coe v2 of
      0 -> coe MAlonzo.Code.Data.Nat.Properties.d1422 (coe v0)
      _ -> let v4 = subInt (coe v2) (coe (1 :: Integer)) in
           case coe v3 of
             0 -> coe
                    MAlonzo.Code.Data.Nat.Properties.du1430
                    (coe MAlonzo.Code.Data.Nat.Properties.d1508 (coe v0))
                    (coe
                       d416 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1) (coe v4)
                       (coe v1))
             _ -> let v5 = subInt (coe v3) (coe (1 :: Integer)) in
                  coe d416 (coe v0) (coe v1) (coe v4) (coe v5)
name446 = "Data.Nat.DivMod.Core.divₕ-extractAcc"
d446 ::
  Integer ->
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d446 = erased
name490 = "Data.Nat.DivMod.Core.divₕ-offsetEq"
d490 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Sum.Base.T30 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d490 = erased
name736 = "Data.Nat.DivMod.Core.div-mod-lemma"
d736 ::
  Integer ->
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d736 = erased
name766 = "Data.Nat.DivMod.Core._.m"
d766 :: Integer -> Integer -> Integer -> Integer -> Integer
d766 v0 v1 v2 v3 = du766 v0 v1
du766 :: Integer -> Integer -> Integer
du766 v0 v1
  = coe addInt (coe addInt (coe (2 :: Integer)) (coe v0)) (coe v1)
name776 = "Data.Nat.DivMod.Core.n[divₕ]n≡1"
d776 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d776 = erased
name788 = "Data.Nat.DivMod.Core.a[divₕ]1≡a"
d788 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d788 = erased
name802 = "Data.Nat.DivMod.Core.a*n[divₕ]n≡a"
d802 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d802 = erased
name824 = "Data.Nat.DivMod.Core.+-distrib-divₕ"
d824 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d824 = erased
name870 = "Data.Nat.DivMod.Core._.case"
d870 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Sum.Base.T30
d870 v0 v1 v2 v3 v4 = du870 v1 v3 v4
du870 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Sum.Base.T30
du870 v0 v1 v2
  = coe
      MAlonzo.Code.Data.Sum.Base.C42
      (coe
         MAlonzo.Code.Data.Sum.Base.C38
         (coe
            MAlonzo.Code.Agda.Builtin.Sigma.C32 erased
            (coe
               MAlonzo.Code.Agda.Builtin.Sigma.C32
               (coe
                  MAlonzo.Code.Data.Nat.Properties.du2004
                  (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v2))
               (coe MAlonzo.Code.Data.Nat.Properties.du2090 (coe v1)))))
name886 = "Data.Nat.DivMod.Core.divₕ-mono-≤"
d886 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d886 v0 v1 v2 v3 v4 v5 v6 v7
  = case coe v6 of
      MAlonzo.Code.Data.Nat.Base.C10
        -> coe
             d416
             (coe
                MAlonzo.Code.Agda.Builtin.Nat.d60 v0 (addInt (coe v1) (coe v4))
                (0 :: Integer) v4)
             (coe addInt (coe v1) (coe v5)) (coe v3) (coe v5)
      MAlonzo.Code.Data.Nat.Base.C18 v10
        -> let v11 = subInt (coe v2) (coe (1 :: Integer)) in
           let v12 = subInt (coe v3) (coe (1 :: Integer)) in
           case coe v4 of
             0 -> case coe v7 of
                    MAlonzo.Code.Data.Nat.Base.C10
                      -> let v14 = 0 :: Integer in
                         let v15
                               = MAlonzo.Code.Data.Nat.Properties.d1684
                                   (coe (0 :: Integer)) (coe v2) in
                         case coe v15 of
                           MAlonzo.Code.Relation.Nullary.C46 v16 v17
                             -> if coe v16
                                  then coe
                                         seq (coe v17)
                                         (coe
                                            MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                                            (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                            (\ v18 v19 v20 ->
                                               coe MAlonzo.Code.Data.Nat.Properties.du1520 v19 v20)
                                            (coe MAlonzo.Code.Agda.Builtin.Nat.d60 v0 v1 v2 v14)
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.Nat.d60
                                               (addInt (coe (1 :: Integer)) (coe v0)) v1 v12 v1)
                                            (coe
                                               MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                               (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                               (\ v18 v19 v20 v21 v22 ->
                                                  coe
                                                    MAlonzo.Code.Data.Nat.Properties.du1640 v21 v22)
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Nat.d60
                                                  (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                  (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v11 v14)
                                                  v1)
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Nat.d60
                                                  (addInt (coe (1 :: Integer)) (coe v0)) v1 v12 v1)
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Nat.d60
                                                  (addInt (coe (1 :: Integer)) (coe v0)) v1 v12 v1)
                                               (coe
                                                  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                                                  (coe
                                                     MAlonzo.Code.Relation.Binary.Structures.d34
                                                     (MAlonzo.Code.Relation.Binary.Structures.d80
                                                        (coe
                                                           MAlonzo.Code.Data.Nat.Properties.d1472))
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Nat.d60
                                                        (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                        v12 v1)))
                                               (coe
                                                  d886 (coe addInt (coe (1 :: Integer)) (coe v0))
                                                  (coe (0 :: Integer))
                                                  (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v11 v14)
                                                  (coe v12) (coe v1) (coe v1)
                                                  (coe
                                                     MAlonzo.Code.Data.Nat.Properties.du1430
                                                     (coe
                                                        MAlonzo.Code.Data.Nat.Properties.d3748
                                                        (coe v11) (coe v14))
                                                     (coe v10))
                                                  (coe
                                                     MAlonzo.Code.Data.Nat.Properties.du2078
                                                     (coe v1)))))
                                  else coe
                                         seq (coe v17)
                                         (coe
                                            MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                                            (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                            (\ v18 v19 v20 ->
                                               coe MAlonzo.Code.Data.Nat.Properties.du1520 v19 v20)
                                            (coe MAlonzo.Code.Agda.Builtin.Nat.d60 v0 v1 v2 v14)
                                            (coe
                                               MAlonzo.Code.Agda.Builtin.Nat.d60
                                               (addInt (coe (1 :: Integer)) (coe v0)) v1 v12 v1)
                                            (coe
                                               MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                               (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                               (\ v18 v19 v20 v21 v22 ->
                                                  coe
                                                    MAlonzo.Code.Data.Nat.Properties.du1640 v21 v22)
                                               (coe v0) (coe addInt (coe (1 :: Integer)) (coe v0))
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Nat.d60
                                                  (addInt (coe (1 :: Integer)) (coe v0)) v1 v12 v1)
                                               (coe
                                                  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                                  (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                  (\ v18 v19 v20 v21 v22 ->
                                                     coe
                                                       MAlonzo.Code.Data.Nat.Properties.du1640 v21
                                                       v22)
                                                  (coe addInt (coe (1 :: Integer)) (coe v0))
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60
                                                     (addInt (coe (1 :: Integer)) (coe v0)) v1 v12
                                                     v1)
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60
                                                     (addInt (coe (1 :: Integer)) (coe v0)) v1 v12
                                                     v1)
                                                  (coe
                                                     MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                                                     (coe
                                                        MAlonzo.Code.Relation.Binary.Structures.d34
                                                        (MAlonzo.Code.Relation.Binary.Structures.d80
                                                           (coe
                                                              MAlonzo.Code.Data.Nat.Properties.d1472))
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Nat.d60
                                                           (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                           v12 v1)))
                                                  (coe
                                                     d416 (coe addInt (coe (1 :: Integer)) (coe v0))
                                                     (coe v1) (coe v12) (coe v1)))
                                               (coe
                                                  MAlonzo.Code.Data.Nat.Properties.d1508 (coe v0))))
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> let v13 = subInt (coe v4) (coe (1 :: Integer)) in
                  case coe v5 of
                    _ | coe geqInt (coe v5) (coe (1 :: Integer)) ->
                        let v14 = subInt (coe v5) (coe (1 :: Integer)) in
                        case coe v7 of
                          MAlonzo.Code.Data.Nat.Base.C18 v17
                            -> coe
                                 d886 (coe v0) (coe addInt (coe (1 :: Integer)) (coe v1)) (coe v11)
                                 (coe v12) (coe v13) (coe v14) (coe v10) (coe v17)
                          MAlonzo.Code.Data.Nat.Base.C10
                            -> let v16
                                     = MAlonzo.Code.Data.Nat.Properties.d1684 (coe v4) (coe v2) in
                               case coe v16 of
                                 MAlonzo.Code.Relation.Nullary.C46 v17 v18
                                   -> if coe v17
                                        then coe
                                               seq (coe v18)
                                               (coe
                                                  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                                                  (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                  (\ v19 v20 v21 ->
                                                     coe
                                                       MAlonzo.Code.Data.Nat.Properties.du1520 v20
                                                       v21)
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60 v0
                                                     (addInt (coe v1) (coe v4)) v2 v4)
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60
                                                     (addInt (coe (1 :: Integer)) (coe v0)) v1 v12
                                                     v1)
                                                  (coe
                                                     MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                                     (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                     (\ v19 v20 v21 v22 v23 ->
                                                        coe
                                                          MAlonzo.Code.Data.Nat.Properties.du1640
                                                          v22 v23)
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Nat.d60
                                                        (addInt (coe (1 :: Integer)) (coe v0))
                                                        (addInt (coe v1) (coe v4))
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Nat.d22 v11 v4)
                                                        (addInt (coe v1) (coe v4)))
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Nat.d60
                                                        (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                        v12 v1)
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Nat.d60
                                                        (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                        v12 v1)
                                                     (coe
                                                        MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                                                        (coe
                                                           MAlonzo.Code.Relation.Binary.Structures.d34
                                                           (MAlonzo.Code.Relation.Binary.Structures.d80
                                                              (coe
                                                                 MAlonzo.Code.Data.Nat.Properties.d1472))
                                                           (coe
                                                              MAlonzo.Code.Agda.Builtin.Nat.d60
                                                              (addInt (coe (1 :: Integer)) (coe v0))
                                                              v1 v12 v1)))
                                                     (coe
                                                        d886
                                                        (coe addInt (coe (1 :: Integer)) (coe v0))
                                                        (coe (0 :: Integer))
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Nat.d22 v11 v4)
                                                        (coe v12) (coe addInt (coe v1) (coe v4))
                                                        (coe v1)
                                                        (coe
                                                           MAlonzo.Code.Data.Nat.Properties.du1430
                                                           (coe
                                                              MAlonzo.Code.Data.Nat.Properties.d3748
                                                              (coe v11) (coe v4))
                                                           (coe v10))
                                                        (coe
                                                           MAlonzo.Code.Data.Nat.Properties.du2078
                                                           (coe v1)))))
                                        else coe
                                               seq (coe v18)
                                               (coe
                                                  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                                                  (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                  (\ v19 v20 v21 ->
                                                     coe
                                                       MAlonzo.Code.Data.Nat.Properties.du1520 v20
                                                       v21)
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60 v0
                                                     (addInt (coe v1) (coe v4)) v2 v4)
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60
                                                     (addInt (coe (1 :: Integer)) (coe v0)) v1 v12
                                                     v1)
                                                  (coe
                                                     MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                                     (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                     (\ v19 v20 v21 v22 v23 ->
                                                        coe
                                                          MAlonzo.Code.Data.Nat.Properties.du1640
                                                          v22 v23)
                                                     (coe v0)
                                                     (coe addInt (coe (1 :: Integer)) (coe v0))
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Nat.d60
                                                        (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                        v12 v1)
                                                     (coe
                                                        MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                                        (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                        (\ v19 v20 v21 v22 v23 ->
                                                           coe
                                                             MAlonzo.Code.Data.Nat.Properties.du1640
                                                             v22 v23)
                                                        (coe addInt (coe (1 :: Integer)) (coe v0))
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Nat.d60
                                                           (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                           v12 v1)
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Nat.d60
                                                           (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                           v12 v1)
                                                        (coe
                                                           MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                                                           (coe
                                                              MAlonzo.Code.Relation.Binary.Structures.d34
                                                              (MAlonzo.Code.Relation.Binary.Structures.d80
                                                                 (coe
                                                                    MAlonzo.Code.Data.Nat.Properties.d1472))
                                                              (coe
                                                                 MAlonzo.Code.Agda.Builtin.Nat.d60
                                                                 (addInt
                                                                    (coe (1 :: Integer)) (coe v0))
                                                                 v1 v12 v1)))
                                                        (coe
                                                           d416
                                                           (coe
                                                              addInt (coe (1 :: Integer)) (coe v0))
                                                           (coe v1) (coe v12) (coe v1)))
                                                     (coe
                                                        MAlonzo.Code.Data.Nat.Properties.d1508
                                                        (coe v0))))
                                 _ -> MAlonzo.RTE.mazUnreachableError
                          _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> coe
                           seq (coe v7)
                           (let v14
                                  = MAlonzo.Code.Data.Nat.Properties.d1684 (coe v4) (coe v2) in
                            case coe v14 of
                              MAlonzo.Code.Relation.Nullary.C46 v15 v16
                                -> if coe v15
                                     then coe
                                            seq (coe v16)
                                            (coe
                                               MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                                               (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                               (\ v17 v18 v19 ->
                                                  coe
                                                    MAlonzo.Code.Data.Nat.Properties.du1520 v18 v19)
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Nat.d60 v0
                                                  (addInt (coe v1) (coe v4)) v2 v4)
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Nat.d60
                                                  (addInt (coe (1 :: Integer)) (coe v0)) v1 v12 v1)
                                               (coe
                                                  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                                  (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                  (\ v17 v18 v19 v20 v21 ->
                                                     coe
                                                       MAlonzo.Code.Data.Nat.Properties.du1640 v20
                                                       v21)
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60
                                                     (addInt (coe (1 :: Integer)) (coe v0))
                                                     (addInt (coe v1) (coe v4))
                                                     (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v11 v4)
                                                     (addInt (coe v1) (coe v4)))
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60
                                                     (addInt (coe (1 :: Integer)) (coe v0)) v1 v12
                                                     v1)
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60
                                                     (addInt (coe (1 :: Integer)) (coe v0)) v1 v12
                                                     v1)
                                                  (coe
                                                     MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                                                     (coe
                                                        MAlonzo.Code.Relation.Binary.Structures.d34
                                                        (MAlonzo.Code.Relation.Binary.Structures.d80
                                                           (coe
                                                              MAlonzo.Code.Data.Nat.Properties.d1472))
                                                        (coe
                                                           MAlonzo.Code.Agda.Builtin.Nat.d60
                                                           (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                           v12 v1)))
                                                  (coe
                                                     d886 (coe addInt (coe (1 :: Integer)) (coe v0))
                                                     (coe (0 :: Integer))
                                                     (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v11 v4)
                                                     (coe v12) (coe addInt (coe v1) (coe v4))
                                                     (coe v1)
                                                     (coe
                                                        MAlonzo.Code.Data.Nat.Properties.du1430
                                                        (coe
                                                           MAlonzo.Code.Data.Nat.Properties.d3748
                                                           (coe v11) (coe v4))
                                                        (coe v10))
                                                     (coe
                                                        MAlonzo.Code.Data.Nat.Properties.du2078
                                                        (coe v1)))))
                                     else coe
                                            seq (coe v16)
                                            (coe
                                               MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                                               (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                               (\ v17 v18 v19 ->
                                                  coe
                                                    MAlonzo.Code.Data.Nat.Properties.du1520 v18 v19)
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Nat.d60 v0
                                                  (addInt (coe v1) (coe v4)) v2 v4)
                                               (coe
                                                  MAlonzo.Code.Agda.Builtin.Nat.d60
                                                  (addInt (coe (1 :: Integer)) (coe v0)) v1 v12 v1)
                                               (coe
                                                  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                                  (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                  (\ v17 v18 v19 v20 v21 ->
                                                     coe
                                                       MAlonzo.Code.Data.Nat.Properties.du1640 v20
                                                       v21)
                                                  (coe v0)
                                                  (coe addInt (coe (1 :: Integer)) (coe v0))
                                                  (coe
                                                     MAlonzo.Code.Agda.Builtin.Nat.d60
                                                     (addInt (coe (1 :: Integer)) (coe v0)) v1 v12
                                                     v1)
                                                  (coe
                                                     MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                                                     (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                                                     (\ v17 v18 v19 v20 v21 ->
                                                        coe
                                                          MAlonzo.Code.Data.Nat.Properties.du1640
                                                          v20 v21)
                                                     (coe addInt (coe (1 :: Integer)) (coe v0))
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Nat.d60
                                                        (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                        v12 v1)
                                                     (coe
                                                        MAlonzo.Code.Agda.Builtin.Nat.d60
                                                        (addInt (coe (1 :: Integer)) (coe v0)) v1
                                                        v12 v1)
                                                     (coe
                                                        MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                                                        (coe
                                                           MAlonzo.Code.Relation.Binary.Structures.d34
                                                           (MAlonzo.Code.Relation.Binary.Structures.d80
                                                              (coe
                                                                 MAlonzo.Code.Data.Nat.Properties.d1472))
                                                           (coe
                                                              MAlonzo.Code.Agda.Builtin.Nat.d60
                                                              (addInt (coe (1 :: Integer)) (coe v0))
                                                              v1 v12 v1)))
                                                     (coe
                                                        d416
                                                        (coe addInt (coe (1 :: Integer)) (coe v0))
                                                        (coe v1) (coe v12) (coe v1)))
                                                  (coe
                                                     MAlonzo.Code.Data.Nat.Properties.d1508
                                                     (coe v0))))
                              _ -> MAlonzo.RTE.mazUnreachableError)
      _ -> MAlonzo.RTE.mazUnreachableError
name22401 = "Data.Nat.DivMod.Core..absurdlambda"
d22401 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d22401 = erased
name26157 = "Data.Nat.DivMod.Core..absurdlambda"
d26157 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d26157 = erased
