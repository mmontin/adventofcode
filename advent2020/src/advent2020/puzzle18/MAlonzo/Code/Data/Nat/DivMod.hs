{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.Nat.DivMod where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Data.Fin.Base
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.DivMod.Core
import qualified MAlonzo.Code.Data.Nat.Divisibility.Core
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple
import qualified MAlonzo.Code.Relation.Binary.Structures

name12 = "Data.Nat.DivMod._/_"
d12 :: Integer -> Integer -> AgdaAny -> Integer
d12 v0 v1 v2 = du12 v0 v1
du12 :: Integer -> Integer -> Integer
du12 v0 v1 = coe quotInt (coe v0) (coe v1)
name24 = "Data.Nat.DivMod._%_"
d24 :: Integer -> Integer -> AgdaAny -> Integer
d24 v0 v1 v2 = du24 v0 v1
du24 :: Integer -> Integer -> Integer
du24 v0 v1 = coe remInt (coe v0) (coe v1)
name34 = "Data.Nat.DivMod.m≡m%n+[m/n]*n"
d34 :: Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d34 = erased
name44 = "Data.Nat.DivMod.m%n≡m∸m/n*n"
d44 :: Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d44 = erased
name54 = "Data.Nat.DivMod._.n"
d54 :: Integer -> Integer -> Integer
d54 v0 v1 = du54 v1
du54 :: Integer -> Integer
du54 v0 = coe addInt (coe (1 :: Integer)) (coe v0)
name56 = "Data.Nat.DivMod._.m/n*n"
d56 :: Integer -> Integer -> Integer
d56 v0 v1
  = coe
      mulInt (coe du12 (coe v0) (coe du54 (coe v1))) (coe du54 (coe v1))
name62 = "Data.Nat.DivMod.n%1≡0"
d62 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d62 = erased
name66 = "Data.Nat.DivMod.n%n≡0"
d66 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d66 = erased
name74 = "Data.Nat.DivMod.m%n%n≡m%n"
d74 :: Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d74 = erased
name84 = "Data.Nat.DivMod.[m+n]%n≡m%n"
d84 :: Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d84 = erased
name96 = "Data.Nat.DivMod.[m+kn]%n≡m%n"
d96 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d96 = erased
name114 = "Data.Nat.DivMod._.n"
d114 :: Integer -> Integer -> Integer -> Integer
d114 v0 v1 v2 = du114 v2
du114 :: Integer -> Integer
du114 v0 = coe addInt (coe (1 :: Integer)) (coe v0)
name122 = "Data.Nat.DivMod.m*n%n≡0"
d122 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d122 = erased
name128 = "Data.Nat.DivMod.m%n<n"
d128 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d128 v0 v1
  = coe
      MAlonzo.Code.Data.Nat.Base.C18
      (MAlonzo.Code.Data.Nat.DivMod.Core.d70
         (coe (0 :: Integer)) (coe v0) (coe v1))
name138 = "Data.Nat.DivMod.m%n≤m"
d138 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d138 v0 v1
  = coe
      MAlonzo.Code.Data.Nat.DivMod.Core.d96 (coe (0 :: Integer)) (coe v0)
      (coe v1)
name148 = "Data.Nat.DivMod.m≤n⇒m%n≡m"
d148 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d148 = erased
name174 = "Data.Nat.DivMod.%-pred-≡0"
d174 ::
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d174 = erased
name190 = "Data.Nat.DivMod.m<[1+n%d]⇒m≤[n%d]"
d190 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d190 v0 v1 v2 v3 = du190 v1 v2
du190 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du190 v0 v1
  = let v2 = subInt (coe v1) (coe (1 :: Integer)) in
    coe
      MAlonzo.Code.Data.Nat.DivMod.Core.du216 (coe (0 :: Integer))
      (coe v0) (coe v2)
name206 = "Data.Nat.DivMod.[1+m%d]≤1+n⇒[m%d]≤n"
d206 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d206 v0 v1 v2 v3 v4 = du206 v0 v2
du206 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du206 v0 v1
  = let v2 = subInt (coe v1) (coe (1 :: Integer)) in
    coe
      MAlonzo.Code.Data.Nat.DivMod.Core.du260 (coe (0 :: Integer))
      (coe v0) (coe v2)
name224 = "Data.Nat.DivMod.%-distribˡ-+"
d224 ::
  Integer ->
  Integer ->
  Integer -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d224 = erased
name254 = "Data.Nat.DivMod.%-distribˡ-*"
d254 ::
  Integer ->
  Integer ->
  Integer -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d254 = erased
name268 = "Data.Nat.DivMod._.m′"
d268 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
d268 v0 v1 v2 v3 = du268 v0 v2
du268 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
du268 v0 v1 v2
  = coe du24 (coe v0) (coe addInt (coe (1 :: Integer)) (coe v1))
name270 = "Data.Nat.DivMod._.n′"
d270 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
d270 v0 v1 v2 v3 = du270 v1 v2
du270 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
du270 v0 v1 v2
  = coe du24 (coe v0) (coe addInt (coe (1 :: Integer)) (coe v1))
name272 = "Data.Nat.DivMod._.k"
d272 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
d272 v0 v1 v2 v3 = du272 v0 v2
du272 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
du272 v0 v1 v2
  = coe du12 (coe v0) (coe addInt (coe (1 :: Integer)) (coe v1))
name274 = "Data.Nat.DivMod._.j"
d274 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 ->
  MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
d274 v0 v1 v2 v3 = du274 v1 v2
du274 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
du274 v0 v1 v2
  = coe du12 (coe v0) (coe addInt (coe (1 :: Integer)) (coe v1))
name302 = "Data.Nat.DivMod.%-remove-+ˡ"
d302 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Divisibility.Core.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d302 = erased
name324 = "Data.Nat.DivMod.%-remove-+ʳ"
d324 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Divisibility.Core.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d324 = erased
name344 = "Data.Nat.DivMod./-congˡ"
d344 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d344 = erased
name356 = "Data.Nat.DivMod./-congʳ"
d356 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d356 = erased
name362 = "Data.Nat.DivMod.0/n≡0"
d362 ::
  Integer -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d362 = erased
name368 = "Data.Nat.DivMod.n/1≡n"
d368 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d368 = erased
name376 = "Data.Nat.DivMod.n/n≡1"
d376 ::
  Integer -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d376 = erased
name386 = "Data.Nat.DivMod.m*n/n≡m"
d386 ::
  Integer ->
  Integer -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d386 = erased
name398 = "Data.Nat.DivMod.m/n*n≡m"
d398 ::
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Divisibility.Core.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d398 = erased
name414 = "Data.Nat.DivMod.m*[n/m]≡n"
d414 ::
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Divisibility.Core.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d414 = erased
name426 = "Data.Nat.DivMod.m/n*n≤m"
d426 ::
  Integer -> Integer -> AgdaAny -> MAlonzo.Code.Data.Nat.Base.T6
d426 v0 v1 v2 = du426 v0 v1
du426 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du426 v0 v1
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
      (coe MAlonzo.Code.Data.Nat.Properties.d1472)
      (\ v2 v3 v4 -> coe MAlonzo.Code.Data.Nat.Properties.du1520 v3 v4)
      (coe mulInt (coe du12 (coe v0) (coe v1)) (coe v1)) (coe v0)
      (coe
         MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
         (coe MAlonzo.Code.Data.Nat.Properties.d1472)
         (\ v2 v3 v4 v5 v6 ->
            coe MAlonzo.Code.Data.Nat.Properties.du1640 v5 v6)
         (coe mulInt (coe du12 (coe v0) (coe v1)) (coe v1))
         (coe
            addInt (coe du24 (coe v0) (coe v1))
            (coe mulInt (coe du12 (coe v0) (coe v1)) (coe v1)))
         (coe v0)
         (coe
            MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d34
               (MAlonzo.Code.Relation.Binary.Structures.d80
                  (coe MAlonzo.Code.Data.Nat.Properties.d1472))
               v0))
         (coe
            MAlonzo.Code.Data.Nat.Properties.du2078
            (coe mulInt (coe du12 (coe v0) (coe v1)) (coe v1))))
