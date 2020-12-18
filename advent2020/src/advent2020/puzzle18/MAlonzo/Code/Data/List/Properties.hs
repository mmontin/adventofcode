{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Data.List.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.List
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Data.Bool.Base
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.Fin.Base
import qualified MAlonzo.Code.Data.List.Base
import qualified MAlonzo.Code.Data.List.Relation.Unary.All
import qualified MAlonzo.Code.Data.List.Relation.Unary.Any
import qualified MAlonzo.Code.Data.Maybe.Base
import qualified MAlonzo.Code.Data.Nat.Base
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.Product
import qualified MAlonzo.Code.Data.Sum.Base
import qualified MAlonzo.Code.Data.These.Base
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties
import qualified MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core
import qualified MAlonzo.Code.Relation.Nullary.Negation
import qualified MAlonzo.Code.Relation.Nullary.Product
import qualified MAlonzo.Code.Relation.Nullary.Reflects

name42 = "Data.List.Properties._.∷-injective"
d42 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d42 v0 v1 v2 v3 v4 v5 v6 = du42
du42 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
du42 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name44 = "Data.List.Properties._.∷-injectiveˡ"
d44 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d44 = erased
name46 = "Data.List.Properties._.∷-injectiveʳ"
d46 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d46 = erased
name48 = "Data.List.Properties._.∷-dec"
d48 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Relation.Nullary.T32 ->
  MAlonzo.Code.Relation.Nullary.T32 ->
  MAlonzo.Code.Relation.Nullary.T32
d48 v0 v1 v2 v3 v4 v5 v6 v7 = du48 v6 v7
du48 ::
  MAlonzo.Code.Relation.Nullary.T32 ->
  MAlonzo.Code.Relation.Nullary.T32 ->
  MAlonzo.Code.Relation.Nullary.T32
du48 v0 v1
  = coe
      MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
      (coe MAlonzo.Code.Data.Product.du264 erased)
      (coe MAlonzo.Code.Relation.Nullary.Product.du30 (coe v0) (coe v1))
name54 = "Data.List.Properties.≡-dec"
d54 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Relation.Nullary.T32
d54 v0 v1 v2 v3 v4 = du54 v2 v3 v4
du54 ::
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Relation.Nullary.T32
du54 v0 v1 v2
  = case coe v1 of
      []
        -> case coe v2 of
             []
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
                    (coe MAlonzo.Code.Relation.Nullary.C22 erased)
             (:) v3 v4
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      (:) v3 v4
        -> case coe v2 of
             []
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             (:) v5 v6
               -> coe du48 (coe v0 v3 v5) (coe du54 (coe v0) (coe v4) (coe v6))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name80 = "Data.List.Properties.map-id"
d80 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d80 = erased
name94 = "Data.List.Properties.map-id₂"
d94 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] ->
  MAlonzo.Code.Data.List.Relation.Unary.All.T34 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d94 = erased
name106 = "Data.List.Properties.map-++-commute"
d106 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d106 = erased
name126 = "Data.List.Properties.map-cong"
d126 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d126 = erased
name144 = "Data.List.Properties.map-cong₂"
d144 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] ->
  MAlonzo.Code.Data.List.Relation.Unary.All.T34 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d144 = erased
name154 = "Data.List.Properties.length-map"
d154 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d154 = erased
name168 = "Data.List.Properties.map-compose"
d168 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d168 = erased
name178 = "Data.List.Properties.map-injective"
d178 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny ->
   AgdaAny ->
   MAlonzo.Code.Agda.Builtin.Equality.T12 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d178 = erased
name202 = "Data.List.Properties.mapMaybe-just"
d202 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d202 = erased
name214 = "Data.List.Properties.mapMaybe-nothing"
d214 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d214 = erased
name230 = "Data.List.Properties._.mapMaybe-concatMap"
d230 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d230 = erased
name254 = "Data.List.Properties._.length-mapMaybe"
d254 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
d254 v0 v1 v2 v3 v4 v5 = du254 v4 v5
du254 ::
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
du254 v0 v1
  = case coe v1 of
      [] -> coe MAlonzo.Code.Data.Nat.Base.C10
      (:) v2 v3
        -> let v4 = coe v0 v2 in
           case coe v4 of
             MAlonzo.Code.Data.Maybe.Base.C26 -> coe du254 (coe v0) (coe v3)
             MAlonzo.Code.Data.Maybe.Base.C30 v5
               -> coe MAlonzo.Code.Data.Nat.Base.C18 (coe du254 (coe v0) (coe v3))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name278 = "Data.List.Properties.length-++"
