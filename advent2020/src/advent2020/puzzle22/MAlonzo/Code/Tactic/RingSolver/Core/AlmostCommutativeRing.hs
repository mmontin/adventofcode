{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.AlmostCommutativeRing where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Operations.Ring
import qualified MAlonzo.Code.Algebra.Properties.AbelianGroup
import qualified MAlonzo.Code.Algebra.Properties.Ring
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Data.Maybe.Base
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Structures

name26
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing"
d26 a0 a1 a2 a3 a4 a5 a6 a7 a8 = ()
data T26
  = C673 MAlonzo.Code.Algebra.Structures.T1276
         (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny)
         (AgdaAny -> AgdaAny -> AgdaAny) (AgdaAny -> AgdaAny -> AgdaAny)
name62
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing.isCommutativeSemiring"
d62 :: T26 -> MAlonzo.Code.Algebra.Structures.T1276
d62 v0
  = case coe v0 of
      C673 v1 v2 v3 v4 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name64
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing.-‿cong"
d64 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d64 v0
  = case coe v0 of
      C673 v1 v2 v3 v4 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name70
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing.-‿*-distribˡ"
d70 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny
d70 v0
  = case coe v0 of
      C673 v1 v2 v3 v4 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name76
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing.-‿+-comm"
d76 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny
d76 v0
  = case coe v0 of
      C673 v1 v2 v3 v4 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name80
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.assoc"
d80 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d80 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))))
name82
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.*-comm"
d82 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny
d82 v0
  = coe MAlonzo.Code.Algebra.Structures.d1292 (coe d62 (coe v0))
name84
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.∙-cong"
d84 ::
  T26 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d84 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))))
name86
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.∙-congʳ"
d86 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d86 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du86 v9
du86 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du86 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1096 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d324 (coe v4) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v5))
name88
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.∙-congˡ"
d88 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d88 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du88 v9
du88 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du88 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1096 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d324 (coe v4) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v5))
name90
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.identity"
d90 :: T26 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d90 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))
name92
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.identityʳ"
d92 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> AgdaAny -> AgdaAny
d92 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du92 v9
du92 :: T26 -> AgdaAny -> AgdaAny
du92 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1096 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v4))
name94
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.identityˡ"
d94 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> AgdaAny -> AgdaAny
d94 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du94 v9
du94 :: T26 -> AgdaAny -> AgdaAny
du94 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1096 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v4))
name96
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.*-isCommutativeMonoid"
d96 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> MAlonzo.Code.Algebra.Structures.T362
d96 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du96 v9
du96 :: T26 -> MAlonzo.Code.Algebra.Structures.T362
du96 v0
  = coe MAlonzo.Code.Algebra.Structures.du1378 (coe d62 (coe v0))
name98
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.*-isCommutativeSemigroup"
d98 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> MAlonzo.Code.Algebra.Structures.T192
d98 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du98 v9
du98 :: T26 -> MAlonzo.Code.Algebra.Structures.T192
du98 v0
  = coe MAlonzo.Code.Algebra.Structures.du1376 (coe d62 (coe v0))
name100
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isMagma"
d100 :: T26 -> MAlonzo.Code.Algebra.Structures.T80
d100 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))))
name102
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.*-isMonoid"
d102 :: T26 -> MAlonzo.Code.Algebra.Structures.T314
d102 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1096
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))
name104
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isSemigroup"
d104 :: T26 -> MAlonzo.Code.Algebra.Structures.T116
d104 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))
name106
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.assoc"
d106 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d106 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d372
            (coe
               MAlonzo.Code.Algebra.Structures.d1094
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))))
name108
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.comm"
d108 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny
d108 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d374
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))
name110
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.∙-cong"
d110 ::
  T26 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d110 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
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
                     (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))))))
name112
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.∙-congʳ"
d112 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d112 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du112 v9
du112 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du112 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1094 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d372 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name114
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.∙-congˡ"
d114 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d114 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du114 v9
du114 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du114 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1094 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d372 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name116
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.identity"
d116 :: T26 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d116 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))))
name118
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.identityʳ"
d118 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> AgdaAny -> AgdaAny
d118 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du118 v9
du118 :: T26 -> AgdaAny -> AgdaAny
du118 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1094 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d372 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name120
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.identityˡ"
d120 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> AgdaAny -> AgdaAny
d120 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du120 v9
du120 :: T26 -> AgdaAny -> AgdaAny
du120 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1094 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d372 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name122
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.+-isCommutativeMonoid"
d122 :: T26 -> MAlonzo.Code.Algebra.Structures.T362
d122 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1094
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))
name124
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isCommutativeSemigroup"
d124 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> MAlonzo.Code.Algebra.Structures.T192
d124 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du124 v9
du124 :: T26 -> MAlonzo.Code.Algebra.Structures.T192
du124 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Structures.du410
      (coe MAlonzo.Code.Algebra.Structures.d1094 (coe v3))
name126
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isMagma"
d126 :: T26 -> MAlonzo.Code.Algebra.Structures.T80
d126 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d372
            (coe
               MAlonzo.Code.Algebra.Structures.d1094
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))))
name128
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isMonoid"
d128 :: T26 -> MAlonzo.Code.Algebra.Structures.T314
d128 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d372
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))
name130
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isSemigroup"
d130 :: T26 -> MAlonzo.Code.Algebra.Structures.T116
d130 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))))
name132
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.distrib"
d132 :: T26 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d132 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1098
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))
name134
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.distribʳ"
d134 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny -> T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d134 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du134 v9
du134 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du134 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v3))
name136
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.distribˡ"
d136 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny -> T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d136 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du136 v9
du136 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du136 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v3))
name138
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isCommutativeSemiringWithoutOne"
d138 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> MAlonzo.Code.Algebra.Structures.T988
d138 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du138 v9
du138 :: T26 -> MAlonzo.Code.Algebra.Structures.T988
du138 v0
  = coe MAlonzo.Code.Algebra.Structures.du1374 (coe d62 (coe v0))
name140
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isEquivalence"
d140 :: T26 -> MAlonzo.Code.Relation.Binary.Structures.T26
d140 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d88
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
                     (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))))))))
name142
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isNearSemiring"
d142 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> MAlonzo.Code.Algebra.Structures.T822
d142 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du142 v9
du142 :: T26 -> MAlonzo.Code.Algebra.Structures.T822
du142 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du934
      (coe MAlonzo.Code.Algebra.Structures.du1258 (coe v2))
name144
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isPartialEquivalence"
d144 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny -> T26 -> MAlonzo.Code.Relation.Binary.Structures.T16
d144 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du144 v9
du144 :: T26 -> MAlonzo.Code.Relation.Binary.Structures.T16
du144 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1094 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d372 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d124 (coe v6) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Algebra.Structures.d88 (coe v7))
name146
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isSemiring"
d146 :: T26 -> MAlonzo.Code.Algebra.Structures.T1172
d146 v0
  = coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0))
name148
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isSemiringWithoutAnnihilatingZero"
d148 :: T26 -> MAlonzo.Code.Algebra.Structures.T1078
d148 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1186
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))
name150
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.isSemiringWithoutOne"
d150 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> MAlonzo.Code.Algebra.Structures.T898
d150 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du150 v9
du150 :: T26 -> MAlonzo.Code.Algebra.Structures.T898
du150 v0
  = let v1 = d62 (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.du1258
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe v1))
name152
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.refl"
d152 :: T26 -> AgdaAny -> AgdaAny
d152 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d34
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))))))
name154
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.reflexive"
d154 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  T26 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d154 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du154 v9
du154 ::
  T26 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du154 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1094 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d372 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d124 (coe v6) in
    \ v8 v9 v10 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Algebra.Structures.d88 (coe v7)) v8
name156
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.setoid"
d156 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny -> T26 -> MAlonzo.Code.Relation.Binary.Bundles.T44
d156 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du156 v9
du156 :: T26 -> MAlonzo.Code.Relation.Binary.Bundles.T44
du156 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1186 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1094 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d372 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du104
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name158
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.sym"
d158 :: T26 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d158 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))))))
name160
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.trans"
d160 ::
  T26 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d160 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))))))))
name162
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.zero"
d162 :: T26 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d162 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1188
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe v0)))
name164
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.zeroʳ"
d164 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> AgdaAny -> AgdaAny
d164 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du164 v9
du164 :: T26 -> AgdaAny -> AgdaAny
du164 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v2) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v3))
name166
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.IsAlmostCommutativeRing._.zeroˡ"
d166 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T26 -> AgdaAny -> AgdaAny
d166 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du166 v9
du166 :: T26 -> AgdaAny -> AgdaAny
du166 v0
  = let v1 = d62 (coe v0) in
    let v2 = MAlonzo.Code.Algebra.Structures.d1290 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v2) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v3))
name172
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing"
d172 a0 a1 = ()
data T172
  = C3313 (AgdaAny -> AgdaAny -> AgdaAny)
          (AgdaAny -> AgdaAny -> AgdaAny) (AgdaAny -> AgdaAny) AgdaAny
          (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) AgdaAny T26