name440 = "Data.Nat.DivMod.m/n<m"
d440 ::
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d440 v0 v1 v2 v3 v4 = du440 v0 v1
du440 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
du440 v0 v1
  = coe
      MAlonzo.Code.Data.Nat.Properties.du2602 (coe v1)
      (coe du12 (coe v0) (coe v1)) (coe v0)
name464 = "Data.Nat.DivMod./-mono-≤"
d464 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d464 v0 v1 v2 v3 v4 v5 v6 v7 = du464 v0 v1 v2 v3 v6 v7
du464 ::
  Integer ->
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du464 v0 v1 v2 v3 v4 v5
  = case coe v5 of
      MAlonzo.Code.Data.Nat.Base.C18 v8
        -> let v9 = subInt (coe v2) (coe (1 :: Integer)) in
           let v10 = subInt (coe v3) (coe (1 :: Integer)) in
           coe
             MAlonzo.Code.Data.Nat.DivMod.Core.d886 (coe (0 :: Integer))
             (coe (0 :: Integer)) (coe v0) (coe v1) (coe v9) (coe v10) (coe v4)
             (coe v8)
      _ -> MAlonzo.RTE.mazUnreachableError
name478 = "Data.Nat.DivMod./-monoˡ-≤"
d478 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d478 v0 v1 v2 v3 v4 = du478 v0 v1 v2 v4
du478 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du478 v0 v1 v2 v3
  = coe
      du464 (coe v0) (coe v1) (coe v2) (coe v2) (coe v3)
      (coe MAlonzo.Code.Data.Nat.Properties.d1422 (coe v2))
name494 = "Data.Nat.DivMod./-monoʳ-≤"
d494 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d494 v0 v1 v2 v3 v4 v5 = du494 v0 v1 v2 v5
du494 ::
  Integer ->
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du494 v0 v1 v2 v3
  = coe
      du464 (coe v0) (coe v0) (coe v1) (coe v2)
      (coe MAlonzo.Code.Data.Nat.Properties.d1422 (coe v0)) (coe v3)