d278 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d278 = erased
name306 = "Data.List.Properties._._.Associative"
d306 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> ([AgdaAny] -> [AgdaAny] -> [AgdaAny]) -> ()
d306 = erased
name308 = "Data.List.Properties._._.Cancellative"
d308 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> ([AgdaAny] -> [AgdaAny] -> [AgdaAny]) -> ()
d308 = erased
name316 = "Data.List.Properties._._.Conical"
d316 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> ([AgdaAny] -> [AgdaAny] -> [AgdaAny]) -> ()
d316 = erased
name322 = "Data.List.Properties._._.Identity"
d322 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> ([AgdaAny] -> [AgdaAny] -> [AgdaAny]) -> ()
d322 = erased
name336 = "Data.List.Properties._._.LeftIdentity"
d336 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> ([AgdaAny] -> [AgdaAny] -> [AgdaAny]) -> ()
d336 = erased
name348 = "Data.List.Properties._._.RightIdentity"
d348 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> ([AgdaAny] -> [AgdaAny] -> [AgdaAny]) -> ()
d348 = erased
name386 = "Data.List.Properties._._.IsMagma"
d386 a0 a1 a2 = ()
name388 = "Data.List.Properties._._.IsMonoid"
d388 a0 a1 a2 a3 = ()
name396 = "Data.List.Properties._._.IsSemigroup"
d396 a0 a1 a2 = ()
name1620 = "Data.List.Properties._.++-assoc"
d1620 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1620 = erased
name1636 = "Data.List.Properties._.++-identityˡ"
d1636 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1636 = erased
name1640 = "Data.List.Properties._.++-identityʳ"
d1640 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1640 = erased
name1648 = "Data.List.Properties._.++-identity"
d1648 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d1648 v0 v1 = du1648
du1648 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
du1648 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name1654 = "Data.List.Properties._.++-identityʳ-unique"
d1654 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1654 = erased
name1666 = "Data.List.Properties._.++-identityˡ-unique"
d1666 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1666 = erased
name1704 = "Data.List.Properties._.++-cancelˡ"
d1704 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1704 = erased
name1720 = "Data.List.Properties._.++-cancelʳ"
d1720 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1720 = erased
name1748 = "Data.List.Properties._.++-cancel"
d1748 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d1748 v0 v1 = du1748
du1748 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
du1748 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name1754 = "Data.List.Properties._.++-conicalˡ"
d1754 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1754 = erased
name1760 = "Data.List.Properties._.++-conicalʳ"
d1760 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d1760 = erased
name1762 = "Data.List.Properties._.++-conical"
d1762 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Agda.Builtin.Sigma.T14
d1762 v0 v1 = du1762
du1762 :: MAlonzo.Code.Agda.Builtin.Sigma.T14
du1762 = coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased
name1764 = "Data.List.Properties._.++-isMagma"
d1764 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Algebra.Structures.T80
d1764 v0 v1 = du1764
du1764 :: MAlonzo.Code.Algebra.Structures.T80
du1764
  = coe
      MAlonzo.Code.Algebra.Structures.C423
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du242)
      erased
name1766 = "Data.List.Properties._.++-isSemigroup"
d1766 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Algebra.Structures.T116
d1766 v0 v1 = du1766
du1766 :: MAlonzo.Code.Algebra.Structures.T116
du1766
  = coe MAlonzo.Code.Algebra.Structures.C1721 (coe du1764) erased
name1768 = "Data.List.Properties._.++-isMonoid"
d1768 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Algebra.Structures.T314
d1768 v0 v1 = du1768
du1768 :: MAlonzo.Code.Algebra.Structures.T314
du1768
  = coe
      MAlonzo.Code.Algebra.Structures.C4201 (coe du1766) (coe du1648)
name1778 = "Data.List.Properties._.++-semigroup"
d1778 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Algebra.Bundles.T80
d1778 v0 v1 = du1778
du1778 :: MAlonzo.Code.Algebra.Bundles.T80
du1778
  = coe
      MAlonzo.Code.Algebra.Bundles.C877
      (coe MAlonzo.Code.Data.List.Base.du58) (coe du1766)
name1780 = "Data.List.Properties._.++-monoid"
d1780 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> MAlonzo.Code.Algebra.Bundles.T422
d1780 v0 v1 = du1780
du1780 :: MAlonzo.Code.Algebra.Bundles.T422
du1780
  = coe
      MAlonzo.Code.Algebra.Bundles.C4689
      (coe MAlonzo.Code.Data.List.Base.du58)
      (coe MAlonzo.Code.Agda.Builtin.List.C16) (coe du1768)