name198
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.Carrier"
d198 :: T172 -> ()
d198 = erased
name200
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._≈_"
d200 :: T172 -> AgdaAny -> AgdaAny -> ()
d200 = erased
name202
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._+_"
d202 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d202 v0
  = case coe v0 of
      C3313 v3 v4 v5 v6 v7 v8 v9 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name204
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._*_"
d204 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d204 v0
  = case coe v0 of
      C3313 v3 v4 v5 v6 v7 v8 v9 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name206
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.-_"
d206 :: T172 -> AgdaAny -> AgdaAny
d206 v0
  = case coe v0 of
      C3313 v3 v4 v5 v6 v7 v8 v9 -> coe v5
      _ -> MAlonzo.RTE.mazUnreachableError
name208
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.0#"
d208 :: T172 -> AgdaAny
d208 v0
  = case coe v0 of
      C3313 v3 v4 v5 v6 v7 v8 v9 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name212
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.0≟_"
d212 :: T172 -> AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22
d212 v0
  = case coe v0 of
      C3313 v3 v4 v5 v6 v7 v8 v9 -> coe v7
      _ -> MAlonzo.RTE.mazUnreachableError
name214
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.1#"
d214 :: T172 -> AgdaAny
d214 v0
  = case coe v0 of
      C3313 v3 v4 v5 v6 v7 v8 v9 -> coe v8
      _ -> MAlonzo.RTE.mazUnreachableError
name216
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.isAlmostCommutativeRing"
d216 :: T172 -> T26
d216 v0
  = case coe v0 of
      C3313 v3 v4 v5 v6 v7 v8 v9 -> coe v9
      _ -> MAlonzo.RTE.mazUnreachableError
name220
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.assoc"
d220 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d220 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name222
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.*-comm"
d222 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d222 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1292 (coe d62 (coe d216 (coe v0)))
name224
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.∙-cong"
d224 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d224 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe d62 (coe d216 (coe v0))))))))
name226
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.∙-congʳ"
d226 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d226 v0 v1 v2 = du226 v2
du226 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du226 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name228
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.∙-congˡ"
d228 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d228 v0 v1 v2 = du228 v2
du228 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du228 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name230
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.identity"
d230 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d230 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name232
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.identityʳ"
d232 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d232 v0 v1 v2 = du232 v2
du232 :: T172 -> AgdaAny -> AgdaAny
du232 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name234
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.identityˡ"
d234 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d234 v0 v1 v2 = du234 v2
du234 :: T172 -> AgdaAny -> AgdaAny
du234 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name236
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.*-isCommutativeMonoid"
d236 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T362
d236 v0 v1 v2 = du236 v2
du236 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
du236 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1378 (coe d62 (coe v1))
name238
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.*-isCommutativeSemigroup"
d238 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T192
d238 v0 v1 v2 = du238 v2
du238 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du238 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1376 (coe d62 (coe v1))
name240
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isMagma"
d240 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
d240 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name242
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.*-isMonoid"
d242 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
d242 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1096
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name244
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isSemigroup"
d244 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
d244 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name246
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.assoc"
d246 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d246 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
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
                     (coe d62 (coe d216 (coe v0))))))))
name248
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.comm"
d248 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d248 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d374
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name250
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.∙-cong"
d250 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d250 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
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
                        (coe d62 (coe d216 (coe v0)))))))))
name252
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.∙-congʳ"
d252 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d252 v0 v1 v2 = du252 v2
du252 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du252 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name254
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.∙-congˡ"
d254 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d254 v0 v1 v2 = du254 v2
du254 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du254 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name256
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.identity"
d256 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d256 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name258
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.identityʳ"
d258 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d258 v0 v1 v2 = du258 v2
du258 :: T172 -> AgdaAny -> AgdaAny
du258 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name260
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.identityˡ"
d260 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d260 v0 v1 v2 = du260 v2
du260 :: T172 -> AgdaAny -> AgdaAny
du260 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name262
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.+-isCommutativeMonoid"
d262 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
d262 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1094
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name264
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isCommutativeSemigroup"
d264 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T192
d264 v0 v1 v2 = du264 v2
du264 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du264 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Structures.du410
      (coe MAlonzo.Code.Algebra.Structures.d1094 (coe v4))
name266
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isMagma"
d266 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
d266 v0
  = coe
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
                     (coe d62 (coe d216 (coe v0))))))))
name268
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isMonoid"
d268 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
d268 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d372
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name270
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isSemigroup"
d270 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
d270 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name272
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.-‿*-distribˡ"
d272 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d272 v0 = coe d70 (coe d216 (coe v0))
name274
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.-‿+-comm"
d274 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d274 v0 = coe d76 (coe d216 (coe v0))
name276
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.-‿cong"
d276 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d276 v0 = coe d64 (coe d216 (coe v0))
name278
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.distrib"
d278 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d278 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1098
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name280
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.distribʳ"
d280 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d280 v0 v1 v2 = du280 v2
du280 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du280 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name282
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.distribˡ"
d282 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d282 v0 v1 v2 = du282 v2
du282 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du282 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name284
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isCommutativeSemiring"
d284 :: T172 -> MAlonzo.Code.Algebra.Structures.T1276
d284 v0 = coe d62 (coe d216 (coe v0))
name286
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isCommutativeSemiringWithoutOne"
d286 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T988
d286 v0 v1 v2 = du286 v2
du286 :: T172 -> MAlonzo.Code.Algebra.Structures.T988
du286 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1374 (coe d62 (coe v1))
name288
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isEquivalence"
d288 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T26
d288 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d88
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
                        (coe d62 (coe d216 (coe v0)))))))))
name290
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isNearSemiring"
d290 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T822
d290 v0 v1 v2 = du290 v2
du290 :: T172 -> MAlonzo.Code.Algebra.Structures.T822
du290 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Structures.du934
      (coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3))
name292
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isPartialEquivalence"
d292 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Relation.Binary.Structures.T16
d292 v0 v1 v2 = du292 v2
du292 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T16
du292 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8))
name294
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isSemiring"
d294 :: T172 -> MAlonzo.Code.Algebra.Structures.T1172
d294 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe d216 (coe v0)))
name296
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isSemiringWithoutAnnihilatingZero"
d296 :: T172 -> MAlonzo.Code.Algebra.Structures.T1078
d296 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1186
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name298
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.isSemiringWithoutOne"
d298 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T898
d298 v0 v1 v2 = du298 v2
du298 :: T172 -> MAlonzo.Code.Algebra.Structures.T898
du298 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du1258
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe v2))
name300
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.reflexive"
d300 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d300 v0 v1 v2 = du300 v2
du300 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du300 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    \ v9 v10 v11 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8)) v9
name302
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.setoid"
d302 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Relation.Binary.Bundles.T44
d302 v0 v1 v2 = du302 v2
du302 :: T172 -> MAlonzo.Code.Relation.Binary.Bundles.T44
du302 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du104
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name304
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.sym"
d304 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d304 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name306
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.trans"
d306 ::
  T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d306 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name308
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.zero"
d308 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d308 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1188
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name310
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.zeroʳ"
d310 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d310 v0 v1 v2 = du310 v2
du310 :: T172 -> AgdaAny -> AgdaAny
du310 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name312
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.zeroˡ"
d312 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d312 v0 v1 v2 = du312 v2
du312 :: T172 -> AgdaAny -> AgdaAny
du312 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name314
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.commutativeSemiring"
d314 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1828
d314 v0 v1 v2 = du314 v2
du314 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1828
du314 v0
  = coe
      MAlonzo.Code.Algebra.Bundles.C20509 (d202 (coe v0)) (d204 (coe v0))
      (d208 (coe v0)) (d214 (coe v0)) (d62 (coe d216 (coe v0)))
name318
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.*-commutativeMonoid"
d318 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T496
d318 v0 v1 v2 = du318 v2
du318 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du318 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1990 (coe du314 (coe v0))
name320
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.*-monoid"
d320 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T422
d320 v0 v1 v2 = du320 v2
du320 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du320 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1658
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name322
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.semigroup"
d322 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T80
d322 v0 v1 v2 = du322 v2
du322 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du322 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du1658 (coe v3))
name324
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.+-commutativeMonoid"
d324 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T496
d324 v0 v1 v2 = du324 v2
du324 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du324 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1642
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name326
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.monoid"
d326 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T422
d326 v0 v1 v2 = du326 v2
du326 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du326 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du562
      (coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3))
name328
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.semigroup"
d328 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T80
d328 v0 v1 v2 = du328 v2
du328 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du328 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du562 (coe v4))
name330
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._.semiring"
d330 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1674
d330 v0 v1 v2 = du330 v2
du330 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1674
du330 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe du314 (coe v0))
name332
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.rawRing"
d332 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1998
d332 v0 v1 v2 = du332 v2
du332 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1998
du332 v0
  = coe
      MAlonzo.Code.Algebra.Bundles.C22533 (d202 (coe v0)) (d204 (coe v0))
      (d206 (coe v0)) (d208 (coe v0)) (d214 (coe v0))
