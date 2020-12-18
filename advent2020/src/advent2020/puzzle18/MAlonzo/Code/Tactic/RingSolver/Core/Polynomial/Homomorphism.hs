{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Data.Fin.Base
import qualified MAlonzo.Code.Data.Vec.Base
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Addition
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Constants
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Multiplication
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables
import qualified MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters

name22
  = "Tactic.RingSolver.Core.Polynomial.Homomorphism._.pow-cong"
d22 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> AgdaAny -> Integer -> AgdaAny -> AgdaAny
d22 v0 v1 v2 v3 v4 = du22 v4
du22 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  AgdaAny -> AgdaAny -> Integer -> AgdaAny -> AgdaAny
du22 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Lemmas.du634
      (coe v0)
name26 = "Tactic.RingSolver.Core.Polynomial.Homomorphism._.⊞-hom"
d26 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d26 v0 v1 v2 v3 v4 v5 v6 v7
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Addition.du480
      (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) v6 v7
name30 = "Tactic.RingSolver.Core.Polynomial.Homomorphism._.⊠-hom"
d30 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d30 v0 v1 v2 v3 v4 v5 v6
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Multiplication.du878
      (coe v0) (coe v1) (coe v2) (coe v3) (coe v4) v6
name34 = "Tactic.RingSolver.Core.Polynomial.Homomorphism._.⊟-hom"
d34 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d34 v0 v1 v2 v3 v4 = du34 v4
du34 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du34 v0 v1
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Negation.du512
      (coe v0)
name38 = "Tactic.RingSolver.Core.Polynomial.Homomorphism._.⊡-hom"
d38 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Base.T166 ->
  Integer -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d38 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Exponentiation.d600
      (coe v0) (coe v1) (coe v2) (coe v3) (coe v4)
name42 = "Tactic.RingSolver.Core.Polynomial.Homomorphism._.κ-hom"
d42 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer -> AgdaAny -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d42 v0 v1 v2 v3 v4 = du42 v4
du42 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer -> AgdaAny -> MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du42 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Constants.du376
      (coe v0) v2
name46 = "Tactic.RingSolver.Core.Polynomial.Homomorphism._.ι-hom"
d46 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
d46 v0 v1 v2 v3 v4 = du46 v4
du46 ::
  MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Parameters.T56 ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Data.Vec.Base.T24 -> AgdaAny
du46 v0
  = coe
      MAlonzo.Code.Tactic.RingSolver.Core.Polynomial.Homomorphism.Variables.du480
      (coe v0)