name1798 = "Data.List.Properties._.alignWith-cong"
d1798 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  (MAlonzo.Code.Data.These.Base.T38 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1798 = erased
name1822 = "Data.List.Properties._.length-alignWith"
d1822 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1822 = erased
name1844 = "Data.List.Properties._.alignWith-map"
d1844 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1844 = erased
name1876 = "Data.List.Properties._.map-alignWith"
d1876 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1876 = erased
name1914 = "Data.List.Properties._.zipWith-comm"
d1914 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1914 = erased
name1954 = "Data.List.Properties._.zipWith-identityˡ"
d1954 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1954 = erased
name1962 = "Data.List.Properties._.zipWith-identityʳ"
d1962 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1962 = erased
name1972 = "Data.List.Properties._.length-zipWith"
d1972 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d1972 = erased
name2010 = "Data.List.Properties._.zipWith-map"
d2010 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2010 = erased
name2058 = "Data.List.Properties._.map-zipWith"
d2058 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2058 = erased
name2086 = "Data.List.Properties.unalignWith-this"
d2086 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2086 = erased
name2096 = "Data.List.Properties.unalignWith-that"
d2096 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2096 = erased
name2118 = "Data.List.Properties._.unalignWith-cong"
d2118 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Data.These.Base.T38) ->
  (AgdaAny -> MAlonzo.Code.Data.These.Base.T38) ->
  (AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2118 = erased
name2182 = "Data.List.Properties._.unalignWith-map"
d2182 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Data.These.Base.T38) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2182 = erased
name2234 = "Data.List.Properties._.map-unalignWith"
d2234 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Data.These.Base.T38) ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2234 = erased
name2298 = "Data.List.Properties._.unalignWith-alignWith"
d2298 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Data.These.Base.T38) ->
  (MAlonzo.Code.Data.These.Base.T38 -> AgdaAny) ->
  (MAlonzo.Code.Data.These.Base.T38 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2298 = erased
name2346 = "Data.List.Properties._.length-unzipWith₁"
d2346 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2346 = erased
name2354 = "Data.List.Properties._.length-unzipWith₂"
d2354 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2354 = erased
name2362 = "Data.List.Properties._.zipWith-unzipWith"
d2362 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2362 = erased
name2386 = "Data.List.Properties.foldr-universal"
d2386 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  ([AgdaAny] -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  (AgdaAny -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2386 = erased
name2424 = "Data.List.Properties.foldr-cong"
d2424 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2424 = erased
name2452 = "Data.List.Properties.foldr-fusion"
d2452 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2452 = erased
name2468 = "Data.List.Properties.id-is-foldr"
d2468 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2468 = erased
name2478 = "Data.List.Properties.++-is-foldr"
d2478 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2478 = erased
name2500 = "Data.List.Properties.foldr-++"
d2500 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2500 = erased
name2524 = "Data.List.Properties.map-is-foldr"
d2524 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2524 = erased
name2546 = "Data.List.Properties.foldr-∷ʳ"
d2546 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2546 = erased
name2584 = "Data.List.Properties._.foldr-forcesᵇ"
d2584 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny ->
   AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  AgdaAny ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Data.List.Relation.Unary.All.T34
d2584 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du2584 v4 v5 v6 v7 v8
du2584 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny ->
   AgdaAny -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Sigma.T14) ->
  AgdaAny ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Data.List.Relation.Unary.All.T34
du2584 v0 v1 v2 v3 v4
  = case coe v3 of
      [] -> coe MAlonzo.Code.Data.List.Relation.Unary.All.C40
      (:) v5 v6
        -> let v7
                 = coe
                     v1 v5
                     (coe MAlonzo.Code.Data.List.Base.du216 (coe v0) (coe v2) (coe v6))
                     v4 in
           case coe v7 of
             MAlonzo.Code.Agda.Builtin.Sigma.C32 v8 v9
               -> coe
                    MAlonzo.Code.Data.List.Relation.Unary.All.C50 v8
                    (coe du2584 (coe v0) (coe v1) (coe v2) (coe v6) (coe v9))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name2618 = "Data.List.Properties._.foldr-preservesᵇ"
d2618 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Data.List.Relation.Unary.All.T34 -> AgdaAny
d2618 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 = du2618 v4 v5 v6 v7 v8 v9
du2618 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  [AgdaAny] ->
  AgdaAny -> MAlonzo.Code.Data.List.Relation.Unary.All.T34 -> AgdaAny
du2618 v0 v1 v2 v3 v4 v5
  = case coe v5 of
      MAlonzo.Code.Data.List.Relation.Unary.All.C40 -> coe v4
      MAlonzo.Code.Data.List.Relation.Unary.All.C50 v8 v9
        -> case coe v3 of
             (:) v10 v11
               -> coe
                    v1 v10
                    (coe MAlonzo.Code.Data.List.Base.du216 (coe v0) (coe v2) (coe v11))
                    v8
                    (coe du2618 (coe v0) (coe v1) (coe v2) (coe v11) (coe v4) (coe v9))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name2638 = "Data.List.Properties._.foldr-preservesʳ"
d2638 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> [AgdaAny] -> AgdaAny
d2638 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du2638 v4 v5 v6 v7 v8
du2638 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> [AgdaAny] -> AgdaAny
du2638 v0 v1 v2 v3 v4
  = case coe v4 of
      [] -> coe v3
      (:) v5 v6
        -> coe
             v1 v5
             (coe MAlonzo.Code.Data.List.Base.du216 (coe v0) (coe v2) (coe v6))
             (coe du2638 (coe v0) (coe v1) (coe v2) (coe v3) (coe v6))
      _ -> MAlonzo.RTE.mazUnreachableError
name2658 = "Data.List.Properties._.foldr-preservesᵒ"
d2658 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Data.Sum.Base.T30 -> AgdaAny) ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Data.Sum.Base.T30 -> AgdaAny
d2658 v0 v1 v2 v3 v4 v5 v6 v7 v8 = du2658 v4 v5 v6 v7 v8
du2658 ::
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  (AgdaAny ->
   AgdaAny -> MAlonzo.Code.Data.Sum.Base.T30 -> AgdaAny) ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Data.Sum.Base.T30 -> AgdaAny
du2658 v0 v1 v2 v3 v4
  = case coe v3 of
      []
        -> case coe v4 of
             MAlonzo.Code.Data.Sum.Base.C38 v5 -> coe v5
             _ -> MAlonzo.RTE.mazUnreachableError
      (:) v5 v6
        -> case coe v4 of
             MAlonzo.Code.Data.Sum.Base.C38 v7
               -> coe
                    v1 v5
                    (coe MAlonzo.Code.Data.List.Base.du216 (coe v0) (coe v2) (coe v6))
                    (coe
                       MAlonzo.Code.Data.Sum.Base.C42
                       (coe du2658 (coe v0) (coe v1) (coe v2) (coe v6) (coe v4)))
             MAlonzo.Code.Data.Sum.Base.C42 v7
               -> case coe v7 of
                    MAlonzo.Code.Data.List.Relation.Unary.Any.C38 v10
                      -> coe
                           v1 v5
                           (coe MAlonzo.Code.Data.List.Base.du216 (coe v0) (coe v2) (coe v6))
                           (coe MAlonzo.Code.Data.Sum.Base.C38 (coe v10))
                    MAlonzo.Code.Data.List.Relation.Unary.Any.C46 v10
                      -> coe
                           v1 v5
                           (coe MAlonzo.Code.Data.List.Base.du216 (coe v0) (coe v2) (coe v6))
                           (coe
                              MAlonzo.Code.Data.Sum.Base.C42
                              (coe
                                 du2658 (coe v0) (coe v1) (coe v2) (coe v6)
                                 (coe MAlonzo.Code.Data.Sum.Base.C42 (coe v10))))
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name2704 = "Data.List.Properties.foldl-++"
d2704 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2704 = erased
name2730 = "Data.List.Properties.foldl-∷ʳ"
d2730 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2730 = erased
name2750 = "Data.List.Properties.concat-map"
d2750 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [[AgdaAny]] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2750 = erased
name2772 = "Data.List.Properties.sum-++-commute"
d2772 ::
  [Integer] -> [Integer] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2772 = erased
name2788 = "Data.List.Properties.length-replicate"
d2788 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> Integer -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2788 = erased
name2796 = "Data.List.Properties.scanr-defn"
d2796 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2796 = erased
name2878 = "Data.List.Properties.scanl-defn"
d2878 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2878 = erased
name2902 = "Data.List.Properties.length-applyUpTo"
d2902 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (Integer -> AgdaAny) ->
  Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2902 = erased
name2916 = "Data.List.Properties.lookup-applyUpTo"
d2916 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (Integer -> AgdaAny) ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2916 = erased
name2938 = "Data.List.Properties._.length-applyDownFrom"
d2938 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (Integer -> AgdaAny) ->
  Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2938 = erased
name2946 = "Data.List.Properties._.lookup-applyDownFrom"
d2946 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (Integer -> AgdaAny) ->
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2946 = erased
name2956 = "Data.List.Properties.length-upTo"
d2956 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2956 = erased
name2962 = "Data.List.Properties.lookup-upTo"
d2962 ::
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2962 = erased
name2966 = "Data.List.Properties.length-downFrom"
d2966 :: Integer -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2966 = erased
name2972 = "Data.List.Properties.lookup-downFrom"
d2972 ::
  Integer ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2972 = erased
name2980 = "Data.List.Properties.tabulate-cong"
d2980 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  Integer ->
  (MAlonzo.Code.Data.Fin.Base.T6 -> AgdaAny) ->
  (MAlonzo.Code.Data.Fin.Base.T6 -> AgdaAny) ->
  (MAlonzo.Code.Data.Fin.Base.T6 ->
   MAlonzo.Code.Agda.Builtin.Equality.T12) ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d2980 = erased
name2990 = "Data.List.Properties.tabulate-lookup"
d2990 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d2990 = erased
name3002 = "Data.List.Properties.length-tabulate"
d3002 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  Integer ->
  (MAlonzo.Code.Data.Fin.Base.T6 -> AgdaAny) ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3002 = erased
name3020 = "Data.List.Properties.lookup-tabulate"
d3020 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  Integer ->
  (MAlonzo.Code.Data.Fin.Base.T6 -> AgdaAny) ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3020 = erased
name3034 = "Data.List.Properties.map-tabulate"
d3034 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  Integer ->
  (MAlonzo.Code.Data.Fin.Base.T6 -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3034 = erased
name3054 = "Data.List.Properties.length-%="
d3054 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  (AgdaAny -> AgdaAny) -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3054 = erased
name3076 = "Data.List.Properties.length-∷="
d3076 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3076 = erased
name3094 = "Data.List.Properties.map-∷="
d3094 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  AgdaAny ->
  (AgdaAny -> AgdaAny) -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3094 = erased
name3120 = "Data.List.Properties.length-─"
d3120 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3120 = erased
name3142 = "Data.List.Properties.map-─"
d3142 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  MAlonzo.Code.Data.Fin.Base.T6 ->
  (AgdaAny -> AgdaAny) -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3142 = erased
name3164 = "Data.List.Properties.length-take"
d3164 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3164 = erased
name3180 = "Data.List.Properties.length-drop"
d3180 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3180 = erased
name3196 = "Data.List.Properties.take++drop"
d3196 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3196 = erased
name3212 = "Data.List.Properties.splitAt-defn"
d3212 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  Integer -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3212 = erased
name3256 = "Data.List.Properties._.takeWhile++dropWhile"
d3256 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3256 = erased
name3276 = "Data.List.Properties._.span-defn"
d3276 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3276 = erased
name3310 = "Data.List.Properties._.length-filter"
d3310 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
d3310 v0 v1 v2 v3 v4 v5 = du3310 v4 v5
du3310 ::
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
du3310 v0 v1
  = case coe v1 of
      [] -> coe MAlonzo.Code.Data.Nat.Base.C10
      (:) v2 v3
        -> let v4 = MAlonzo.Code.Relation.Nullary.d42 (coe v0 v2) in
           if coe v4
             then coe
                    MAlonzo.Code.Data.Nat.Base.C18 (coe du3310 (coe v0) (coe v3))
             else coe du3310 (coe v0) (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
name3330 = "Data.List.Properties._.filter-all"
d3330 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] ->
  MAlonzo.Code.Data.List.Relation.Unary.All.T34 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3330 = erased
name3366 = "Data.List.Properties._.filter-notAll"
d3366 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] ->
  MAlonzo.Code.Data.List.Relation.Unary.Any.T26 ->
  MAlonzo.Code.Data.Nat.Base.T6
d3366 v0 v1 v2 v3 v4 v5 v6 = du3366 v4 v5 v6
du3366 ::
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] ->
  MAlonzo.Code.Data.List.Relation.Unary.Any.T26 ->
  MAlonzo.Code.Data.Nat.Base.T6