name334
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing._^_"
d334 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> Integer -> AgdaAny
d334 v0 v1 v2 = du334 v2
du334 :: T172 -> AgdaAny -> Integer -> AgdaAny
du334 v0
  = let v1 = coe du332 (coe v0) in
    coe
      (\ v2 v3 ->
         case coe v3 of
           0 -> coe MAlonzo.Code.Algebra.Bundles.d2030 (coe v1)
           _ -> let v4 = subInt (coe v3) (coe (1 :: Integer)) in
                coe
                  MAlonzo.Code.Algebra.Operations.Ring.du32 (coe v1) (coe v2)
                  (coe v4))
name338
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.AlmostCommutativeRing.refl"
d338 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d338 v0 v1 v2 v3 = du338 v2 v3
du338 :: T172 -> AgdaAny -> AgdaAny
du338 v0 v1
  = coe
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
                           (coe d62 (coe d216 (coe v0))))))))))
      v1
name352
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_"
d352 a0 a1 a2 a3 a4 a5 = ()
data T352
  = C6003 (AgdaAny -> AgdaAny) (AgdaAny -> AgdaAny -> AgdaAny)
          (AgdaAny -> AgdaAny -> AgdaAny) (AgdaAny -> AgdaAny) AgdaAny
          AgdaAny
name368 = "Tactic.RingSolver.Core.AlmostCommutativeRing.F._*_"
d368 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny
d368 v0 v1 v2 v3 v4 v5 = du368 v4
du368 ::
  MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny -> AgdaAny -> AgdaAny
du368 v0 = coe MAlonzo.Code.Algebra.Bundles.d2024 (coe v0)
name370 = "Tactic.RingSolver.Core.AlmostCommutativeRing.F._+_"
d370 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny
d370 v0 v1 v2 v3 v4 v5 = du370 v4
du370 ::
  MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny -> AgdaAny -> AgdaAny
du370 v0 = coe MAlonzo.Code.Algebra.Bundles.d2022 (coe v0)
name378 = "Tactic.RingSolver.Core.AlmostCommutativeRing.F.-_"
d378 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny -> AgdaAny
d378 v0 v1 v2 v3 v4 v5 = du378 v4
du378 :: MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny -> AgdaAny
du378 v0 = coe MAlonzo.Code.Algebra.Bundles.d2026 (coe v0)
name380 = "Tactic.RingSolver.Core.AlmostCommutativeRing.F.0#"
d380 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny
d380 v0 v1 v2 v3 v4 v5 = du380 v4
du380 :: MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny
du380 v0 = coe MAlonzo.Code.Algebra.Bundles.d2028 (coe v0)
name382 = "Tactic.RingSolver.Core.AlmostCommutativeRing.F.1#"
d382 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny
d382 v0 v1 v2 v3 v4 v5 = du382 v4
du382 :: MAlonzo.Code.Algebra.Bundles.T1998 -> AgdaAny
du382 v0 = coe MAlonzo.Code.Algebra.Bundles.d2030 (coe v0)
name384 = "Tactic.RingSolver.Core.AlmostCommutativeRing.F.Carrier"
d384 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> ()
d384 = erased
name388 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T._*_"
d388 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d388 v0 = coe d204 (coe v0)
name390 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T._+_"
d390 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d390 v0 = coe d202 (coe v0)
name392 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T._^_"
d392 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> Integer -> AgdaAny
d392 v0 v1 v2 v3 v4 v5 = du392 v5
du392 :: T172 -> AgdaAny -> Integer -> AgdaAny
du392 v0 = coe du334 (coe v0)
name394 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T._≈_"
d394 :: T172 -> AgdaAny -> AgdaAny -> ()
d394 = erased
name396 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.assoc"
d396 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d396 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name398 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.*-comm"
d398 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d398 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1292 (coe d62 (coe d216 (coe v0)))
name400
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.*-commutativeMonoid"
d400 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T496
d400 v0 v1 v2 v3 v4 v5 = du400 v5
du400 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du400 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1990 (coe du314 (coe v0))
name402 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.∙-cong"
d402 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d402 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe d62 (coe d216 (coe v0))))))))
name404 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.∙-congʳ"
d404 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d404 v0 v1 v2 v3 v4 v5 = du404 v5
du404 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du404 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name406 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.∙-congˡ"
d406 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d406 v0 v1 v2 v3 v4 v5 = du406 v5
du406 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du406 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name408 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.identity"
d408 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d408 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name410
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.identityʳ"
d410 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny -> AgdaAny
d410 v0 v1 v2 v3 v4 v5 = du410 v5
du410 :: T172 -> AgdaAny -> AgdaAny
du410 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name412
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.identityˡ"
d412 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny -> AgdaAny
d412 v0 v1 v2 v3 v4 v5 = du412 v5
du412 :: T172 -> AgdaAny -> AgdaAny
du412 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name414
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.*-isCommutativeMonoid"
d414 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T362
d414 v0 v1 v2 v3 v4 v5 = du414 v5
du414 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
du414 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1378 (coe d62 (coe v1))
name416
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.*-isCommutativeSemigroup"
d416 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T192
d416 v0 v1 v2 v3 v4 v5 = du416 v5
du416 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du416 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1376 (coe d62 (coe v1))
name418 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isMagma"
d418 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
d418 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name420
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.*-isMonoid"
d420 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
d420 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1096
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name422
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isSemigroup"
d422 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
d422 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name424 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.*-monoid"
d424 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T422
d424 v0 v1 v2 v3 v4 v5 = du424 v5
du424 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du424 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1658
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name426
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.semigroup"
d426 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T80
d426 v0 v1 v2 v3 v4 v5 = du426 v5
du426 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du426 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du1658 (coe v3))
name428 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.assoc"
d428 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d428 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
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
                     (coe d62 (coe d216 (coe v0))))))))
name430 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.comm"
d430 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d430 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d374
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name432
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.+-commutativeMonoid"
d432 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T496
d432 v0 v1 v2 v3 v4 v5 = du432 v5
du432 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du432 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1642
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name434 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.∙-cong"
d434 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d434 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
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
                        (coe d62 (coe d216 (coe v0)))))))))
name436 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.∙-congʳ"
d436 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d436 v0 v1 v2 v3 v4 v5 = du436 v5
du436 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du436 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name438 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.∙-congˡ"
d438 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d438 v0 v1 v2 v3 v4 v5 = du438 v5
du438 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du438 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name440 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.identity"
d440 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d440 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name442
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.identityʳ"
d442 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny -> AgdaAny
d442 v0 v1 v2 v3 v4 v5 = du442 v5
du442 :: T172 -> AgdaAny -> AgdaAny
du442 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name444
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.identityˡ"
d444 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny -> AgdaAny
d444 v0 v1 v2 v3 v4 v5 = du444 v5
du444 :: T172 -> AgdaAny -> AgdaAny
du444 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name446
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.+-isCommutativeMonoid"
d446 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
d446 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1094
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name448
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isCommutativeSemigroup"
d448 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T192
d448 v0 v1 v2 v3 v4 v5 = du448 v5
du448 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du448 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Structures.du410
      (coe MAlonzo.Code.Algebra.Structures.d1094 (coe v4))
name450 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isMagma"
d450 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
d450 v0
  = coe
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
                     (coe d62 (coe d216 (coe v0))))))))
name452 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isMonoid"
d452 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
d452 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d372
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name454
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isSemigroup"
d454 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
d454 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name456 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.monoid"
d456 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T422
d456 v0 v1 v2 v3 v4 v5 = du456 v5
du456 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du456 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du562
      (coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3))
name458
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.semigroup"
d458 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T80
d458 v0 v1 v2 v3 v4 v5 = du458 v5
du458 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du458 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du562 (coe v4))
name460 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.-_"
d460 :: T172 -> AgdaAny -> AgdaAny
d460 v0 = coe d206 (coe v0)
name462
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.-‿*-distribˡ"
d462 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d462 v0 = coe d70 (coe d216 (coe v0))
name464 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.-‿+-comm"
d464 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d464 v0 = coe d76 (coe d216 (coe v0))
name466 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.-‿cong"
d466 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d466 v0 = coe d64 (coe d216 (coe v0))
name468 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.0#"
d468 :: T172 -> AgdaAny
d468 v0 = coe d208 (coe v0)
name470 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.0≟_"
d470 :: T172 -> AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22
d470 v0 = coe d212 (coe v0)
name472 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.1#"
d472 :: T172 -> AgdaAny
d472 v0 = coe d214 (coe v0)
name474 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.Carrier"
d474 :: T172 -> ()
d474 = erased
name476
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.commutativeSemiring"
d476 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1828
d476 v0 v1 v2 v3 v4 v5 = du476 v5
du476 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1828
du476 v0 = coe du314 (coe v0)
name478 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.distrib"
d478 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d478 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1098
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name480 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.distribʳ"
d480 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d480 v0 v1 v2 v3 v4 v5 = du480 v5
du480 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du480 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name482 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.distribˡ"
d482 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d482 v0 v1 v2 v3 v4 v5 = du482 v5
du482 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du482 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name484
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isAlmostCommutativeRing"
d484 :: T172 -> T26
d484 v0 = coe d216 (coe v0)
name486
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isCommutativeSemiring"
d486 :: T172 -> MAlonzo.Code.Algebra.Structures.T1276
d486 v0 = coe d62 (coe d216 (coe v0))
name488
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isCommutativeSemiringWithoutOne"
d488 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T988
d488 v0 v1 v2 v3 v4 v5 = du488 v5
du488 :: T172 -> MAlonzo.Code.Algebra.Structures.T988
du488 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1374 (coe d62 (coe v1))
name490
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isEquivalence"
d490 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T26
d490 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d88
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
                        (coe d62 (coe d216 (coe v0)))))))))
