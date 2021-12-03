{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Reasoning where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial
import qualified MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing

name154
  = "Tactic.RingSolver.Core.Polynomial.Reasoning._._IsRelatedTo_"
d154 a0 a1 a2 a3 a4 = ()
name156 = "Tactic.RingSolver.Core.Polynomial.Reasoning._._∎"
d156 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
d156 v0 v1 v2 = du156 v2
du156 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
du156 v0
  = let v1
          = let v1
                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                      (coe v0) in
            let v2
                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                      (coe v1) in
            let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
            let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
            let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
            let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
            let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
            coe
              MAlonzo.Code.Algebra.Structures.du104
              (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7)) in
    let v2
          = MAlonzo.Code.Relation.Binary.Structures.d34
              (coe MAlonzo.Code.Relation.Binary.Bundles.d60 (coe v1)) in
    coe
      (\ v3 ->
         coe
           MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.C32
           (coe v2 v3))
name158 = "Tactic.RingSolver.Core.Polynomial.Reasoning._._∎⟨_⟩"
d158 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
d158 v0 v1 v2 v3 v4 = du158 v4
du158 ::
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
du158 v0
  = coe
      MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.C32 (coe v0)
name160 = "Tactic.RingSolver.Core.Polynomial.Reasoning._._≡⟨⟩_"
d160 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
d160 v0 = coe v0
name162 = "Tactic.RingSolver.Core.Polynomial.Reasoning._.begin_"
d162 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 -> AgdaAny
d162 = coe MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.d38
name166 = "Tactic.RingSolver.Core.Polynomial.Reasoning._.step-≈"
d166 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
d166 v0 v1 v2 = du166 v2
du166 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
du166 v0
  = let v1
          = let v1
                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                      (coe v0) in
            let v2
                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                      (coe v1) in
            let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
            let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
            let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
            let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
            let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
            coe
              MAlonzo.Code.Algebra.Structures.du104
              (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7)) in
    coe
      MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du50
      (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v1))
name168 = "Tactic.RingSolver.Core.Polynomial.Reasoning._.step-≈˘"
d168 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
d168 v0 v1 v2 = du168 v2
du168 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  AgdaAny -> MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
du168 v0
  = let v1
          = let v1
                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                      (coe v0) in
            let v2
                  = MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                      (coe v1) in
            let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
            let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
            let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
            let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
            let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
            coe
              MAlonzo.Code.Algebra.Structures.du104
              (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7)) in
    coe
      MAlonzo.Code.Relation.Binary.Reasoning.PartialSetoid.du58
      (coe MAlonzo.Code.Relation.Binary.Bundles.du74 (coe v1))
name170 = "Tactic.RingSolver.Core.Polynomial.Reasoning._.step-≡"
d170 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
d170 v0 v1 v2 v3 v4 v5 v6 v7 = du170 v6
du170 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
du170 v0 = coe v0
name172 = "Tactic.RingSolver.Core.Polynomial.Reasoning._.step-≡˘"
d172 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
d172 v0 v1 v2 v3 v4 v5 v6 v7 = du172 v6
du172 ::
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24 ->
  MAlonzo.Code.Relation.Binary.Reasoning.Base.Partial.T24
du172 v0 = coe v0
name184 = "Tactic.RingSolver.Core.Polynomial.Reasoning.≪+_"
d184 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d184 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d372
               (coe
                  MAlonzo.Code.Algebra.Structures.d1094
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1186
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1290
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                              (coe v0)))))))))
      v1 v2 v3 v3 v4
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d34
         (MAlonzo.Code.Algebra.Structures.d88
            (coe
               MAlonzo.Code.Algebra.Structures.d124
               (coe
                  MAlonzo.Code.Algebra.Structures.d324
                  (coe
                     MAlonzo.Code.Algebra.Structures.d372
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1094
                        (coe
                           MAlonzo.Code.Algebra.Structures.d1186
                           (coe
                              MAlonzo.Code.Algebra.Structures.d1290
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                    (coe v0))))))))))
         v3)
name194 = "Tactic.RingSolver.Core.Polynomial.Reasoning.+≫_"
d194 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d194 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d372
               (coe
                  MAlonzo.Code.Algebra.Structures.d1094
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1186
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1290
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                              (coe v0)))))))))
      v1 v1 v2 v3
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d34
         (MAlonzo.Code.Algebra.Structures.d88
            (coe
               MAlonzo.Code.Algebra.Structures.d124
               (coe
                  MAlonzo.Code.Algebra.Structures.d324
                  (coe
                     MAlonzo.Code.Algebra.Structures.d372
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1094
                        (coe
                           MAlonzo.Code.Algebra.Structures.d1186
                           (coe
                              MAlonzo.Code.Algebra.Structures.d1290
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                    (coe v0))))))))))
         v1)
name202 = "Tactic.RingSolver.Core.Polynomial.Reasoning.≪*_"
d202 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d202 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                           (coe v0))))))))
      v1 v2 v3 v3 v4
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d34
         (MAlonzo.Code.Algebra.Structures.d88
            (coe
               MAlonzo.Code.Algebra.Structures.d124
               (coe
                  MAlonzo.Code.Algebra.Structures.d324
                  (coe
                     MAlonzo.Code.Algebra.Structures.d372
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1094
                        (coe
                           MAlonzo.Code.Algebra.Structures.d1186
                           (coe
                              MAlonzo.Code.Algebra.Structures.d1290
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                    (coe v0))))))))))
         v3)
name212 = "Tactic.RingSolver.Core.Polynomial.Reasoning.*≫_"
d212 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d212 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe
                        MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                        (coe
                           MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                           (coe v0))))))))
      v1 v1 v2 v3
      (coe
         MAlonzo.Code.Relation.Binary.Structures.d34
         (MAlonzo.Code.Algebra.Structures.d88
            (coe
               MAlonzo.Code.Algebra.Structures.d124
               (coe
                  MAlonzo.Code.Algebra.Structures.d324
                  (coe
                     MAlonzo.Code.Algebra.Structures.d372
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1094
                        (coe
                           MAlonzo.Code.Algebra.Structures.d1186
                           (coe
                              MAlonzo.Code.Algebra.Structures.d1290
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                                 (coe
                                    MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                    (coe v0))))))))))
         v1)
name220 = "Tactic.RingSolver.Core.Polynomial.Reasoning._⊙_"
d220 ::
  MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d220 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (MAlonzo.Code.Algebra.Structures.d88
         (coe
            MAlonzo.Code.Algebra.Structures.d124
            (coe
               MAlonzo.Code.Algebra.Structures.d324
               (coe
                  MAlonzo.Code.Algebra.Structures.d372
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1094
                     (coe
                        MAlonzo.Code.Algebra.Structures.d1186
                        (coe
                           MAlonzo.Code.Algebra.Structures.d1290
                           (coe
                              MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d62
                              (coe
                                 MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing.d216
                                 (coe v0))))))))))
      v1 v2 v3