du3366 v0 v1 v2
  = case coe v1 of
      (:) v3 v4
        -> case coe v2 of
             MAlonzo.Code.Data.List.Relation.Unary.Any.C38 v7
               -> let v8 = coe v0 v3 in
                  case coe v8 of
                    MAlonzo.Code.Relation.Nullary.C46 v9 v10
                      -> if coe v9
                           then coe
                                  seq (coe v10) (coe MAlonzo.Code.Data.Empty.d10 () erased erased)
                           else coe
                                  MAlonzo.Code.Data.Nat.Base.C18 (coe du3310 (coe v0) (coe v4))
                    _ -> MAlonzo.RTE.mazUnreachableError
             MAlonzo.Code.Data.List.Relation.Unary.Any.C46 v7
               -> let v8 = MAlonzo.Code.Relation.Nullary.d42 (coe v0 v3) in
                  if coe v8
                    then coe
                           MAlonzo.Code.Data.Nat.Base.C18
                           (coe du3366 (coe v0) (coe v4) (coe v7))
                    else coe du3366 (coe v0) (coe v4) (coe v7)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name3416 = "Data.List.Properties._.filter-some"
d3416 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] ->
  MAlonzo.Code.Data.List.Relation.Unary.Any.T26 ->
  MAlonzo.Code.Data.Nat.Base.T6