name492
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isNearSemiring"
d492 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T822
d492 v0 v1 v2 v3 v4 v5 = du492 v5
du492 :: T172 -> MAlonzo.Code.Algebra.Structures.T822
du492 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Structures.du934
      (coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3))
name494
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isPartialEquivalence"
d494 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Relation.Binary.Structures.T16
d494 v0 v1 v2 v3 v4 v5 = du494 v5
du494 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T16
du494 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8))
name496
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isSemiring"
d496 :: T172 -> MAlonzo.Code.Algebra.Structures.T1172
d496 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe d216 (coe v0)))
name498
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isSemiringWithoutAnnihilatingZero"
d498 :: T172 -> MAlonzo.Code.Algebra.Structures.T1078
d498 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1186
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name500
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.isSemiringWithoutOne"
d500 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T898
d500 v0 v1 v2 v3 v4 v5 = du500 v5
du500 :: T172 -> MAlonzo.Code.Algebra.Structures.T898
du500 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du1258
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe v2))
name502 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.rawRing"
d502 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1998
d502 v0 v1 v2 v3 v4 v5 = du502 v5
du502 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1998
du502 v0 = coe du332 (coe v0)
name504 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.refl"
d504 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny -> AgdaAny
d504 v0 v1 v2 v3 v4 v5 v6 = du504 v5 v6
du504 :: T172 -> AgdaAny -> AgdaAny
du504 v0 v1
  = coe
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
                           (coe d62 (coe d216 (coe v0))))))))))
      v1
name506
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.reflexive"
d506 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d506 v0 v1 v2 v3 v4 v5 = du506 v5
du506 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du506 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    \ v9 v10 v11 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8)) v9
name508 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.semiring"
d508 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1674
d508 v0 v1 v2 v3 v4 v5 = du508 v5
du508 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1674
du508 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe du314 (coe v0))
name510 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.setoid"
d510 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> MAlonzo.Code.Relation.Binary.Bundles.T44
d510 v0 v1 v2 v3 v4 v5 = du510 v5
du510 :: T172 -> MAlonzo.Code.Relation.Binary.Bundles.T44
du510 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du104
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name512 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.sym"
d512 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d512 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name514 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.trans"
d514 ::
  T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d514 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name516 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.zero"
d516 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d516 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1188
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name518 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.zeroʳ"
d518 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny -> AgdaAny
d518 v0 v1 v2 v3 v4 v5 = du518 v5
du518 :: T172 -> AgdaAny -> AgdaAny
du518 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name520 = "Tactic.RingSolver.Core.AlmostCommutativeRing.T.zeroˡ"
d520 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> AgdaAny -> AgdaAny
d520 v0 v1 v2 v3 v4 v5 = du520 v5
du520 :: T172 -> AgdaAny -> AgdaAny
du520 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name524
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._.Homomorphic₀"
d524 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny -> ()
d524 = erased
name526
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._.Homomorphic₁"
d526 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> ()
d526 = erased
name528
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._.Homomorphic₂"
d528 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) -> ()
d528 = erased
name530 = "Tactic.RingSolver.Core.AlmostCommutativeRing._.Morphism"
d530 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> ()
d530 = erased
name566
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T._*_"
d566 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny
d566 v0 v1 v2 v3 v4 v5 v6 = du566 v5
du566 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du566 v0 = coe d204 (coe v0)
name568
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T._+_"
d568 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny
d568 v0 v1 v2 v3 v4 v5 v6 = du568 v5
du568 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du568 v0 = coe d202 (coe v0)
name570
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T._^_"
d570 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> Integer -> AgdaAny
d570 v0 v1 v2 v3 v4 v5 v6 = du570 v5
du570 :: T172 -> AgdaAny -> Integer -> AgdaAny
du570 v0 = coe du334 (coe v0)
name572
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T._≈_"
d572 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> ()
d572 = erased
name574
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.assoc"
d574 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d574 v0 v1 v2 v3 v4 v5 v6 = du574 v5
du574 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du574 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name576
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.*-comm"
d576 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny
d576 v0 v1 v2 v3 v4 v5 v6 = du576 v5
du576 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du576 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1292 (coe d62 (coe d216 (coe v0)))
name578
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.*-commutativeMonoid"
d578 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T496
d578 v0 v1 v2 v3 v4 v5 v6 = du578 v5
du578 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du578 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1990 (coe du314 (coe v0))
name580
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.∙-cong"
d580 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d580 v0 v1 v2 v3 v4 v5 v6 = du580 v5
du580 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du580 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe d62 (coe d216 (coe v0))))))))
name582
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.∙-congʳ"
d582 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d582 v0 v1 v2 v3 v4 v5 v6 = du582 v5
du582 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du582 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name584
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.∙-congˡ"
d584 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d584 v0 v1 v2 v3 v4 v5 v6 = du584 v5
du584 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du584 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name586
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.identity"
d586 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d586 v0 v1 v2 v3 v4 v5 v6 = du586 v5
du586 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du586 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name588
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.identityʳ"
d588 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny
d588 v0 v1 v2 v3 v4 v5 v6 = du588 v5
du588 :: T172 -> AgdaAny -> AgdaAny
du588 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name590
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.identityˡ"
d590 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny
d590 v0 v1 v2 v3 v4 v5 v6 = du590 v5
du590 :: T172 -> AgdaAny -> AgdaAny
du590 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name592
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.*-isCommutativeMonoid"
d592 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T362
d592 v0 v1 v2 v3 v4 v5 v6 = du592 v5
du592 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
du592 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1378 (coe d62 (coe v1))
name594
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.*-isCommutativeSemigroup"
d594 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T192
d594 v0 v1 v2 v3 v4 v5 v6 = du594 v5
du594 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du594 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1376 (coe d62 (coe v1))
name596
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isMagma"
d596 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T80
d596 v0 v1 v2 v3 v4 v5 v6 = du596 v5
du596 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
du596 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name598
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.*-isMonoid"
d598 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T314
d598 v0 v1 v2 v3 v4 v5 v6 = du598 v5
du598 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
du598 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1096
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name600
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isSemigroup"
d600 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T116
d600 v0 v1 v2 v3 v4 v5 v6 = du600 v5
du600 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
du600 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name602
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.*-monoid"
d602 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T422
d602 v0 v1 v2 v3 v4 v5 v6 = du602 v5
du602 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du602 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1658
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name604
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.semigroup"
d604 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T80
d604 v0 v1 v2 v3 v4 v5 v6 = du604 v5
du604 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du604 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du1658 (coe v3))
name606
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.assoc"
d606 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d606 v0 v1 v2 v3 v4 v5 v6 = du606 v5
du606 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du606 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
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
                     (coe d62 (coe d216 (coe v0))))))))
name608
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.comm"
d608 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny
d608 v0 v1 v2 v3 v4 v5 v6 = du608 v5
du608 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du608 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d374
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name610
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.+-commutativeMonoid"
d610 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T496
d610 v0 v1 v2 v3 v4 v5 v6 = du610 v5
du610 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du610 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1642
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name612
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.∙-cong"
d612 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d612 v0 v1 v2 v3 v4 v5 v6 = du612 v5
du612 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du612 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
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
                        (coe d62 (coe d216 (coe v0)))))))))
name614
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.∙-congʳ"
d614 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d614 v0 v1 v2 v3 v4 v5 v6 = du614 v5
du614 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du614 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name616
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.∙-congˡ"
d616 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d616 v0 v1 v2 v3 v4 v5 v6 = du616 v5
du616 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du616 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name618
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.identity"
d618 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d618 v0 v1 v2 v3 v4 v5 v6 = du618 v5
du618 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du618 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name620
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.identityʳ"
d620 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny
d620 v0 v1 v2 v3 v4 v5 v6 = du620 v5
du620 :: T172 -> AgdaAny -> AgdaAny
du620 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name622
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.identityˡ"
d622 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny
d622 v0 v1 v2 v3 v4 v5 v6 = du622 v5
du622 :: T172 -> AgdaAny -> AgdaAny
du622 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name624
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.+-isCommutativeMonoid"
d624 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T362
d624 v0 v1 v2 v3 v4 v5 v6 = du624 v5
du624 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
du624 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1094
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name626
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isCommutativeSemigroup"
d626 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T192
d626 v0 v1 v2 v3 v4 v5 v6 = du626 v5
du626 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du626 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Structures.du410
      (coe MAlonzo.Code.Algebra.Structures.d1094 (coe v4))
name628
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isMagma"
d628 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T80
d628 v0 v1 v2 v3 v4 v5 v6 = du628 v5
du628 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
du628 v0
  = coe
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
                     (coe d62 (coe d216 (coe v0))))))))
