{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Nat
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Morphism
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Data.Bool.Properties
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Sum.Base
import qualified MAlonzo.Code.Function.Injection
import qualified MAlonzo.Code.Function.Metric.Nat.Bundles
import qualified MAlonzo.Code.Function.Metric.Structures
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Consequences
import qualified MAlonzo.Code.Relation.Binary.Definitions
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Algebra
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Core
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core

name8 = "Data.Nat.Properties._._Absorbs_"
d8 ::
  (Integer -> Integer -> Integer) ->
  (Integer -> Integer -> Integer) -> ()
d8 = erased
name10 = "Data.Nat.Properties._._DistributesOver_"
d10 ::
  (Integer -> Integer -> Integer) ->
  (Integer -> Integer -> Integer) -> ()
d10 = erased
name12 = "Data.Nat.Properties._._DistributesOverʳ_"
d12 ::
  (Integer -> Integer -> Integer) ->
  (Integer -> Integer -> Integer) -> ()
d12 = erased
name14 = "Data.Nat.Properties._._DistributesOverˡ_"
d14 ::
  (Integer -> Integer -> Integer) ->
  (Integer -> Integer -> Integer) -> ()
d14 = erased
name18 = "Data.Nat.Properties._.Absorptive"
d18 ::
  (Integer -> Integer -> Integer) ->
  (Integer -> Integer -> Integer) -> ()
d18 = erased
name20 = "Data.Nat.Properties._.Associative"
d20 :: (Integer -> Integer -> Integer) -> ()
d20 = erased
name22 = "Data.Nat.Properties._.Commutative"
d22 :: (Integer -> Integer -> Integer) -> ()
d22 = erased
name30 = "Data.Nat.Properties._.Idempotent"
d30 :: (Integer -> Integer -> Integer) -> ()
d30 = erased
name34 = "Data.Nat.Properties._.Identity"
d34 :: Integer -> (Integer -> Integer -> Integer) -> ()
d34 = erased
name46 = "Data.Nat.Properties._.LeftIdentity"
d46 :: Integer -> (Integer -> Integer -> Integer) -> ()
d46 = erased
name50 = "Data.Nat.Properties._.LeftZero"
d50 :: Integer -> (Integer -> Integer -> Integer) -> ()
d50 = erased
name56 = "Data.Nat.Properties._.RightIdentity"
d56 :: Integer -> (Integer -> Integer -> Integer) -> ()
d56 = erased
name60 = "Data.Nat.Properties._.RightZero"
d60 :: Integer -> (Integer -> Integer -> Integer) -> ()
d60 = erased
name62 = "Data.Nat.Properties._.Selective"
d62 :: (Integer -> Integer -> Integer) -> ()
d62 = erased
name64 = "Data.Nat.Properties._.Zero"
d64 :: Integer -> (Integer -> Integer -> Integer) -> ()
d64 = erased
name70 = "Data.Nat.Properties._.IsBand"
d70 a0 = ()
name76 = "Data.Nat.Properties._.IsCommutativeMonoid"
d76 a0 a1 = ()
name80 = "Data.Nat.Properties._.IsCommutativeSemigroup"
d80 a0 = ()
name82 = "Data.Nat.Properties._.IsCommutativeSemiring"
d82 a0 a1 a2 a3 = ()
name84 = "Data.Nat.Properties._.IsCommutativeSemiringWithoutOne"
d84 a0 a1 a2 = ()
name86 = "Data.Nat.Properties._.IsDistributiveLattice"
d86 a0 a1 = ()
name92 = "Data.Nat.Properties._.IsLattice"
d92 a0 a1 = ()
name94 = "Data.Nat.Properties._.IsMagma"
d94 a0 = ()
name96 = "Data.Nat.Properties._.IsMonoid"
d96 a0 a1 = ()
name104 = "Data.Nat.Properties._.IsSemigroup"
d104 a0 = ()
name106 = "Data.Nat.Properties._.IsSemilattice"
d106 a0 = ()
name108 = "Data.Nat.Properties._.IsSemiring"
d108 a0 a1 a2 a3 = ()
name112 = "Data.Nat.Properties._.IsSemiringWithoutOne"
d112 a0 a1 a2 = ()
name1332 = "Data.Nat.Properties.suc-injective"
d1332 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1332 = erased
name1338 = "Data.Nat.Properties.≡ᵇ⇒≡"
d1338 ::
  Integer ->
  Integer -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1338 = erased
name1350 = "Data.Nat.Properties.≡⇒≡ᵇ"
d1350 ::
  Integer ->
  Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d1350 v0 v1 v2 = du1350 v0
du1350 :: Integer -> AgdaAny
du1350 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Agda.Builtin.Unit.C8
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe du1350 (coe v1)
name1360 = "Data.Nat.Properties._≟_"
d1360 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d1360 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
      (coe
         MAlonzo.Code.Data.Bool.Properties.d2042
         (coe eqInt (coe v0) (coe v1)))
name1366 = "Data.Nat.Properties.≡-irrelevant"
d1366 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1366 = erased
name1374 = "Data.Nat.Properties.≟-diag"
d1374 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1374 = erased
name1376 = "Data.Nat.Properties.≡-isDecEquivalence"
d1376 :: MAlonzo.Code.Relation.Binary.Structures.T44
d1376
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C1529
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      (coe d1360)
name1378 = "Data.Nat.Properties.≡-decSetoid"
d1378 :: MAlonzo.Code.Relation.Binary.Bundles.T84
d1378 = coe MAlonzo.Code.Relation.Binary.Bundles.C939 d1376
name1382 = "Data.Nat.Properties.0≢1+n"
d1382 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1382 = erased
name1386 = "Data.Nat.Properties.1+n≢0"
d1386 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1386 = erased
name1390 = "Data.Nat.Properties.1+n≢n"
d1390 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1390 = erased
name1398 = "Data.Nat.Properties.<ᵇ⇒<"
d1398 ::
  Integer -> Integer -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d1398 v0 v1 v2 = du1398 v0
du1398 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
du1398 v0
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Data.Nat.Base.C18 (coe MAlonzo.Code.Data.Nat.Base.C10)
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (coe du1398 (coe v1))
name1414 = "Data.Nat.Properties.<⇒<ᵇ"
d1414 ::
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny
d1414 v0 v1 v2 = du1414 v2
du1414 :: MAlonzo.Code.Data.Nat.Base.T6 -> AgdaAny
du1414 v0
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C18 v3
        -> case coe v3 of
             MAlonzo.Code.Data.Nat.Base.C10
               -> coe MAlonzo.Code.Agda.Builtin.Unit.C8
             MAlonzo.Code.Data.Nat.Base.C18 v6
               -> coe du1414 (coe MAlonzo.Code.Data.Nat.Base.C18 v6)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name1418 = "Data.Nat.Properties.≤-reflexive"
d1418 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d1418 v0 v1 v2 = du1418 v0
du1418 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
du1418 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (coe du1418 (coe v1))
name1422 = "Data.Nat.Properties.≤-refl"
d1422 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d1422 v0 = coe du1418 (coe v0)
name1424 = "Data.Nat.Properties.≤-antisym"
d1424 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1424 = erased
name1430 = "Data.Nat.Properties.≤-trans"
d1430 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d1430 v0 v1 v2 v3 v4 = du1430 v3 v4
du1430 ::
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du1430 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C10
        -> coe MAlonzo.Code.Data.Nat.Base.C10
      MAlonzo.Code.Data.Nat.Base.C18 v4
        -> case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C18 v7
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18 (coe du1430 (coe v4) (coe v7))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name1436 = "Data.Nat.Properties.≤-total"
d1436 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d1436 v0 v1
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Data.Sum.Base.C38 (coe MAlonzo.Code.Data.Nat.Base.C10)
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe
                    MAlonzo.Code.Data.Sum.Base.C42 (coe MAlonzo.Code.Data.Nat.Base.C10)
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  let v4 = d1436 (coe v2) (coe v3) in
                  case coe v4 of
                    MAlonzo.Code.Data.Sum.Base.C38 v5
                      -> coe
                           MAlonzo.Code.Data.Sum.Base.C38
                           (coe MAlonzo.Code.Data.Nat.Base.C18 v5)
                    MAlonzo.Code.Data.Sum.Base.C42 v5
                      -> coe
                           MAlonzo.Code.Data.Sum.Base.C42
                           (coe MAlonzo.Code.Data.Nat.Base.C18 v5)
                    _ -> MAlonzo.RTE.mazUnreachableError
name1458 = "Data.Nat.Properties.≤-irrelevant"
d1458 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1458 = erased
name1464 = "Data.Nat.Properties._≤?_"
d1464 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d1464 v0 v1
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Relation.Nullary.C46
             (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
             (coe
                MAlonzo.Code.Relation.Nullary.C22
                (coe MAlonzo.Code.Data.Nat.Base.C10))
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
             (\ v3 -> coe du1398 (coe v2))
             (coe
                MAlonzo.Code.Data.Bool.Properties.d2042
                (coe ltInt (coe v2) (coe v1)))
name1470 = "Data.Nat.Properties._≥?_"
d1470 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d1470 v0 v1 = coe d1464 (coe v1) (coe v0)
name1472 = "Data.Nat.Properties.≤-isPreorder"
d1472 :: MAlonzo.Code.Relation.Binary.Structures.T70
d1472
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C2113
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      (\ v0 v1 v2 -> coe du1418 v0)
      (\ v0 v1 v2 v3 v4 -> coe du1430 v3 v4)
name1474 = "Data.Nat.Properties.≤-isPartialOrder"
d1474 :: MAlonzo.Code.Relation.Binary.Structures.T118
d1474
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C4865 (coe d1472) erased
name1476 = "Data.Nat.Properties.≤-isTotalOrder"
d1476 :: MAlonzo.Code.Relation.Binary.Structures.T340
d1476
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C11665 (coe d1474)
      (coe d1436)
name1478 = "Data.Nat.Properties.≤-isDecTotalOrder"
d1478 :: MAlonzo.Code.Relation.Binary.Structures.T388
d1478
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C12739 (coe d1476)
      (coe d1360) (coe d1464)
name1480 = "Data.Nat.Properties.≤-preorder"
d1480 :: MAlonzo.Code.Relation.Binary.Bundles.T132
d1480 = coe MAlonzo.Code.Relation.Binary.Bundles.C1509 d1472
name1482 = "Data.Nat.Properties.≤-poset"
d1482 :: MAlonzo.Code.Relation.Binary.Bundles.T204
d1482 = coe MAlonzo.Code.Relation.Binary.Bundles.C2365 d1474
name1484 = "Data.Nat.Properties.≤-totalOrder"
d1484 :: MAlonzo.Code.Relation.Binary.Bundles.T574
d1484 = coe MAlonzo.Code.Relation.Binary.Bundles.C6779 d1476
name1486 = "Data.Nat.Properties.≤-decTotalOrder"
d1486 :: MAlonzo.Code.Relation.Binary.Bundles.T658
d1486 = coe MAlonzo.Code.Relation.Binary.Bundles.C7777 d1478
name1496 = "Data.Nat.Properties.s≤s-injective"
d1496 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1496 = erased
name1502 = "Data.Nat.Properties.≤-step"
d1502 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d1502 v0 v1 v2 = du1502 v2
du1502 ::
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du1502 v0 = coe v0
name1508 = "Data.Nat.Properties.n≤1+n"
d1508 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d1508 v0 = coe d1422 (coe v0)
name1512 = "Data.Nat.Properties.1+n≰n"
d1512 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d1512 = erased
name1518 = "Data.Nat.Properties.n≤0⇒n≡0"
d1518 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1518 = erased
name1520 = "Data.Nat.Properties.<⇒≤"
d1520 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d1520 v0 v1 v2 = du1520 v1 v2
du1520 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du1520 v0 v1
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C18 v4
        -> let v5 = subInt (coe v0) (coe (1 :: Integer)) in
           coe du1430 (coe v4) (coe d1422 (coe v5))
      _ -> MAlonzo.RTE.mazUnreachableError
name1524 = "Data.Nat.Properties.<⇒≢"
d1524 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1524 = erased
name1528 = "Data.Nat.Properties.≤⇒≯"
d1528 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d1528 = erased
name1534 = "Data.Nat.Properties.<⇒≱"
d1534 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d1534 = erased
name1540 = "Data.Nat.Properties.<⇒≯"
d1540 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d1540 = erased
name1546 = "Data.Nat.Properties.≰⇒≮"
d1546 ::
  Integer ->
  Integer ->
  (MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d1546 = erased
name1552 = "Data.Nat.Properties.≰⇒>"
d1552 ::
  Integer ->
  Integer ->
  (MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d1552 v0 v1 v2 = du1552 v0 v1
du1552 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du1552 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Empty.d10 () erased erased
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe
                    MAlonzo.Code.Data.Nat.Base.C18 (coe MAlonzo.Code.Data.Nat.Base.C10)
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (coe du1552 (coe v2) (coe v3))
name1564 = "Data.Nat.Properties.≰⇒≥"
d1564 ::
  Integer ->
  Integer ->
  (MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d1564 v0 v1 v2 = du1564 v0 v1
du1564 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du1564 v0 v1 = coe du1520 (coe v0) (coe du1552 (coe v0) (coe v1))
name1566 = "Data.Nat.Properties.≮⇒≥"
d1566 ::
  Integer ->
  Integer ->
  (MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d1566 v0 v1 v2 = du1566 v0 v1
du1566 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du1566 v0 v1
  = case coe v1 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v0 of
             0 -> coe MAlonzo.Code.Data.Empty.d10 () erased erased
             _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (coe du1566 (coe v3) (coe v2))
name1582 = "Data.Nat.Properties.≤∧≢⇒<"
d1582 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  (MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d1582 v0 v1 v2 v3 = du1582 v1 v2
du1582 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du1582 v0 v1
  = case coe v0 of
      0 -> coe
             seq (coe v1) (coe MAlonzo.Code.Data.Empty.d10 () erased erased)
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C10
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18 (coe MAlonzo.Code.Data.Nat.Base.C10)
             MAlonzo.Code.Data.Nat.Base.C18 v5
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18 (coe du1582 (coe v2) (coe v5))
             _ -> MAlonzo.RTE.mazUnreachableError
name1596 = "Data.Nat.Properties.≤-<-connex"
d1596 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d1596 v0 v1
  = let v2 = d1464 (coe v0) (coe v1) in
    case coe v2 of
      MAlonzo.Code.Relation.Nullary.C46 v3 v4
        -> if coe v3
             then case coe v4 of
                    MAlonzo.Code.Relation.Nullary.C22 v5
                      -> coe MAlonzo.Code.Data.Sum.Base.C38 (coe v5)
                    _ -> MAlonzo.RTE.mazUnreachableError
             else coe
                    seq (coe v4)
                    (coe MAlonzo.Code.Data.Sum.Base.C42 (coe du1552 (coe v0) (coe v1)))
      _ -> MAlonzo.RTE.mazUnreachableError
name1618 = "Data.Nat.Properties.≥->-connex"
d1618 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d1618 v0 v1 = coe d1596 (coe v1) (coe v0)
name1620 = "Data.Nat.Properties.<-≤-connex"
d1620 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d1620
  = coe MAlonzo.Code.Relation.Binary.Consequences.du726 (coe d1596)
name1622 = "Data.Nat.Properties.>-≥-connex"
d1622 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d1622
  = coe MAlonzo.Code.Relation.Binary.Consequences.du726 (coe d1618)
name1624 = "Data.Nat.Properties.<-irrefl"
d1624 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d1624 = erased
name1628 = "Data.Nat.Properties.<-asym"
d1628 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d1628 = erased
name1634 = "Data.Nat.Properties.<-trans"
d1634 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d1634 v0 v1 v2 v3 v4 = du1634 v1 v3 v4
du1634 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du1634 v0 v1 v2
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C18 v5
        -> let v6 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v2 of
             MAlonzo.Code.Data.Nat.Base.C18 v9
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18
                    (coe du1430 (coe v5) (coe du1430 (coe d1508 (coe v6)) (coe v9)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name1640 = "Data.Nat.Properties.<-transʳ"
d1640 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d1640 v0 v1 v2 v3 v4 = du1640 v3 v4
du1640 ::
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du1640 v0 v1
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C18 v4
        -> coe
             MAlonzo.Code.Data.Nat.Base.C18 (coe du1430 (coe v0) (coe v4))
      _ -> MAlonzo.RTE.mazUnreachableError
name1646 = "Data.Nat.Properties.<-transˡ"
d1646 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d1646 v0 v1 v2 v3 v4 = du1646 v3 v4
du1646 ::
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du1646 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C18 v4
        -> case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C18 v7
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18 (coe du1430 (coe v4) (coe v7))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name1652 = "Data.Nat.Properties.<-cmp"
d1652 ::
  Integer -> Integer -> MAlonzo.Code.Relation.Binary.Definitions.T136
d1652 v0 v1
  = let v2 = d1360 (coe v0) (coe v1) in
    let v3
          = MAlonzo.Code.Data.Bool.Properties.d2042
              (coe ltInt (coe v0) (coe v1)) in
    case coe v2 of
      MAlonzo.Code.Relation.Nullary.C46 v4 v5
        -> if coe v4
             then case coe v5 of
                    MAlonzo.Code.Relation.Nullary.C22 v6
                      -> coe MAlonzo.Code.Relation.Binary.Definitions.C158 v6
                    _ -> MAlonzo.RTE.mazUnreachableError
             else coe
                    seq (coe v5)
                    (case coe v3 of
                       MAlonzo.Code.Relation.Nullary.C46 v6 v7
                         -> if coe v6
                              then coe
                                     seq (coe v7)
                                     (coe
                                        MAlonzo.Code.Relation.Binary.Definitions.C150
                                        (coe du1398 (coe v0)))
                              else coe
                                     seq (coe v7)
                                     (coe
                                        MAlonzo.Code.Relation.Binary.Definitions.C166
                                        (coe du1582 (coe v0) (coe du1566 (coe v0) (coe v1))))
                       _ -> MAlonzo.RTE.mazUnreachableError)
      _ -> MAlonzo.RTE.mazUnreachableError
name1684 = "Data.Nat.Properties._<?_"
d1684 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d1684 v0 v1
  = coe d1464 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1)
name1690 = "Data.Nat.Properties._>?_"
d1690 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d1690 v0 v1 = coe d1684 (coe v1) (coe v0)
name1692 = "Data.Nat.Properties.<-irrelevant"
d1692 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1692 = erased
name1694 = "Data.Nat.Properties.<-resp₂-≡"
d1694 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d1694
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe (\ v0 v1 v2 v3 v4 -> v4))
      (coe (\ v0 v1 v2 v3 v4 -> v4))
name1700 = "Data.Nat.Properties.<-isStrictPartialOrder"
d1700 :: MAlonzo.Code.Relation.Binary.Structures.T222
d1700
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C7193
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      (\ v0 v1 v2 v3 v4 -> coe du1634 v1 v3 v4) d1694
name1702 = "Data.Nat.Properties.<-isStrictTotalOrder"
d1702 :: MAlonzo.Code.Relation.Binary.Structures.T454
d1702
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C14057
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      (\ v0 v1 v2 v3 v4 -> coe du1634 v1 v3 v4) (coe d1652)
name1704 = "Data.Nat.Properties.<-strictPartialOrder"
d1704 :: MAlonzo.Code.Relation.Binary.Bundles.T394
d1704 = coe MAlonzo.Code.Relation.Binary.Bundles.C4625 d1700
name1706 = "Data.Nat.Properties.<-strictTotalOrder"
d1706 :: MAlonzo.Code.Relation.Binary.Bundles.T780
d1706 = coe MAlonzo.Code.Relation.Binary.Bundles.C9189 d1702
name1710 = "Data.Nat.Properties.n≮n"
d1710 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d1710 = erased
name1716 = "Data.Nat.Properties.0<1+n"
d1716 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d1716 v0 = du1716
du1716 :: MAlonzo.Code.Data.Nat.Base.T6
du1716
  = coe
      MAlonzo.Code.Data.Nat.Base.C18 (coe MAlonzo.Code.Data.Nat.Base.C10)
name1720 = "Data.Nat.Properties.n<1+n"
d1720 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d1720 v0 = coe d1422 (coe addInt (coe (1 :: Integer)) (coe v0))
name1726 = "Data.Nat.Properties.n≢0⇒n>0"
d1726 ::
  Integer ->
  (MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d1726 v0 v1 = du1726 v0
du1726 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
du1726 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Empty.d10 () erased erased
      _ -> coe du1716
name1736 = "Data.Nat.Properties.m<n⇒n≢0"
d1736 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1736 = erased
name1744 = "Data.Nat.Properties.m<n⇒m≤1+n"
d1744 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d1744 v0 v1 v2 = du1744 v2
du1744 ::
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du1744 v0
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C18 v3
        -> case coe v3 of
             MAlonzo.Code.Data.Nat.Base.C10
               -> coe MAlonzo.Code.Data.Nat.Base.C10
             MAlonzo.Code.Data.Nat.Base.C18 v6
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18
                    (coe du1744 (coe MAlonzo.Code.Data.Nat.Base.C18 v6))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name1754 = "Data.Nat.Properties.∀[m≤n⇒m≢o]⇒n<o"
d1754 ::
  Integer ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T6 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d1754 v0 v1 v2 = du1754 v0 v1
du1754 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du1754 v0 v1
  = case coe v1 of
      0 -> coe MAlonzo.Code.Data.Empty.d10 () erased erased
      _ -> let v2 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v0 of
             0 -> coe du1716
             _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (coe du1754 (coe v3) (coe v2))
name1772 = "Data.Nat.Properties._.rec"
d1772 ::
  Integer ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T6 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1772 = erased
name1782 = "Data.Nat.Properties.∀[m<n⇒m≢o]⇒n≤o"
d1782 ::
  Integer ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T6 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d1782 v0 v1 v2 = du1782 v0 v1
du1782 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du1782 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe MAlonzo.Code.Data.Empty.d10 () erased erased
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (coe du1782 (coe v2) (coe v3))
name1802 = "Data.Nat.Properties._.rec"
d1802 ::
  Integer ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T6 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1802 = erased
name1810 = "Data.Nat.Properties.≤-Reasoning._._IsRelatedTo_"
d1810 a0 a1 = ()
name1812 = "Data.Nat.Properties.≤-Reasoning._._∎"
d1812 ::
  Integer -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d1812
  = let v0 = d1472 in
    coe
      (\ v1 ->
         coe
           MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
           (coe
              MAlonzo.Code.Relation.Binary.Structures.d34
              (MAlonzo.Code.Relation.Binary.Structures.d80 (coe v0)) v1))
name1814 = "Data.Nat.Properties.≤-Reasoning._._≡⟨⟩_"
d1814 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d1814 v0 = coe v0
name1816 = "Data.Nat.Properties.≤-Reasoning._.IsEquality"
d1816 a0 a1 a2 = ()
name1818 = "Data.Nat.Properties.≤-Reasoning._.IsEquality?"
d1818 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Nullary.T32
d1818 v0 v1 v2
  = coe MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du142 v2
name1820 = "Data.Nat.Properties.≤-Reasoning._.IsStrict"
d1820 a0 a1 a2 = ()
name1822 = "Data.Nat.Properties.≤-Reasoning._.IsStrict?"
d1822 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Nullary.T32
d1822 v0 v1 v2
  = coe MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du108 v2
name1824 = "Data.Nat.Properties.≤-Reasoning._.begin_"
d1824 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Data.Nat.Base.T6
d1824
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
      (coe d1472) (\ v0 v1 v2 -> coe du1520 v1 v2)
name1826 = "Data.Nat.Properties.≤-Reasoning._.begin-equality_"
d1826 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1826 = erased
name1828 = "Data.Nat.Properties.≤-Reasoning._.begin-strict_"
d1828 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d1828 v0 v1 v2 v3
  = coe MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du176 v2
name1832 = "Data.Nat.Properties.≤-Reasoning._.extractEquality"
d1832 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T126 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1832 = erased
name1834 = "Data.Nat.Properties.≤-Reasoning._.extractStrict"
d1834 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T92 ->
  MAlonzo.Code.Data.Nat.Base.T6
d1834 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du118 v2 v3
name1842 = "Data.Nat.Properties.≤-Reasoning._.step-<"
d1842 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d1842
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du202
      (\ v0 v1 v2 v3 v4 -> coe du1634 v1 v3 v4)
      (coe MAlonzo.Code.Relation.Binary.PropositionalEquality.Core.du136)
      (\ v0 v1 v2 v3 v4 -> coe du1646 v3 v4)
name1844 = "Data.Nat.Properties.≤-Reasoning._.step-≡"
d1844 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d1844 v0 v1 v2 v3 v4 = du1844 v3
du1844 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du1844 v0 = coe v0
name1846 = "Data.Nat.Properties.≤-Reasoning._.step-≡˘"
d1846 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d1846 v0 v1 v2 v3 v4 = du1846 v3
du1846 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
du1846 v0 = coe v0
name1848 = "Data.Nat.Properties.≤-Reasoning._.step-≤"
d1848 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.T70
d1848
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
      (coe d1472) (\ v0 v1 v2 v3 v4 -> coe du1640 v3 v4)
name1872 = "Data.Nat.Properties.+-suc"
d1872 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1872 = erased
name1880 = "Data.Nat.Properties.+-assoc"
d1880 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1880 = erased
name1888 = "Data.Nat.Properties.+-identityˡ"
d1888 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1888 = erased
name1890 = "Data.Nat.Properties.+-identityʳ"
d1890 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1890 = erased
name1894 = "Data.Nat.Properties.+-identity"
d1894 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d1894 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name1896 = "Data.Nat.Properties.+-comm"
d1896 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1896 = erased
name1904 = "Data.Nat.Properties.+-cancelˡ-≡"
d1904 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1904 = erased
name1912 = "Data.Nat.Properties.+-cancelʳ-≡"
d1912 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1912 = erased
name1914 = "Data.Nat.Properties.+-cancel-≡"
d1914 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d1914 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name1916 = "Data.Nat.Properties.+-isMagma"
d1916 :: MAlonzo.Code.Algebra.Structures.T80
d1916
  = coe
      MAlonzo.Code.Algebra.Structures.C423
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      erased
name1918 = "Data.Nat.Properties.+-isSemigroup"
d1918 :: MAlonzo.Code.Algebra.Structures.T116
d1918
  = coe MAlonzo.Code.Algebra.Structures.C1721 (coe d1916) erased
name1920 = "Data.Nat.Properties.+-isCommutativeSemigroup"
d1920 :: MAlonzo.Code.Algebra.Structures.T192
d1920
  = coe MAlonzo.Code.Algebra.Structures.C2681 (coe d1918) erased
name1922 = "Data.Nat.Properties.+-0-isMonoid"
d1922 :: MAlonzo.Code.Algebra.Structures.T314
d1922
  = coe MAlonzo.Code.Algebra.Structures.C4201 (coe d1918) (coe d1894)
name1924 = "Data.Nat.Properties.+-0-isCommutativeMonoid"
d1924 :: MAlonzo.Code.Algebra.Structures.T362
d1924
  = coe MAlonzo.Code.Algebra.Structures.C5263 (coe d1922) erased
name1926 = "Data.Nat.Properties.+-rawMagma"
d1926 :: MAlonzo.Code.Algebra.Bundles.T8
d1926 = coe MAlonzo.Code.Algebra.Bundles.C47 addInt
name1928 = "Data.Nat.Properties.+-0-rawMonoid"
d1928 :: MAlonzo.Code.Algebra.Bundles.T394
d1928
  = coe MAlonzo.Code.Algebra.Bundles.C4379 addInt (0 :: Integer)
name1930 = "Data.Nat.Properties.+-magma"
d1930 :: MAlonzo.Code.Algebra.Bundles.T30
d1930 = coe MAlonzo.Code.Algebra.Bundles.C255 addInt d1916
name1932 = "Data.Nat.Properties.+-semigroup"
d1932 :: MAlonzo.Code.Algebra.Bundles.T80
d1932 = coe MAlonzo.Code.Algebra.Bundles.C877 addInt d1918
name1934 = "Data.Nat.Properties.+-commutativeSemigroup"
d1934 :: MAlonzo.Code.Algebra.Bundles.T202
d1934 = coe MAlonzo.Code.Algebra.Bundles.C2287 addInt d1920
name1936 = "Data.Nat.Properties.+-0-monoid"
d1936 :: MAlonzo.Code.Algebra.Bundles.T422
d1936
  = coe
      MAlonzo.Code.Algebra.Bundles.C4689 addInt (0 :: Integer) d1922
name1938 = "Data.Nat.Properties.+-0-commutativeMonoid"
d1938 :: MAlonzo.Code.Algebra.Bundles.T496
d1938
  = coe
      MAlonzo.Code.Algebra.Bundles.C5649 addInt (0 :: Integer) d1924
name1940 = "Data.Nat.Properties.∸-magma"
d1940 :: MAlonzo.Code.Algebra.Bundles.T30
d1940
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Algebra.du20
      (coe MAlonzo.Code.Agda.Builtin.Nat.d22)
name1946 = "Data.Nat.Properties.m≢1+m+n"
d1946 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1946 = erased
name1956 = "Data.Nat.Properties.m≢1+n+m"
d1956 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1956 = erased
name1966 = "Data.Nat.Properties.m+1+n≢m"
d1966 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1966 = erased
name1974 = "Data.Nat.Properties.m+1+n≢0"
d1974 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1974 = erased
name1988 = "Data.Nat.Properties.m+n≡0⇒m≡0"
d1988 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1988 = erased
name1996 = "Data.Nat.Properties.m+n≡0⇒n≡0"
d1996 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1996 = erased
name2004 = "Data.Nat.Properties.+-cancelˡ-≤"
d2004 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2004 v0 v1 v2 v3 = du2004 v0 v3
du2004 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2004 v0 v1
  = case coe v0 of
      0 -> coe v1
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C18 v5 -> coe du2004 (coe v2) (coe v5)
             _ -> MAlonzo.RTE.mazUnreachableError
name2012 = "Data.Nat.Properties.+-cancelʳ-≤"
d2012 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2012 v0 v1 v2 v3 = du2012 v0 v3
du2012 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2012 v0 v1 = coe du2004 (coe v0) (coe v1)
name2022 = "Data.Nat.Properties.+-cancel-≤"
d2022 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d2022
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.C32
      (\ v0 v1 v2 v3 -> coe du2004 v0 v3)
      (\ v0 v1 v2 v3 -> coe du2012 v0 v3)
name2024 = "Data.Nat.Properties.+-cancelˡ-<"
d2024 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2024 v0 v1 v2 v3 = du2024 v0 v3
du2024 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2024 v0 v1 = coe du2004 (coe v0) (coe v1)
name2034 = "Data.Nat.Properties.+-cancelʳ-<"
d2034 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2034 v0 v1 v2 v3 = du2034 v0 v3
du2034 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2034 v0 v1 = coe du2012 (coe v0) (coe v1)
name2042 = "Data.Nat.Properties.+-cancel-<"
d2042 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d2042
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.C32
      (\ v0 v1 v2 v3 -> coe du2024 v0 v3)
      (\ v0 v1 v2 v3 -> coe du2034 v0 v3)
name2050 = "Data.Nat.Properties.≤-stepsˡ"
d2050 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2050 v0 v1 v2 v3 = du2050 v3
du2050 ::
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2050 v0 = coe v0
name2064 = "Data.Nat.Properties.≤-stepsʳ"
d2064 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2064 v0 v1 v2 v3 = du2064 v3
du2064 ::
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2064 v0 = coe v0
name2078 = "Data.Nat.Properties.m≤m+n"
d2078 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d2078 v0 v1 = du2078 v0
du2078 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
du2078 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (coe du2078 (coe v1))
name2090 = "Data.Nat.Properties.m≤n+m"
d2090 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d2090 v0 v1 = du2090 v0
du2090 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
du2090 v0 = coe du2078 (coe v0)
name2102 = "Data.Nat.Properties.m≤n⇒m<n∨m≡n"
d2102 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Sum.Base.T30
d2102 v0 v1 v2
  = case coe v0 of
      0 -> case coe v1 of
             0 -> coe MAlonzo.Code.Data.Sum.Base.C42 erased
             _ -> coe MAlonzo.Code.Data.Sum.Base.C38 (coe du1716)
      _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
           let v4 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v2 of
             MAlonzo.Code.Data.Nat.Base.C18 v7
               -> let v8 = d2102 (coe v3) (coe v4) (coe v7) in
                  case coe v8 of
                    MAlonzo.Code.Data.Sum.Base.C38 v9
                      -> coe
                           MAlonzo.Code.Data.Sum.Base.C38
                           (coe MAlonzo.Code.Data.Nat.Base.C18 v9)
                    MAlonzo.Code.Data.Sum.Base.C42 v9
                      -> coe MAlonzo.Code.Data.Sum.Base.C42 erased
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
name2138 = "Data.Nat.Properties.m+n≤o⇒m≤o"
d2138 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2138 v0 v1 v2 v3 = du2138 v0 v3
du2138 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2138 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C18 v5
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18 (coe du2138 (coe v2) (coe v5))
             _ -> MAlonzo.RTE.mazUnreachableError
name2152 = "Data.Nat.Properties.m+n≤o⇒n≤o"
d2152 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2152 v0 v1 v2 v3 = du2152 v0 v2 v3
du2152 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2152 v0 v1 v2
  = case coe v0 of
      0 -> coe v2
      _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
           coe du2152 (coe v3) (coe v1) (coe du1520 (coe v1) (coe v2))
name2160 = "Data.Nat.Properties.+-mono-≤"
d2160 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2160 v0 v1 v2 v3 v4 v5 = du2160 v3 v4 v5
du2160 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2160 v0 v1 v2
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C10
        -> coe du1430 (coe v2) (coe du2090 (coe v0))
      MAlonzo.Code.Data.Nat.Base.C18 v5
        -> coe
             MAlonzo.Code.Data.Nat.Base.C18
             (coe du2160 (coe v0) (coe v5) (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
name2174 = "Data.Nat.Properties.+-monoˡ-≤"
d2174 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2174 v0 v1 v2 v3 = du2174 v0 v3
du2174 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2174 v0 v1 = coe du2160 (coe v0) (coe v1) (coe d1422 (coe v0))
name2184 = "Data.Nat.Properties.+-monoʳ-≤"
d2184 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2184 v0 v1 v2 v3 = du2184 v0 v2 v3
du2184 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2184 v0 v1 v2 = coe du2160 (coe v1) (coe d1422 (coe v0)) (coe v2)
name2190 = "Data.Nat.Properties.+-mono-<-≤"
d2190 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2190 v0 v1 v2 v3 v4 v5 = du2190 v4 v5
du2190 ::
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2190 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C18 v4
        -> case coe v4 of
             MAlonzo.Code.Data.Nat.Base.C10
               -> coe MAlonzo.Code.Data.Nat.Base.C18 v1
             MAlonzo.Code.Data.Nat.Base.C18 v7
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18
                    (coe du2190 (coe MAlonzo.Code.Data.Nat.Base.C18 v7) (coe v1))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name2200 = "Data.Nat.Properties.+-mono-≤-<"
d2200 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2200 v0 v1 v2 v3 v4 v5 = du2200 v3 v4 v5
du2200 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2200 v0 v1 v2
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C10
        -> coe du1430 (coe v2) (coe du2090 (coe v0))
      MAlonzo.Code.Data.Nat.Base.C18 v5
        -> coe
             MAlonzo.Code.Data.Nat.Base.C18
             (coe du2200 (coe v0) (coe v5) (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
name2210 = "Data.Nat.Properties.+-mono-<"
d2210 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2210 v0 v1 v2 v3 v4 = du2210 v1 v3 v4
du2210 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2210 v0 v1 v2
  = coe du2200 (coe v1) (coe du1520 (coe v0) (coe v2))
name2218 = "Data.Nat.Properties.+-monoˡ-<"
d2218 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2218 v0 v1 v2 = du2218 v0
du2218 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2218 v0 = coe du2174 (coe v0)
name2226 = "Data.Nat.Properties.+-monoʳ-<"
d2226 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2226 v0 v1 v2 v3 = du2226 v0 v3
du2226 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2226 v0 v1
  = case coe v0 of
      0 -> coe v1
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (coe du2226 (coe v2) (coe v1))
name2238 = "Data.Nat.Properties.m+1+n≰m"
d2238 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d2238 = erased
name2248 = "Data.Nat.Properties.m<m+n"
d2248 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2248 v0 v1 v2 = du2248 v0 v2
du2248 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2248 v0 v1
  = case coe v0 of
      0 -> coe v1
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (coe du2248 (coe v2) (coe v1))
name2260 = "Data.Nat.Properties.m<n+m"
d2260 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2260 v0 v1 v2 = du2260 v0 v2
du2260 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2260 v0 v1 = coe du2248 (coe v0) (coe v1)
name2276 = "Data.Nat.Properties.m+n≮n"
d2276 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d2276 = erased
name2290 = "Data.Nat.Properties.m+n≮m"
d2290 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d2290 = erased
name2302 = "Data.Nat.Properties.*-suc"
d2302 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2302 = erased
name2314 = "Data.Nat.Properties.*-identityˡ"
d2314 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2314 = erased
name2318 = "Data.Nat.Properties.*-identityʳ"
d2318 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2318 = erased
name2322 = "Data.Nat.Properties.*-identity"
d2322 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d2322 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name2324 = "Data.Nat.Properties.*-zeroˡ"
d2324 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2324 = erased
name2326 = "Data.Nat.Properties.*-zeroʳ"
d2326 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2326 = erased
name2330 = "Data.Nat.Properties.*-zero"
d2330 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d2330 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name2332 = "Data.Nat.Properties.*-comm"
d2332 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2332 = erased
name2342 = "Data.Nat.Properties.*-distribʳ-+"
d2342 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2342 = erased
name2356 = "Data.Nat.Properties.*-distribˡ-+"
d2356 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2356 = erased
name2358 = "Data.Nat.Properties.*-distrib-+"
d2358 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d2358 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name2360 = "Data.Nat.Properties.*-assoc"
d2360 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2360 = erased
name2374 = "Data.Nat.Properties.*-isMagma"
d2374 :: MAlonzo.Code.Algebra.Structures.T80
d2374
  = coe
      MAlonzo.Code.Algebra.Structures.C423
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      erased
name2376 = "Data.Nat.Properties.*-isSemigroup"
d2376 :: MAlonzo.Code.Algebra.Structures.T116
d2376
  = coe MAlonzo.Code.Algebra.Structures.C1721 (coe d2374) erased
name2378 = "Data.Nat.Properties.*-isCommutativeSemigroup"
d2378 :: MAlonzo.Code.Algebra.Structures.T192
d2378
  = coe MAlonzo.Code.Algebra.Structures.C2681 (coe d2376) erased
name2380 = "Data.Nat.Properties.*-1-isMonoid"
d2380 :: MAlonzo.Code.Algebra.Structures.T314
d2380
  = coe MAlonzo.Code.Algebra.Structures.C4201 (coe d2376) (coe d2322)
name2382 = "Data.Nat.Properties.*-1-isCommutativeMonoid"
d2382 :: MAlonzo.Code.Algebra.Structures.T362
d2382
  = coe MAlonzo.Code.Algebra.Structures.C5263 (coe d2380) erased
name2384 = "Data.Nat.Properties.+-*-isSemiring"
d2384 :: MAlonzo.Code.Algebra.Structures.T1172
d2384
  = coe
      MAlonzo.Code.Algebra.Structures.C21369
      (coe
         MAlonzo.Code.Algebra.Structures.C19341 (coe d1924) (coe d2380)
         (coe d2358))
      (coe d2330)
name2386 = "Data.Nat.Properties.+-*-isCommutativeSemiring"
d2386 :: MAlonzo.Code.Algebra.Structures.T1276
d2386
  = coe MAlonzo.Code.Algebra.Structures.C23215 (coe d2384) erased
name2388 = "Data.Nat.Properties.*-rawMagma"
d2388 :: MAlonzo.Code.Algebra.Bundles.T8
d2388 = coe MAlonzo.Code.Algebra.Bundles.C47 mulInt
name2390 = "Data.Nat.Properties.*-1-rawMonoid"
d2390 :: MAlonzo.Code.Algebra.Bundles.T394
d2390
  = coe MAlonzo.Code.Algebra.Bundles.C4379 mulInt (1 :: Integer)
name2392 = "Data.Nat.Properties.*-magma"
d2392 :: MAlonzo.Code.Algebra.Bundles.T30
d2392 = coe MAlonzo.Code.Algebra.Bundles.C255 mulInt d2374
name2394 = "Data.Nat.Properties.*-semigroup"
d2394 :: MAlonzo.Code.Algebra.Bundles.T80
d2394 = coe MAlonzo.Code.Algebra.Bundles.C877 mulInt d2376
name2396 = "Data.Nat.Properties.*-commutativeSemigroup"
d2396 :: MAlonzo.Code.Algebra.Bundles.T202
d2396 = coe MAlonzo.Code.Algebra.Bundles.C2287 mulInt d2378
name2398 = "Data.Nat.Properties.*-1-monoid"
d2398 :: MAlonzo.Code.Algebra.Bundles.T422
d2398
  = coe
      MAlonzo.Code.Algebra.Bundles.C4689 mulInt (1 :: Integer) d2380
name2400 = "Data.Nat.Properties.*-1-commutativeMonoid"
d2400 :: MAlonzo.Code.Algebra.Bundles.T496
d2400
  = coe
      MAlonzo.Code.Algebra.Bundles.C5649 mulInt (1 :: Integer) d2382
name2402 = "Data.Nat.Properties.+-*-semiring"
d2402 :: MAlonzo.Code.Algebra.Bundles.T1674
d2402
  = coe
      MAlonzo.Code.Algebra.Bundles.C18667 addInt mulInt (0 :: Integer)
      (1 :: Integer) d2384
name2404 = "Data.Nat.Properties.+-*-commutativeSemiring"
d2404 :: MAlonzo.Code.Algebra.Bundles.T1828
d2404
  = coe
      MAlonzo.Code.Algebra.Bundles.C20509 addInt mulInt (0 :: Integer)
      (1 :: Integer) d2386
name2412 = "Data.Nat.Properties.*-cancelʳ-≡"
d2412 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2412 = erased
name2430 = "Data.Nat.Properties.*-cancelˡ-≡"
d2430 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2430 = erased
name2444 = "Data.Nat.Properties.m*n≡0⇒m≡0∨n≡0"
d2444 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Sum.Base.T30
d2444 v0 v1 v2 = du2444 v0
du2444 :: Integer -> MAlonzo.Code.Data.Sum.Base.T30
du2444 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Sum.Base.C38 erased
      _ -> coe MAlonzo.Code.Data.Sum.Base.C42 erased
name2458 = "Data.Nat.Properties.m*n≡1⇒m≡1"
d2458 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2458 = erased
name2472 = "Data.Nat.Properties.m*n≡1⇒n≡1"
d2472 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2472 = erased
name2486 = "Data.Nat.Properties.*-cancelʳ-≤"
d2486 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2486 v0 v1 v2 v3 = du2486 v0
du2486 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
du2486 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (coe du2486 (coe v1))
name2502 = "Data.Nat.Properties.*-cancelˡ-≤"
d2502 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2502 v0 v1 v2 = du2502 v0
du2502 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2502 v0 v1 = coe du2486 (coe v0)
name2518 = "Data.Nat.Properties.*-mono-≤"
d2518 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2518 v0 v1 v2 v3 v4 v5 = du2518 v1 v3 v4 v5
du2518 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2518 v0 v1 v2 v3
  = case coe v2 of
      MAlonzo.Code.Data.Nat.Base.C10
        -> coe MAlonzo.Code.Data.Nat.Base.C10
      MAlonzo.Code.Data.Nat.Base.C18 v6
        -> let v7 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             du2160 (coe mulInt (coe v7) (coe v1)) (coe v3)
             (coe du2518 (coe v7) (coe v1) (coe v6) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
name2528 = "Data.Nat.Properties.*-monoˡ-≤"
d2528 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2528 v0 v1 v2 v3 = du2528 v0 v2 v3
du2528 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2528 v0 v1 v2
  = coe du2518 (coe v1) (coe v0) (coe v2) (coe d1422 (coe v0))
name2538 = "Data.Nat.Properties.*-monoʳ-≤"
d2538 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2538 v0 v1 v2 v3 = du2538 v0 v2 v3
du2538 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2538 v0 v1 v2
  = coe du2518 (coe v0) (coe v1) (coe d1422 (coe v0)) (coe v2)
name2544 = "Data.Nat.Properties.*-mono-<"
d2544 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2544 v0 v1 v2 v3 v4 v5 = du2544 v1 v3 v4 v5
du2544 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2544 v0 v1 v2 v3
  = case coe v2 of
      MAlonzo.Code.Data.Nat.Base.C18 v6
        -> case coe v6 of
             MAlonzo.Code.Data.Nat.Base.C10
               -> coe
                    seq (coe v3)
                    (coe
                       MAlonzo.Code.Data.Nat.Base.C18
                       (coe MAlonzo.Code.Data.Nat.Base.C10))
             MAlonzo.Code.Data.Nat.Base.C18 v9
               -> case coe v3 of
                    MAlonzo.Code.Data.Nat.Base.C18 v12
                      -> coe
                           du2210 v1
                           (mulInt (coe subInt (coe v0) (coe (1 :: Integer))) (coe v1))
                           (coe MAlonzo.Code.Data.Nat.Base.C18 v12)
                           (coe
                              du2544 (coe subInt (coe v0) (coe (1 :: Integer))) (coe v1)
                              (coe MAlonzo.Code.Data.Nat.Base.C18 v9)
                              (coe MAlonzo.Code.Data.Nat.Base.C18 v12))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name2556 = "Data.Nat.Properties.*-monoˡ-<"
d2556 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2556 v0 v1 v2 v3 = du2556 v0 v2 v3
du2556 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2556 v0 v1 v2
  = case coe v2 of
      MAlonzo.Code.Data.Nat.Base.C18 v5
        -> case coe v5 of
             MAlonzo.Code.Data.Nat.Base.C10
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18 (coe MAlonzo.Code.Data.Nat.Base.C10)
             MAlonzo.Code.Data.Nat.Base.C18 v8
               -> coe
                    du2200
                    (coe
                       mulInt (coe subInt (coe v1) (coe (1 :: Integer)))
                       (coe addInt (coe (1 :: Integer)) (coe v0)))
                    (coe d1422 (coe addInt (coe (1 :: Integer)) (coe v0)))
                    (coe
                       du2556 (coe v0) (coe subInt (coe v1) (coe (1 :: Integer)))
                       (coe MAlonzo.Code.Data.Nat.Base.C18 v8))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name2568 = "Data.Nat.Properties.*-monoʳ-<"
d2568 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2568 v0 v1 v2 v3 = du2568 v0 v2 v3
du2568 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2568 v0 v1 v2
  = case coe v0 of
      0 -> case coe v2 of
             MAlonzo.Code.Data.Nat.Base.C18 v5
               -> coe
                    du2160 (coe (0 :: Integer)) (coe MAlonzo.Code.Data.Nat.Base.C18 v5)
                    (coe MAlonzo.Code.Data.Nat.Base.C10)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v2 of
             MAlonzo.Code.Data.Nat.Base.C18 v6
               -> coe
                    du2160 (coe mulInt (coe v0) (coe v1))
                    (coe MAlonzo.Code.Data.Nat.Base.C18 v6)
                    (coe
                       du1520 (coe mulInt (coe v0) (coe v1))
                       (coe
                          du2568 (coe v3) (coe v1) (coe MAlonzo.Code.Data.Nat.Base.C18 v6)))
             _ -> MAlonzo.RTE.mazUnreachableError
name2580 = "Data.Nat.Properties.m≤m*n"
d2580 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2580 v0 v1 v2
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
      (coe d1472) (\ v3 v4 v5 -> coe du1520 v4 v5) (coe v0)
      (coe mulInt (coe v0) (coe v1))
      (coe
         MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
         (coe d1472) (\ v3 v4 v5 v6 v7 -> coe du1640 v6 v7)
         (coe mulInt (coe v0) (coe (1 :: Integer)))
         (coe mulInt (coe v0) (coe v1)) (coe mulInt (coe v0) (coe v1))
         (coe
            MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d34
               (MAlonzo.Code.Relation.Binary.Structures.d80 (coe d1472))
               (mulInt (coe v0) (coe v1))))
         (coe du2538 (coe v0) (coe v1) (coe v2)))
name2592 = "Data.Nat.Properties.m<m*n"
d2592 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2592 v0 v1 v2 v3
  = let v4 = subInt (coe v0) (coe (1 :: Integer)) in
    coe
      seq (coe v2)
      (case coe v3 of
         MAlonzo.Code.Data.Nat.Base.C18 v7
           -> coe
                seq (coe v7)
                (coe
                   MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du176
                   (coe
                      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du202
                      (\ v8 v9 v10 v11 v12 -> coe du1634 v9 v11 v12)
                      (coe MAlonzo.Code.Relation.Binary.PropositionalEquality.Core.du136)
                      (\ v8 v9 v10 v11 v12 -> coe du1646 v11 v12) (coe v0)
                      (coe addInt (coe v1) (coe v4)) (coe mulInt (coe v0) (coe v1))
                      (coe
                         MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                         (coe d1472) (\ v8 v9 v10 v11 v12 -> coe du1640 v11 v12)
                         (coe addInt (coe v1) (coe v4))
                         (coe addInt (coe v1) (coe mulInt (coe v4) (coe v1)))
                         (coe mulInt (coe v0) (coe v1))
                         (coe
                            MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                            (coe
                               MAlonzo.Code.Relation.Binary.Structures.d34
                               (MAlonzo.Code.Relation.Binary.Structures.d80 (coe d1472))
                               (mulInt (coe v0) (coe v1))))
                         (coe
                            du2184 (coe v1) (coe mulInt (coe v4) (coe v1))
                            (coe d2580 (coe v4) (coe v1) (coe du1716))))
                      (coe
                         MAlonzo.Code.Data.Nat.Base.C18
                         (coe MAlonzo.Code.Data.Nat.Base.C18 (coe du2090 (coe v4))))))
         _ -> MAlonzo.RTE.mazUnreachableError)
name2602 = "Data.Nat.Properties.*-cancelʳ-<"
d2602 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2602 v0 v1 v2 v3 = du2602 v0 v1 v2
du2602 ::
  Integer -> Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du2602 v0 v1 v2
  = let v3
          = let v3 = subInt (coe v1) (coe (1 :: Integer)) in
            let v4 = subInt (coe v2) (coe (1 :: Integer)) in
            coe
              MAlonzo.Code.Data.Nat.Base.C18
              (coe du2602 (coe v0) (coe v3) (coe v4)) in
    coe
      seq (coe v0)
      (case coe v1 of
         0 -> case coe v2 of
                _ | coe geqInt (coe v2) (coe (1 :: Integer)) -> coe du1716
                _ -> coe v3
         _ -> let v4 = subInt (coe v1) (coe (1 :: Integer)) in
              case coe v2 of
                _ | coe geqInt (coe v2) (coe (1 :: Integer)) ->
                    let v5 = subInt (coe v2) (coe (1 :: Integer)) in
                    coe
                      MAlonzo.Code.Data.Nat.Base.C18
                      (coe du2602 (coe v0) (coe v4) (coe v5))
                _ -> coe v3)
name2618 = "Data.Nat.Properties.*-cancelˡ-<"
d2618 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2618 v0 v1 v2 v3 = coe du2602 (coe v0) (coe v1) (coe v2)
name2634 = "Data.Nat.Properties.*-cancel-<"
d2634 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d2634
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.C32 (coe d2618)
      (\ v0 v1 v2 v3 -> coe du2602 v0 v1 v2)
name2636 = "Data.Nat.Properties.^-identityʳ"
d2636 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2636 = erased
name2640 = "Data.Nat.Properties.^-zeroˡ"
d2640 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2640 = erased
name2650 = "Data.Nat.Properties.^-distribˡ-+-*"
d2650 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2650 = erased
name2668 = "Data.Nat.Properties.^-semigroup-morphism"
d2668 :: Integer -> MAlonzo.Code.Algebra.Morphism.T144
d2668 v0 = du2668
du2668 :: MAlonzo.Code.Algebra.Morphism.T144
du2668 = coe MAlonzo.Code.Algebra.Morphism.C771 erased erased
name2676 = "Data.Nat.Properties.^-monoid-morphism"
d2676 :: Integer -> MAlonzo.Code.Algebra.Morphism.T290
d2676 v0 = du2676
du2676 :: MAlonzo.Code.Algebra.Morphism.T290
du2676
  = coe MAlonzo.Code.Algebra.Morphism.C1525 (coe du2668) erased
name2684 = "Data.Nat.Properties.^-*-assoc"
d2684 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2684 = erased
name2706 = "Data.Nat.Properties.m^n≡0⇒m≡0"
d2706 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2706 = erased
name2718 = "Data.Nat.Properties.m^n≡1⇒n≡0∨m≡1"
d2718 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Sum.Base.T30
d2718 v0 v1 v2 = du2718 v1
du2718 :: Integer -> MAlonzo.Code.Data.Sum.Base.T30
du2718 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Sum.Base.C38 erased
      _ -> coe MAlonzo.Code.Data.Sum.Base.C42 erased
name2728 = "Data.Nat.Properties.⊔-assoc"
d2728 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2728 = erased
name2744 = "Data.Nat.Properties.⊔-identityˡ"
d2744 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2744 = erased
name2746 = "Data.Nat.Properties.⊔-identityʳ"
d2746 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2746 = erased
name2750 = "Data.Nat.Properties.⊔-identity"
d2750 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d2750 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name2752 = "Data.Nat.Properties.⊔-comm"
d2752 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2752 = erased
name2762 = "Data.Nat.Properties.⊔-sel"
d2762 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d2762 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Sum.Base.C42 erased
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe MAlonzo.Code.Data.Sum.Base.C38 erased
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe d2762 (coe v2) (coe v3)
name2786 = "Data.Nat.Properties.⊔-idem"
d2786 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2786 = erased
name2794 = "Data.Nat.Properties.⊔-least"
d2794 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2794 v0 v1 v2 v3 v4 = du2794 v0 v1 v3 v4
du2794 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2794 v0 v1 v2 v3
  = let v4 = d2762 (coe v0) (coe v1) in
    case coe v4 of
      MAlonzo.Code.Data.Sum.Base.C38 v5 -> coe v2
      MAlonzo.Code.Data.Sum.Base.C42 v5 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name2836 = "Data.Nat.Properties.⊔-isMagma"
d2836 :: MAlonzo.Code.Algebra.Structures.T80
d2836
  = coe
      MAlonzo.Code.Algebra.Structures.C423
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      erased
name2838 = "Data.Nat.Properties.⊔-isSemigroup"
d2838 :: MAlonzo.Code.Algebra.Structures.T116
d2838
  = coe MAlonzo.Code.Algebra.Structures.C1721 (coe d2836) erased
name2840 = "Data.Nat.Properties.⊔-isBand"
d2840 :: MAlonzo.Code.Algebra.Structures.T152
d2840
  = coe MAlonzo.Code.Algebra.Structures.C2175 (coe d2838) erased
name2842 = "Data.Nat.Properties.⊔-isSemilattice"
d2842 :: MAlonzo.Code.Algebra.Structures.T232
d2842
  = coe MAlonzo.Code.Algebra.Structures.C3189 (coe d2840) erased
name2844 = "Data.Nat.Properties.⊔-0-isMonoid"
d2844 :: MAlonzo.Code.Algebra.Structures.T314
d2844
  = coe MAlonzo.Code.Algebra.Structures.C4201 (coe d2838) (coe d2750)
name2846 = "Data.Nat.Properties.⊔-0-isCommutativeMonoid"
d2846 :: MAlonzo.Code.Algebra.Structures.T362
d2846
  = coe MAlonzo.Code.Algebra.Structures.C5263 (coe d2844) erased
name2848 = "Data.Nat.Properties.⊔-magma"
d2848 :: MAlonzo.Code.Algebra.Bundles.T30
d2848
  = coe
      MAlonzo.Code.Algebra.Bundles.C255 MAlonzo.Code.Data.Nat.Base.d94
      d2836
name2850 = "Data.Nat.Properties.⊔-semigroup"
d2850 :: MAlonzo.Code.Algebra.Bundles.T80
d2850
  = coe
      MAlonzo.Code.Algebra.Bundles.C877 MAlonzo.Code.Data.Nat.Base.d94
      d2838
name2852 = "Data.Nat.Properties.⊔-band"
d2852 :: MAlonzo.Code.Algebra.Bundles.T138
d2852
  = coe
      MAlonzo.Code.Algebra.Bundles.C1567 MAlonzo.Code.Data.Nat.Base.d94
      d2840
name2854 = "Data.Nat.Properties.⊔-semilattice"
d2854 :: MAlonzo.Code.Algebra.Bundles.T266
d2854
  = coe
      MAlonzo.Code.Algebra.Bundles.C3011 MAlonzo.Code.Data.Nat.Base.d94
      d2842
name2856 = "Data.Nat.Properties.⊔-0-commutativeMonoid"
d2856 :: MAlonzo.Code.Algebra.Bundles.T496
d2856
  = coe
      MAlonzo.Code.Algebra.Bundles.C5649 MAlonzo.Code.Data.Nat.Base.d94
      (0 :: Integer) d2846
name2864 = "Data.Nat.Properties.⊔-triangulate"
d2864 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2864 = erased
name2880 = "Data.Nat.Properties.m≤m⊔n"
d2880 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d2880 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe d1422 (coe v0)
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (d2880 (coe v2) (coe v3))
name2892 = "Data.Nat.Properties.n≤m⊔n"
d2892 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d2892 v0 v1 = coe d2880 (coe v1) (coe v0)
name2904 = "Data.Nat.Properties.m≤n⇒n⊔m≡n"
d2904 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2904 = erased
name2912 = "Data.Nat.Properties.m≤n⇒m⊔n≡n"
d2912 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2912 = erased
name2922 = "Data.Nat.Properties.n⊔m≡m⇒n≤m"
d2922 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d2922 v0 v1 v2 = du2922 v0 v1
du2922 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du2922 v0 v1 = coe d2880 (coe v1) (coe v0)
name2932 = "Data.Nat.Properties.n⊔m≡n⇒m≤n"
d2932 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d2932 v0 v1 v2 = du2932 v0 v1
du2932 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du2932 v0 v1 = coe d2892 (coe v1) (coe v0)
name2944 = "Data.Nat.Properties.m≤n⇒m≤n⊔o"
d2944 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2944 v0 v1 v2 v3 = du2944 v1 v2 v3
du2944 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2944 v0 v1 v2 = coe du1430 (coe v2) (coe d2880 (coe v0) (coe v1))
name2956 = "Data.Nat.Properties.m≤n⇒m≤o⊔n"
d2956 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2956 v0 v1 v2 v3 = du2956 v1 v2 v3
du2956 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2956 v0 v1 v2 = coe du1430 (coe v2) (coe d2892 (coe v1) (coe v0))
name2968 = "Data.Nat.Properties.m⊔n≤o⇒m≤o"
d2968 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2968 v0 v1 v2 v3 = du2968 v0 v1 v3
du2968 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2968 v0 v1 v2 = coe du1430 (coe d2880 (coe v0) (coe v1)) (coe v2)
name2982 = "Data.Nat.Properties.m⊔n≤o⇒n≤o"
d2982 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2982 v0 v1 v2 v3 = du2982 v0 v1 v3
du2982 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2982 v0 v1 v2 = coe du1430 (coe d2892 (coe v0) (coe v1)) (coe v2)
name2996 = "Data.Nat.Properties.m<n⇒m<n⊔o"
d2996 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d2996 v0 v1 = du2996 v1
du2996 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du2996 v0 = coe du2944 (coe v0)
name3004 = "Data.Nat.Properties.m<n⇒m<o⊔n"
d3004 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3004 v0 v1 = du3004 v1
du3004 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3004 v0 = coe du2956 (coe v0)
name3012 = "Data.Nat.Properties.m⊔n<o⇒m<o"
d3012 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3012 v0 v1 v2 v3 = du3012 v0 v1 v3
du3012 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3012 v0 v1 v2 = coe du1640 (coe d2880 (coe v0) (coe v1)) (coe v2)
name3026 = "Data.Nat.Properties.m⊔n<o⇒n<o"
d3026 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3026 v0 v1 v2 v3 = du3026 v0 v1 v3
du3026 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3026 v0 v1 v2 = coe du1640 (coe d2892 (coe v0) (coe v1)) (coe v2)
name3034 = "Data.Nat.Properties.⊔-mono-≤"
d3034 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3034 v0 v1 v2 v3 v4 v5
  = let v6 = d2762 (coe v0) (coe v2) in
    case coe v6 of
      MAlonzo.Code.Data.Sum.Base.C38 v7
        -> coe du1430 (coe v4) (coe d2880 (coe v1) (coe v3))
      MAlonzo.Code.Data.Sum.Base.C42 v7
        -> coe du1430 (coe v5) (coe d2892 (coe v1) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
name3092 = "Data.Nat.Properties.⊔-monoˡ-≤"
d3092 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3092 v0 v1 v2 v3
  = coe
      d3034 (coe v1) (coe v2) (coe v0) (coe v0) (coe v3)
      (coe d1422 (coe v0))
name3102 = "Data.Nat.Properties.⊔-monoʳ-≤"
d3102 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3102 v0 v1 v2 v3
  = coe
      d3034 (coe v0) (coe v0) (coe v1) (coe v2) (coe d1422 (coe v0))
      (coe v3)
name3108 = "Data.Nat.Properties.⊔-mono-<"
d3108 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3108 v0 v1 v2 v3
  = coe
      d3034 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1)
      (coe addInt (coe (1 :: Integer)) (coe v2)) (coe v3)
name3116 = "Data.Nat.Properties.⊔-pres-≤m"
d3116 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3116 v0 v1 v2 v3 v4
  = coe d3034 (coe v1) (coe v0) (coe v2) (coe v0) (coe v3) (coe v4)
name3132 = "Data.Nat.Properties.⊔-pres-<m"
d3132 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3132 v0 v1 v2 v3 v4 = coe d3108 v1 v0 v2 v0 v3 v4
name3142 = "Data.Nat.Properties.+-distribˡ-⊔"
d3142 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3142 = erased
name3154 = "Data.Nat.Properties.+-distribʳ-⊔"
d3154 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3154 = erased
name3156 = "Data.Nat.Properties.+-distrib-⊔"
d3156 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d3156 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name3162 = "Data.Nat.Properties.m⊔n≤m+n"
d3162 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d3162 v0 v1
  = let v2 = d2762 (coe v0) (coe v1) in
    case coe v2 of
      MAlonzo.Code.Data.Sum.Base.C38 v3 -> coe du2078 (coe v0)
      MAlonzo.Code.Data.Sum.Base.C42 v3 -> coe du2090 (coe v1)
      _ -> MAlonzo.RTE.mazUnreachableError
name3192 = "Data.Nat.Properties.⊓-assoc"
d3192 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3192 = erased
name3208 = "Data.Nat.Properties.⊓-zeroˡ"
d3208 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3208 = erased
name3210 = "Data.Nat.Properties.⊓-zeroʳ"
d3210 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3210 = erased
name3214 = "Data.Nat.Properties.⊓-zero"
d3214 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d3214 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name3216 = "Data.Nat.Properties.⊓-comm"
d3216 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3216 = erased
name3226 = "Data.Nat.Properties.⊓-sel"
d3226 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d3226 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Sum.Base.C38 erased
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe MAlonzo.Code.Data.Sum.Base.C42 erased
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe d3226 (coe v2) (coe v3)
name3250 = "Data.Nat.Properties.⊓-idem"
d3250 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3250 = erased
name3258 = "Data.Nat.Properties.⊓-greatest"
d3258 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3258 v0 v1 v2 v3 v4 = du3258 v0 v1 v3 v4
du3258 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3258 v0 v1 v2 v3
  = let v4 = d3226 (coe v0) (coe v1) in
    case coe v4 of
      MAlonzo.Code.Data.Sum.Base.C38 v5 -> coe v2
      MAlonzo.Code.Data.Sum.Base.C42 v5 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name3300 = "Data.Nat.Properties.⊓-distribʳ-⊔"
d3300 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3300 = erased
name3320 = "Data.Nat.Properties.⊓-distribˡ-⊔"
d3320 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3320 = erased
name3322 = "Data.Nat.Properties.⊓-distrib-⊔"
d3322 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d3322 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name3324 = "Data.Nat.Properties.⊔-abs-⊓"
d3324 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3324 = erased
name3334 = "Data.Nat.Properties.⊓-abs-⊔"
d3334 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3334 = erased
name3346 = "Data.Nat.Properties.⊓-⊔-absorptive"
d3346 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d3346 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name3348 = "Data.Nat.Properties.⊓-isMagma"
d3348 :: MAlonzo.Code.Algebra.Structures.T80
d3348
  = coe
      MAlonzo.Code.Algebra.Structures.C423
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      erased
name3350 = "Data.Nat.Properties.⊓-isSemigroup"
d3350 :: MAlonzo.Code.Algebra.Structures.T116
d3350
  = coe MAlonzo.Code.Algebra.Structures.C1721 (coe d3348) erased
name3352 = "Data.Nat.Properties.⊓-isBand"
d3352 :: MAlonzo.Code.Algebra.Structures.T152
d3352
  = coe MAlonzo.Code.Algebra.Structures.C2175 (coe d3350) erased
name3354 = "Data.Nat.Properties.⊓-isSemilattice"
d3354 :: MAlonzo.Code.Algebra.Structures.T232
d3354
  = coe MAlonzo.Code.Algebra.Structures.C3189 (coe d3352) erased
name3356 = "Data.Nat.Properties.⊔-⊓-isSemiringWithoutOne"
d3356 :: MAlonzo.Code.Algebra.Structures.T898
d3356
  = coe
      MAlonzo.Code.Algebra.Structures.C16303 (coe d2846) (coe d3350)
      (coe d3322) (coe d3214)
name3358
  = "Data.Nat.Properties.⊔-⊓-isCommutativeSemiringWithoutOne"
d3358 :: MAlonzo.Code.Algebra.Structures.T988
d3358
  = coe MAlonzo.Code.Algebra.Structures.C18217 (coe d3356) erased
name3360 = "Data.Nat.Properties.⊓-⊔-isLattice"
d3360 :: MAlonzo.Code.Algebra.Structures.T686
d3360
  = coe
      MAlonzo.Code.Algebra.Structures.C11495
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      erased erased erased erased erased erased (coe d3346)
name3362 = "Data.Nat.Properties.⊓-⊔-isDistributiveLattice"
d3362 :: MAlonzo.Code.Algebra.Structures.T760
d3362
  = coe MAlonzo.Code.Algebra.Structures.C14283 (coe d3360) erased
name3364 = "Data.Nat.Properties.⊓-magma"
d3364 :: MAlonzo.Code.Algebra.Bundles.T30
d3364
  = coe
      MAlonzo.Code.Algebra.Bundles.C255 MAlonzo.Code.Data.Nat.Base.d104
      d3348
name3366 = "Data.Nat.Properties.⊓-semigroup"
d3366 :: MAlonzo.Code.Algebra.Bundles.T80
d3366
  = coe
      MAlonzo.Code.Algebra.Bundles.C877 MAlonzo.Code.Data.Nat.Base.d94
      d2838
name3368 = "Data.Nat.Properties.⊓-band"
d3368 :: MAlonzo.Code.Algebra.Bundles.T138
d3368
  = coe
      MAlonzo.Code.Algebra.Bundles.C1567 MAlonzo.Code.Data.Nat.Base.d104
      d3352
name3370 = "Data.Nat.Properties.⊓-semilattice"
d3370 :: MAlonzo.Code.Algebra.Bundles.T266
d3370
  = coe
      MAlonzo.Code.Algebra.Bundles.C3011 MAlonzo.Code.Data.Nat.Base.d104
      d3354
name3372 = "Data.Nat.Properties.⊔-⊓-commutativeSemiringWithoutOne"
d3372 :: MAlonzo.Code.Algebra.Bundles.T1376
d3372
  = coe
      MAlonzo.Code.Algebra.Bundles.C15627 MAlonzo.Code.Data.Nat.Base.d94
      MAlonzo.Code.Data.Nat.Base.d104 (0 :: Integer) d3358
name3374 = "Data.Nat.Properties.⊓-⊔-lattice"
d3374 :: MAlonzo.Code.Algebra.Bundles.T990
d3374
  = coe
      MAlonzo.Code.Algebra.Bundles.C10791 MAlonzo.Code.Data.Nat.Base.d104
      MAlonzo.Code.Data.Nat.Base.d94 d3360
name3376 = "Data.Nat.Properties.⊓-⊔-distributiveLattice"
d3376 :: MAlonzo.Code.Algebra.Bundles.T1062
d3376
  = coe
      MAlonzo.Code.Algebra.Bundles.C11717 MAlonzo.Code.Data.Nat.Base.d104
      MAlonzo.Code.Data.Nat.Base.d94 d3362
name3384 = "Data.Nat.Properties.⊓-triangulate"
d3384 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3384 = erased
name3400 = "Data.Nat.Properties.m⊓n≤m"
d3400 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d3400 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe MAlonzo.Code.Data.Nat.Base.C10
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (d3400 (coe v2) (coe v3))
name3412 = "Data.Nat.Properties.m⊓n≤n"
d3412 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d3412 v0 v1 = coe d3400 (coe v1) (coe v0)
name3424 = "Data.Nat.Properties.m≤n⇒m⊓n≡m"
d3424 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3424 = erased
name3432 = "Data.Nat.Properties.m≤n⇒n⊓m≡m"
d3432 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3432 = erased
name3442 = "Data.Nat.Properties.m⊓n≡m⇒m≤n"
d3442 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d3442 v0 v1 v2 = du3442 v0 v1
du3442 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du3442 v0 v1 = coe d3412 (coe v0) (coe v1)
name3452 = "Data.Nat.Properties.m⊓n≡n⇒n≤m"
d3452 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d3452 v0 v1 v2 = du3452 v0 v1
du3452 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du3452 v0 v1 = coe d3400 (coe v0) (coe v1)
name3464 = "Data.Nat.Properties.m≤n⇒m⊓o≤n"
d3464 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3464 v0 v1 v2 v3 = du3464 v0 v2 v3
du3464 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3464 v0 v1 v2 = coe du1430 (coe d3400 (coe v0) (coe v1)) (coe v2)
name3476 = "Data.Nat.Properties.m≤n⇒o⊓m≤n"
d3476 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3476 v0 v1 v2 v3 = du3476 v0 v2 v3
du3476 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3476 v0 v1 v2 = coe du1430 (coe d3412 (coe v1) (coe v0)) (coe v2)
name3488 = "Data.Nat.Properties.m≤n⊓o⇒m≤n"
d3488 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3488 v0 v1 v2 v3 = du3488 v1 v2 v3
du3488 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3488 v0 v1 v2 = coe du1430 (coe v2) (coe d3400 (coe v0) (coe v1))
name3502 = "Data.Nat.Properties.m≤n⊓o⇒m≤o"
d3502 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3502 v0 v1 v2 v3 = du3502 v1 v2 v3
du3502 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3502 v0 v1 v2 = coe du1430 (coe v2) (coe d3412 (coe v0) (coe v1))
name3516 = "Data.Nat.Properties.m<n⇒m⊓o<n"
d3516 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3516 v0 v1 v2 v3 = du3516 v0 v2 v3
du3516 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3516 v0 v1 v2 = coe du1640 (coe d3400 (coe v0) (coe v1)) (coe v2)
name3528 = "Data.Nat.Properties.m<n⇒o⊓m<n"
d3528 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3528 v0 v1 v2 v3 = du3528 v0 v2 v3
du3528 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3528 v0 v1 v2 = coe du1640 (coe d3412 (coe v1) (coe v0)) (coe v2)
name3540 = "Data.Nat.Properties.m<n⊓o⇒m<n"
d3540 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3540 v0 = du3540
du3540 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3540 = coe du3488
name3548 = "Data.Nat.Properties.m<n⊓o⇒m<o"
d3548 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3548 v0 = du3548
du3548 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3548 = coe du3502
name3550 = "Data.Nat.Properties.⊓-mono-≤"
d3550 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3550 v0 v1 v2 v3 v4 v5
  = let v6 = d3226 (coe v1) (coe v3) in
    case coe v6 of
      MAlonzo.Code.Data.Sum.Base.C38 v7
        -> coe du1430 (coe d3400 (coe v0) (coe v2)) (coe v4)
      MAlonzo.Code.Data.Sum.Base.C42 v7
        -> coe du1430 (coe d3412 (coe v0) (coe v2)) (coe v5)
      _ -> MAlonzo.RTE.mazUnreachableError
name3608 = "Data.Nat.Properties.⊓-monoˡ-≤"
d3608 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3608 v0 v1 v2 v3
  = coe
      d3550 (coe v1) (coe v2) (coe v0) (coe v0) (coe v3)
      (coe d1422 (coe v0))
name3618 = "Data.Nat.Properties.⊓-monoʳ-≤"
d3618 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3618 v0 v1 v2 v3
  = coe
      d3550 (coe v0) (coe v0) (coe v1) (coe v2) (coe d1422 (coe v0))
      (coe v3)
name3624 = "Data.Nat.Properties.⊓-mono-<"
d3624 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3624 v0 v1 v2 v3
  = coe
      d3550 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1)
      (coe addInt (coe (1 :: Integer)) (coe v2)) (coe v3)
name3630 = "Data.Nat.Properties.m⊓n≤m⊔n"
d3630 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d3630 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe MAlonzo.Code.Data.Nat.Base.C10
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (d3630 (coe v2) (coe v3))
name3646 = "Data.Nat.Properties.⊓-pres-m≤"
d3646 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3646 v0 v1 v2 v3 v4
  = coe d3550 (coe v0) (coe v1) (coe v0) (coe v2) (coe v3) (coe v4)
name3662 = "Data.Nat.Properties.⊓-pres-m<"
d3662 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3662 v0 v1 v2 v3 v4 = coe d3624 v0 v1 v0 v2 v3 v4
name3672 = "Data.Nat.Properties.+-distribˡ-⊓"
d3672 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3672 = erased
name3684 = "Data.Nat.Properties.+-distribʳ-⊓"
d3684 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3684 = erased
name3686 = "Data.Nat.Properties.+-distrib-⊓"
d3686 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d3686 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name3692 = "Data.Nat.Properties.m⊓n≤m+n"
d3692 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d3692 v0 v1
  = let v2 = d3226 (coe v0) (coe v1) in
    case coe v2 of
      MAlonzo.Code.Data.Sum.Base.C38 v3 -> coe du2078 (coe v0)
      MAlonzo.Code.Data.Sum.Base.C42 v3 -> coe du2090 (coe v1)
      _ -> MAlonzo.RTE.mazUnreachableError
name3722 = "Data.Nat.Properties.0∸n≡0"
d3722 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3722 = erased
name3726 = "Data.Nat.Properties.n∸n≡0"
d3726 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3726 = erased
name3734 = "Data.Nat.Properties.pred[m∸n]≡m∸[1+n]"
d3734 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3734 = erased
name3748 = "Data.Nat.Properties.m∸n≤m"
d3748 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d3748 v0 v1
  = case coe v1 of
      0 -> coe
             d1422 (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v0 (0 :: Integer))
      _ -> let v2 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v0 of
             0 -> coe
                    d1422 (coe MAlonzo.Code.Agda.Builtin.Nat.d22 (0 :: Integer) v1)
             _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
                  coe du1430 (coe d3748 (coe v3) (coe v2)) (coe d1508 (coe v3))
name3762 = "Data.Nat.Properties.m≮m∸n"
d3762 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d3762 = erased
name3774 = "Data.Nat.Properties.1+m≢m∸n"
d3774 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3774 = erased
name3782 = "Data.Nat.Properties.∸-mono"
d3782 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3782 v0 v1 v2 v3 v4 v5
  = let v6
          = seq
              (coe v5) (coe du1430 (coe d3748 (coe v0) (coe v2)) (coe v4)) in
    case coe v4 of
      MAlonzo.Code.Data.Nat.Base.C10
        -> case coe v5 of
             MAlonzo.Code.Data.Nat.Base.C18 v10
               -> case coe v2 of
                    _ | coe geqInt (coe v2) (coe (1 :: Integer)) ->
                        case coe v3 of
                          _ | coe geqInt (coe v3) (coe (1 :: Integer)) ->
                              coe MAlonzo.Code.Data.Nat.Base.C10
                          _ -> coe v6
                    _ -> coe v6
             MAlonzo.Code.Data.Nat.Base.C10
               -> coe
                    du1430 (coe d3748 (coe v0) (coe v2))
                    (coe MAlonzo.Code.Data.Nat.Base.C10)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Data.Nat.Base.C18 v9
        -> case coe v0 of
             _ | coe geqInt (coe v0) (coe (1 :: Integer)) ->
                 let v10 = subInt (coe v0) (coe (1 :: Integer)) in
                 case coe v1 of
                   _ | coe geqInt (coe v1) (coe (1 :: Integer)) ->
                       let v11 = subInt (coe v1) (coe (1 :: Integer)) in
                       case coe v5 of
                         MAlonzo.Code.Data.Nat.Base.C18 v14
                           -> case coe v2 of
                                _ | coe geqInt (coe v2) (coe (1 :: Integer)) ->
                                    let v15 = subInt (coe v2) (coe (1 :: Integer)) in
                                    case coe v3 of
                                      _ | coe geqInt (coe v3) (coe (1 :: Integer)) ->
                                          let v16 = subInt (coe v3) (coe (1 :: Integer)) in
                                          coe
                                            d3782 (coe v10) (coe v11) (coe v15) (coe v16) (coe v9)
                                            (coe v14)
                                      _ -> coe v6
                                _ -> coe v6
                         MAlonzo.Code.Data.Nat.Base.C10
                           -> coe
                                du1430 (coe d3748 (coe v0) (coe v2))
                                (coe MAlonzo.Code.Data.Nat.Base.C18 v9)
                         _ -> MAlonzo.RTE.mazUnreachableError
                   _ -> coe v6
             _ -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name3800 = "Data.Nat.Properties.∸-monoˡ-≤"
d3800 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3800 v0 v1 v2 v3
  = coe
      d3782 (coe v0) (coe v1) (coe v2) (coe v2) (coe v3)
      (coe d1422 (coe v2))
name3812 = "Data.Nat.Properties.∸-monoʳ-≤"
d3812 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3812 v0 v1 v2 v3
  = coe
      d3782 (coe v2) (coe v2) (coe v1) (coe v0) (coe d1422 (coe v2))
      (coe v3)
name3822 = "Data.Nat.Properties.∸-monoʳ-<"
d3822 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3822 v0 v1 v2 v3 v4
  = let v5 = subInt (coe v1) (coe (1 :: Integer)) in
    case coe v2 of
      0 -> coe
             seq (coe v3)
             (coe
                seq (coe v4)
                (coe
                   MAlonzo.Code.Data.Nat.Base.C18
                   (d3748 (coe subInt (coe v0) (coe (1 :: Integer))) (coe v5))))
      _ -> let v6 = subInt (coe v2) (coe (1 :: Integer)) in
           case coe v3 of
             MAlonzo.Code.Data.Nat.Base.C18 v9
               -> case coe v4 of
                    MAlonzo.Code.Data.Nat.Base.C18 v12
                      -> let v13 = subInt (coe v0) (coe (1 :: Integer)) in
                         coe d3822 (coe v13) (coe v5) (coe v6) (coe v9) (coe v12)
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
name3844 = "Data.Nat.Properties.∸-cancelʳ-≤"
d3844 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3844 v0 v1 v2 v3 v4 = du3844 v1 v3
du3844 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3844 v0 v1
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C10
        -> coe MAlonzo.Code.Data.Nat.Base.C10
      MAlonzo.Code.Data.Nat.Base.C18 v4
        -> case coe v0 of
             0 -> coe MAlonzo.Code.Data.Empty.d10 () erased erased
             _ -> let v5 = subInt (coe v0) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (coe du3844 (coe v5) (coe v4))
      _ -> MAlonzo.RTE.mazUnreachableError
name3864 = "Data.Nat.Properties.∸-cancelʳ-<"
d3864 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3864 v0 v1 v2 v3 = du3864 v0 v1
du3864 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du3864 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Empty.d10 () erased erased
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe du1716
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (coe du3864 (coe v2) (coe v3))
name3890 = "Data.Nat.Properties.∸-cancelˡ-≡"
d3890 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3890 = erased
name3912 = "Data.Nat.Properties.∸-cancelʳ-≡"
d3912 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3912 = erased
name3926 = "Data.Nat.Properties.m∸n≡0⇒m≤n"
d3926 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d3926 v0 v1 v2 = du3926 v0
du3926 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
du3926 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (coe du3926 (coe v1))
name3938 = "Data.Nat.Properties.m≤n⇒m∸n≡0"
d3938 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3938 = erased
name3948 = "Data.Nat.Properties.m<n⇒0<n∸m"
d3948 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d3948 v0 v1 v2 = du3948 v0 v2
du3948 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du3948 v0 v1
  = case coe v0 of
      0 -> coe du1716
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C18 v5 -> coe du3948 (coe v2) (coe v5)
             _ -> MAlonzo.RTE.mazUnreachableError
name3962 = "Data.Nat.Properties.m∸n≢0⇒n<m"
d3962 ::
  Integer ->
  Integer ->
  (MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d3962 v0 v1 v2 = du3962 v0 v1
du3962 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du3962 v0 v1
  = let v2 = d1684 (coe v1) (coe v0) in
    case coe v2 of
      MAlonzo.Code.Relation.Nullary.C46 v3 v4
        -> if coe v3
             then case coe v4 of
                    MAlonzo.Code.Relation.Nullary.C22 v5 -> coe v5
                    _ -> MAlonzo.RTE.mazUnreachableError
             else coe
                    seq (coe v4) (coe MAlonzo.Code.Data.Empty.d10 () erased erased)
      _ -> MAlonzo.RTE.mazUnreachableError
name3994 = "Data.Nat.Properties.m>n⇒m∸n≢0"
d3994 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3994 = erased
name4006 = "Data.Nat.Properties.+-∸-comm"
d4006 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4006 = erased
name4024 = "Data.Nat.Properties.∸-+-assoc"
d4024 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4024 = erased
name4048 = "Data.Nat.Properties.+-∸-assoc"
d4048 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4048 = erased
name4068 = "Data.Nat.Properties.m≤n+m∸n"
d4068 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4068 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe d1422 (coe v0)
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (d4068 (coe v2) (coe v3))
name4082 = "Data.Nat.Properties.m+n∸n≡m"
d4082 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4082 = erased
name4094 = "Data.Nat.Properties.m+n∸m≡n"
d4094 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4094 = erased
name4106 = "Data.Nat.Properties.m+[n∸m]≡n"
d4106 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4106 = erased
name4120 = "Data.Nat.Properties.m∸n+n≡m"
d4120 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4120 = erased
name4132 = "Data.Nat.Properties.m∸[m∸n]≡n"
d4132 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4132 = erased
name4148 = "Data.Nat.Properties.[m+n]∸[m+o]≡n∸o"
d4148 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4148 = erased
name4160 = "Data.Nat.Properties.*-distribʳ-∸"
d4160 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4160 = erased
name4180 = "Data.Nat.Properties.*-distribˡ-∸"
d4180 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4180 = erased
name4182 = "Data.Nat.Properties.*-distrib-∸"
d4182 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d4182 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name4188 = "Data.Nat.Properties.even≢odd"
d4188 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4188 = erased
name4204 = "Data.Nat.Properties.m⊓n+n∸m≡n"
d4204 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4204 = erased
name4218 = "Data.Nat.Properties.[m∸n]⊓[n∸m]≡0"
d4218 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4218 = erased
name4234 = "Data.Nat.Properties.∸-distribˡ-⊓-⊔"
d4234 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4234 = erased
name4260 = "Data.Nat.Properties.∸-distribʳ-⊓"
d4260 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4260 = erased
name4286 = "Data.Nat.Properties.∸-distribˡ-⊔-⊓"
d4286 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4286 = erased
name4310 = "Data.Nat.Properties.∸-distribʳ-⊔"
d4310 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4310 = erased
name4330 = "Data.Nat.Properties.pred-mono"
d4330 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d4330 v0 v1 v2
  = coe
      d3782 (coe v0) (coe v1) (coe (1 :: Integer)) (coe (1 :: Integer))
      (coe v2) (coe d1422 (coe (1 :: Integer)))
name4338 = "Data.Nat.Properties.≤pred⇒≤"
d4338 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d4338 v0 v1 v2 = du4338 v1 v2
du4338 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du4338 v0 v1 = coe seq (coe v0) (coe v1)
name4354 = "Data.Nat.Properties.≤⇒pred≤"
d4354 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d4354 v0 v1 v2 = du4354 v0 v2
du4354 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du4354 v0 v1
  = case coe v0 of
      0 -> coe v1
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe du1430 (coe d1508 (coe v2)) (coe v1)
name4366 = "Data.Nat.Properties.<⇒≤pred"
d4366 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d4366 v0 v1 v2 = du4366 v2
du4366 ::
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du4366 v0
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C18 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name4372 = "Data.Nat.Properties.suc[pred[n]]≡n"
d4372 ::
  Integer ->
  (MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4372 = erased
name4384 = "Data.Nat.Properties.m≡n⇒∣m-n∣≡0"
d4384 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4384 = erased
name4392 = "Data.Nat.Properties.∣m-n∣≡0⇒m≡n"
d4392 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4392 = erased
name4406 = "Data.Nat.Properties.m≤n⇒∣n-m∣≡n∸m"
d4406 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4406 = erased
name4416 = "Data.Nat.Properties.∣m-n∣≡m∸n⇒n≤m"
d4416 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d4416 v0 v1 v2 = du4416 v0 v1
du4416 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du4416 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe MAlonzo.Code.Data.Nat.Base.C10
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (coe du4416 (coe v2) (coe v3))
name4432 = "Data.Nat.Properties.∣n-n∣≡0"
d4432 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4432 = erased
name4440 = "Data.Nat.Properties.∣m-m+n∣≡n"
d4440 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4440 = erased
name4454 = "Data.Nat.Properties.∣m+n-m+o∣≡∣n-o|"
d4454 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4454 = erased
name4470 = "Data.Nat.Properties.m∸n≤∣m-n∣"
d4470 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4470 v0 v1
  = let v2 = d1436 (coe v0) (coe v1) in
    case coe v2 of
      MAlonzo.Code.Data.Sum.Base.C38 v3
        -> coe MAlonzo.Code.Data.Nat.Base.C10
      MAlonzo.Code.Data.Sum.Base.C42 v3
        -> coe d1422 (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v0 v1)
      _ -> MAlonzo.RTE.mazUnreachableError
name4500 = "Data.Nat.Properties.∣m-n∣≤m⊔n"
d4500 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4500 v0 v1
  = case coe v0 of
      0 -> coe
             d1422
             (coe MAlonzo.Code.Data.Nat.Base.d130 (coe (0 :: Integer)) (coe v1))
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe
                    d1422
                    (coe MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe (0 :: Integer)))
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe d4500 (coe v2) (coe v3)
name4510 = "Data.Nat.Properties.∣-∣-identityˡ"
d4510 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4510 = erased
name4514 = "Data.Nat.Properties.∣-∣-identityʳ"
d4514 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4514 = erased
name4518 = "Data.Nat.Properties.∣-∣-identity"
d4518 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d4518 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name4520 = "Data.Nat.Properties.∣-∣-comm"
d4520 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4520 = erased
name4534 = "Data.Nat.Properties.∣m-n∣≡[m∸n]∨[n∸m]"
d4534 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d4534 v0 v1
  = let v2 = d1436 (coe v0) (coe v1) in
    case coe v2 of
      MAlonzo.Code.Data.Sum.Base.C38 v3
        -> coe
             MAlonzo.Code.Data.Sum.Base.C42
             (coe
                MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du190
                (coe
                   MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                   (coe
                      MAlonzo.Code.Relation.Binary.Structures.d34
                      (MAlonzo.Code.Relation.Binary.Structures.d80 (coe d1472))
                      (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v1 v0))))
      MAlonzo.Code.Data.Sum.Base.C42 v3
        -> coe MAlonzo.Code.Data.Sum.Base.C38 erased
      _ -> MAlonzo.RTE.mazUnreachableError
name4562 = "Data.Nat.Properties.*-distribˡ-∣-∣-aux"
d4562 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4562 = erased
name4574 = "Data.Nat.Properties.*-distribˡ-∣-∣"
d4574 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4574 = erased
name4604 = "Data.Nat.Properties.*-distribʳ-∣-∣"
d4604 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4604 = erased
name4606 = "Data.Nat.Properties.*-distrib-∣-∣"
d4606 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
d4606 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name4612 = "Data.Nat.Properties.m≤n+∣n-m∣"
d4612 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4612 v0 v1
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe d1422 (coe v0)
             _ -> let v3 = subInt (coe v1) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (d4612 (coe v2) (coe v3))
name4626 = "Data.Nat.Properties.m≤n+∣m-n∣"
d4626 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4626 v0 v1 = coe d4612 (coe v0) (coe v1)
name4640 = "Data.Nat.Properties.m≤∣m-n∣+n"
d4640 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4640 v0 v1 = coe d4626 (coe v0) (coe v1)
name4648 = "Data.Nat.Properties.∣-∣-triangle"
d4648 ::
  Integer -> Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4648 v0 v1 v2
  = case coe v0 of
      0 -> coe d4612 (coe v2) (coe v1)
      _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             0 -> coe
                    MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                    (coe d1472) (\ v4 v5 v6 -> coe du1520 v5 v6)
                    (coe MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe v2))
                    (coe
                       addInt
                       (coe MAlonzo.Code.Data.Nat.Base.d130 (coe (0 :: Integer)) (coe v2))
                       (coe
                          MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe (0 :: Integer))))
                    (coe
                       MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                       (coe d1472) (\ v4 v5 v6 v7 v8 -> coe du1640 v7 v8)
                       (coe MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe v2))
                       (coe MAlonzo.Code.Data.Nat.Base.d94 (coe v0) (coe v2))
                       (coe
                          addInt
                          (coe MAlonzo.Code.Data.Nat.Base.d130 (coe (0 :: Integer)) (coe v2))
                          (coe
                             MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe (0 :: Integer))))
                       (coe
                          MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                          (coe d1472) (\ v4 v5 v6 v7 v8 -> coe du1640 v7 v8)
                          (coe MAlonzo.Code.Data.Nat.Base.d94 (coe v0) (coe v2))
                          (coe addInt (coe v0) (coe v2))
                          (coe
                             addInt
                             (coe MAlonzo.Code.Data.Nat.Base.d130 (coe (0 :: Integer)) (coe v2))
                             (coe
                                MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe (0 :: Integer))))
                          (coe
                             MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                             (coe
                                MAlonzo.Code.Relation.Binary.Structures.d34
                                (MAlonzo.Code.Relation.Binary.Structures.d80 (coe d1472))
                                (addInt
                                   (coe
                                      MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe (0 :: Integer)))
                                   (coe v2))))
                          (coe d3162 (coe v0) (coe v2)))
                       (coe d4500 (coe v0) (coe v2)))
             _ -> let v4 = subInt (coe v1) (coe (1 :: Integer)) in
                  case coe v2 of
                    0 -> coe
                           MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
                           (coe d1472) (\ v5 v6 v7 -> coe du1520 v6 v7)
                           (coe MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe (0 :: Integer)))
                           (coe
                              addInt (coe MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe v1))
                              (coe
                                 MAlonzo.Code.Data.Nat.Base.d130 (coe v1) (coe (0 :: Integer))))
                           (coe
                              MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                              (coe d1472) (\ v5 v6 v7 v8 v9 -> coe du1640 v8 v9) (coe v0)
                              (coe
                                 addInt (coe MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe v1))
                                 (coe v1))
                              (coe
                                 addInt (coe MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe v1))
                                 (coe
                                    MAlonzo.Code.Data.Nat.Base.d130 (coe v1) (coe (0 :: Integer))))
                              (coe
                                 MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                                 (coe
                                    MAlonzo.Code.Relation.Binary.Structures.d34
                                    (MAlonzo.Code.Relation.Binary.Structures.d80 (coe d1472))
                                    (addInt
                                       (coe MAlonzo.Code.Data.Nat.Base.d130 (coe v0) (coe v1))
                                       (coe
                                          MAlonzo.Code.Data.Nat.Base.d130 (coe v1)
                                          (coe (0 :: Integer))))))
                              (coe d4640 (coe v0) (coe v1)))
                    _ -> let v5 = subInt (coe v2) (coe (1 :: Integer)) in
                         coe d4648 (coe v3) (coe v4) (coe v5)
name4676 = "Data.Nat.Properties.∣-∣-isProtoMetric"
d4676 :: MAlonzo.Code.Function.Metric.Structures.T30
d4676
  = coe
      MAlonzo.Code.Function.Metric.Structures.C1309 (coe d1474)
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      erased (coe (\ v0 v1 -> coe MAlonzo.Code.Data.Nat.Base.C10))
name4678 = "Data.Nat.Properties.∣-∣-isPreMetric"
d4678 :: MAlonzo.Code.Function.Metric.Structures.T96
d4678
  = coe
      MAlonzo.Code.Function.Metric.Structures.C3595 (coe d4676) erased
name4680 = "Data.Nat.Properties.∣-∣-isQuasiSemiMetric"
d4680 :: MAlonzo.Code.Function.Metric.Structures.T162
d4680
  = coe
      MAlonzo.Code.Function.Metric.Structures.C5519 (coe d4678) erased
name4682 = "Data.Nat.Properties.∣-∣-isSemiMetric"
d4682 :: MAlonzo.Code.Function.Metric.Structures.T232
d4682
  = coe
      MAlonzo.Code.Function.Metric.Structures.C7485 (coe d4680) erased
name4684 = "Data.Nat.Properties.∣-∣-isMetric"
d4684 :: MAlonzo.Code.Function.Metric.Structures.T308
d4684
  = coe
      MAlonzo.Code.Function.Metric.Structures.C9643 (coe d4682)
      (coe d4648)
name4686 = "Data.Nat.Properties.∣-∣-quasiSemiMetric"
d4686 :: MAlonzo.Code.Function.Metric.Nat.Bundles.T174
d4686
  = coe
      MAlonzo.Code.Function.Metric.Nat.Bundles.C1953
      MAlonzo.Code.Data.Nat.Base.d130 d4680
name4688 = "Data.Nat.Properties.∣-∣-semiMetric"
d4688 :: MAlonzo.Code.Function.Metric.Nat.Bundles.T266
d4688
  = coe
      MAlonzo.Code.Function.Metric.Nat.Bundles.C3001
      MAlonzo.Code.Data.Nat.Base.d130 d4682
name4690 = "Data.Nat.Properties.∣-∣-preMetric"
d4690 :: MAlonzo.Code.Function.Metric.Nat.Bundles.T90
d4690
  = coe
      MAlonzo.Code.Function.Metric.Nat.Bundles.C967
      MAlonzo.Code.Data.Nat.Base.d130 d4678
name4692 = "Data.Nat.Properties.∣-∣-metric"
d4692 :: MAlonzo.Code.Function.Metric.Nat.Bundles.T364
d4692
  = coe
      MAlonzo.Code.Function.Metric.Nat.Bundles.C4083
      MAlonzo.Code.Data.Nat.Base.d130 d4684
name4694 = "Data.Nat.Properties.⌊n/2⌋-mono"
d4694 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d4694 v0 v1 v2 = du4694 v2
du4694 ::
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du4694 v0
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C10
        -> coe MAlonzo.Code.Data.Nat.Base.C10
      MAlonzo.Code.Data.Nat.Base.C18 v3
        -> case coe v3 of
             MAlonzo.Code.Data.Nat.Base.C10
               -> coe MAlonzo.Code.Data.Nat.Base.C10
             MAlonzo.Code.Data.Nat.Base.C18 v6
               -> coe MAlonzo.Code.Data.Nat.Base.C18 (coe du4694 (coe v6))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name4698 = "Data.Nat.Properties.⌈n/2⌉-mono"
d4698 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d4698 v0 v1 v2 = du4698 v2
du4698 ::
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du4698 v0 = coe du4694 (coe MAlonzo.Code.Data.Nat.Base.C18 v0)
name4704 = "Data.Nat.Properties.⌊n/2⌋≤⌈n/2⌉"
d4704 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4704 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      1 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v1 = subInt (coe v0) (coe (2 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (d4704 (coe v1))
name4710 = "Data.Nat.Properties.⌊n/2⌋+⌈n/2⌉≡n"
d4710 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4710 = erased
name4716 = "Data.Nat.Properties.⌊n/2⌋≤n"
d4716 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4716 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      1 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v1 = subInt (coe v0) (coe (2 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (d4716 (coe v1))
name4722 = "Data.Nat.Properties.⌊n/2⌋<n"
d4722 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4722 v0
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Data.Nat.Base.C18 (coe MAlonzo.Code.Data.Nat.Base.C10)
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Data.Nat.Base.C18
             (coe MAlonzo.Code.Data.Nat.Base.C18 (d4716 (coe v1)))
name4728 = "Data.Nat.Properties.⌈n/2⌉≤n"
d4728 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4728 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C18 (d4716 (coe v1))
name4734 = "Data.Nat.Properties.⌈n/2⌉<n"
d4734 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
d4734 v0 = coe MAlonzo.Code.Data.Nat.Base.C18 (d4722 (coe v0))
name4738 = "Data.Nat.Properties.≤′-trans"
d4738 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> MAlonzo.Code.Data.Nat.Base.T142
d4738 v0 v1 v2 v3 v4 = du4738 v3 v4
du4738 ::
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Nat.Base.T142 -> MAlonzo.Code.Data.Nat.Base.T142
du4738 v0 v1
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C146 -> coe v0
      MAlonzo.Code.Data.Nat.Base.C152 v3
        -> coe
             MAlonzo.Code.Data.Nat.Base.C152 (coe du4738 (coe v0) (coe v3))
      _ -> MAlonzo.RTE.mazUnreachableError
name4748 = "Data.Nat.Properties.z≤′n"
d4748 :: Integer -> MAlonzo.Code.Data.Nat.Base.T142
d4748 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C146
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C152 (d4748 (coe v1))
name4756 = "Data.Nat.Properties.s≤′s"
d4756 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 -> MAlonzo.Code.Data.Nat.Base.T142
d4756 v0 v1 v2 = du4756 v2
du4756 ::
  MAlonzo.Code.Data.Nat.Base.T142 -> MAlonzo.Code.Data.Nat.Base.T142
du4756 v0 = coe v0
name4760 = "Data.Nat.Properties.≤′⇒≤"
d4760 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 -> MAlonzo.Code.Data.Nat.Base.T6
d4760 v0 v1 v2 = du4760 v0 v2
du4760 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 -> MAlonzo.Code.Data.Nat.Base.T6
du4760 v0 v1
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C146 -> coe d1422 (coe v0)
      MAlonzo.Code.Data.Nat.Base.C152 v3 -> coe du4760 (coe v0) (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
name4764 = "Data.Nat.Properties.≤⇒≤′"
d4764 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T142
d4764 v0 v1 v2 = du4764 v1 v2
du4764 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T142
du4764 v0 v1
  = case coe v1 of
      MAlonzo.Code.Data.Nat.Base.C10 -> coe d4748 (coe v0)
      MAlonzo.Code.Data.Nat.Base.C18 v4
        -> let v5 = subInt (coe v0) (coe (1 :: Integer)) in
           coe du4764 (coe v5) (coe v4)
      _ -> MAlonzo.RTE.mazUnreachableError
name4776 = "Data.Nat.Properties.≤′-step-injective"
d4776 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Data.Nat.Base.T142 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4776 = erased
name4778 = "Data.Nat.Properties._≤′?_"
d4778 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4778 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
      (coe du4764 (coe v1)) (coe d1464 (coe v0) (coe v1))
name4784 = "Data.Nat.Properties._<′?_"
d4784 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4784 v0 v1
  = coe d4778 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1)
name4790 = "Data.Nat.Properties._≥′?_"
d4790 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4790 v0 v1 = coe d4778 (coe v1) (coe v0)
name4792 = "Data.Nat.Properties._>′?_"
d4792 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4792 v0 v1 = coe d4784 (coe v1) (coe v0)
name4798 = "Data.Nat.Properties.m≤′m+n"
d4798 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T142
d4798 v0 v1
  = coe du4764 (coe addInt (coe v0) (coe v1)) (coe du2078 (coe v0))
name4808 = "Data.Nat.Properties.n≤′m+n"
d4808 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T142
d4808 v0 v1 = du4808 v0
du4808 :: Integer -> MAlonzo.Code.Data.Nat.Base.T142
du4808 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C146
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C152 (coe du4808 (coe v1))
name4818 = "Data.Nat.Properties.⌈n/2⌉≤′n"
d4818 :: Integer -> MAlonzo.Code.Data.Nat.Base.T142
d4818 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C146
      1 -> coe MAlonzo.Code.Data.Nat.Base.C146
      _ -> let v1 = subInt (coe v0) (coe (2 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C152 (d4818 (coe v1))
name4824 = "Data.Nat.Properties.⌊n/2⌋≤′n"
d4824 :: Integer -> MAlonzo.Code.Data.Nat.Base.T142
d4824 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C146
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C152 (d4818 (coe v1))
name4832 = "Data.Nat.Properties.m<ᵇn⇒1+m+[n-1+m]≡n"
d4832 ::
  Integer ->
  Integer -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4832 = erased
name4844 = "Data.Nat.Properties.m<ᵇ1+m+n"
d4844 :: Integer -> Integer -> AgdaAny
d4844 v0 v1 = du4844 v0
du4844 :: Integer -> AgdaAny
du4844 v0
  = coe
      du1414 (coe du2078 (coe addInt (coe (1 :: Integer)) (coe v0)))
name4852 = "Data.Nat.Properties.<ᵇ⇒<″"
d4852 ::
  Integer -> Integer -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T176
d4852 v0 v1 v2 = du4852 v0 v1
du4852 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T176
du4852 v0 v1
  = coe
      MAlonzo.Code.Data.Nat.Base.C190
      (coe
         MAlonzo.Code.Agda.Builtin.Nat.d22 v1
         (addInt (coe (1 :: Integer)) (coe v0)))
name4864 = "Data.Nat.Properties.<″⇒<ᵇ"
d4864 ::
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T176 -> AgdaAny
d4864 v0 v1 v2 = du4864 v0 v2
du4864 :: Integer -> MAlonzo.Code.Data.Nat.Base.T176 -> AgdaAny
du4864 v0 v1
  = coe
      seq (coe v1)
      (coe
         du1414 (coe du2078 (coe addInt (coe (1 :: Integer)) (coe v0))))
name4868 = "Data.Nat.Properties.≤″⇒≤"
d4868 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T176 -> MAlonzo.Code.Data.Nat.Base.T6
d4868 v0 v1 v2 = du4868 v0 v2
du4868 ::
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T176 -> MAlonzo.Code.Data.Nat.Base.T6
du4868 v0 v1
  = case coe v0 of
      0 -> coe seq (coe v1) (coe MAlonzo.Code.Data.Nat.Base.C10)
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           case coe v1 of
             MAlonzo.Code.Data.Nat.Base.C190 v3
               -> coe
                    MAlonzo.Code.Data.Nat.Base.C18
                    (coe du4868 (coe v2) (coe MAlonzo.Code.Data.Nat.Base.C190 v3))
             _ -> MAlonzo.RTE.mazUnreachableError
name4872 = "Data.Nat.Properties.≤⇒≤″"
d4872 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T176
d4872 v0 v1 v2 = du4872 v0 v1
du4872 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T176
du4872 v0 v1
  = coe
      MAlonzo.Code.Data.Nat.Base.C190
      (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v1 v0)
name4874 = "Data.Nat.Properties._<″?_"
d4874 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4874 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
      (\ v2 -> coe du4852 (coe v0) (coe v1))
      (coe
         MAlonzo.Code.Data.Bool.Properties.d2042
         (coe ltInt (coe v0) (coe v1)))
name4880 = "Data.Nat.Properties._≤″?_"
d4880 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4880 v0 v1
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Relation.Nullary.C46
             (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
             (coe
                MAlonzo.Code.Relation.Nullary.C22
                (coe MAlonzo.Code.Data.Nat.Base.C190 v1))
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe d4874 (coe v2) (coe v1)
name4888 = "Data.Nat.Properties._≥″?_"
d4888 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4888 v0 v1 = coe d4880 (coe v1) (coe v0)
name4890 = "Data.Nat.Properties._>″?_"
d4890 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4890 v0 v1 = coe d4874 (coe v1) (coe v0)
name4892 = "Data.Nat.Properties.≤″-irrelevant"
d4892 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T176 ->
  MAlonzo.Code.Data.Nat.Base.T176 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4892 = erased
name4910 = "Data.Nat.Properties.<″-irrelevant"
d4910 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T176 ->
  MAlonzo.Code.Data.Nat.Base.T176 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4910 = erased
name4912 = "Data.Nat.Properties.>″-irrelevant"
d4912 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T176 ->
  MAlonzo.Code.Data.Nat.Base.T176 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4912 = erased
name4914 = "Data.Nat.Properties.≥″-irrelevant"
d4914 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T176 ->
  MAlonzo.Code.Data.Nat.Base.T176 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4914 = erased
name4920 = "Data.Nat.Properties.≤‴⇒≤″"
d4920 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T210 -> MAlonzo.Code.Data.Nat.Base.T176
d4920 v0 v1 v2
  = case coe v2 of
      MAlonzo.Code.Data.Nat.Base.C214
        -> coe MAlonzo.Code.Data.Nat.Base.C190 (0 :: Integer)
      MAlonzo.Code.Data.Nat.Base.C220 v5
        -> coe
             MAlonzo.Code.Data.Nat.Base.C190
             (addInt
                (coe (1 :: Integer))
                (coe
                   MAlonzo.Code.Data.Nat.Base.d186
                   (coe d4932 (coe v0) (coe v1) (coe v5))))
      _ -> MAlonzo.RTE.mazUnreachableError
name4932 = "Data.Nat.Properties._.ind"
d4932 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T210 -> MAlonzo.Code.Data.Nat.Base.T176
d4932 v0 v1 v2
  = coe
      d4920 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1) (coe v2)
name4940 = "Data.Nat.Properties.m≤‴m+k"
d4940 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T210
d4940 v0 v1 v2 v3 = du4940 v2
du4940 :: Integer -> MAlonzo.Code.Data.Nat.Base.T210
du4940 v0
  = case coe v0 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C214
      _ -> let v1 = subInt (coe v0) (coe (1 :: Integer)) in
           coe MAlonzo.Code.Data.Nat.Base.C220 (coe du4940 (coe v1))
name4956 = "Data.Nat.Properties.≤″⇒≤‴"
d4956 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T176 -> MAlonzo.Code.Data.Nat.Base.T210
d4956 v0 v1 v2 = du4956 v2
du4956 ::
  MAlonzo.Code.Data.Nat.Base.T176 -> MAlonzo.Code.Data.Nat.Base.T210
du4956 v0
  = case coe v0 of
      MAlonzo.Code.Data.Nat.Base.C190 v1 -> coe du4940 (coe v1)
      _ -> MAlonzo.RTE.mazUnreachableError
name4964 = "Data.Nat.Properties.0≤‴n"
d4964 :: Integer -> MAlonzo.Code.Data.Nat.Base.T210
d4964 v0 = coe du4940 (coe v0)
name4972 = "Data.Nat.Properties.<ᵇ⇒<‴"
d4972 ::
  Integer -> Integer -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T210
d4972 v0 v1 v2 = du4972 v0 v1
du4972 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T210
du4972 v0 v1 = coe du4956 (coe du4852 (coe v0) (coe v1))
name4984 = "Data.Nat.Properties.<‴⇒<ᵇ"
d4984 ::
  Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T210 -> AgdaAny
d4984 v0 v1 v2
  = coe
      du4864 (coe v0)
      (coe
         d4920 (coe addInt (coe (1 :: Integer)) (coe v0)) (coe v1) (coe v2))
name4988 = "Data.Nat.Properties._<‴?_"
d4988 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4988 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
      (\ v2 -> coe du4972 (coe v0) (coe v1))
      (coe
         MAlonzo.Code.Data.Bool.Properties.d2042
         (coe ltInt (coe v0) (coe v1)))
name4994 = "Data.Nat.Properties._≤‴?_"
d4994 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d4994 v0 v1
  = case coe v0 of
      0 -> coe
             MAlonzo.Code.Relation.Nullary.C46
             (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
             (coe MAlonzo.Code.Relation.Nullary.C22 (coe d4964 (coe v1)))
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe d4988 (coe v2) (coe v1)
name5002 = "Data.Nat.Properties._≥‴?_"
d5002 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d5002 v0 v1 = coe d4994 (coe v1) (coe v0)
name5004 = "Data.Nat.Properties._>‴?_"
d5004 :: Integer -> Integer -> MAlonzo.Code.Relation.Nullary.T32
d5004 v0 v1 = coe d4988 (coe v1) (coe v0)
name5006 = "Data.Nat.Properties.≤⇒≤‴"
d5006 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T210
d5006 v0 v1 v2 = du5006 v0 v1
du5006 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T210
du5006 v0 v1 = coe du4956 (coe du4872 (coe v0) (coe v1))
name5008 = "Data.Nat.Properties.≤‴⇒≤"
d5008 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T210 -> MAlonzo.Code.Data.Nat.Base.T6
d5008 v0 v1 v2
  = coe du4868 (coe v0) (coe d4920 (coe v0) (coe v1) (coe v2))
name5014 = "Data.Nat.Properties.eq?"
d5014 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Function.Injection.T88 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32
d5014 v0 v1 v2 = du5014 v2
du5014 ::
  MAlonzo.Code.Function.Injection.T88 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32
du5014 v0
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.du68 (coe v0) (coe d1360)
name5018 = "Data.Nat.Properties._*-mono_"
d5018 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d5018 v0 v1 v2 v3 v4 v5 = coe du2518 v1 v3 v4 v5
name5020 = "Data.Nat.Properties._+-mono_"
d5020 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d5020 v0 v1 v2 v3 v4 v5 = coe du2160 v3 v4 v5
name5022 = "Data.Nat.Properties.+-right-identity"
d5022 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5022 = erased
name5024 = "Data.Nat.Properties.*-right-zero"
d5024 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5024 = erased
name5026 = "Data.Nat.Properties.distribʳ-*-+"
d5026 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5026 = erased
name5028 = "Data.Nat.Properties.*-distrib-∸ʳ"
d5028 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5028 = erased
name5030 = "Data.Nat.Properties.cancel-+-left"
d5030 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5030 = erased
name5032 = "Data.Nat.Properties.cancel-+-left-≤"
d5032 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d5032 v0 v1 v2 v3 = coe du2004 v0 v3
name5034 = "Data.Nat.Properties.cancel-*-right"
d5034 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5034 = erased
name5036 = "Data.Nat.Properties.cancel-*-right-≤"
d5036 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d5036 v0 v1 v2 v3 = coe du2486 v0
name5038 = "Data.Nat.Properties.strictTotalOrder"
d5038 :: MAlonzo.Code.Relation.Binary.Bundles.T780
d5038 = coe d1706
name5040 = "Data.Nat.Properties.isCommutativeSemiring"
d5040 :: MAlonzo.Code.Algebra.Structures.T1276
d5040 = coe d2386
name5042 = "Data.Nat.Properties.commutativeSemiring"
d5042 :: MAlonzo.Code.Algebra.Bundles.T1828
d5042 = coe d2404
name5044 = "Data.Nat.Properties.isDistributiveLattice"
d5044 :: MAlonzo.Code.Algebra.Structures.T760
d5044 = coe d3362
name5046 = "Data.Nat.Properties.distributiveLattice"
d5046 :: MAlonzo.Code.Algebra.Bundles.T1062
d5046 = coe d3376
name5048 = "Data.Nat.Properties.⊔-⊓-0-isSemiringWithoutOne"
d5048 :: MAlonzo.Code.Algebra.Structures.T898
d5048 = coe d3356
name5050
  = "Data.Nat.Properties.⊔-⊓-0-isCommutativeSemiringWithoutOne"
d5050 :: MAlonzo.Code.Algebra.Structures.T988
d5050 = coe d3358
name5052
  = "Data.Nat.Properties.⊔-⊓-0-commutativeSemiringWithoutOne"
d5052 :: MAlonzo.Code.Algebra.Bundles.T1376
d5052 = coe d3372
name5054 = "Data.Nat.Properties.¬i+1+j≤i"
d5054 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d5054 = erased
name5056 = "Data.Nat.Properties.≤-steps"
d5056 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d5056 v0 v1 v2 v3 = du5056 v3
du5056 ::
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du5056 v0 = coe v0
name5064 = "Data.Nat.Properties.i∸k∸j+j∸k≡i+j∸k"
d5064 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5064 = erased
name5100 = "Data.Nat.Properties.im≡jm+n⇒[i∸j]m≡n"
d5100 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5100 = erased
name5116 = "Data.Nat.Properties.≤+≢⇒<"
d5116 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  (MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d5116 v0 v1 v2 v3 = coe du1582 v1 v2
name5118 = "Data.Nat.Properties.≤-irrelevance"
d5118 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5118 = erased
name5120 = "Data.Nat.Properties.<-irrelevance"
d5120 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5120 = erased
name5122 = "Data.Nat.Properties.i+1+j≢i"
d5122 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5122 = erased
name5124 = "Data.Nat.Properties.i+j≡0⇒i≡0"
d5124 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5124 = erased
name5126 = "Data.Nat.Properties.i+j≡0⇒j≡0"
d5126 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5126 = erased
name5128 = "Data.Nat.Properties.i+1+j≰i"
d5128 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Empty.T4
d5128 = erased
name5130 = "Data.Nat.Properties.i*j≡0⇒i≡0∨j≡0"
d5130 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Sum.Base.T30
d5130 v0 v1 v2 = coe du2444 v0
name5132 = "Data.Nat.Properties.i*j≡1⇒i≡1"
d5132 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5132 = erased
name5134 = "Data.Nat.Properties.i*j≡1⇒j≡1"
d5134 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5134 = erased
name5136 = "Data.Nat.Properties.i^j≡0⇒i≡0"
d5136 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5136 = erased
name5138 = "Data.Nat.Properties.i^j≡1⇒j≡0∨i≡1"
d5138 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Sum.Base.T30
d5138 v0 v1 v2 = coe du2718 v1
name5140 = "Data.Nat.Properties.[i+j]∸[i+k]≡j∸k"
d5140 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5140 = erased
name5142 = "Data.Nat.Properties.m≢0⇒suc[pred[m]]≡m"
d5142 ::
  Integer ->
  (MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5142 = erased
name5144 = "Data.Nat.Properties.n≡m⇒∣n-m∣≡0"
d5144 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5144 = erased
name5146 = "Data.Nat.Properties.∣n-m∣≡0⇒n≡m"
d5146 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d5146 = erased
name5148 = "Data.Nat.Properties.∣n-m∣≡n∸m⇒m≤n"
d5148 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Nat.Base.T6
d5148 v0 v1 v2 = coe du4416 v0 v1
name5150 = "Data.Nat.Properties.∣n-n+m∣≡m"
d5150 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5150 = erased
name5152 = "Data.Nat.Properties.∣n+m-n+o∣≡∣m-o|"
d5152 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5152 = erased
name5154 = "Data.Nat.Properties.n∸m≤∣n-m∣"
d5154 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d5154 = coe d4470
name5156 = "Data.Nat.Properties.∣n-m∣≤n⊔m"
d5156 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d5156 = coe d4500
name5162 = "Data.Nat.Properties.n≤m+n"
d5162 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d5162 v0 v1 = du5162 v1
du5162 :: Integer -> MAlonzo.Code.Data.Nat.Base.T6
du5162 v0 = coe du2078 (coe v0)
name5174 = "Data.Nat.Properties.n≤m+n∸m"
d5174 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d5174 v0 v1
  = case coe v1 of
      0 -> coe MAlonzo.Code.Data.Nat.Base.C10
      _ -> let v2 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v0 of
             0 -> coe d1422 (coe v1)
             _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
                  coe MAlonzo.Code.Data.Nat.Base.C18 (d5174 (coe v3) (coe v2))
name5188 = "Data.Nat.Properties.∣n-m∣≡[n∸m]∨[m∸n]"
d5188 :: Integer -> Integer -> MAlonzo.Code.Data.Sum.Base.T30
d5188 v0 v1
  = let v2 = d1436 (coe v0) (coe v1) in
    case coe v2 of
      MAlonzo.Code.Data.Sum.Base.C38 v3
        -> coe MAlonzo.Code.Data.Sum.Base.C38 erased
      MAlonzo.Code.Data.Sum.Base.C42 v3
        -> coe
             MAlonzo.Code.Data.Sum.Base.C42
             (coe
                MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du190
                (coe
                   MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                   (coe
                      MAlonzo.Code.Relation.Binary.Structures.d34
                      (MAlonzo.Code.Relation.Binary.Structures.d80 (coe d1472))
                      (coe MAlonzo.Code.Agda.Builtin.Nat.d22 v0 v1))))
      _ -> MAlonzo.RTE.mazUnreachableError
name5210 = "Data.Nat.Properties.+-*-suc"
d5210 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d5210 = erased
name5216 = "Data.Nat.Properties.n∸m≤n"
d5216 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d5216 v0 v1 = coe d3748 (coe v1) (coe v0)
name5228 = "Data.Nat.Properties.∀[m≤n⇒m≢o]⇒o<n"
d5228 ::
  Integer ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T6 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d5228 v0 v1 v2 = coe du1754 v0 v1
name5236 = "Data.Nat.Properties.∀[m<n⇒m≢o]⇒o≤n"
d5236 ::
  Integer ->
  Integer ->
  (Integer ->
   MAlonzo.Code.Data.Nat.Base.T6 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Data.Nat.Base.T6
d5236 v0 v1 v2 = coe du1782 v0 v1
name5238 = "Data.Nat.Properties.*-+-isSemiring"
d5238 :: MAlonzo.Code.Algebra.Structures.T1172
d5238 = coe d2384
name5240 = "Data.Nat.Properties.*-+-isCommutativeSemiring"
d5240 :: MAlonzo.Code.Algebra.Structures.T1276
d5240 = coe d2386
name5242 = "Data.Nat.Properties.*-+-semiring"
d5242 :: MAlonzo.Code.Algebra.Bundles.T1674
d5242 = coe d2402
name5244 = "Data.Nat.Properties.*-+-commutativeSemiring"
d5244 :: MAlonzo.Code.Algebra.Bundles.T1828
d5244 = coe d2404
name34823 = "Data.Nat.Properties..absurdlambda"
d34823 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d34823 = erased
name51819 = "Data.Nat.Properties..absurdlambda"
d51819 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d51819 = erased