d3416 v0 v1 v2 v3 v4 v5 v6 = du3416 v4 v5 v6
du3416 ::
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] ->
  MAlonzo.Code.Data.List.Relation.Unary.Any.T26 ->
  MAlonzo.Code.Data.Nat.Base.T6
du3416 v0 v1 v2
  = case coe v1 of
      (:) v3 v4
        -> case coe v2 of
             MAlonzo.Code.Data.List.Relation.Unary.Any.C38 v7
               -> let v8 = coe v0 v3 in
                  case coe v8 of
                    MAlonzo.Code.Relation.Nullary.C46 v9 v10
                      -> if coe v9
                           then coe
                                  MAlonzo.Code.Data.Nat.Base.C18
                                  (coe MAlonzo.Code.Data.Nat.Base.C10)
                           else coe
                                  seq (coe v10) (coe MAlonzo.Code.Data.Empty.d10 () erased erased)
                    _ -> MAlonzo.RTE.mazUnreachableError
             MAlonzo.Code.Data.List.Relation.Unary.Any.C46 v7
               -> let v8 = MAlonzo.Code.Relation.Nullary.d42 (coe v0 v3) in
                  coe seq (coe v8) (coe du3416 (coe v0) (coe v4) (coe v7))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name3466 = "Data.List.Properties._.filter-none"