name630
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isMonoid"
d630 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T314
d630 v0 v1 v2 v3 v4 v5 v6 = du630 v5
du630 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
du630 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d372
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name632
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isSemigroup"
d632 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T116
d632 v0 v1 v2 v3 v4 v5 v6 = du632 v5
du632 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
du632 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name634
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.monoid"
d634 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T422
d634 v0 v1 v2 v3 v4 v5 v6 = du634 v5
du634 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du634 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du562
      (coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3))
name636
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.semigroup"
d636 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T80
d636 v0 v1 v2 v3 v4 v5 v6 = du636 v5
du636 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du636 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du562 (coe v4))
name638
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.-_"
d638 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny
d638 v0 v1 v2 v3 v4 v5 v6 = du638 v5
du638 :: T172 -> AgdaAny -> AgdaAny
du638 v0 = coe d206 (coe v0)
name640
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.-‿*-distribˡ"
d640 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny
d640 v0 v1 v2 v3 v4 v5 v6 = du640 v5
du640 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du640 v0 = coe d70 (coe d216 (coe v0))
name642
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.-‿+-comm"
d642 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny
d642 v0 v1 v2 v3 v4 v5 v6 = du642 v5
du642 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du642 v0 = coe d76 (coe d216 (coe v0))
name644
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.-‿cong"
d644 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d644 v0 v1 v2 v3 v4 v5 v6 = du644 v5
du644 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du644 v0 = coe d64 (coe d216 (coe v0))
name646
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.0#"
d646 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> T352 -> AgdaAny
d646 v0 v1 v2 v3 v4 v5 v6 = du646 v5
du646 :: T172 -> AgdaAny
du646 v0 = coe d208 (coe v0)
name648
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.0≟_"
d648 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22
d648 v0 v1 v2 v3 v4 v5 v6 = du648 v5
du648 :: T172 -> AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22
du648 v0 = coe d212 (coe v0)
name650
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.1#"
d650 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> T352 -> AgdaAny
d650 v0 v1 v2 v3 v4 v5 v6 = du650 v5
du650 :: T172 -> AgdaAny
du650 v0 = coe d214 (coe v0)
name652
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.Carrier"
d652 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> T352 -> ()
d652 = erased
name654
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.commutativeSemiring"
d654 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T1828
d654 v0 v1 v2 v3 v4 v5 v6 = du654 v5
du654 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1828
du654 v0 = coe du314 (coe v0)
name656
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.distrib"
d656 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d656 v0 v1 v2 v3 v4 v5 v6 = du656 v5
du656 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du656 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1098
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name658
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.distribʳ"
d658 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d658 v0 v1 v2 v3 v4 v5 v6 = du658 v5
du658 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du658 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name660
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.distribˡ"
d660 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d660 v0 v1 v2 v3 v4 v5 v6 = du660 v5
du660 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du660 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name662
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isAlmostCommutativeRing"
d662 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 -> T172 -> T352 -> T26
d662 v0 v1 v2 v3 v4 v5 v6 = du662 v5
du662 :: T172 -> T26
du662 v0 = coe d216 (coe v0)
name664
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isCommutativeSemiring"
d664 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T1276
d664 v0 v1 v2 v3 v4 v5 v6 = du664 v5
du664 :: T172 -> MAlonzo.Code.Algebra.Structures.T1276
du664 v0 = coe d62 (coe d216 (coe v0))
name666
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isCommutativeSemiringWithoutOne"
d666 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T988
d666 v0 v1 v2 v3 v4 v5 v6 = du666 v5
du666 :: T172 -> MAlonzo.Code.Algebra.Structures.T988
du666 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1374 (coe d62 (coe v1))
name668
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isEquivalence"
d668 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Relation.Binary.Structures.T26
d668 v0 v1 v2 v3 v4 v5 v6 = du668 v5
du668 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T26
du668 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d88
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
                        (coe d62 (coe d216 (coe v0)))))))))
name670
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isNearSemiring"
d670 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T822
d670 v0 v1 v2 v3 v4 v5 v6 = du670 v5
du670 :: T172 -> MAlonzo.Code.Algebra.Structures.T822
du670 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Structures.du934
      (coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3))
name672
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isPartialEquivalence"
d672 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Relation.Binary.Structures.T16
d672 v0 v1 v2 v3 v4 v5 v6 = du672 v5
du672 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T16
du672 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8))
name674
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isSemiring"
d674 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T1172
d674 v0 v1 v2 v3 v4 v5 v6 = du674 v5
du674 :: T172 -> MAlonzo.Code.Algebra.Structures.T1172
du674 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe d216 (coe v0)))
name676
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isSemiringWithoutAnnihilatingZero"
d676 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T1078
d676 v0 v1 v2 v3 v4 v5 v6 = du676 v5
du676 :: T172 -> MAlonzo.Code.Algebra.Structures.T1078
du676 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1186
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name678
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.isSemiringWithoutOne"
d678 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Structures.T898
d678 v0 v1 v2 v3 v4 v5 v6 = du678 v5
du678 :: T172 -> MAlonzo.Code.Algebra.Structures.T898
du678 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du1258
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe v2))
name680
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.rawRing"
d680 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T1998
d680 v0 v1 v2 v3 v4 v5 v6 = du680 v5
du680 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1998
du680 v0 = coe du332 (coe v0)
name682
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.refl"
d682 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny
d682 v0 v1 v2 v3 v4 v5 v6 v7 = du682 v5 v7
du682 :: T172 -> AgdaAny -> AgdaAny
du682 v0 v1
  = coe
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
                           (coe d62 (coe d216 (coe v0))))))))))
      v1
name684
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.reflexive"
d684 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d684 v0 v1 v2 v3 v4 v5 v6 = du684 v5
du684 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du684 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    \ v9 v10 v11 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8)) v9
name686
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.semiring"
d686 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Algebra.Bundles.T1674
d686 v0 v1 v2 v3 v4 v5 v6 = du686 v5
du686 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1674
du686 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe du314 (coe v0))
name688
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.setoid"
d688 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Relation.Binary.Bundles.T44
d688 v0 v1 v2 v3 v4 v5 v6 = du688 v5
du688 :: T172 -> MAlonzo.Code.Relation.Binary.Bundles.T44
du688 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du104
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name690
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.sym"
d690 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d690 v0 v1 v2 v3 v4 v5 v6 = du690 v5
du690 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du690 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name692
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.trans"
d692 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d692 v0 v1 v2 v3 v4 v5 v6 = du692 v5
du692 ::
  T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du692 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name694
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.zero"
d694 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d694 v0 v1 v2 v3 v4 v5 v6 = du694 v5
du694 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du694 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1188
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name696
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.zeroʳ"
d696 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny
d696 v0 v1 v2 v3 v4 v5 v6 = du696 v5
du696 :: T172 -> AgdaAny -> AgdaAny
du696 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name698
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.T.zeroˡ"
d698 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny
d698 v0 v1 v2 v3 v4 v5 v6 = du698 v5
du698 :: T172 -> AgdaAny -> AgdaAny
du698 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name710
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.⟦_⟧"
d710 :: T352 -> AgdaAny -> AgdaAny
d710 v0
  = case coe v0 of
      C6003 v1 v2 v3 v4 v5 v6 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
name712
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.+-homo"
d712 :: T352 -> AgdaAny -> AgdaAny -> AgdaAny
d712 v0
  = case coe v0 of
      C6003 v1 v2 v3 v4 v5 v6 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
name714
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.*-homo"
d714 :: T352 -> AgdaAny -> AgdaAny -> AgdaAny
d714 v0
  = case coe v0 of
      C6003 v1 v2 v3 v4 v5 v6 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
name716
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.-‿homo"
d716 :: T352 -> AgdaAny -> AgdaAny
d716 v0
  = case coe v0 of
      C6003 v1 v2 v3 v4 v5 v6 -> coe v4
      _ -> MAlonzo.RTE.mazUnreachableError
name718
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.0-homo"
d718 :: T352 -> AgdaAny
d718 v0
  = case coe v0 of
      C6003 v1 v2 v3 v4 v5 v6 -> coe v5
      _ -> MAlonzo.RTE.mazUnreachableError
name720
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._-Raw-AlmostCommutative⟶_.1-homo"
d720 :: T352 -> AgdaAny
d720 v0
  = case coe v0 of
      C6003 v1 v2 v3 v4 v5 v6 -> coe v6
      _ -> MAlonzo.RTE.mazUnreachableError
name728
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.-raw-almostCommutative⟶"
d728 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> T352
d728 v0 v1 v2 = du728 v2
du728 :: T172 -> T352
du728 v0
  = coe
      C6003 (coe (\ v1 -> v1))
      (coe
         (\ v1 v2 ->
            coe
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
                                   (coe d62 (coe d216 (coe v0))))))))))
              (let v3 = coe du332 (coe v0) in
               coe MAlonzo.Code.Algebra.Bundles.d2022 v3 v1 v2)))
      (coe
         (\ v1 v2 ->
            coe
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
                                   (coe d62 (coe d216 (coe v0))))))))))
              (let v3 = coe du332 (coe v0) in
               coe MAlonzo.Code.Algebra.Bundles.d2024 v3 v1 v2)))
      (coe
         (\ v1 ->
            coe
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
                                   (coe d62 (coe d216 (coe v0))))))))))
              (let v2 = coe du332 (coe v0) in
               coe MAlonzo.Code.Algebra.Bundles.d2026 v2 v1)))
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
                              (coe d62 (coe d216 (coe v0))))))))))
         (let v1 = coe du332 (coe v0) in
          MAlonzo.Code.Algebra.Bundles.d2028 (coe v1)))
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
                              (coe d62 (coe d216 (coe v0))))))))))
         (let v1 = coe du332 (coe v0) in
          MAlonzo.Code.Algebra.Bundles.d2030 (coe v1)))
