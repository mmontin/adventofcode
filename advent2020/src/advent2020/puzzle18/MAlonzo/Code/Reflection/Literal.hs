{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.Literal where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Float
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Data.Char.Properties
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.Float.Properties
import qualified MAlonzo.Code.Data.Nat.Properties
import qualified MAlonzo.Code.Data.String.Properties
import qualified MAlonzo.Code.Data.Word.Properties
import qualified MAlonzo.Code.Reflection.Meta
import qualified MAlonzo.Code.Reflection.Name
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core

name8 = "Reflection.Literal.meta-injective"
d8 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d8 = erased
name14 = "Reflection.Literal.nat-injective"
d14 ::
  Integer ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d14 = erased
name20 = "Reflection.Literal.word64-injective"
d20 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d20 = erased
name26 = "Reflection.Literal.float-injective"
d26 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d26 = erased
name32 = "Reflection.Literal.char-injective"
d32 ::
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d32 = erased
name38 = "Reflection.Literal.string-injective"
d38 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d38 = erased
name44 = "Reflection.Literal.name-injective"
d44 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d44 = erased
name46 = "Reflection.Literal._≟_"
d46 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Relation.Nullary.T32
d46 v0 v1
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C106 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C106 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Data.Nat.Properties.d1360 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C110 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C114 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C118 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C122 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C126 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C130 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C110 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C106 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C110 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Data.Word.Properties.d52 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C114 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C118 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C122 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C126 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C130 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C114 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C106 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C110 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C114 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Data.Float.Properties.d52 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C118 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C122 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C126 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C130 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C118 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C106 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C110 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C114 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C118 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Data.Char.Properties.d52 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C122 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C126 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C130 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C122 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C106 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C110 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C114 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C118 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C122 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Data.String.Properties.d64 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C126 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C130 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C126 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C106 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C110 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C114 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C118 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C122 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C126 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Reflection.Name.d10 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C130 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C130 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C106 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C110 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C114 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C118 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C122 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C126 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C130 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Reflection.Meta.d8 (coe v2) (coe v3))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name1633 = "Reflection.Literal..absurdlambda"
d1633 ::
  Integer ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1633 = erased
name1711 = "Reflection.Literal..absurdlambda"
d1711 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1711 = erased
name1789 = "Reflection.Literal..absurdlambda"
d1789 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1789 = erased
name1867 = "Reflection.Literal..absurdlambda"
d1867 ::
  Integer ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1867 = erased
name1945 = "Reflection.Literal..absurdlambda"
d1945 ::
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d1945 = erased
name2023 = "Reflection.Literal..absurdlambda"
d2023 ::
  Integer ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2023 = erased
name2269 = "Reflection.Literal..absurdlambda"
d2269 ::
  MAlonzo.RTE.Word64 ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2269 = erased
name2347 = "Reflection.Literal..absurdlambda"
d2347 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2347 = erased
name2425 = "Reflection.Literal..absurdlambda"
d2425 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2425 = erased
name2503 = "Reflection.Literal..absurdlambda"
d2503 ::
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2503 = erased
name2581 = "Reflection.Literal..absurdlambda"
d2581 ::
  MAlonzo.RTE.Word64 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2581 = erased
name2659 = "Reflection.Literal..absurdlambda"
d2659 ::
  MAlonzo.RTE.Word64 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2659 = erased
name2737 = "Reflection.Literal..absurdlambda"
d2737 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2737 = erased
name2815 = "Reflection.Literal..absurdlambda"
d2815 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d2815 = erased
name3061 = "Reflection.Literal..absurdlambda"
d3061 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3061 = erased
name3139 = "Reflection.Literal..absurdlambda"
d3139 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3139 = erased
name3217 = "Reflection.Literal..absurdlambda"
d3217 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3217 = erased
name3295 = "Reflection.Literal..absurdlambda"
d3295 ::
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3295 = erased
name3373 = "Reflection.Literal..absurdlambda"
d3373 ::
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3373 = erased
name3451 = "Reflection.Literal..absurdlambda"
d3451 ::
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3451 = erased
name3529 = "Reflection.Literal..absurdlambda"
d3529 ::
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3529 = erased
name3775 = "Reflection.Literal..absurdlambda"
d3775 ::
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3775 = erased
name3853 = "Reflection.Literal..absurdlambda"
d3853 ::
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3853 = erased
name3931 = "Reflection.Literal..absurdlambda"
d3931 ::
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3931 = erased
name4009 = "Reflection.Literal..absurdlambda"
d4009 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4009 = erased
name4087 = "Reflection.Literal..absurdlambda"
d4087 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4087 = erased
name4165 = "Reflection.Literal..absurdlambda"
d4165 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4165 = erased
name4243 = "Reflection.Literal..absurdlambda"
d4243 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4243 = erased
name4489 = "Reflection.Literal..absurdlambda"
d4489 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4489 = erased
name4567 = "Reflection.Literal..absurdlambda"
d4567 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4567 = erased
name4645 = "Reflection.Literal..absurdlambda"
d4645 ::
  AgdaAny ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4645 = erased
name4723 = "Reflection.Literal..absurdlambda"
d4723 ::
  AgdaAny ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4723 = erased
name4801 = "Reflection.Literal..absurdlambda"
d4801 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4801 = erased
name4879 = "Reflection.Literal..absurdlambda"
d4879 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4879 = erased
name4957 = "Reflection.Literal..absurdlambda"
d4957 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4957 = erased
name5203 = "Reflection.Literal..absurdlambda"
d5203 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5203 = erased
name5281 = "Reflection.Literal..absurdlambda"
d5281 ::
  AgdaAny ->
  Integer ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5281 = erased
name5359 = "Reflection.Literal..absurdlambda"
d5359 ::
  AgdaAny ->
  MAlonzo.RTE.Word64 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5359 = erased
name5437 = "Reflection.Literal..absurdlambda"
d5437 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Float.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5437 = erased
name5515 = "Reflection.Literal..absurdlambda"
d5515 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Char.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5515 = erased
name5593 = "Reflection.Literal..absurdlambda"
d5593 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5593 = erased
name5671 = "Reflection.Literal..absurdlambda"
d5671 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5671 = erased