d3466 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] ->
  MAlonzo.Code.Data.List.Relation.Unary.All.T34 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3466 = erased
name3500 = "Data.List.Properties._.filter-complete"
d3500 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3500 = erased
name3532 = "Data.List.Properties._.filter-accept"
d3532 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  AgdaAny ->
  [AgdaAny] -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3532 = erased
name3556 = "Data.List.Properties._.filter-reject"
d3556 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  AgdaAny ->
  [AgdaAny] ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3556 = erased
name3576 = "Data.List.Properties._.filter-idem"
d3576 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3576 = erased
name3606 = "Data.List.Properties._.filter-++"
d3606 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3606 = erased
name3648 = "Data.List.Properties._.length-derun"
d3648 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
d3648 v0 v1 v2 v3 v4 v5 = du3648 v4 v5
du3648 ::
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
du3648 v0 v1
  = case coe v1 of
      []
        -> coe
             MAlonzo.Code.Data.Nat.Properties.d1422
             (coe
                MAlonzo.Code.Data.List.Base.du272
                (coe MAlonzo.Code.Data.List.Base.du678 (coe v0) (coe v1)))
      (:) v2 v3
        -> case coe v3 of
             []
               -> coe
                    MAlonzo.Code.Data.Nat.Properties.d1422
                    (coe
                       MAlonzo.Code.Data.List.Base.du272
                       (coe MAlonzo.Code.Data.List.Base.du678 (coe v0) (coe v1)))
             (:) v4 v5
               -> let v6 = MAlonzo.Code.Relation.Nullary.d42 (coe v0 v2 v4) in
                  let v7 = coe du3648 (coe v0) (coe v3) in
                  if coe v6 then coe v7 else coe MAlonzo.Code.Data.Nat.Base.C18 v7
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name3680 = "Data.List.Properties._.length-deduplicate"
d3680 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
d3680 v0 v1 v2 v3 v4 v5 = du3680 v4 v5
du3680 ::
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
du3680 v0 v1
  = case coe v1 of
      [] -> coe MAlonzo.Code.Data.Nat.Base.C10
      (:) v2 v3
        -> coe
             MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du160
             (coe MAlonzo.Code.Data.Nat.Properties.d1472)
             (\ v4 v5 v6 -> coe MAlonzo.Code.Data.Nat.Properties.du1520 v5 v6)
             (coe
                MAlonzo.Code.Data.List.Base.du272
                (coe MAlonzo.Code.Data.List.Base.du720 (coe v0) (coe v1)))
             (coe MAlonzo.Code.Data.List.Base.du272 v1)
             (coe
                MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                (\ v4 v5 v6 v7 v8 ->
                   coe MAlonzo.Code.Data.Nat.Properties.du1640 v7 v8)
                (coe
                   addInt (coe (1 :: Integer))
                   (coe
                      MAlonzo.Code.Data.List.Base.du272
                      (coe
                         MAlonzo.Code.Data.List.Base.du578
                         (coe
                            (\ v4 ->
                               coe MAlonzo.Code.Relation.Nullary.Negation.du52 (coe v0 v2 v4)))
                         (coe du3690 (coe v0) (coe v3)))))
                (coe
                   addInt (coe (1 :: Integer))
                   (coe
                      MAlonzo.Code.Data.List.Base.du272 (coe du3690 (coe v0) (coe v3))))
                (coe MAlonzo.Code.Data.List.Base.du272 v1)
                (coe
                   MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.du228
                   (coe MAlonzo.Code.Data.Nat.Properties.d1472)
                   (\ v4 v5 v6 v7 v8 ->
                      coe MAlonzo.Code.Data.Nat.Properties.du1640 v7 v8)
                   (coe
                      addInt (coe (1 :: Integer))
                      (coe
                         MAlonzo.Code.Data.List.Base.du272 (coe du3690 (coe v0) (coe v3))))
                   (coe
                      addInt (coe (1 :: Integer))
                      (coe MAlonzo.Code.Data.List.Base.du272 v3))
                   (coe MAlonzo.Code.Data.List.Base.du272 v1)
                   (coe
                      MAlonzo.Code.Relation.Binary.Reasoning.Base.Triple.C86
                      (coe
                         MAlonzo.Code.Relation.Binary.Structures.d34
                         (MAlonzo.Code.Relation.Binary.Structures.d80
                            (coe MAlonzo.Code.Data.Nat.Properties.d1472))
                         (addInt
                            (coe (1 :: Integer)) (coe MAlonzo.Code.Data.List.Base.du272 v3))))
                   (coe
                      MAlonzo.Code.Data.Nat.Base.C18 (coe du3680 (coe v0) (coe v3))))
                (coe
                   MAlonzo.Code.Data.Nat.Base.C18
                   (coe
                      du3310
                      (coe
                         (\ v4 ->
                            coe MAlonzo.Code.Relation.Nullary.Negation.du52 (coe v0 v2 v4)))
                      (coe du3690 (coe v0) (coe v3)))))
      _ -> MAlonzo.RTE.mazUnreachableError