name738 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._._*_"
d738 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d738 v0 = coe d204 (coe v0)
name740 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._._+_"
d740 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d740 v0 = coe d202 (coe v0)
name742 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._._^_"
d742 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> Integer -> AgdaAny
d742 v0 v1 v2 = du742 v2
du742 :: T172 -> AgdaAny -> Integer -> AgdaAny
du742 v0 = coe du334 (coe v0)
name744 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._._≈_"
d744 :: T172 -> AgdaAny -> AgdaAny -> ()
d744 = erased
name746 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.assoc"
d746 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d746 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name748 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-comm"
d748 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d748 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1292 (coe d62 (coe d216 (coe v0)))
name750
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-commutativeMonoid"
d750 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T496
d750 v0 v1 v2 = du750 v2
du750 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du750 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1990 (coe du314 (coe v0))
name752 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-cong"
d752 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d752 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe d62 (coe d216 (coe v0))))))))
name754
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-congʳ"
d754 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d754 v0 v1 v2 = du754 v2
du754 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du754 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name756
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-congˡ"
d756 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d756 v0 v1 v2 = du756 v2
du756 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du756 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name758
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identity"
d758 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d758 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name760
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identityʳ"
d760 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d760 v0 v1 v2 = du760 v2
du760 :: T172 -> AgdaAny -> AgdaAny
du760 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name762
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identityˡ"
d762 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d762 v0 v1 v2 = du762 v2
du762 :: T172 -> AgdaAny -> AgdaAny
du762 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name764
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-isCommutativeMonoid"
d764 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T362
d764 v0 v1 v2 = du764 v2
du764 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
du764 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1378 (coe d62 (coe v1))
name766
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-isCommutativeSemigroup"
d766 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T192
d766 v0 v1 v2 = du766 v2
du766 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du766 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1376 (coe d62 (coe v1))
name768
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isMagma"
d768 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
d768 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name770
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-isMonoid"
d770 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
d770 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1096
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name772
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemigroup"
d772 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
d772 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name774
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-monoid"
d774 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T422
d774 v0 v1 v2 = du774 v2
du774 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du774 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1658
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name776
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.semigroup"
d776 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T80
d776 v0 v1 v2 = du776 v2
du776 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du776 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du1658 (coe v3))
name778 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.assoc"
d778 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d778 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
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
                     (coe d62 (coe d216 (coe v0))))))))
name780 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.comm"
d780 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d780 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d374
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name782
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.+-commutativeMonoid"
d782 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T496
d782 v0 v1 v2 = du782 v2
du782 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du782 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1642
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name784 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-cong"
d784 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d784 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
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
                        (coe d62 (coe d216 (coe v0)))))))))
name786
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-congʳ"
d786 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d786 v0 v1 v2 = du786 v2
du786 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du786 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name788
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-congˡ"
d788 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d788 v0 v1 v2 = du788 v2
du788 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du788 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name790
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identity"
d790 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d790 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name792
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identityʳ"
d792 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d792 v0 v1 v2 = du792 v2
du792 :: T172 -> AgdaAny -> AgdaAny
du792 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name794
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identityˡ"
d794 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d794 v0 v1 v2 = du794 v2
du794 :: T172 -> AgdaAny -> AgdaAny
du794 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name796
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.+-isCommutativeMonoid"
d796 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
d796 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1094
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name798
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isCommutativeSemigroup"
d798 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T192
d798 v0 v1 v2 = du798 v2
du798 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du798 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Structures.du410
      (coe MAlonzo.Code.Algebra.Structures.d1094 (coe v4))
name800
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isMagma"
d800 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
d800 v0
  = coe
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
                     (coe d62 (coe d216 (coe v0))))))))
name802
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isMonoid"
d802 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
d802 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d372
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name804
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemigroup"
d804 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
d804 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name806 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.monoid"
d806 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T422
d806 v0 v1 v2 = du806 v2
du806 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du806 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du562
      (coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3))
name808
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.semigroup"
d808 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T80
d808 v0 v1 v2 = du808 v2
du808 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du808 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du562 (coe v4))
name810 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-_"
d810 :: T172 -> AgdaAny -> AgdaAny
d810 v0 = coe d206 (coe v0)
name812
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-‿*-distribˡ"
d812 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d812 v0 = coe d70 (coe d216 (coe v0))
name814
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-‿+-comm"
d814 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
d814 v0 = coe d76 (coe d216 (coe v0))
name816 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-‿cong"
d816 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d816 v0 = coe d64 (coe d216 (coe v0))
name818 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.0#"
d818 :: T172 -> AgdaAny
d818 v0 = coe d208 (coe v0)
name820 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.0≟_"
d820 :: T172 -> AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22
d820 v0 = coe d212 (coe v0)
name822 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.1#"
d822 :: T172 -> AgdaAny
d822 v0 = coe d214 (coe v0)
name824
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.Carrier"
d824 :: T172 -> ()
d824 = erased
name826
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.commutativeSemiring"
d826 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1828
d826 v0 v1 v2 = du826 v2
du826 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1828
du826 v0 = coe du314 (coe v0)
name828
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.distrib"
d828 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d828 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1098
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name830
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.distribʳ"
d830 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d830 v0 v1 v2 = du830 v2
du830 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du830 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name832
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.distribˡ"
d832 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d832 v0 v1 v2 = du832 v2
du832 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du832 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name834
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isAlmostCommutativeRing"
d834 :: T172 -> T26
d834 v0 = coe d216 (coe v0)
name836
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isCommutativeSemiring"
d836 :: T172 -> MAlonzo.Code.Algebra.Structures.T1276
d836 v0 = coe d62 (coe d216 (coe v0))
name838
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isCommutativeSemiringWithoutOne"
d838 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T988
d838 v0 v1 v2 = du838 v2
du838 :: T172 -> MAlonzo.Code.Algebra.Structures.T988
du838 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1374 (coe d62 (coe v1))
name840
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isEquivalence"
d840 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T26
d840 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d88
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
                        (coe d62 (coe d216 (coe v0)))))))))
name842
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isNearSemiring"
d842 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T822
d842 v0 v1 v2 = du842 v2
du842 :: T172 -> MAlonzo.Code.Algebra.Structures.T822
du842 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Structures.du934
      (coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3))
name844
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isPartialEquivalence"
d844 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Relation.Binary.Structures.T16
d844 v0 v1 v2 = du844 v2
du844 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T16
du844 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8))
name846
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemiring"
d846 :: T172 -> MAlonzo.Code.Algebra.Structures.T1172
d846 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe d216 (coe v0)))
name848
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemiringWithoutAnnihilatingZero"
d848 :: T172 -> MAlonzo.Code.Algebra.Structures.T1078
d848 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1186
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name850
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemiringWithoutOne"
d850 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Structures.T898
d850 v0 v1 v2 = du850 v2
du850 :: T172 -> MAlonzo.Code.Algebra.Structures.T898
du850 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du1258
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe v2))
name852
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.rawRing"
d852 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1998
d852 v0 v1 v2 = du852 v2
du852 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1998
du852 v0 = coe du332 (coe v0)
name854 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.refl"
d854 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d854 v0 v1 v2 v3 = du854 v2 v3
du854 :: T172 -> AgdaAny -> AgdaAny
du854 v0 v1
  = coe
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
                           (coe d62 (coe d216 (coe v0))))))))))
      v1
name856
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.reflexive"
d856 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d856 v0 v1 v2 = du856 v2
du856 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du856 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    \ v9 v10 v11 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8)) v9
name858
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.semiring"
d858 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Algebra.Bundles.T1674
d858 v0 v1 v2 = du858 v2
du858 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1674
du858 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe du314 (coe v0))
name860 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.setoid"
d860 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  T172 -> MAlonzo.Code.Relation.Binary.Bundles.T44
d860 v0 v1 v2 = du860 v2
du860 :: T172 -> MAlonzo.Code.Relation.Binary.Bundles.T44
du860 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du104
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name862 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.sym"
d862 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d862 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name864 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.trans"
d864 ::
  T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d864 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name866 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.zero"