name508 = "Data.Nat.DivMod.m≥n⇒m/n>0"
d508 ::
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
d508 v0 v1 v2 v3 = du508 v0 v1 v3
du508 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Data.Nat.Base.T6 -> MAlonzo.Code.Data.Nat.Base.T6
du508 v0 v1 v2
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
      (coe MAlonzo.Code.Data.Nat.Properties.d1472)
      (\ v3 v4 v5 -> coe MAlonzo.Code.Data.Nat.Properties.du1520 v4 v5)
      (coe (1 :: Integer)) (coe du12 (coe v0) (coe v1))
      (coe
         MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
         (coe MAlonzo.Code.Data.Nat.Properties.d1472)
         (\ v3 v4 v5 v6 v7 ->
            coe MAlonzo.Code.Data.Nat.Properties.du1640 v6 v7)
         (coe du12 (coe v0) (coe v0)) (coe du12 (coe v0) (coe v1))
         (coe du12 (coe v0) (coe v1))
         (coe
            MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
            (coe
               MAlonzo.Code.Relation.Binary.Structures.d34
               (MAlonzo.Code.Relation.Binary.Structures.d80
                  (coe MAlonzo.Code.Data.Nat.Properties.d1472))
               (coe du12 (coe v0) (coe v1))))
         (coe du494 (coe v0) (coe v0) (coe v1) (coe v2)))
name528 = "Data.Nat.DivMod.+-distrib-/"
d528 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d528 = erased
name546 = "Data.Nat.DivMod.+-distrib-/-∣ˡ"
d546 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Divisibility.Core.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d546 = erased
name568 = "Data.Nat.DivMod.+-distrib-/-∣ʳ"
d568 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Divisibility.Core.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d568 = erased
name590 = "Data.Nat.DivMod.*-/-assoc"
d590 ::
  Integer ->
  Integer ->
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Data.Nat.Divisibility.Core.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d590 = erased
name610 = "Data.Nat.DivMod.DivMod"
d610 a0 a1 = ()
data T610 = C628 Integer MAlonzo.Code.Data.Fin.Base.T6
name622 = "Data.Nat.DivMod.DivMod.quotient"
d622 :: T610 -> Integer
d622 v0
  = case coe v0 of
      C628 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name624 = "Data.Nat.DivMod.DivMod.remainder"
d624 :: T610 -> MAlonzo.Code.Data.Fin.Base.T6
d624 v0
  = case coe v0 of
      C628 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name626 = "Data.Nat.DivMod.DivMod.property"
d626 :: T610 -> MAlonzo.Code.Agda.Builtin.Equality.T12
d626 = erased
name636 = "Data.Nat.DivMod._div_"
d636 :: Integer -> Integer -> AgdaAny -> Integer
d636 v0 v1 v2 = coe du12 v0 v1
name644 = "Data.Nat.DivMod._mod_"
d644 ::
  Integer -> Integer -> AgdaAny -> MAlonzo.Code.Data.Fin.Base.T6
d644 v0 v1 v2 = du644 v0 v1
du644 :: Integer -> Integer -> MAlonzo.Code.Data.Fin.Base.T6
du644 v0 v1
  = coe
      MAlonzo.Code.Data.Fin.Base.du66 (coe remInt (coe v0) (coe v1))
name656 = "Data.Nat.DivMod._divMod_"
d656 :: Integer -> Integer -> AgdaAny -> T610
d656 v0 v1 v2 = du656 v0 v1
du656 :: Integer -> Integer -> T610
du656 v0 v1
  = coe
      C628 (coe du12 (coe v0) (coe v1)) (coe du644 (coe v0) (coe v1))
name668 = "Data.Nat.DivMod._.[m/n]*n"
d668 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Unit.T6 -> Integer
d668 v0 v1 v2 = du668 v0 v1
du668 :: Integer -> Integer -> Integer
du668 v0 v1
  = coe
      mulInt
      (coe du12 (coe v0) (coe addInt (coe (1 :: Integer)) (coe v1)))
      (coe addInt (coe (1 :: Integer)) (coe v1))
name672 = "Data.Nat.DivMod.a≡a%n+[a/n]*n"
d672 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d672 = erased
name674 = "Data.Nat.DivMod.a%1≡0"
d674 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d674 = erased
name676 = "Data.Nat.DivMod.a%n%n≡a%n"
d676 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d676 = erased
name678 = "Data.Nat.DivMod.[a+n]%n≡a%n"
d678 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d678 = erased
name680 = "Data.Nat.DivMod.[a+kn]%n≡a%n"
d680 ::
  Integer ->
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d680 = erased
name682 = "Data.Nat.DivMod.kn%n≡0"
d682 ::
  Integer -> Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d682 = erased
name684 = "Data.Nat.DivMod.a%n<n"
d684 :: Integer -> Integer -> MAlonzo.Code.Data.Nat.Base.T6
d684 = coe d128