name3690 = "Data.List.Properties._._.r"
d3690 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  AgdaAny -> [AgdaAny] -> [AgdaAny]
d3690 v0 v1 v2 v3 v4 v5 v6 = du3690 v4 v6
du3690 ::
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> [AgdaAny]
du3690 v0 v1
  = coe MAlonzo.Code.Data.List.Base.du720 (coe v0) (coe v1)
name3698 = "Data.List.Properties._.derun-reject"
d3698 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] -> AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3698 = erased
name3736 = "Data.List.Properties._.derun-accept"
d3736 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny -> ()) ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  (AgdaAny -> MAlonzo.Code.Data.Empty.T4) ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3736 = erased
name3780 = "Data.List.Properties._.partition-defn"
d3780 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3780 = erased
name3806 = "Data.List.Properties.ʳ++-defn"
d3806 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3806 = erased
name3822 = "Data.List.Properties.ʳ++-++"
d3822 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3822 = erased
name3838 = "Data.List.Properties.ʳ++-ʳ++"
d3838 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3838 = erased
name3852 = "Data.List.Properties.length-ʳ++"
d3852 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3852 = erased
name3866 = "Data.List.Properties.map-ʳ++"
d3866 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3866 = erased
name3886 = "Data.List.Properties.foldr-ʳ++"
d3886 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3886 = erased
name3910 = "Data.List.Properties.foldl-ʳ++"
d3910 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3910 = erased
name3930 = "Data.List.Properties.unfold-reverse"
d3930 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3930 = erased
name3940 = "Data.List.Properties.reverse-++-commute"
d3940 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3940 = erased
name3946 = "Data.List.Properties.reverse-involutive"
d3946 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3946 = erased
name3954 = "Data.List.Properties.reverse-injective"
d3954 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d3954 = erased
name3958 = "Data.List.Properties.length-reverse"
d3958 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3958 = erased
name3964 = "Data.List.Properties.reverse-map-commute"
d3964 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3964 = erased
name3974 = "Data.List.Properties.reverse-foldr"
d3974 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3974 = erased
name3988 = "Data.List.Properties.reverse-foldl"
d3988 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d3988 = erased
name4010 = "Data.List.Properties._.∷ʳ-injective"
d4010 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d4010 v0 v1 v2 v3 v4 v5 v6 = du4010 v4 v5
du4010 ::
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Sigma.T14
du4010 v0 v1
  = case coe v0 of
      []
        -> coe
             seq (coe v1)
             (coe MAlonzo.Code.Agda.Builtin.Sigma.C32 erased erased)
      (:) v2 v3
        -> case coe v1 of
             (:) v4 v5
               -> let v6 = coe du42 in
                  coe
                    seq (coe v6)
                    (coe
                       MAlonzo.Code.Data.Product.du148 erased (coe (\ v7 v8 -> v8))
                       (coe du4010 (coe v3) (coe v5)))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name4044 = "Data.List.Properties._.∷ʳ-injectiveˡ"