d866 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d866 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1188
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name868 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.zeroʳ"
d868 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d868 v0 v1 v2 = du868 v2
du868 :: T172 -> AgdaAny -> AgdaAny
du868 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name870 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.zeroˡ"
d870 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> T172 -> AgdaAny -> AgdaAny
d870 v0 v1 v2 = du870 v2
du870 :: T172 -> AgdaAny -> AgdaAny
du870 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name894
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.Induced-equivalence"
d894 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> ()
d894 = erased
name910 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._._*_"
d910 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d910 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du910 v5
du910 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du910 v0 = coe d204 (coe v0)
name912 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._._+_"
d912 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d912 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du912 v5
du912 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du912 v0 = coe d202 (coe v0)
name914 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._._^_"
d914 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> Integer -> AgdaAny
d914 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du914 v5
du914 :: T172 -> AgdaAny -> Integer -> AgdaAny
du914 v0 = coe du334 (coe v0)
name916 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._._≈_"
d916 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> ()
d916 = erased
name918 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.assoc"
d918 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d918 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du918 v5
du918 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du918 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name920 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-comm"
d920 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d920 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du920 v5
du920 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du920 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1292 (coe d62 (coe d216 (coe v0)))
name922
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-commutativeMonoid"
d922 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T496
d922 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du922 v5
du922 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du922 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1990 (coe du314 (coe v0))
name924 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-cong"
d924 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d924 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du924 v5
du924 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du924 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
      (coe
         MAlonzo.Code.Algebra.Structures.d124
         (coe
            MAlonzo.Code.Algebra.Structures.d324
            (coe
               MAlonzo.Code.Algebra.Structures.d1096
               (coe
                  MAlonzo.Code.Algebra.Structures.d1186
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1290
                     (coe d62 (coe d216 (coe v0))))))))
name926
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-congʳ"
d926 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d926 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du926 v5
du926 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du926 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name928
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-congˡ"
d928 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d928 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du928 v5
du928 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du928 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d324 (coe v5) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v6))
name930
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identity"
d930 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d930 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du930 v5
du930 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du930 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name932
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identityʳ"
d932 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d932 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du932 v5
du932 :: T172 -> AgdaAny -> AgdaAny
du932 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name934
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identityˡ"
d934 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d934 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du934 v5
du934 :: T172 -> AgdaAny -> AgdaAny
du934 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1096 (coe v4) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v5))
name936
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-isCommutativeMonoid"
d936 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T362
d936 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du936 v5
du936 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
du936 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1378 (coe d62 (coe v1))
name938
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-isCommutativeSemigroup"
d938 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T192
d938 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du938 v5
du938 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du938 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1376 (coe d62 (coe v1))
name940
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isMagma"
d940 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T80
d940 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du940 v5
du940 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
du940 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d124
      (coe
         MAlonzo.Code.Algebra.Structures.d324
         (coe
            MAlonzo.Code.Algebra.Structures.d1096
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name942
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-isMonoid"
d942 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T314
d942 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du942 v5
du942 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
du942 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1096
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name944
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemigroup"
d944 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T116
d944 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du944 v5
du944 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
du944 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d1096
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name946
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-monoid"
d946 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T422
d946 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du946 v5
du946 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du946 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1658
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name948
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.semigroup"
d948 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T80
d948 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du948 v5
du948 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du948 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du1658 (coe v3))
name950 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.assoc"
d950 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d950 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du950 v5
du950 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du950 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d126
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
                     (coe d62 (coe d216 (coe v0))))))))
name952 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.comm"
d952 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d952 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du952 v5
du952 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du952 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d374
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name954
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.+-commutativeMonoid"
d954 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T496
d954 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du954 v5
du954 :: T172 -> MAlonzo.Code.Algebra.Bundles.T496
du954 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Bundles.du1642
      (coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2))
name956 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-cong"
d956 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d956 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du956 v5
du956 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du956 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d90
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
                        (coe d62 (coe d216 (coe v0)))))))))
name958
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-congʳ"
d958 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d958 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du958 v5
du958 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du958 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du110
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name960
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.∙-congˡ"
d960 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d960 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du960 v5
du960 ::
  T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du960 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du106
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name962
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identity"
d962 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d962 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du962 v5
du962 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du962 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d326
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name964
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identityʳ"
d964 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d964 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du964 v5
du964 :: T172 -> AgdaAny -> AgdaAny
du964 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name966
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.identityˡ"
d966 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d966 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du966 v5
du966 :: T172 -> AgdaAny -> AgdaAny
du966 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d326 (coe v6))
name968
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.+-isCommutativeMonoid"
d968 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T362
d968 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du968 v5
du968 :: T172 -> MAlonzo.Code.Algebra.Structures.T362
du968 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1094
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name970
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isCommutativeSemigroup"
d970 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T192
d970 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du970 v5
du970 :: T172 -> MAlonzo.Code.Algebra.Structures.T192
du970 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Structures.du410
      (coe MAlonzo.Code.Algebra.Structures.d1094 (coe v4))
name972
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isMagma"
d972 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T80
d972 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du972 v5
du972 :: T172 -> MAlonzo.Code.Algebra.Structures.T80
du972 v0
  = coe
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
                     (coe d62 (coe d216 (coe v0))))))))
name974
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isMonoid"
d974 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T314
d974 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du974 v5
du974 :: T172 -> MAlonzo.Code.Algebra.Structures.T314
du974 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d372
      (coe
         MAlonzo.Code.Algebra.Structures.d1094
         (coe
            MAlonzo.Code.Algebra.Structures.d1186
            (coe
               MAlonzo.Code.Algebra.Structures.d1290
               (coe d62 (coe d216 (coe v0))))))
name976
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemigroup"
d976 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T116
d976 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du976 v5
du976 :: T172 -> MAlonzo.Code.Algebra.Structures.T116
du976 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d324
      (coe
         MAlonzo.Code.Algebra.Structures.d372
         (coe
            MAlonzo.Code.Algebra.Structures.d1094
            (coe
               MAlonzo.Code.Algebra.Structures.d1186
               (coe
                  MAlonzo.Code.Algebra.Structures.d1290
                  (coe d62 (coe d216 (coe v0)))))))
name978 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.monoid"
d978 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T422
d978 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du978 v5
du978 :: T172 -> MAlonzo.Code.Algebra.Bundles.T422
du978 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Bundles.du562
      (coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3))
name980
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.semigroup"
d980 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T80
d980 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du980 v5
du980 :: T172 -> MAlonzo.Code.Algebra.Bundles.T80
du980 v0
  = let v1 = coe du314 (coe v0) in
    let v2 = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe v1) in
    let v3 = coe MAlonzo.Code.Algebra.Bundles.du1790 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Bundles.du1642 (coe v3) in
    coe
      MAlonzo.Code.Algebra.Bundles.du482
      (coe MAlonzo.Code.Algebra.Bundles.du562 (coe v4))
name982 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-_"
d982 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d982 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du982 v5
du982 :: T172 -> AgdaAny -> AgdaAny
du982 v0 = coe d206 (coe v0)
name984
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-‿*-distribˡ"
d984 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d984 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du984 v5
du984 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du984 v0 = coe d70 (coe d216 (coe v0))
name986
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-‿+-comm"
d986 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d986 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du986 v5
du986 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny
du986 v0 = coe d76 (coe d216 (coe v0))
name988 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-‿cong"
d988 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d988 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du988 v5
du988 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du988 v0 = coe d64 (coe d216 (coe v0))
name990 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.0#"
d990 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny
d990 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du990 v5
du990 :: T172 -> AgdaAny
du990 v0 = coe d208 (coe v0)
name992 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.0≟_"
d992 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22
d992 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du992 v5
du992 :: T172 -> AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22
du992 v0 = coe d212 (coe v0)
name994 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.1#"
d994 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny
d994 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du994 v5
du994 :: T172 -> AgdaAny
du994 v0 = coe d214 (coe v0)
name996
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.Carrier"
d996 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> ()
d996 = erased
name998
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.commutativeSemiring"
d998 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T1828
d998 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du998 v5
du998 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1828
du998 v0 = coe du314 (coe v0)
name1000
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.distrib"
d1000 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d1000 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1000 v5
du1000 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du1000 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1098
      (coe
         MAlonzo.Code.Algebra.Structures.d1186
         (coe
            MAlonzo.Code.Algebra.Structures.d1290
            (coe d62 (coe d216 (coe v0)))))
name1002
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.distribʳ"
d1002 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1002 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1002 v5
du1002 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du1002 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name1004
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.distribˡ"
d1004 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1004 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1004 v5
du1004 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du1004 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d1098 (coe v4))
name1006
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isAlmostCommutativeRing"
d1006 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> T26
d1006 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1006 v5
du1006 :: T172 -> T26
du1006 v0 = coe d216 (coe v0)
name1008
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isCommutativeSemiring"
d1008 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T1276
d1008 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1008 v5
du1008 :: T172 -> MAlonzo.Code.Algebra.Structures.T1276
du1008 v0 = coe d62 (coe d216 (coe v0))
name1010
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isCommutativeSemiringWithoutOne"
d1010 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T988
d1010 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1010 v5
du1010 :: T172 -> MAlonzo.Code.Algebra.Structures.T988
du1010 v0
  = let v1 = d216 (coe v0) in
    coe MAlonzo.Code.Algebra.Structures.du1374 (coe d62 (coe v1))
name1012
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isEquivalence"
d1012 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Binary.Structures.T26
d1012 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1012 v5
du1012 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T26
du1012 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d88
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
                        (coe d62 (coe d216 (coe v0)))))))))
name1014
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isNearSemiring"
d1014 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T822
d1014 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1014 v5
du1014 :: T172 -> MAlonzo.Code.Algebra.Structures.T822
du1014 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    coe
      MAlonzo.Code.Algebra.Structures.du934
      (coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3))
