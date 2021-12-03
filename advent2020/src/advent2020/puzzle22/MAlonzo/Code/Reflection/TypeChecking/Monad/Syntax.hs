{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification,
             ScopedTypeVariables, NoMonomorphismRestriction, RankNTypes,
             PatternSynonyms #-}
module MAlonzo.Code.Reflection.TypeChecking.Monad.Syntax where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, eqFloat, add64, sub64,
                    mul64, quot64, rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Reflection
import qualified MAlonzo.Code.Agda.Primitive

name16 = "Reflection.TypeChecking.Monad.Syntax.pure"
d16 :: MAlonzo.Code.Agda.Primitive.T4 -> () -> AgdaAny -> AgdaAny
d16 v0 v1 = du16 v0
du16 :: MAlonzo.Code.Agda.Primitive.T4 -> AgdaAny -> AgdaAny
du16 v0 = coe MAlonzo.Code.Agda.Builtin.Reflection.d276 v0 erased
name18 = "Reflection.TypeChecking.Monad.Syntax._<|>_"
d18 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> AgdaAny -> AgdaAny
d18 v0 v1 = du18 v0
du18 ::
  MAlonzo.Code.Agda.Primitive.T4 -> AgdaAny -> AgdaAny -> AgdaAny
du18 v0 = coe MAlonzo.Code.Agda.Builtin.Reflection.d308 v0 erased
name20 = "Reflection.TypeChecking.Monad.Syntax._>>=_"
d20 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d20 v0 v1 v2 v3 = du20 v0 v2
du20 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du20 v0 v1
  = coe MAlonzo.Code.Agda.Builtin.Reflection.d286 v0 v1 erased erased
name22 = "Reflection.TypeChecking.Monad.Syntax._>>_"
d22 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> AgdaAny -> AgdaAny
d22 v0 v1 v2 v3 v4 v5 = du22 v0 v2 v4 v5
du22 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> AgdaAny -> AgdaAny -> AgdaAny
du22 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 v0 v1 erased erased v2
      (\ v4 -> v3)
name30 = "Reflection.TypeChecking.Monad.Syntax._<*>_"
d30 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> AgdaAny -> AgdaAny
d30 v0 v1 v2 v3 v4 v5 = du30 v0 v2 v4 v5
du30 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> AgdaAny -> AgdaAny -> AgdaAny
du30 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 () v1 erased erased v2
      (\ v4 ->
         coe
           MAlonzo.Code.Agda.Builtin.Reflection.d286 v0 v1 erased erased v3
           (\ v5 ->
              coe
                MAlonzo.Code.Agda.Builtin.Reflection.d276 v1 erased (coe v4 v5)))
name40 = "Reflection.TypeChecking.Monad.Syntax._<$>_"
d40 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d40 v0 v1 v2 v3 v4 v5 = du40 v0 v2 v4 v5
du40 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du40 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 v0 v1 erased erased v3
      (\ v4 ->
         coe
           MAlonzo.Code.Agda.Builtin.Reflection.d276 v1 erased (coe v2 v4))
name48 = "Reflection.TypeChecking.Monad.Syntax._<$_"
d48 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> AgdaAny -> AgdaAny
d48 v0 v1 v2 v3 v4 v5 = du48 v0 v2 v4 v5
du48 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 -> AgdaAny -> AgdaAny -> AgdaAny
du48 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 v1 v0 erased erased v3
      (\ v4 ->
         coe MAlonzo.Code.Agda.Builtin.Reflection.d276 v0 erased v2)
name56 = "Reflection.TypeChecking.Monad.Syntax._<&>_"
d56 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  () -> AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
d56 v0 v1 v2 v3 v4 v5 = du56 v0 v2 v4 v5
du56 ::
  MAlonzo.Code.Agda.Primitive.T4 ->
  MAlonzo.Code.Agda.Primitive.T4 ->
  AgdaAny -> (AgdaAny -> AgdaAny) -> AgdaAny
du56 v0 v1 v2 v3
  = coe
      MAlonzo.Code.Agda.Builtin.Reflection.d286 v0 v1 erased erased v2
      (\ v4 ->
         coe
           MAlonzo.Code.Agda.Builtin.Reflection.d276 v1 erased (coe v3 v4))