d4044 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4044 = erased
name4056 = "Data.List.Properties._.∷ʳ-injectiveʳ"
d4056 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  AgdaAny ->
  AgdaAny ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4056 = erased
name4064 = "Data.List.Properties.gfilter-just"
d4064 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4064 = erased
name4066 = "Data.List.Properties.gfilter-nothing"
d4066 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4066 = erased
name4068 = "Data.List.Properties.gfilter-concatMap"
d4068 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4068 = erased
name4070 = "Data.List.Properties.length-gfilter"
d4070 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> MAlonzo.Code.Data.Maybe.Base.T22) ->
  [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
d4070 v0 v1 v2 v3 v4 v5 = coe du254 v4 v5
name4072 = "Data.List.Properties.right-identity-unique"
d4072 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4072 = erased
name4074 = "Data.List.Properties.left-identity-unique"
d4074 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d4074 = erased
name4086 = "Data.List.Properties._.boolTakeWhile++boolDropWhile"
d4086 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> Bool) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4086 = erased
name4106 = "Data.List.Properties._.boolSpan-defn"
d4106 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> Bool) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4106 = erased
name4128 = "Data.List.Properties._.length-boolFilter"
d4128 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> Bool) -> [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
d4128 v0 v1 v2 v3 = du4128 v2 v3
du4128 ::
  (AgdaAny -> Bool) -> [AgdaAny] -> MAlonzo.Code.Data.Nat.Base.T6
du4128 v0 v1
  = coe
      du254
      (coe
         (\ v2 ->
            coe
              MAlonzo.Code.Data.Bool.Base.du42 (coe v0 v2)
              (coe MAlonzo.Code.Data.Maybe.Base.C30 (coe v2))
              (coe MAlonzo.Code.Data.Maybe.Base.C26)))
      (coe v1)
name4134 = "Data.List.Properties._.boolPartition-defn"
d4134 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> Bool) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4134 = erased
name4170 = "Data.List.Properties._.boolFilter-filters"
d4170 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> ()) ->
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Data.List.Relation.Unary.All.T34
d4170 v0 v1 v2 v3 v4 v5 = du4170 v4 v5
du4170 ::
  (AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  [AgdaAny] -> MAlonzo.Code.Data.List.Relation.Unary.All.T34
du4170 v0 v1
  = case coe v1 of
      [] -> coe MAlonzo.Code.Data.List.Relation.Unary.All.C40
      (:) v2 v3
        -> let v4 = coe v0 v2 in
           case coe v4 of
             MAlonzo.Code.Relation.Nullary.C46 v5 v6
               -> if coe v5
                    then coe
                           MAlonzo.Code.Data.List.Relation.Unary.All.C50
                           (coe MAlonzo.Code.Relation.Nullary.Reflects.du20 (coe v6))
                           (coe du4170 (coe v0) (coe v3))
                    else coe du4170 (coe v0) (coe v3)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name4190 = "Data.List.Properties.idIsFold"
d4190 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4190 = erased
name4192 = "Data.List.Properties.++IsFold"
d4192 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  [AgdaAny] -> [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4192 = erased
name4194 = "Data.List.Properties.mapIsFold"
d4194 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  [AgdaAny] -> MAlonzo.Code.Agda.Builtin.Equality.T12
d4194 = erased
name4223 = "Data.List.Properties..absurdlambda"
d4223 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  AgdaAny ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4223 = erased
name4413 = "Data.List.Properties..absurdlambda"
d4413 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  (AgdaAny -> AgdaAny -> MAlonzo.Code.Relation.Nullary.T32) ->
  AgdaAny ->
  [AgdaAny] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4413 = erased