name1016
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isPartialEquivalence"
d1016 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Binary.Structures.T16
d1016 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1016 v5
du1016 :: T172 -> MAlonzo.Code.Relation.Binary.Structures.T16
du1016 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    coe
      MAlonzo.Code.Relation.Binary.Structures.du42
      (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8))
name1018
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemiring"
d1018 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T1172
d1018 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1018 v5
du1018 :: T172 -> MAlonzo.Code.Algebra.Structures.T1172
du1018 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1290 (coe d62 (coe d216 (coe v0)))
name1020
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemiringWithoutAnnihilatingZero"
d1020 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T1078
d1020 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1020 v5
du1020 :: T172 -> MAlonzo.Code.Algebra.Structures.T1078
du1020 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1186
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name1022
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.isSemiringWithoutOne"
d1022 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Structures.T898
d1022 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1022 v5
du1022 :: T172 -> MAlonzo.Code.Algebra.Structures.T898
du1022 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du1258
      (coe MAlonzo.Code.Algebra.Structures.d1290 (coe v2))
name1024
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.rawRing"
d1024 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T1998
d1024 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1024 v5
du1024 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1998
du1024 v0 = coe du332 (coe v0)
name1026 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.refl"
d1026 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1026 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du1026 v5 v9
du1026 :: T172 -> AgdaAny -> AgdaAny
du1026 v0 v1
  = coe
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
                           (coe d62 (coe d216 (coe v0))))))))))
      v1
name1028
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.reflexive"
d1028 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
d1028 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1028 v5
du1028 ::
  T172 ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12 -> AgdaAny
du1028 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    let v8 = MAlonzo.Code.Algebra.Structures.d124 (coe v7) in
    \ v9 v10 v11 ->
      coe
        MAlonzo.Code.Relation.Binary.Structures.du40
        (coe MAlonzo.Code.Algebra.Structures.d88 (coe v8)) v9
name1030
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.semiring"
d1030 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Algebra.Bundles.T1674
d1030 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1030 v5
du1030 :: T172 -> MAlonzo.Code.Algebra.Bundles.T1674
du1030 v0
  = coe MAlonzo.Code.Algebra.Bundles.du1952 (coe du314 (coe v0))
name1032
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.setoid"
d1032 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Binary.Bundles.T44
d1032 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1032 v5
du1032 :: T172 -> MAlonzo.Code.Relation.Binary.Bundles.T44
du1032 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = MAlonzo.Code.Algebra.Structures.d1186 (coe v3) in
    let v5 = MAlonzo.Code.Algebra.Structures.d1094 (coe v4) in
    let v6 = MAlonzo.Code.Algebra.Structures.d372 (coe v5) in
    let v7 = MAlonzo.Code.Algebra.Structures.d324 (coe v6) in
    coe
      MAlonzo.Code.Algebra.Structures.du104
      (coe MAlonzo.Code.Algebra.Structures.d124 (coe v7))
name1034 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.sym"
d1034 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1034 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1034 v5
du1034 :: T172 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du1034 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d36
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name1036 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.trans"
d1036 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1036 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1036 v5
du1036 ::
  T172 ->
  AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
du1036 v0
  = coe
      MAlonzo.Code.Relation.Binary.Structures.d38
      (coe
         MAlonzo.Code.Algebra.Structures.d88
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
                           (coe d62 (coe d216 (coe v0))))))))))
name1038 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.zero"
d1038 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 ->
  T352 -> AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d1038 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1038 v5
du1038 :: T172 -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du1038 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d1188
      (coe
         MAlonzo.Code.Algebra.Structures.d1290
         (coe d62 (coe d216 (coe v0))))
name1040 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.zeroʳ"
d1040 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1040 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1040 v5
du1040 :: T172 -> AgdaAny -> AgdaAny
du1040 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d30
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name1042 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.zeroˡ"
d1042 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1998 ->
  T172 -> T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1042 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du1042 v5
du1042 :: T172 -> AgdaAny -> AgdaAny
du1042 v0
  = let v1 = d216 (coe v0) in
    let v2 = d62 (coe v1) in
    let v3 = MAlonzo.Code.Algebra.Structures.d1290 (coe v2) in
    let v4 = coe MAlonzo.Code.Algebra.Structures.du1258 (coe v3) in
    coe
      MAlonzo.Code.Agda.Builtin.Sigma.d28
      (coe MAlonzo.Code.Algebra.Structures.d920 (coe v4))
name1046
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.*-homo"
d1046 ::
  T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1046 v0 v1 v2 = du1046 v0
du1046 :: T352 -> AgdaAny -> AgdaAny -> AgdaAny
du1046 v0 = coe d714 (coe v0)
name1048
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.+-homo"
d1048 ::
  T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1048 v0 v1 v2 = du1048 v0
du1048 :: T352 -> AgdaAny -> AgdaAny -> AgdaAny
du1048 v0 = coe d712 (coe v0)
name1050
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.-‿homo"
d1050 :: T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1050 v0 v1 v2 = du1050 v0
du1050 :: T352 -> AgdaAny -> AgdaAny
du1050 v0 = coe d716 (coe v0)
name1052
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.0-homo"
d1052 :: T352 -> AgdaAny -> AgdaAny -> AgdaAny
d1052 v0 v1 v2 = du1052 v0
du1052 :: T352 -> AgdaAny
du1052 v0 = coe d718 (coe v0)
name1054
  = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.1-homo"
d1054 :: T352 -> AgdaAny -> AgdaAny -> AgdaAny
d1054 v0 v1 v2 = du1054 v0
du1054 :: T352 -> AgdaAny
du1054 v0 = coe d720 (coe v0)
name1056 = "Tactic.RingSolver.Core.AlmostCommutativeRing._._.⟦_⟧"
d1056 :: T352 -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny
d1056 v0 v1 v2 = du1056 v0
du1056 :: T352 -> AgdaAny -> AgdaAny
du1056 v0 = coe d710 (coe v0)
name1240
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.fromCommutativeRing"
d1240 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T2224 ->
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) -> T172
d1240 v0 v1 v2 v3 = du1240 v2 v3
du1240 ::
  MAlonzo.Code.Algebra.Bundles.T2224 ->
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) -> T172
du1240 v0 v1
  = coe
      C3313 (MAlonzo.Code.Algebra.Bundles.d2250 (coe v0))
      (MAlonzo.Code.Algebra.Bundles.d2252 (coe v0))
      (MAlonzo.Code.Algebra.Bundles.d2254 (coe v0))
      (MAlonzo.Code.Algebra.Bundles.d2256 (coe v0)) v1
      (MAlonzo.Code.Algebra.Bundles.d2258 (coe v0))
      (coe
         C673
         (coe
            MAlonzo.Code.Algebra.Structures.du1646
            (coe MAlonzo.Code.Algebra.Bundles.d2260 (coe v0)))
         (coe
            MAlonzo.Code.Algebra.Structures.d546
            (coe
               MAlonzo.Code.Algebra.Structures.d622
               (coe
                  MAlonzo.Code.Algebra.Structures.d1410
                  (coe
                     MAlonzo.Code.Algebra.Structures.d1540
                     (coe MAlonzo.Code.Algebra.Bundles.d2260 (coe v0))))))
         (coe
            MAlonzo.Code.Algebra.Properties.Ring.du254
            (coe MAlonzo.Code.Algebra.Bundles.du2372 (coe v0)))
         (coe
            MAlonzo.Code.Algebra.Properties.AbelianGroup.du174
            (coe
               MAlonzo.Code.Algebra.Bundles.du2178
               (coe MAlonzo.Code.Algebra.Bundles.du2372 (coe v0)))))
name1660
  = "Tactic.RingSolver.Core.AlmostCommutativeRing.fromCommutativeSemiring"
d1660 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Algebra.Bundles.T1828 ->
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) -> T172
d1660 v0 v1 v2 v3 = du1660 v2 v3
du1660 ::
  MAlonzo.Code.Algebra.Bundles.T1828 ->
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) -> T172
du1660 v0 v1
  = coe
      C3313 (MAlonzo.Code.Algebra.Bundles.d1852 (coe v0))
      (MAlonzo.Code.Algebra.Bundles.d1854 (coe v0)) (\ v2 -> v2)
      (MAlonzo.Code.Algebra.Bundles.d1856 (coe v0)) v1
      (MAlonzo.Code.Algebra.Bundles.d1858 (coe v0))
      (coe
         C673 (coe MAlonzo.Code.Algebra.Bundles.d1860 (coe v0))
         (coe (\ v2 v3 v4 -> v4))
         (coe
            (\ v2 v3 ->
               coe
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
                                      (coe MAlonzo.Code.Algebra.Bundles.d1860 (coe v0)))))))))
                 (coe MAlonzo.Code.Algebra.Bundles.d1854 v0 v2 v3)))
         (coe
            (\ v2 v3 ->
               coe
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
                                      (coe MAlonzo.Code.Algebra.Bundles.d1860 (coe v0)))))))))
                 (coe MAlonzo.Code.Algebra.Bundles.d1852 v0 v2 v3))))
