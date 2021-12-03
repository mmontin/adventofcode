{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.Pattern where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.List.Properties
import qualified MAlonzo.Code.Data.Product
import qualified MAlonzo.Code.Data.String.Properties
import qualified MAlonzo.Code.Reflection.Argument
import qualified MAlonzo.Code.Reflection.Literal
import qualified MAlonzo.Code.Reflection.Name
import qualified MAlonzo.Code.Relation.Nullary
import qualified MAlonzo.Code.Relation.Nullary.Decidable.Core
import qualified MAlonzo.Code.Relation.Nullary.Product

name12 = "Reflection.Pattern.con-injective₁"
d12 ::
  AgdaAny ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d12 = erased
name22 = "Reflection.Pattern.con-injective₂"
d22 ::
  AgdaAny ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d22 = erased
name32 = "Reflection.Pattern.con-injective"
d32 ::
  AgdaAny ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
d32 v0 v1 v2 v3 = du32
du32 ::
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T14
du32 = coe MAlonzo.Code.Data.Product.du132 erased erased
name38 = "Reflection.Pattern.var-injective"
d38 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d38 = erased
name44 = "Reflection.Pattern.lit-injective"
d44 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d44 = erased
name50 = "Reflection.Pattern.proj-injective"
d50 ::
  AgdaAny ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12
d50 = erased
name52 = "Reflection.Pattern._≟s_"
d52 ::
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Relation.Nullary.T32
d52 v0 v1
  = case coe v0 of
      []
        -> case coe v1 of
             []
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
                    (coe MAlonzo.Code.Relation.Nullary.C22 erased)
             (:) v2 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      (:) v2 v3
        -> case coe v2 of
             MAlonzo.Code.Agda.Builtin.Reflection.C84 v4 v5
               -> case coe v1 of
                    []
                      -> coe
                           MAlonzo.Code.Relation.Nullary.C46
                           (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                           (coe MAlonzo.Code.Relation.Nullary.C26)
                    (:) v6 v7
                      -> case coe v6 of
                           MAlonzo.Code.Agda.Builtin.Reflection.C84 v8 v9
                             -> coe
                                  MAlonzo.Code.Data.List.Properties.du48
                                  (coe
                                     MAlonzo.Code.Reflection.Argument.du98 (coe v2) (coe v6)
                                     (coe d54 (coe v5) (coe v9)))
                                  (coe d52 (coe v3) (coe v7))
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name54 = "Reflection.Pattern._≟_"
d54 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T132 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T132 ->
  MAlonzo.Code.Relation.Nullary.T32
d54 v0 v1
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C138 v2 v3
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C138 v4 v5
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168
                    (coe MAlonzo.Code.Data.Product.du264 erased)
                    (coe
                       MAlonzo.Code.Relation.Nullary.Product.du30
                       (coe MAlonzo.Code.Reflection.Name.d10 (coe v2) (coe v4))
                       (coe d52 (coe v3) (coe v5)))
             MAlonzo.Code.Agda.Builtin.Reflection.C140
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C144 v4
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C148 v4
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C152 v4
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C154
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C140
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C138 v2 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C140
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
                    (coe MAlonzo.Code.Relation.Nullary.C22 erased)
             MAlonzo.Code.Agda.Builtin.Reflection.C144 v2
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C148 v2
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C152 v2
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C154
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C144 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C138 v3 v4
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C140
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C144 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Data.String.Properties.d64 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C148 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C152 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C154
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C148 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C138 v3 v4
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C140
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C144 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C148 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Reflection.Literal.d46 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C152 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C154
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C152 v2
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C138 v3 v4
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C140
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C144 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C148 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C152 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.Decidable.Core.du168 erased
                    (coe MAlonzo.Code.Reflection.Name.d10 (coe v2) (coe v3))
             MAlonzo.Code.Agda.Builtin.Reflection.C154
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C154
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C138 v2 v3
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C140
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C144 v2
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C148 v2
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C152 v2
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C154
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
                    (coe MAlonzo.Code.Relation.Nullary.C22 erased)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name3175 = "Reflection.Pattern..absurdlambda"
d3175 ::
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3175 = erased
name3283 = "Reflection.Pattern..absurdlambda"
d3283 ::
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3283 = erased
name3391 = "Reflection.Pattern..absurdlambda"
d3391 ::
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3391 = erased
name3499 = "Reflection.Pattern..absurdlambda"
d3499 ::
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3499 = erased
name3589 = "Reflection.Pattern..absurdlambda"
d3589 ::
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3589 = erased
name3655 = "Reflection.Pattern..absurdlambda"
d3655 ::
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3655 = erased
name3725 = "Reflection.Pattern..absurdlambda"
d3725 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3725 = erased
name3773 = "Reflection.Pattern..absurdlambda"
d3773 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3773 = erased
name3821 = "Reflection.Pattern..absurdlambda"
d3821 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3821 = erased
name3851 = "Reflection.Pattern..absurdlambda"
d3851 ::
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3851 = erased
name3947 = "Reflection.Pattern..absurdlambda"
d3947 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d3947 = erased
name4007 = "Reflection.Pattern..absurdlambda"
d4007 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4007 = erased
name4085 = "Reflection.Pattern..absurdlambda"
d4085 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4085 = erased
name4163 = "Reflection.Pattern..absurdlambda"
d4163 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4163 = erased
name4223 = "Reflection.Pattern..absurdlambda"
d4223 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4223 = erased
name4319 = "Reflection.Pattern..absurdlambda"
d4319 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4319 = erased
name4379 = "Reflection.Pattern..absurdlambda"
d4379 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4379 = erased
name4459 = "Reflection.Pattern..absurdlambda"
d4459 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4459 = erased
name4537 = "Reflection.Pattern..absurdlambda"
d4537 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4537 = erased
name4597 = "Reflection.Pattern..absurdlambda"
d4597 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4597 = erased
name4693 = "Reflection.Pattern..absurdlambda"
d4693 ::
  AgdaAny ->
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4693 = erased
name4753 = "Reflection.Pattern..absurdlambda"
d4753 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4753 = erased
name4833 = "Reflection.Pattern..absurdlambda"
d4833 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4833 = erased
name4911 = "Reflection.Pattern..absurdlambda"
d4911 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4911 = erased
name4971 = "Reflection.Pattern..absurdlambda"
d4971 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d4971 = erased
name5037 = "Reflection.Pattern..absurdlambda"
d5037 ::
  AgdaAny ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5037 = erased
name5067 = "Reflection.Pattern..absurdlambda"
d5067 ::
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5067 = erased
name5117 = "Reflection.Pattern..absurdlambda"
d5117 ::
  MAlonzo.Code.Agda.Builtin.String.T6 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5117 = erased
name5165 = "Reflection.Pattern..absurdlambda"
d5165 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T102 ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5165 = erased
name5213 = "Reflection.Pattern..absurdlambda"
d5213 ::
  AgdaAny ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d5213 = erased
name6103 = "Reflection.Pattern..absurdlambda"
d6103 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d6103 = erased
name6197 = "Reflection.Pattern..absurdlambda"
d6197 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T74 ->
  [MAlonzo.Code.Agda.Builtin.Reflection.T74] ->
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d6197 = erased
