{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.Argument.Relevance where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Relation.Nullary

name6 = "Reflection.Argument.Relevance._≟_"
d6 ::
  MAlonzo.Code.Agda.Builtin.Reflection.T56 ->
  MAlonzo.Code.Agda.Builtin.Reflection.T56 ->
  MAlonzo.Code.Relation.Nullary.T32
d6 v0 v1
  = case coe v0 of
      MAlonzo.Code.Agda.Builtin.Reflection.C58
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C58
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
                    (coe MAlonzo.Code.Relation.Nullary.C22 erased)
             MAlonzo.Code.Agda.Builtin.Reflection.C60
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             _ -> MAlonzo.RTE.mazUnreachableError
      MAlonzo.Code.Agda.Builtin.Reflection.C60
        -> case coe v1 of
             MAlonzo.Code.Agda.Builtin.Reflection.C58
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C8)
                    (coe MAlonzo.Code.Relation.Nullary.C26)
             MAlonzo.Code.Agda.Builtin.Reflection.C60
               -> coe
                    MAlonzo.Code.Relation.Nullary.C46
                    (coe MAlonzo.Code.Agda.Builtin.Bool.C10)
                    (coe MAlonzo.Code.Relation.Nullary.C22 erased)
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
name75 = "Reflection.Argument.Relevance..absurdlambda"
d75 ::
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d75 = erased
name105 = "Reflection.Argument.Relevance..absurdlambda"
d105 ::
  MAlonzo.Code.Agda.Builtin.Equality.T12 ->
  MAlonzo.Code.Data.Empty.T4
d105 = erased
